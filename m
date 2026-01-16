Return-Path: <linux-arm-msm+bounces-89306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED0FD2C5B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9565300FEF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA4434CFD4;
	Fri, 16 Jan 2026 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7vhwqp5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZqTzERI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324034C981
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768543859; cv=none; b=SODz0DEf1nm5Jo55ah9wiXw1t0aGvopY4IirEvFlijzE6meW2fZp2sbMoFUVXUZsI4gmhiFm0TEv7UXMyUMLdPpMKpW1RGPuQpRtCuD6IDT2eRky6ySL+e16JGFHYrvk1M5JHwBwLFc9bOw8/EDyTQ2mVPJlhSY5FcbB4Pb7sv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768543859; c=relaxed/simple;
	bh=UWRZdYdbVOS0Qf0SoV1GOlwURlJyQ9EwbQ0x+ZZu2Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eU5Yn17TEntT2aJ0MROFGe//N8Y187wdBDnLrsmK3K7mBFRoEkqfoQjCcLLQvf0EPJz2Vfwyk5w91JnRH66DgjJTtkbFYMB+s55tQ8Ks/Nz3atFBvmRMR3WXMF6fA2Q5aehVdSu7e92ek9miOV1EIcyayHtY/S0x22MZCEljt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7vhwqp5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZqTzERI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbRHx3714365
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8dvGPLqwrrYLb/jUyaHbTl0R
	INjXWSRLqYqkLp0HioU=; b=R7vhwqp5cDUhV0nwb9FqfTFX0WA2X7STq1Li3Twu
	u/C2rqetf0G99ZRCUdfoXSC9z7puk2b7idtC1gCPijNtDviUTtBSKUuXYUlyS6pD
	ZcDIKo8KhvODP8JI4M2kXPAbzJMch4M+2SNu2JlwYdwPUow+wfuHY0l3kK/89166
	UKUBtp948E5vf5n2FMgFp68SqCN6UBcYeSjX2vdvHeoicGQaQqBE3MRlkpYYxxLb
	ER61lGuN8b+WGxAOdWcku2Ix4AUiZGULhrjX9RAAJm1Gk1KsPHyJO0U4fgTnCrJB
	7xHC6kKaBHp2BVHK1L06RkTda0gsf7+fFbv7SYidLQ360Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96p90r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:10:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a7fb4421so85677685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768543857; x=1769148657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8dvGPLqwrrYLb/jUyaHbTl0RINjXWSRLqYqkLp0HioU=;
        b=RZqTzERIyxHJ/eU3i5PRik8HMzxyG/w1lqC8a95Lm2ClAo4wQt29/HE4kpsAF19OB8
         0M02yY/WfxViChRWiftv4SqRlSOabY878ragw5a30HYIOkmEb2wo0sEEWE3uOZABazmH
         yrdaTce0cISeOKajq3SkA6pA8Eed4VooIQsDK6ymbQ+qzp8HP/wRCZPA+4EukqZdInac
         STYOpKR59RAgKYyA18bsGTs62kBjFdpmyUVpTjdW6SAun9VnEjDWfKLurUkpbQa43uHw
         9Np4hcVgat/D7y5b5GEUcL34Has7+i5pefALwgTsiMi+JLIfab78oD0u0UlBpopzvlGx
         pBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768543857; x=1769148657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dvGPLqwrrYLb/jUyaHbTl0RINjXWSRLqYqkLp0HioU=;
        b=K8ugTamOaKws4+0SMU4LuuqB5g/e6Z2GoySTQ77qC+Qf+5xulHrHTPDhZAbAy1ZdUU
         6uqAcy7sVL1j2Luzc5xG4Copc9zlMWu9u/j4Kvc6CQ9aycGtvAFnwy49O6hRps2Xlw4Q
         Hn5jn7jRPpY+rNJF1HeuDTMLKOeEUhUkaTckcT50JFxXqo6LPJGi8qOix8UminwLx9JG
         3KoKt8GQGqK/RS2SYDOpSL5dmLltjBtCKd/xvWwtckaMnfPiWQHwsiCC8dJX+eCgxseJ
         1+OeR+Twxzkpax/TbODtiooBdaHDMx8r0yLm6uorzYvRCAtci9bBnt+ylCoXm1THngBE
         yg6A==
X-Forwarded-Encrypted: i=1; AJvYcCXcoGG1WVuG0LEshgyAoclQL6upkfP9vTPF7oxX+UWHkhYILto4QJ3Nkdjvu5/7D+Rl0qF4H3kXDTXZU8pT@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmYBQQvFI4Ta9iKRENfH2n1ULOp4Q1y7RMcKuzwHZr1HFGzBi
	MuyEk2crUTEzeTZNEtkqtgF6WlP9cIG9C4Gtjd3oOTRbgiJVZYhTdqftUpvrv74szCfI1ZKEvvM
	VjWP8sYvXfDHd3rbbJfxTcQLpIPmJIsECbh/+NBeTa5zjxJnIiKnYz+Kyb0bPvCW7hzeED53OYr
	Og
X-Gm-Gg: AY/fxX46hpUNm0dwIg47cs99eM+Jsb5XFJO6xaz0UNho+F5BWb+soktzPk6wOP96LAQ
	goJTwkzCyiHYx7mNs9XQUUV23eb5cp3rH/1XMurnKPw5a3vo5+U8XRQeTxMUHdmH4N8i72Bc5oS
	ziudOgmoREAkAKCbKdjViCNkz9O/u/QsZlX3hOUx93VOvoYYJdrLj0TWoRtAPNa/iEELKNczFEu
	tRo2YLqWwDIWGSjmLT68MSSa29QLwYzwNLVrgloevReLEsLU4DCOiqgaRuhQ1OmsjFSvLoIrXsm
	FMpR3X+tYjBRHOkqOWWBbWZYBndS0nYjMOIdkAkoTLL/T2qbYQqXGrtKQ9zHuBngZGMQjtAhW3s
	v9H+ZVVXNEsxjSG0I52hNQGIdNaM/r141r/X0Usq9IfPFisnRoh5c/6gcH9gp71xM1RSZh1mXWF
	NCqSuR0PgCDfMnwAElg/4orz8=
X-Received: by 2002:a05:620a:1a86:b0:8b2:4a1b:b80a with SMTP id af79cd13be357-8c6a66e4ec2mr297780985a.25.1768543856742;
        Thu, 15 Jan 2026 22:10:56 -0800 (PST)
X-Received: by 2002:a05:620a:1a86:b0:8b2:4a1b:b80a with SMTP id af79cd13be357-8c6a66e4ec2mr297778685a.25.1768543856296;
        Thu, 15 Jan 2026 22:10:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm457592e87.24.2026.01.15.22.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 22:10:54 -0800 (PST)
Date: Fri, 16 Jan 2026 08:10:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <s5eu5xqoh7zs762dciup426fxed7kcnk3offyguv2qhqsnaomt@drou2clinmly>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
 <20251027-glymur-display-v3-7-aa13055818ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-glymur-display-v3-7-aa13055818ac@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0OCBTYWx0ZWRfX2T3dNAqo9W8H
 YXW7dbj1T5ItQfOeG/V2GtuD5xp+0y+kDUmvEjGoytbsGkMigupvBHX2NxnsfkVDTt+zCcv9OsO
 x5fXXLmOplvnYQc0d594xSmpbRD4uM43uSf8fZ9THZ+dfmahfmZ7VQ5OlqusAk1IXoS7LUV1Ma2
 vAc//wMv8b2J497jAUtlXaHfJNdnuZEyOyIjzPjeujzW/cT7o5XdaqrAeKxmQ7RhhxBQJRuYDhk
 P/uEIaZyU3wasB8sSyDH+pKcfx2AGq+axkemCXLPt8CKJ7PW2bEBbPchsrYuMDep+ugsb6wVeXl
 DhoyTxy7SHLh73OUD8FRNBNOtO7NttYyznheP5WWwt6hsxrtdfYgm0Xdsz8hfnsR+AYvG6q8LJQ
 UDQ4/Q65aHA4WYxbZEVNmbi4ReyK5JCCwyZlvGSi0Ke2WNPTqmsV/IWCw/PMAPSrI7fWjSvfUBj
 q8XMNL4JV74z1UdIzgg==
X-Authority-Analysis: v=2.4 cv=M7ZA6iws c=1 sm=1 tr=0 ts=6969d672 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=qHQHcOLFhFkQKvqmysIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: j5qpxkC1DgNWb4rB2Da5oJFcI9h4rYJe
X-Proofpoint-ORIG-GUID: j5qpxkC1DgNWb4rB2Da5oJFcI9h4rYJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160048

On Mon, Oct 27, 2025 at 04:59:24PM +0200, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..7cca2afb68e3e9d33f3066f1deb3b9fcc01641a1 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -218,11 +218,23 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  	.macrotile_mode = true,
>  };
>  
> +static const struct qcom_ubwc_cfg_data glymur_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> +	.highest_bank_bit = 16,

As I started reviewing UBWC bits and pieces... Could you please check,
according to the document I'm looking at this configuration is not
correct.

> +	.macrotile_mode = true,
> +};
> +

-- 
With best wishes
Dmitry

