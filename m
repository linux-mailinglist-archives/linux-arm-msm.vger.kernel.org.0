Return-Path: <linux-arm-msm+bounces-109005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALD6CUvWDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:54:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 101465A2BE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F2B6303A5CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0AE37E304;
	Thu, 21 May 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0+STH9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JE/ake5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEF637F731
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357225; cv=none; b=CsDCdOTxgnpZabeRmRo67q+vQGOw03cTtO9qZn3lDDlEXKDPneVNiq/PxhxkD/ZZRHvGvB7C/0SB3d3rYk7TwSxwtg5be2euvRWOmWQaw7KvjmZumvRHeUrr0wB0/HLOJuiWGTosPMYG8/bjbGJnkqZgSruREPUdqd1BV1pWzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357225; c=relaxed/simple;
	bh=s3gG9bt6gIhaCHKvCQrWOYigG/n946xGXxMAqW3Vnxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gpi0/u3N6xygki2QUloo3EfNJ0Cln+1NUQk07LXLuzGeSZwveD/5PB2kly1qKQQ0v62iIZ5C18Nci240+3qR43k2IlrznyJ0IKcDDD+F7Khc541fiOjMES5VeXQ3qCd+FWpGYOVRRWBFkEhRM7ddNul0xxNgCoeUJFffENlMl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0+STH9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JE/ake5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99m5K3451373
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3aMD0iRX7sybcswouW7tcUH+clRIg1db3DRq2DW7P0=; b=l0+STH9Y8f/y2vVP
	xdUNUqwXGCfRbPi6A8iKNVfzNbLGaSDClGQkpeYcq62MrMef5CleR57XYHaotGix
	cbl/PfbWWPm2694mOqWxOCaZ78dMXV7qMaIS7uS0JUyNycJ074vtiTlXUktrNTWO
	nqWVIL2XMbB4d30jdUi7UkCk4OqEzdinUjjLt+v2BEc01upJPuJ4cOdMoYek70mU
	jK7Ys2bATFiTjtSH8i2ZpZHdPlGT9HvITNWy5VniUGvucoD3TxCI40wNXNASbO+9
	+HYyPBXTYKwDTyZTT/0AFMetEZNmJ/tCeYibRgLI5rB1lRzNcLPvpRJ5nqw4gjY+
	g6XR5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h87q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:53:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f6e66879eso146007585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357221; x=1779962021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3aMD0iRX7sybcswouW7tcUH+clRIg1db3DRq2DW7P0=;
        b=JE/ake5vOw7ZWXrwu98MmfOshKcfKFA0PmkK4UjF3KziWc6yxInUSJumczs0iiK1uY
         6629qGsbth+D9IFeaOAfzMq8wpIKxiBLMBjUWkye1NrTNCa499ZyGgqC4VUSUizVAD2J
         H3gSDEmKMIld/5ENd0bF+1pI9XN0/80GJFYdM4TYLS1XIk8ZAPq5+xNjCbvkUdrbnCGm
         fngfEYrtHrxYkE3Chjesam8QQnWpdidW4GP/Qim5PV2QSfEjcjRHIMuxo3NT9Gn8pBCc
         ZEpg708GdwhmOZAyzs9Xy2t+rJH6N0p3KOoPhw+NrWJhUx0dmeata6/2kcWzQICERT8d
         q85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357221; x=1779962021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3aMD0iRX7sybcswouW7tcUH+clRIg1db3DRq2DW7P0=;
        b=GWo4ObQobkuiN/1uBUy2IXSqSrCCRJME/IWom/o6V48a4bfF+5JL0fXcuwL/4tuFDN
         /GWiNPfG0CZUDHSunRQ+BHON9x/xoycSbjj7qgN/VAS2QebU2hbURtrz9wHIBZvpzaJQ
         DPLaPvRaQFAy/6oHnpfUGLTSvZ1pbiEt33YtlHNvflGm0h2pHDEAlY7/4ZfBBV9Hc605
         AYUzbNPtzrITtkdMOGdY96wTFlunr167itwAigjT7JECwPlmheMhUCMjEDxD/I0C1IY3
         idzbwE3OMHLHo/NpUq+6TW51nk/ATH4Xcu8Njmd6NF9/UXbpTW4M8SmaBuxr5hGE9DJw
         xHww==
X-Forwarded-Encrypted: i=1; AFNElJ+R4GgpTHHsilxEu2ZQuxHWLtp7CiTSvQyL6p9VRK/NYA+YoPqvkb2MJWPMu8HZalpCnaswz74QK6f8is/C@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DEWKRH73ICIDjrP3pv/KkGqc8kyAz9ULyBHO7y5Bd0mBKXwj
	V7uxXonIveAyNVw+eunAGJghWpD9ZfK++hozjttK/wu7aWZesOYwqAmdzH660BFEhwQlrJ7fc5U
	HMEbeKnM8S8Sd7tEIB7FvvdtgVLAG2uxkIvL7Ge/a1A2RIbOBYVcZ2Ibo21KZwF5+UEZd
X-Gm-Gg: Acq92OFKPGBTTiJUKlIHcoiLX699C6/GaUA+aIUqJ7D76v1ixPrnoZdefM/hOUm4T8l
	L2D8UOEA0u+WR9kc29eJmwUc5Kv/4oLWOYl2CjOY4YRjSblmIOUPRqhP9mtPEmfmrsqBEa2DGxo
	aOUhNBGkCYxM80xhBVUFGoiZzcARct1BgNIDudhTqj6lSkQZHs6YmmvGFk9s99ai8Kl3CluEjme
	rMICHNBruv6Y0Fkjfo8ibDyMIFkL1sfrJJb5aPfPPtYgulptsvBxYKJiwIgA76Diun/80K37FAf
	oG/BWooKiKTuoMrn8nUFcj5kpXBmQyLJ5C8r8zONfaXv17Ujfql6WKDVKvR2zoMMFaUADc67buU
	rp66BuU9d5HzlCIPjhWSNH8J1BHlymFeDpi767neQLMpEul0kqzzyKzJU67tmRkKgRe6QpXpNTl
	SNmPc=
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr157290685a.7.1779357221650;
        Thu, 21 May 2026 02:53:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr157288485a.7.1779357221238;
        Thu, 21 May 2026 02:53:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410c87sm23152666b.30.2026.05.21.02.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:53:40 -0700 (PDT)
Message-ID: <f6079442-7df3-49d4-bd4f-06c37fc7be3d@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
 <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
 <x7v2wra6pbtxpt6t4dty4fpo5of7clt7ul2ptw6c2rpeojwbvz@xselcvmgyrsu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <x7v2wra6pbtxpt6t4dty4fpo5of7clt7ul2ptw6c2rpeojwbvz@xselcvmgyrsu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YPJ8zyPbX95h-QkeanCEwTE2wG6Y1GHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX4hvpZy9hw7e/
 0yFmA30w1E0RxWE4cUWESr+T93SrlQVH1bs7FHkQUc9WMXUxJm/5hTgCTGLs4e4BiDABLU28XUj
 RJVrNO7BBIqgz7UR7woCDAHWZ0x6ztNAAVoT1/B3l59wddZCabut6y9TzekHz7Q9aGY3hOKbPDH
 odmAgJS/4xvHv/OYQ07qFBNZhuoUWdoZjPrB9IVD5arOvJP1xXf3sDkHqTJMRke4J/n5vA5FT1I
 yS2W2osW0o8n4XsiBeqRS18hmtEPcqkvH/f74tDg646mFsg4K3XKXT/k2TwRlfCZhVPGyhkAJTJ
 Sx+JmvHCZe95VS/nhmTpsBcCp9MgsPclJE4/parfFPXWhMtTAe1roOy5/WJzJ9/O8rQj4UdJe8E
 k/v5a2XIIFFuUCYA6mnb+inOZw4HiE6SZWCSszz92a5rZCpCpRc+cxdG3pRjWSr+Y7/d0J2CKlN
 np5Fe4CuVWxhBvtEU8w==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0ed626 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0hp0MMcYVCcYrrn_uN0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YPJ8zyPbX95h-QkeanCEwTE2wG6Y1GHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109005-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 101465A2BE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 2:04 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 11:22:06AM +0200, Konrad Dybcio wrote:
>> On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
>>> Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
>>> clocks into the interconnect providers. Stop inferring this dependency
>>> on everybody and set it only when required. As a safety measure, make
>>> sure that the coresponding clock description fields are not available if
>>> corresponding Kconfig option isn't enabled.
>>
>> I think this should be a 'depends on' instead, if you like having
>> PCIe/USB
> 
> I'm not sure I follow. The INTERCONNECT_CLK will be selected for the
> platforms which use it to control NoCs.

Eeh, sorry.. brain fart

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

