Return-Path: <linux-arm-msm+bounces-101549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE1AN/1xzmnxngYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 15:41:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F35389E61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 15:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18A90301DBA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4A930C34A;
	Thu,  2 Apr 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ajyp5s/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfBZ857H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C52FFF8D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136947; cv=none; b=Wa+TGhP0JqBqppeI8IJypN2xJ9RALurTPMuIL9jec/hqoJI2GFi/P9mPZXJRbuIdhav9sWnfaW6BXz1vhBXLK8tJhvKs1OmLkAA8GnEDTZPPe7nFQ2mZ4f3ONAHROl20QhXxg9YaMfsxP3SbeScQ0vbp7+QFuOg/191D/RFMqyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136947; c=relaxed/simple;
	bh=gCGNXJFNQvyItlwAovW+ndYukDhsytMH2mPEFSyn5y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNED0TRvI5i8uq5KiedsiYdnDOVj1d8EdON3Y44VWc1f8FGMjfxzhnLfG921W9zW7L5aIufkjctU2j3pWRO81MKXGlpvrFF2urxWRuiqqDCMSs+GtX9nBwtCHKuhoYAqzNxjhZV4gRsGd8i82S3GeAo6Hkxdb/ljGauW3mZ83vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ajyp5s/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfBZ857H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BtTaH3238851
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 13:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xu94mL1Un+OWCMDeXx07PLCG15kkUK4/1ArJRluxXUI=; b=Ajyp5s/8ls5j2/dp
	42QbDOzFJMPgmNwiHMef1GziEaX97LNanN1FHwpgTVCu07snQQgYx2oFqvoYa0W9
	yghSULMmE/9OiOLREE+FMeVDgS+kK6Pon0bJFnwcdwiJcUgZkUU5ej7KnIrkN/yd
	YiIPSYnXdkh0Pz318zrftX6v2REMxFsbfo8xabrG5bp1o/pEJlPSIhwUONQiFw/N
	U1+FDifQBwGtfGDTHm0eW3J40XC6mE2x9J2vfWpYp4lguzJZawvqdG4F4FGSmKIF
	uYTiBB4VBnwfHJystk9oz7EITZ0VJ/pJf1+43wpKAVIHMHLB1Nv7VSKe82vVuv5H
	2WGz4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u0ddn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 13:35:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c4664f75fso580988b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775136944; x=1775741744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xu94mL1Un+OWCMDeXx07PLCG15kkUK4/1ArJRluxXUI=;
        b=GfBZ857Hlk/uU16pVhFvBb7Z+wHM1UCpXWsBQg6+ZdZ2ltqKc8jtJMogVEEWsNAiTh
         qdRqAq9mZtJ4CI24H1YInoTqsdOI58huaZABENvJCaW5Wg1gGNh856OnDsKXKhBUSGBS
         8L0utUrZsA3Csn0Cpf9Ug3LCdtzbxplrlWW54+lIhdSexK8DwLG5dZOh0AHdTlLsgARv
         S2V6kwbRZEJb2O4KJ92Dwk9Y7mM/19cWtINTTPQZ/lUStN773s3DEz720vt5CBSOdmCo
         gVowb9ZI6EWuAFouSXjEoLq6nyxhWwCzhzL4ipIPkYC6s1u64NHr6yZvL99xPFvT1PCn
         goXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136944; x=1775741744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu94mL1Un+OWCMDeXx07PLCG15kkUK4/1ArJRluxXUI=;
        b=FrY5o+QrTg1TwI2CwQUm37IHbpbQHAjcF25iXf0UT8/rRK2Y/1TbNdknGpke6f5mxk
         CwH0GwgVbIs+h6GxG24RgWa0T3slUq4kjWt2bTgvk9mSCCGv9IyhM+TwwY3ZRGHhjdG1
         xaWjFPQmLhPKldHS8KKErKbACI45Pu8FUX5tIIRegVFb6+c1xrFCR+esDdvMNXRiecAR
         yCgRljyZ208NvWo1yTyTr4rovcOdDYAM6u8VvaR/M0/it/hE8cCHNf341Z1CWFU27seY
         ThVQuJNYVM+yYph7ZD6wJttMeVOD9VSHD2taZYsQkI705pCVy62GMWqfaSIz0yngXhLL
         hIKw==
X-Forwarded-Encrypted: i=1; AJvYcCU/KgQnG2bQ/343RYvmKec4pFAvEA3B9MSRgYr4netIFOJyr2ZUNin6SW0HB2LDTffBWAg6Dj+H9KcBBlIn@vger.kernel.org
X-Gm-Message-State: AOJu0YzwfT9gPK74KDFuOeLTrRZRxdYHKCNUROcXYCqKmsCK8B5ksa6e
	BlpAXKo47dwrUWW4Lh0np7g9yFOC0Z6aUlpHnbmRTIXy3p6aZ+y9/kiCnOH7B4AHjUxjvMGCecp
	7kVX81DFrbZtZNILMUS3X9o1BB8QPcfwiV6pYkuG0wAgffi2gZewqvugdM7CgMYgGwoYsh/Xeo+
	ld
X-Gm-Gg: ATEYQzwJmbI9bOeJyhpR3pqOAzMBQyfq2bPRlJYshOAU2X1ezz1BnKW9ndkStq4/XrQ
	MzJMMI7AFI1f3rTpyaYUBONUySInMzGISkxuN52e9dRTBp7XCGG3baP4q4lTngOtjbppV4RzbU3
	8IHYyrD9tJ/rkNCaf69ut/PrIy2FqMLm1vYWnFt05c1MvwiK5otEWsO8N227ho1i1GrbBLgTAtr
	Bp+/qndTJ2dlS+fXlzJGWsFnl7/7QjA9eUErl8rXELXWk+dxBUex8miHZtTkrfbyS/eSXfmanA7
	CCTCTfCVQWh63pGdA8gM4TohuNqooOuEnsEd+4rTP7ITZxXuAssjUbftd2EEo+CbCGa/Ba4xh8E
	bFwBxdUwy6mhANqhd8HyDOdhE+PNW49IFkBoDVobC9fYt7CLJZgnYAQ==
X-Received: by 2002:a05:6a00:1405:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82ce8ae544fmr7252932b3a.28.1775136943603;
        Thu, 02 Apr 2026 06:35:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:1405:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82ce8ae544fmr7252908b3a.28.1775136943090;
        Thu, 02 Apr 2026 06:35:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.247.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41a2asm3395236b3a.37.2026.04.02.06.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:35:42 -0700 (PDT)
Message-ID: <9e65a64f-b227-4107-873f-5800cc79ee21@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 19:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyMCBTYWx0ZWRfXw/kakonZySlB
 +O668t0apVUe08dtInRfZyh2xfoswkqE6zik8bq8tabcybDsEzXH+6QCuSpo9TbLsEca7t2ycmG
 Bx+4k4smAj4bd4AOOPCCRwnxXpRdpEDHQ2rDAsdWxmAtPTAW0waceQa5K5gRVtQ83XNTMGKnz0c
 ZmKdjCd0U1uEVMBoOdKaBbv+dezRH+Egip9E50bkZZ3v2qHLdxcZjCOe/i4OpUD8nWJvp9jP/gq
 ziduruAtO8IfLfJDL8XVoVpG/vBpHU6hE/cSeKCZJkP7lgQQ/a5Ex/EoaavA8KEXXnZ+nzu2e5H
 CdbgFkmAi9zw+fcpJZCsUmGo60dq1WAUOOSR+iu0s7yriRPgl8jH6hc/nuPg8LFMEP3mtMLHrB5
 yBtlXF2Ggh1pc423MEpKjrkQ4C6EQnWvkupNe0bVNnTuzd7yVhsEg8RkJSS4VLaVi2e2nXywbO3
 e/xjcW3kyjTZQ18L7og==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69ce70b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=HITMEuADKAZbuvU9jplFJA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=zZH_qJBfeQ1MonjMHkkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: U0jV_qbILZe5jQ5F6l6mSTaLRCeJ0RT4
X-Proofpoint-ORIG-GUID: U0jV_qbILZe5jQ5F6l6mSTaLRCeJ0RT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101549-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48F35389E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 7:31 PM, Vladimir Zapolskiy wrote:
> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
> domain provider with a special Titan GDSC as a top power domain in
> the hierarchy and as a clock controller, where the clock provider
> function of the IP strictly depends on top Titan GDSC being enabled,
> thus it makes the CAMCC clock controller to belong to Titan power domain.
> 
> Today the formal hardware dependency between CAMCC power domain and clock
> controller is managed by runtime PM in every CAMCC consumer device driver
> like CAMSS and CCI, however this is terribly scalable to any future
> CAMSS IP device drivers, and unfortunately it is not scalable at all
> camera sensor drivers, which are also CAMCC clock controller consumers.
> 
> The change adds an option to describe CAMCC power domain to CAMCC clock
> controller dependency properly, therefore runtime PM management can
> be simplified on the CAMCC client's side.
> 
> The series touches only platforms with CAMCC drivers, which marked as ones
> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
> change, because camera clocks and GDSC power domain are not separated from
> other media clocks and GDSCs.
> 

Hi Vladimir,

From the camcc provider driver, there isn't any HW requirement of keeping the
GDSC ON to access the CAMCC registers. From the camcc provider side, we are already taking
care of camcc required dependencies(MM, MXC). Similarly consumer drivers need to take
care of voting on their own dependencies(GDSC, clk).

Thanks,
Jagadeesh

> Vladimir Zapolskiy (2):
>   clk: qcom: common: Add option to link clock controller to power domain
>   clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
> 
>  drivers/clk/qcom/camcc-milos.c    |  1 +
>  drivers/clk/qcom/camcc-sm8450.c   |  1 +
>  drivers/clk/qcom/camcc-sm8550.c   |  1 +
>  drivers/clk/qcom/camcc-sm8650.c   |  1 +
>  drivers/clk/qcom/camcc-sm8750.c   |  1 +
>  drivers/clk/qcom/camcc-x1e80100.c |  1 +
>  drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>  drivers/clk/qcom/common.h         |  1 +
>  8 files changed, 23 insertions(+)
> 


