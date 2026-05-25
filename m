Return-Path: <linux-arm-msm+bounces-109612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBJvLSYaFGroJgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:45:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 532015C8C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA571300617B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F9F3E832F;
	Mon, 25 May 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuOBLe/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enVfBEpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804413E7BDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702307; cv=none; b=iYpxfMLcTrqG3mmoXGFoI1YclF4Z8XHen7Boz7fvXKmlBhmW1rBmZkk5Hw9ioIgUDFxI1fpCdq1/AD+/sQt65lNvfXNTSWLjbQuA4pWk2VF0GGcCyYoCMHWu6ISU2Lc75+s1lGSyyuBgg52op2z4dht+e8yyspKvI18SuQkZH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702307; c=relaxed/simple;
	bh=A6KUs0v4i/FPr/3/c1pnkAS1TY/OzmqmMW4xhcO9MZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=iVLpOslZBfGi4Dfrc7o51koq3rkH8k47ZAr5mJ5eUGu8P9k/IysO3N12oULDL30WcuXIhpVf1epY+9zZTBjC7DOK2dCl6UxCfVWtDPV7/Z8aJKMwOxXuAL34lhe2OX7WTcqVW8jP9AFbC5J8CW8aI/dqc0sBGQrkVm1MEuuOKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuOBLe/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enVfBEpp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P83snS1861470
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SWc0cc22x9nunFWpQzihkc7nKAG+xaM6B4HBtT1Khs=; b=RuOBLe/Qc+HJi5YJ
	e47jNH2ZR7MpklJuCHi7VtAqgXSUkuA9HckGwKSfOPaatXdYKFkBCJf8x0DvgDsO
	tqkGEtB/fzRff+OQnF8LFty8HthYnp0Uoi98IdFD5JW3VC8PmnB8TcKKSUt2e5Nt
	/qmC+kTOCw6vzSkADMD09PLyWY1bSIu/7ux1kcusBtvel9eZ3f+g/KIc023UDJ7y
	9tzQf2RY0/9pkrY+IWP/3C7tsu+3GmA+MngxJZSn4MOR2K7IR/Rx3CDKjBFxcsce
	UeC8Ut2T0h5At40OW5mmKubHTreCUrH5u4u9vqfpuuyoow7mIUIuNnlHawHOQUX9
	Fk1jQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5j99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:45:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bdaf8567f3so67030615ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779702305; x=1780307105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SWc0cc22x9nunFWpQzihkc7nKAG+xaM6B4HBtT1Khs=;
        b=enVfBEppd3ErPIaI5lfyiOsLk4d7Xvb0r6NyjRhIBNtMwwIsCZI6GICfj7n63iR2EM
         UQDb/dCoRJReObTLm1On/HtAOPa4GGw1A/EajmPfJsk6H2SM7NpvEKPehmitSrv8O8s3
         NFKYMl4Ygj3JxKNz48k0XM/KuAGy+4FMyeI4OLNcoq91RlLrCeVg3yLrCCetJR1497jW
         QMw8yh2p6rtAmmIDrpWEMxMP9JGJQY4yRWk762m/Vf6DbF+WCdtckifOvOr+9BlcJ6yI
         TE8iR5w0cqu04UfyMrRF8XcBPSBgovXEHyi4S/ZmULpI9dlDZcTDpxHgglHloPOcQELZ
         MUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702305; x=1780307105;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SWc0cc22x9nunFWpQzihkc7nKAG+xaM6B4HBtT1Khs=;
        b=kBmWrCJP+50rqpU7XnEWqH+1/ie/B2T8QQLcSzK3iC1Fha66V4hs/wpH+V8BQUOd7I
         SVqZRML0Tz5/6+0FNgsupsOYaMYj5TFphXDFvIODy+ZEeKQuu+xckx3Fk9npP6lgXOUB
         8I+wgW88dzxJPGNNBT7laqSmmNHrsC6wSvYDRvRzDkdoj8CzoJQYi9Ci4RDgNihMv9vD
         bqL+Cd+E8B6bt7AxyVl/dezsSI913FO/EMPodfizRALtnTlUUd7UUl6nZCdHUxDw2heO
         W47mv6sIrsxW82zxZNnd0B1uAGGkGXy8D1N5ZwjZ58gY0cfhNbZKHSmJtgqmC+K6Y9ij
         FNKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LJwXb5pU5Gta70noHblOlbvgvSUDw9ywab/Md9v0r0WcOmCTDq6K+qW/MvHBFqoRWynBfc0EuLaI3eW5D@vger.kernel.org
X-Gm-Message-State: AOJu0YzaVaiTs80H8HN4+FxJW4jw8XkHx2KZiqFGqJOGZb4hlc8Vu/rt
	4hgYmC0BOX7JsWE8RQrLCTKbw9srEjSsGpRiufq/fN3nc9EZQ1tBXvxMxXBNCVGTxSUClw3amwr
	pC0ARLI2OTFqiVx6uZ6bP05Mh/kjjyaiE4/r0LYnwPcSDknNpQfhiuJz5AWz6BivuQm8e
X-Gm-Gg: Acq92OFYMpBqpUJLX0oeH4/6Ozzhna18qLAjP9MTDl46hKN4tBoKVxGvoGp6tkPKD6S
	Y6/ufmDUw4uwdVD92eNYpL9DUG6xLFewkcGoCWkQaL5VCUeWv4yKcaS2mxpNRH96PDPWQWeVvVr
	ihzEoL+2Ijr25dKAN3/hiy5Ww/J8gzd6N58ssKNVJmNlPWJOF1ecw6qcjdeC9avNKj9csYDyfOo
	3QNbGl7AgkIVk1Kfl3Y4hAlRHC7YXuHZsCUabrALcByuoTQc4m5d9S3HYvaHXbKzUzZA+FpOsFj
	3ot8/bT2Hmo+RFPhNjkWRd9N1P3O7LnbFkKSuFSCbMORypYhYqS3V0fNbznYsMsNtjW9I0jGO3+
	Deh/r2zfvGcQMyN9QYZk5EkAc9yxQnFJMT/L1X4BHgqIK6RCBQp5/88QK3YNCfApIWfpXPhrgHZ
	GX8ZPgGtbA6pfdSX4w
X-Received: by 2002:a17:903:11c9:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bea20a2d54mr159277505ad.5.1779702304976;
        Mon, 25 May 2026 02:45:04 -0700 (PDT)
X-Received: by 2002:a17:903:11c9:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bea20a2d54mr159277205ad.5.1779702304487;
        Mon, 25 May 2026 02:45:04 -0700 (PDT)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695c40sm84634895ad.5.2026.05.25.02.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:45:04 -0700 (PDT)
Message-ID: <be6c9ceb-32b1-4cd3-8811-39248ad1345c@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:44:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-5-jianping.li@oss.qualcomm.com>
 <v3qkvvqlggrk7thn57ff4tlbilz26nt3nlma6deixlalq74i2k@nbxbqyppzwte>
 <fb00c836-95bc-451b-9430-2ebdf0be2630@oss.qualcomm.com>
 <lpsvrgw7spxt34rdvfakxm3trdjybv5lyq2pitnso5k2bfkrmy@7a62dvbmf4r5>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <lpsvrgw7spxt34rdvfakxm3trdjybv5lyq2pitnso5k2bfkrmy@7a62dvbmf4r5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a141a21 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gttq3t2AYlGpivilpbwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5OSBTYWx0ZWRfX5ArvvglDUFPZ
 n5SvZN4nQAhPPVlr8edB8mOAnrLcYZQtbo+FkXdotdZUGSlUQiWdc2EtcYM9qIPX+h+U3B0q26V
 K6qpkRCPcbdQhnh71X1qj6HELLkxcgOWfRUoM7gWqEwwhFx/QxhQCMCr7KoCg6u1qPfE4vwkbzt
 VL+Wn5YsuZ483MTM30LhgXdLnhgLce2WPFeIYhSy9VfHny0lwuYWz5eo8Q6+ZkLHImc+V/2GU2U
 W75iZ4WHqHRZYS4IiJjqeZRIV/DP4odmRrTA3HdrRmQW0QCL2plPWy2fVv/+j9Bsf98lBVMhTZC
 u1PhLjixDlNOUffzryafD3iMlOwWSEDX4fjprxASRMqM8etWHR8HISv4slyri9e/9Nrfw/iDx8j
 eJtOIeH9yQg4bh+n713iiORwbW/uLbekWxJmXwbkXEMYF8J91NcNrlM/dMeqr0HJBQ+MghnTC++
 c9qMmnY1+HzjTIASvIg==
X-Proofpoint-ORIG-GUID: whnlp3qmZ5Zve9izAvbu7gMt0DG7lR9K
X-Proofpoint-GUID: whnlp3qmZ5Zve9izAvbu7gMt0DG7lR9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109612-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 532015C8C77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/25/2026 4:32 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 03:47:31PM +0800, Jianping Li wrote:
>> On 5/15/2026 9:38 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 15, 2026 at 08:42:16PM +0800, Jianping Li wrote:
>>>> Allocating and freeing Audio PD memory from userspace is unsafe because
>>>> the kernel cannot reliably determine when the DSP has finished using the
>>>> memory. Userspace may free buffers while they are still in use by the DSP,
>>>> and remote free requests cannot be safely trusted.
>>>>
>>>> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
>>>> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
>>>> controlled alloc/free and ensures memory is reclaimed only when the DSP
>>>> shuts down.
>>> So, is this a bugfix or not? Is it possible to make the kernel misbehave
>>> without this patch being applied?
>> Yes, this is a bug fix.
> The tag, cc:stable, clear description as the bugfix? How would anybody
> guess if the patch is to be backported to earlier kernels or not?

When userspace repeatedly grows the heap, the kernel does not
support shrinking it, leading to unbounded memory usage.
This can eventually cause memory leak.

I will mention this point in the commit message.

Thanks,
Jianping.

>
>> Because currently after the audio PD requests to grow the heap,
>> the current kernel does not support shrinking the heap, which will all cause memory leaks.
>>
>> The current modification is to allocate in advance and release uniformly, which will avoid this error.
>>
>> Thanks,
>> Jianping.
>>
>>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 107 +++++++++++++++++++----------------------
>>>>    1 file changed, 49 insertions(+), 58 deletions(-)
>>>>

