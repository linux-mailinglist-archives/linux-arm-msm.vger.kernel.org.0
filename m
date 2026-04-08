Return-Path: <linux-arm-msm+bounces-102284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GkDHQgc1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9993B9AEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57015309A061
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441AB3AF674;
	Wed,  8 Apr 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+QsC9wt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9yUJjF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C23AF677
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639211; cv=none; b=IR35JOweqvx/9fYP5mtNraQvmqjZ75f6AfF5G1BoQdk3QwTq8an3U9HqDWvj/S5fWxHdWLEi6EmsluxpuA1fLtsYO4aHNzxfF0vUErufEvAA8jPAXIB1NW7UP7pY2dAlkkBIo4vrS+tl4ZqhzOUdyxYNw+P18vaDn0Oy89o3+uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639211; c=relaxed/simple;
	bh=DqOQ78xd3eCCyPNyCn03OWQN0oM5I1raa+T25OZMDEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BL06kZpVodBt+KbMt4Xjf7Hh04liS4kjBNBCnxNrphDmFPKAlIUyOhdjFlG1qWUM5X4jD3k5ZtY2tixeWrLFSsSyM1lFahnf367d+bcapS/LMxSUjLd2a5oPI9QUd5b/wX1LtM4fbPUziJWnUwG2WqiTmqGzB7myx4fV3VSBwiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+QsC9wt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9yUJjF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386k8tu2451317
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJQMbpIVKNlTG5eu44Vh+yTzjtmXorfu0uv6ojWdYq8=; b=k+QsC9wtzLOy2ECU
	ETrREYvnsQ2i4loZq8J+fp6dcHxiV7b/FW/bOilGyq2r+wPSVutHv0PU5YKSjMWe
	M6Xq8l6JmuGr9R36qLOm6jlMcw05zmsl8HtDlUtfMTwIcHjAem8QzSS76tclNq6D
	XOG5JHm0bwd+CRiYdEKdLIYd+ShRFFOSCyIY33dtKX5rjNQyq1EVf0wIbHRS/h5s
	LGwmgZx9aVy7Y79a87J7iHzRM4ChGFL+FfugbsBNuYW/DjEjxzxdKN/dtQQc0to0
	vVKjsgYzc38eNWC/gSC0MDNAfTGqSQb9ePWNDV6kmp5lDsxhZPblEvNcmpLM5A+4
	lVbHZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae69y14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:06:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d56ae62e86so86787085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639207; x=1776244007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJQMbpIVKNlTG5eu44Vh+yTzjtmXorfu0uv6ojWdYq8=;
        b=W9yUJjF3ukzpN7bAwneKYeSSc0Dg5Jbj0Mz5Hk1wW0BENJ4+sb8bSN3PTWpLZJG+gn
         QI2MzEnAgi2UQwhuc0vMMmL8rVSoCV/D/rD+wc7XMKn8KpEju5cz0MDdR5IU0nMk2To2
         VSbsPAv9pvyzWYfJqEqx2dsaVYdbO2xV5BU6/qAxTsjEOC+FUbt6PRQdEURvraDoU7kt
         CDrjmEWD+Z2vUgtsxr5RR8d2J81V9IMX90ioGqJ4nm7h80QQECZmjxemLaoGrmsTspBS
         S8we1ZWYa3FxOlOqv3XUYHqzuOt50E1jtxFY9YkHUMmtVC/UXaZE5nj0wXsccy0Q0mEZ
         VY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639207; x=1776244007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJQMbpIVKNlTG5eu44Vh+yTzjtmXorfu0uv6ojWdYq8=;
        b=fezxVACTSzjW4W46WeBcvksrabooASbjNTSN8/R4qumb+NzwSlTcABlmuBsItgbFVh
         TiKv8X4TXCd301DrLHND+urmdR0oNvLhYvpo7/EHcrhFxvPowK1Tnv6BmYtZrgyt2ExX
         0Z/PqGNF2q7ztImS1sGeAv9dIc1rGze5OvApnsneN0c2gE6MVuoDemdbl/CVea5Eye1a
         wNp/Lu+AHXKCny+kNWqaelibwAgWkBj25lHCCVSQF/xGkoVY4O6Ca83B8WlcTax6pMMG
         0WfcPcBBfuthGjvV0fwcSS9/GG9MKCVsWdKHVaLkMZe407qzYsuIhelGKsaZstUXMfqx
         4Kng==
X-Gm-Message-State: AOJu0YzzhGi2qYNtcnMi7Am3cONHSKHj7dFB2Sq1msfghDj2q3YVFNDS
	wawfd1ADMLA0b8VF581tY7KdAIPfPtlNaYjqlYVX1CZe+NZ8tjhpZBV4rJNLDAG1AGsPO2Spc7b
	u9P1zn6J6iSCoffv4O9P90tDSet6r8PE+oqNIKBHsV1XzvR8gsMopsFy9ljWweDGlg/MN
X-Gm-Gg: AeBDietIc3Rcz3slW2yLJ3kU9FHK+ilKMzAPrmdUMblvSF0XkP93FlZxT1Pz5SLymHh
	ITxi8yVW1mKdfwqhCW2fv4TZ6JLjjBZHS3xtBu1mVyQfc05LQBXfVFvHene88iG9ZU8sMvbwT6u
	esH1kI3CU6NGfBHLJAcftOolfgZrjiShvNn6tgcsrvNgr3oFBSW3GmjlkbX0oeQm7hqUeRjRMHV
	jZULYGgQ8t/x9OpB74cX+YesKZ2N1lc4QD6H3IpLscpswY+6rhv+RXUv29rCRb0D8Xfj1Kp7l9Y
	don0ncvLV2FvIFmi4+m5W4ur+zd+9fNB9Om2BDXYk1q6hMTg/OLCbYiJ/i5bBn4evxYukdGkksl
	3lXdRNCCw9kLOw4PFqNUaPySOsyvcTyqKingnBFDX20T4ScCCzkh72+3mO6UU+SuFoHkyK1qfKO
	1DM0c=
X-Received: by 2002:a05:620a:408c:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d4187cafeamr2030392685a.1.1775639207263;
        Wed, 08 Apr 2026 02:06:47 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d4187cafeamr2030388685a.1.1775639206745;
        Wed, 08 Apr 2026 02:06:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bb78esm5207821a12.24.2026.04.08.02.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:06:45 -0700 (PDT)
Message-ID: <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfXwwUXXsHdEU/Z
 LO8iN17U22LbtYlIuuJLQ5SUEndbMuI1hfhe/HuA/PdHYvf4gHOcBXvPE/cxB3zHnRpT2x2e4To
 Bl6UV/t38MUuY5s+CNGvncuMds8ALQvXvfHwUE6RHzr+IAMml7eTmNgtDg5ScTVOgWNgeKmDN9J
 rjiTWcBRTz5uPU4T69x4DW6u0iIwNjQJh2otrgpx+Qt/Hxm0rc3EgimyZTIGzaSUxzYcTk/S0W6
 iUt2GaFRmPWtcYj7EEdVfOzEgPN1HDVJHz/begPFgGYXZTXNWkp5ur82lcR2n8Sm5URJXs5298e
 hL460yv6KG6nUzstWtpKpzwSryUIqn6xjzS6gw1TnNoG8YNi3iA3+REyBgFGCTUmHy1WOm/sqWi
 lEI8hUGqUmMVpO0nVGfy1396Nc2L4Kor9yurv5WfsoYYR74XJMbH4iQnVigMbK9KW74ybKVAJjD
 dEsjeIQlTv5NP07C+Tw==
X-Proofpoint-GUID: zekN_wdpIkCT4_0_Rm31W1dqZoiGVzRT
X-Proofpoint-ORIG-GUID: zekN_wdpIkCT4_0_Rm31W1dqZoiGVzRT
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d61aa7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=g-AGuyTcngxyzYSZuwMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102284-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD9993B9AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 5:20 PM, Xilin Wu wrote:
> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
> Q6A.
> 
> This variant enables the LPASS blocks and codec macros needed by the
> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
> that the audio hardware is owned directly by Linux.
> 
> This DTB is an optional configuration for systems booted with the kernel
> running at EL2, where direct CPU access to the LPASS hardware is
> available. It is useful for users who need low-latency and fully
> controllable audio.

I believe on Chrome platforms it was done this way because at some point
it was determined that they would specifically like not to use the DSP.

I think this is more of a hack than anything else.. but at the end of the
commit message you mention low latency - is the impact actually measurable?

Konrad

