Return-Path: <linux-arm-msm+bounces-113118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x9kJHEO6L2rZFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA458684A05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:39:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aauS+tiF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SYeS+pXX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49E91302DF94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1C63D16ED;
	Mon, 15 Jun 2026 08:35:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41173D7D78
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:35:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512518; cv=none; b=OQNtn5K3/T+aSJvA+5YwvNlC/4Qw5mXGX5pS3650M2VdNf8PshxyUq5GKToFWIY4GtTm4MZsub/0NnMhGdINfUM5eVAqAZfkuMqeF9Uj/pC46rixnzOICZ98I64QZiRCcFZYnmW2VkbEHS2qMhk3Cbbejzpizo1TkBSfpTg2l/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512518; c=relaxed/simple;
	bh=GvQK5FNbiwmerMS1KgL7rnmnIhPOdEcF+gMJ89tXJ40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FiesA9nYis96WfTqzbYW3x9EE+huGzfNCb7sG7QqlsjX04XFX/k4rduNYH4kNquxNUEu3zbEvRxpvKzlnUZrpdnLS1BWOZ2538aBy2qPA2zQv3gKa+OmG2qy2Jcj+eQX3VVq9IK9FUe64sX865zuSbtkHUKsfhA6rcXZ8bC+Puo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aauS+tiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYeS+pXX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KbVj3709710
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ee4YEbdewBGxjbW7ktSKrSgjE89dPV0voC5PowcYfE=; b=aauS+tiFOdXy7iKV
	8ruSMy2EGu0998PGpgkC1EIdzuGeW74jI8by3n04Gv1xeAEnYMQ8qlaN4i3X110g
	3VIgwyN5rKLj5Vg6rFno5fom3EwNLUBnMIXMNNjvTjRQaoxiaV/GmCR7gZafGmIp
	tnLEd+/jpV32mc79780nqUarf0Epb3n4WRaoWbKliFN7VuM4AiQClRGuuphlcnD6
	plFuew+KsocUx+bLI0sxD9Xe5XRraLbcEZXH8nOSoCQthfcmvhoSflXbTKdU43TN
	xRRQMyDvl9ck1W/Y0+to939Jx5j2hsuz37ECO7+usJM2BrYkpDPeMLjNiZojE7kr
	ggeQ7g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956eek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:35:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f24dcedso3996531b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512512; x=1782117312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Ee4YEbdewBGxjbW7ktSKrSgjE89dPV0voC5PowcYfE=;
        b=SYeS+pXXsdLZuJWxD8miW/iafN3HvcoJC4jlUU1UJDF5HjeacJ3yFX5W8496C7txur
         at7tHO+m/oTMLRld/ARs5wlrzZvue0yoSEfo8AXk4m9kWJ+edi+f99GtekWhBA8qygkF
         +URuhBNtu1XlbdjrksGfOPXZb+PCLzvVCQWcg+tCX76O9hmhje8McuCotsKBJDU0YIus
         1WX4YF8Mt8VWxcCMtHGXtml9ikVxzaaG5mrlaZF21Zmddq55pPtREf0ggBvBkwMpmQpy
         2vgTuFbMJ6qJ2fqoqrgs4PlSK9bv6xXehpEhEG4TiGYS1CfHI6il7NrlEusmWudgH2PH
         eNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512512; x=1782117312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ee4YEbdewBGxjbW7ktSKrSgjE89dPV0voC5PowcYfE=;
        b=QRJMZGdGtkK5bd4U+A3aPCXd43dxN/eZS6OXM2KIQg/qv7EyxW1oF5uMT6htYj1qBV
         b32OhmDMklCy9Is7VHOitm//UE/f0SKqeiMoX5c4BBtO0Eqj2QYJR4prL9UReueepnCs
         63+RY1e8nEsu06fSQK70b4/qaDQWeRAkFzOaNY3rVpfvLLu6RCS/3N+Vv0QmIOD1ruh1
         B/xoCA3Ce/UqKFgaFqqswCA2zbPmmioTNuUrgiv+nOxC0AUibly6Vc8dHvL5Yns5L7bh
         AHKVpyDMS1ksJYWQJ944N3PA3MKbMRgZRabUmC8xm+wBnxlv/hljbuvXcPFubiQGztRp
         7Q9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+pJrNIka9Pm+sUz+fmEpVzWkSOG3WtSyJy4gCqMhouLrpFc7+v1FesHK5r/FWOATbx2p1J2ZM9ySA6H/N4@vger.kernel.org
X-Gm-Message-State: AOJu0YysE5jJHOO9AVNIP4FwQ0vfKTXj46+nk2bTq2IEzCYup3izNgJJ
	T8r2e6cx3mpLBGxviCajh/AyR4i7lox6xaC8QpvRU0TNqDtO8tFsKOc06fKWG7OSvbVxj3im/qA
	Ewm1YxJK+wIe6tvkoHuxeND0DCdObPrCgEhvUslag8eTPKBzj1VM6xFu+Q5ex5Of0FqaJ
X-Gm-Gg: Acq92OGhg79Izf6H5t7IfMv13VyylE/6USxjh/yd1jQjPQQkRm2+JSLlKoKiuD6yCNx
	//oQVsVKDqPeFOrWFRtLy+T6l0UG32o0aeGf2UkmOww36lhQWu6QL1uIJmTstL996015F7GE3he
	sRG3DsK5beJjeWW8AKwjJnICcEx2Algbtocu+1oiCdrr4XZ3whMjA6YWJK3JWdQQEGpKRks+wgv
	vOIf9p+SMVoBr3WAcXLMy1b0yMb5B0u6nmbaEQAgO9wq3XBzx4Qwf0KYHqnqFKYucBohj/FoB8X
	nRNUmuDzd7z9K+cLSCPVUh7YuXsn7Rfp23sxQQ1J2rlr0PriyJ//sWxvkgvnYtnyhGMejiGmgpo
	k+gGkExSklzr8mUpQACOXcTOEwF93TuWnudfgpaJxEXq9VL+70wd2nscVovs6r8/HtGj1bCyBnd
	lozllsrhS0B4JFLYaAnA==
X-Received: by 2002:a05:6a00:2308:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-8434cd497dfmr14833079b3a.12.1781512512323;
        Mon, 15 Jun 2026 01:35:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-8434cd497dfmr14833051b3a.12.1781512511797;
        Mon, 15 Jun 2026 01:35:11 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf2ac9sm9279179b3a.21.2026.06.15.01.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:35:11 -0700 (PDT)
Message-ID: <d3689914-4afd-4bcb-8aad-380aefbf23d2@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:35:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/39] drm/msm/dp: Add support for sending VCPF packets
 in DP controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-22-b20518dea8de@oss.qualcomm.com>
 <i6x7675n4neufglcjwneds6nehetclystyg3abosbdjkh25ub5@psdjsrfl6wek>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <i6x7675n4neufglcjwneds6nehetclystyg3abosbdjkh25ub5@psdjsrfl6wek>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vhHlBKTHLHimYvuq6yvCI1T4mwIGpC9k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXx/pMvH9yEWSe
 OPYdztNyRHAew+TnPYQPaRZEJZwNM2iBGSunwB6bIPMc9FKF6MIVHniSJcH+bg+fRD0ZatgkSNK
 fR8hytiseoPrtPND+CNgos48W5l4UcU=
X-Proofpoint-GUID: vhHlBKTHLHimYvuq6yvCI1T4mwIGpC9k
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fb941 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TIrvqbJ83FTEx13vzzgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX4jEBOkkpEUWv
 YjanGOS6ShUMUVr/PlnyGdJHBdFsOfwz7ooRx89kCJ3lfDkBZiSFFEjtI62og+kO7cPyswXwsXS
 zO5yunDrcxNqIp8eqJE1f0VGa921+X5tKhfYTDYaEk8bw79IsxoD1eBPIaI9c8622zoAEMM6KZp
 eT7YfRBW/S+081rAblHhGoSUcOSSGxsYn9P8tck6KZ3ZhN75tM0G/SIWab3BAJdZO81VSnCawMS
 iQe8WachFln1jHsWtuVc71xhvHAcgHJpCI0jfamCiu/FUeE3fzEUFLmwgt9jMv8+H3arR4WHJG9
 ss8BhOThdBP6vl8Ygsrgd4iY/2nK+lznX6oIGqA7Gq7cZkbsmw/nNu0g2FRsBwG03ErUD+JNOEz
 O8SNqnhzQdS+ZDf8alFyacom63DYJFzzQo4Ux7k7YQRcUcpUDYOROqIRcgC23GurjcJlLqlJ8KL
 c0062/aVePbO6CyXzmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113118-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA458684A05



On 4/12/2026 3:24 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:57PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> The VC Payload Fill (VCPF) sequence is inserted by the DP controller
>> when stream symbols are absent, typically before a stream is disabled.
>> This patch adds support for triggering the VCPF sequence in the MSM DP
>> controller.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 55 ++++++++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  5 ++++
>>   4 files changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index e64f81bc8c36..9907f2e56e65 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -65,9 +65,18 @@
>>   	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
>>   	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
>>   
>> +#define DP_INTERRUPT_STATUS5 \
>> +	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
>> +#define DP_INTERRUPT_STATUS5_MASK \
>> +	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
>> +
>>   #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
>>   #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
>>   
>> +#define DP_DP0_PUSH_VCPF		BIT(12)
>> +#define DP_DP1_PUSH_VCPF		BIT(14)
>> +#define DP_MSTLINK_PUSH_VCPF		BIT(12)
> 
> dp_reg.h, under corresponding registers.
> 
Got it.
>> +
>>   #define MR_LINK_TRAINING1  0x8
>>   #define MR_LINK_SYMBOL_ERM 0x80
>>   #define MR_LINK_PRBS7 0x100
>> @@ -405,6 +414,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
>>   			DP_INTERRUPT_STATUS1_MASK);
>>   	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
>>   			DP_INTERRUPT_STATUS2_MASK);
>> +	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
>> +			 DP_INTERRUPT_STATUS5_MASK);
>>   }
>>   
>>   void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
>> @@ -414,6 +425,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
>>   
>>   	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
>>   	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
>> +	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
>>   }
>>   
>>   static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
>> @@ -433,6 +445,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
>>   	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
>>   }
>>   
>> +static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
>> +{
>> +	u32 intr, intr_ack;
>> +
>> +	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
>> +	intr &= ~DP_INTERRUPT_STATUS5_MASK;
>> +	intr_ack = (intr & DP_INTERRUPT_STATUS5)
>> +			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
>> +	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
>> +			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
>> +
>> +	return intr;
>> +}
>> +
>>   static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>>   {
>>   	u32 val;
>> @@ -516,14 +542,28 @@ static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
>>   	return true;
>>   }
>>   
>> -void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>> +void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>> +	u32 state = 0x0;
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> +	if (!ctrl->mst_active)
>> +		state |= DP_STATE_CTRL_PUSH_IDLE;
>> +	else if (msm_dp_panel->stream_id == DP_STREAM_0)
>> +		state |= DP_DP0_PUSH_VCPF;
>> +	else if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +		state |= DP_DP1_PUSH_VCPF;
>> +	else
>> +		state |= DP_MSTLINK_PUSH_VCPF;
>> +
>>   	reinit_completion(&ctrl->idle_comp);
> 
> And there can't be two streams wanting to push idle at the same time?
> 
In MST, msm_dp_ctrl_push_idle() is only reached from 
msm_dp_display_disable_helper(), which is called from 
msm_dp_mst_stream_disable() / msm_dp_mst_stream_post_disable() in 
dp_mst_drm.c. Both of those
    callers hold mst->mst_lock for the duration of the disable sequence, 
which serializes push_idle (and the wait on idle_comp) across streams. 
So sharing a single idle_comp on the ctrl is safe.
>> -	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
>> +
>> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
>> +			  msm_dp_panel->stream_id > 1 ?
>> +			  REG_DP_MSTLINK_STATE_CTRL : REG_DP_STATE_CTRL,
>> +			  state);
>>   
>>   	if (!wait_for_completion_timeout(&ctrl->idle_comp,
>>   			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
>> @@ -2073,7 +2113,7 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
>>   			return;
>>   		}
>>   
>> -		msm_dp_ctrl_push_idle(msm_dp_ctrl);
>> +		msm_dp_ctrl_push_idle(msm_dp_ctrl, ctrl->panel);
>>   		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>>   
>>   		msm_dp_ctrl_psr_mainlink_disable(ctrl);
>> @@ -2183,7 +2223,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>>   	int ret = 0;
>>   	int training_step = DP_TRAINING_NONE;
>>   
>> -	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl);
>> +	msm_dp_ctrl_push_idle(&ctrl->msm_dp_ctrl, ctrl->panel);
> 
> Which panel are we passing and why? It feels to me that we have two
> different cases, one for the MST stream and another one for the SST
> link. Can we handle them separately? (note: I might be wrong here,
> please correct me if I'm wrong).
> 
For SST, we push to bit 8 of MDSS_0_DPTX_0_STATE_CTRL.
For MST, stream0 and stream1 use bit 12 and bit 14 respectively.
For MST stream2 and stream3 use REG_DP_MSTLINK_STATE_CTRL.
Do we need to handle MST and SST separately here?
>>   
>>   	ctrl->link->phy_params.p_level = 0;
>>   	ctrl->link->phy_params.v_level = 0;
>> @@ -3005,6 +3045,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>>   		ret = IRQ_HANDLED;
>>   	}
>>   
>> +	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
>> +	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
>> +		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
>> +		complete(&ctrl->idle_comp);
>> +		ret = IRQ_HANDLED;
>> +	}
>> +
>>   	/* DP aux isr */
>>   	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
>>   	if (isr)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index c59338199399..cfe7e4496943 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
>> -void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>> +void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>>   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
>>   struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index e0bf4dffa6af..e8028402f748 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1557,7 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> -	msm_dp_ctrl_push_idle(dp->ctrl);
>> +	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
>>   	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>>   	msm_dp_ctrl_mst_send_act(dp->ctrl);
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 835a55446868..65695fcb48d0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -42,9 +42,13 @@
>>   #define DP_INTR_FRAME_END		BIT(6)
>>   #define DP_INTR_CRC_UPDATED		BIT(9)
>>   
>> +#define DP_INTR_DP0_VCPF_SENT		BIT(0)
>> +#define DP_INTR_DP1_VCPF_SENT		BIT(3)
>> +
>>   #define REG_DP_INTR_STATUS3			(0x00000028)
>>   
>>   #define REG_DP_INTR_STATUS4			(0x0000002C)
>> +#define REG_DP_INTR_STATUS5			(0x00000034)
>>   #define PSR_UPDATE_INT				(0x00000001)
>>   #define PSR_CAPTURE_INT				(0x00000004)
>>   #define PSR_EXIT_INT				(0x00000010)
>> @@ -356,6 +360,7 @@
>>   #define REG_DP_DP0_RG				(0x000004F8)
>>   #define REG_DP_DP1_RG				(0x000004FC)
>>   
>> +#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
>>   #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
>>   #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
>>   #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
>>
>> -- 
>> 2.43.0
>>
> 


