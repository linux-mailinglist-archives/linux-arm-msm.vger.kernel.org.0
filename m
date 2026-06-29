Return-Path: <linux-arm-msm+bounces-114875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+DLNbQkQmqv0wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:54:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B26D7349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:54:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lt9AErWW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J19Z6f2k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114875-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114875-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E27D308069D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E010C3E024D;
	Mon, 29 Jun 2026 07:41:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709263DCDAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:41:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718864; cv=none; b=UbrkTGKD96xFHBESgq3txKWczhCLp8ChCSJ9JuGlfwEOx2gbivWcm9cZlWr6RKlQ+LQE+SukGltRnJ5uZy9e/iriphQfjUsUT74/vMQLu3gMynSCzLUw63V7BEYBXcn2tjMxGsIFX0Jh/thkf9RUrUylRS1ZGhp8e8TJsnTc+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718864; c=relaxed/simple;
	bh=66zTjTSSwTG4b3YNkMn0uHr+RMqoFbdF5t0rH8sHp78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ah2xc6G+P/X+5Xz4EzN5FRy9u1UZv2gx28rB/PAX5UiC/dHQO51fLbQjNIxeyRvM76KpRpBl/IuiLJsJvorE+c8SQtAbnZ9UTWjJQ31XhY1KqiqDDMlFAqyZuRRSQVgF7n9B61CO+0OSUhR8p9FMnoY3ECGkk+E3AEikCwAI25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt9AErWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J19Z6f2k; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sM0K2143147
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMLY01MXHmgEqL1zNbJ6LeGmmyFvOsEKBD+lEg7spaI=; b=Lt9AErWWQjVCGaOX
	7mC3938AUiLp6i5hoahtI1WOV4LxHZleTo0ch1jNDJDdG3eRte8EOUrTFa+H3zff
	Y+fIZA5tcA1tO8eZzLAcYW5fhE9pAUVs1YIP4gAbQ4AlidaKcli3DYgTDE2+c9Mc
	yQ3Z53W+myPTaoni5kzXVmyIO3/FFRyLOFSIudJLd9aApRXJxcYaVmXHGObkTu+i
	19bWk6wqGOEmJniLbFi23tTKinnJg4IZMatzGZHMXohstUQUTI1WuOLeaaahn1wy
	UMs0+5Nm9IlpXXoL8LmxfsKYZX+p0iQoxsd1hf1w80InWrmGvHzoz48O+WmyQS5Z
	l1MmEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nby5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:41:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c890bac374eso3354452a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718859; x=1783323659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMLY01MXHmgEqL1zNbJ6LeGmmyFvOsEKBD+lEg7spaI=;
        b=J19Z6f2k1GfU4nK79UX4TvqewOM3c88X39HtMYLWwrwIysNRA5FQa6idGI90uBRlt+
         Z3bYZ5MHHHnKNZrwbwBPHW57syJs6UYAhtXcCqn59c1RymT6K7RQuhritjHOXLaA5+06
         zHRiODWLzIa8DYD8CRNhn1sw/Ku9cL0lpy13llQuPqRd7udltw3iDHxDEPxs6Ex+nHXt
         OAFtLIvrZg+LJyucP98LbfEJVstBFH3YXMDNL6ZfGkBWsBSKI+t6/YoDfSaFcMH7bipT
         8Q1QooPOUuP2g/femJ54n2WvxsFFmfuTr+35nTyEnfno0VlJZcCKEiyw725O/jwXUMXN
         vREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718859; x=1783323659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMLY01MXHmgEqL1zNbJ6LeGmmyFvOsEKBD+lEg7spaI=;
        b=Lp36Oqkz8SLrnGOPV/Y8YhuYWHFkcXv7aCqa3/nS0rJLB3U51MAAeAFSy7jpKkquKe
         n7dsLsxuW0BEZU+KuFylQJhmLENPZe9OfgXekoSe5fM79WXr8l4UDYP7QnYVJ6PfSne4
         7oQzFq+h87hzozT05DZezB3ef/rc+XM8k0VwDQMlVZrN35Mm82/y6LkqEmV74ofO5Mwc
         N5rENZJ0IhTUh9VZDLbJNRR6yuwM0VZFigI3meT1YpXvOU/NZZmXqzlx4qgFbTCGRWvD
         h0xF+KLmXV1wFI5OGe6AsJvPFmWeOlFrzYroK95WxiaZ/RdrGZVuLxWeCZw6Px7GY9YY
         R1+g==
X-Gm-Message-State: AOJu0YyKEIDR1lIrm5Ecd0ZyTxLad9mqIr/3ittGtIqVoWz25fNF/Xf+
	fkvTVcT3p3XmSuTUXvXEjWDSNMLjyG8lcN5h4HjyLjKv1pMxE8R0VgtlN5iuQIR3qet1/Wztghx
	LTkmglg86RtfAiyQWDE6RAxTpwhB8xRb2xPnol2mlOtwjT8ZNOTBKQGdp+FyUJxz9/ILP
X-Gm-Gg: AfdE7clpG0GcbdMEOzTIn9hXXzNjVULxM3GwTZjpPIp8vdKPJKlHeJE3RyC01hV/lo/
	nmI2HdOAeGHGY4HoX0/HTRijUvdx7rHwCrEU/jBTnRFWX4UZ/QhEanKfZUSOpHAqxPhc+1vSw7f
	CkKT9OOhKBvIevvjVWjKxyQ55W+4GJnSInqse+b8FXZtemh4lfItBiBeK+t4g0DpItYZvmzuMcL
	pZLfxl31ci12eF6GYxRh/1b286pPrPsaPgclK2QM293pxT36Dqmq7RBHIkWMKeupHFwUXHxVc+m
	vt8nRs5yt6OxrY17aytS+9qT1qrw8Uo0h/I7PbpZFHJY+/3yU027G4xmW6RN4btIPZWDl3LRsMs
	MRHZZvwELDjcxN0+WUdjj5ryUsOUdhWtJREWz7daB8GQ=
X-Received: by 2002:a05:6a20:2324:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3bd4ac7044bmr15877467637.1.1782718859327;
        Mon, 29 Jun 2026 00:40:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:2324:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3bd4ac7044bmr15877450637.1.1782718858881;
        Mon, 29 Jun 2026 00:40:58 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm88825405ad.56.2026.06.29.00.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:40:58 -0700 (PDT)
Message-ID: <fefd7333-fe86-41c3-9ad4-1816b2dc701d@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:10:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable iface clock and power domain for kodiak and
 monaco ice sdhc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXxzExhXuXpQRP
 dVUa9CFvj2TMn7h1JZDliCVjy6Ds+SHHURts62kXgny1EUuKSpw8jLIf1smjMtj2m/9yQmZHDFb
 CGwhF25pVJH6a9IGqk03dV9OkBueuD4=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a42218c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eVMMNwGAFmqVeTlyiUoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BJZKliIQup-cSF4q3diwd1oxMopDq0WG
X-Proofpoint-ORIG-GUID: BJZKliIQup-cSF4q3diwd1oxMopDq0WG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXxZLc9KwTjub+
 MXDuJA2NQfFPDH/phFb3WqtG9FgV6MQXF7zw2u1j5OEGTuMhDNlI55FvcJPnhkHWOQd7G5suMsn
 ynJpUatc8OBzyZeVztsX4PDSjNq0L2eeFqMuEiBKi8eNxF4tBzflAVXqV8Mu+DGE74XrwY8ri9d
 aOCmsJEB4NDdRgMOv3fIXxhlTs8Hw0+HCjuV6lwiH2M+rDO8CAEFn8nlOgPkl5z639PRy6V9kEK
 P5gQzFZRC2fvdLakZZtItdnrdByXzof9/dDMXy8+L5ud6F2SYOPtPykAYQf4bQo5wOLi/7qHb5L
 tAZvXJnXHChJ7eNakEpJ30VggWfrw5WspfFkZ8a95T6wlVcjROrTQrUV3u468XLpGeWNXT0rZZb
 MN4/RVIsrSNAq//e04hxpWiIYH7Kwh8kz0ZQqWVHMp5qk0srJTpc3wz0bsHJmhM7ZFVUmU1Buob
 WvnRCb9VYMCQ83bis9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 467B26D7349

On 09-04-2026 14:01, Kuldeep Singh wrote:
> Previously, ice used to exists jointly with ufs/mmc driver and not a
> standalone driver.
> 
> With recent efforts of making ice as separate module after decoupling
> from ufs driver. Update sdhc ice kodiak/moanco DT nodes to adapt power
> domain and iface clock to probe successfully.
> 
> The patchset is motivation to fix ice mmc where ice ufs is fixed with
> below series.
> https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m5da5dd7a18318583b23ffeb42fa07ef1438042d5
> 
> Testing:
> * dtbs check
> * Custom monaco/kodiak device with emmc storage.
> 
> This series depends on the following prerequisite patchsets:
> 
> [1] Add explicit clock vote and enable power-domain for QCOM-ICE
>     https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com
> 
> [2] Enable Inline crypto engine for kodiak and monaco
>     https://lore.kernel.org/lkml/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Below 2 series are clubbed and sent together as new series.
-
https://lore.kernel.org/lkml/20260608041650.541502-1-neeraj.soni@oss.qualcomm.com/
-
https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Kindly refer below series now,
https://lore.kernel.org/linux-arm-msm/20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com/

Regards
Kuldeep


