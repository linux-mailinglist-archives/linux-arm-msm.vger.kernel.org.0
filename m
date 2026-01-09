Return-Path: <linux-arm-msm+bounces-88248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320BD08607
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0295E3010987
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C123633554B;
	Fri,  9 Jan 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbEMBRmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YEq3ZIB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633833556E
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952730; cv=none; b=cAJl/fZ17+DSXJue9Tcp0/NP2ee6bTLvxK9sps3ZVLjrhOulaeENRmUS8pfu8Vz9Gxznm5LHRYsSTkg0gW/jBCn6CZRIe9y4U6wbyEI+a9EPmsXSKUf8a9s6qhCDALY+4co/1ZjnOxei1ChGWtwfvKwhsjIkB9hQrTxo4rRlVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952730; c=relaxed/simple;
	bh=w9kmQhr3nHgHIYohpbkrMCLLczT0ETWtT6hWFY16hO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Add4FAJ5kWmg4fAZwQbgi90I27QFv66oO2/h06pvDIwspVn4m+k6r63Db2HGcycWky6PXbL7k4BJBolErgD2qt1NC5soZJFvlQlaJS6bLQO9Yu0R8KbMhFLp1zD9Hz4EUBDuDL+mjZD2vxL+gheOa5VkkGSAtxpR/23EPDlsCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbEMBRmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YEq3ZIB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096SO7L3141617
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+6GsV1dZl9kT6hAIcgcGDP9q3jtz6hmBU4iyqq4JbUw=; b=nbEMBRmbowbFIPrz
	LxLtlsDhO3Nko65fxamFApMmkJMr9DFazbkvVpDaAPrjon+BVwBbPNkvKLGcJXG7
	U34k75zv7tNcJgXthddZ2o/ubrp7bV4Au1sGif3KXRLQjGjfuPHALpLTXXy1lMha
	/YZvW4FX6b0Ipr6E8rDaLqhIBh7K7T7/MmSl2OTOFfuB/u6ldq+7VX+6BXdIZ32P
	tmuObfPVE0q7YzL0NUDys0qxqRjG3A7Wh4whHAZCvhOqTeh+NP7L5yqrH5cyM0sA
	E0mmN/Zd0vY9Uu34VbbppXr5txc3b2VqnYC95D5CH8FgRlOQ7cPxXVAuL7EjnTUJ
	fzYTPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j27dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:58:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ffc6560f05so3955571cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767952727; x=1768557527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6GsV1dZl9kT6hAIcgcGDP9q3jtz6hmBU4iyqq4JbUw=;
        b=YEq3ZIB13WsadbGD5mWf0Pc+S8A+ZBmLpBuC2TB3rIuhthVbdZ6TC03z/LrW5QLhob
         d/GcNRbv+VJgQ3rrRyrDqdVp4qgc36oUZp7A4Sh4m+c42i5VMw27lexWvE8CP3IIV1WN
         dUYFHV/7xLeaT0l4xo0wKbhvk0n2JZlqFdr9DN5i9PuF2zxSvZOKpYkgk1XOBV3C5b0D
         C17tzPzmPDtylzfnB7pfmcQUYUPXEwewD1AqeSgxbeSDGl1Ed1d64lUX0pVJxOilWR36
         Z2hepy4c2W+HcLRXXUgT7ayykFjgOH+eAHP5puDi7BIiDPcqEjU1nvz/ImyfOFRCKuEN
         7p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952727; x=1768557527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6GsV1dZl9kT6hAIcgcGDP9q3jtz6hmBU4iyqq4JbUw=;
        b=g3z+5MsVM322Zd9l5kRIOH2YqJYX7EbHbgNRLInevvYOX0dWL3Y1jib66iqBt0qFut
         6DyPRTUEPEdMMM9EGEOzl5N8Z4YleT1doC8l5if/vVTE1YQoMYnbRaDlarznr9167Y3L
         BOT+Tt3XGFs/kd7CzQ2YHB4wscggYCiQT2AXvibCI+h50L4tbfzj6lNTkiLNPmgcFwsK
         8mK+CmkdrzkPjUspWk4m9A5dAieRDNvB+EGVSwMail3U+6XOnb5BpmCQYbw9mYQ45GzO
         iA+CbKmDusY9zbr3xozFiRHshNOGvvY8aHuDuxPPewaG+mkVA24PqwOjmInYZBqATovz
         TPyQ==
X-Gm-Message-State: AOJu0Yyi+vVEoCI9XgFHWOZo8YSPi83PyuuZejBz6RUjqXBrcI0rXGxC
	+zz88vypciMzfTIiEyKZjpRPmr2XwkAgSnFjjGW/LTl0iymTAlypZd6AVeciKnq7ZdBXLdMmkJ3
	lCz1IhpwSpXzwgPQ4M9JsVguoMyd9k5w0KVuMi/JtR/0eWtkMUCdHkmYUH+OQhIT4q51m
X-Gm-Gg: AY/fxX7tistJxT6jwKYR4ie2CyCrjavw7t5w9WPCsYKNMj1TiYg0SN26RNJ23eOVQVJ
	ZcrO//S8AreoR5ALYCNfdnlvocdPQ4ZM8n/N1kLF3Lla5MObpdhLOoZZdzVOdbNKIuR+mqO/8s7
	zwLow53t6Z2kYmiMs+peZju67AVtYIvdhKDZgqfmKZlBU2Fi1BPYtPWwKNs91+egBbMTWwo3Ahw
	JIzkvk967kNljUG/wDNv5kF/ttCmK4Me3kHzABnDJZaGCQbwDIsaJBNCGlN/3wAjQ5LQ78K9LST
	qHMjjoWUAwmVeZcOs+FrzyC5kOx4046B0t3KXtdjaJDzDE4BRdiJPKN2KUkggmvWEV1SltpTYow
	IE/lISXB55U5iwg17CyM6pQinjBzfQfw/ZniJn0OzRpdxIPzBlZK061Z3ZkR+Eg5/Y9g=
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr101362351cf.3.1767952726948;
        Fri, 09 Jan 2026 01:58:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8E29q2sylMSnFtakEPUUAJV/nWkQMkdMPAuEzQOehQkivxBC9D4DqYRshBbwS0yUI9YREWg==
X-Received: by 2002:a05:622a:2cb:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4ffb48d3b42mr101362231cf.3.1767952726379;
        Fri, 09 Jan 2026 01:58:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a564e05sm1099326566b.65.2026.01.09.01.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:58:45 -0800 (PST)
Message-ID: <5187dc04-a1a1-4537-9c80-aaa100dd0033@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:58:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3MSBTYWx0ZWRfX5BOUVKGalVDu
 mxC/7+QSrfnZrW8femLkQ4g0H/JsCryX/TBKZMHpIFECkPtjEnci6uaiDP2R67hH48wCRDhB9XG
 46Bwac9PmZxJsROaRN8Y0fZHw4iIdPK4zfc2L0ydOU0v8rIHlbINbSyBX6NnjX5lXQbITi85680
 rEdVL19iwlPtzs2jNDim6mmH8jN0D9jADgrrjTCCWLA1NxmUBgU+awPVFiisxzwTRLruNyzPAYR
 P8D2sqb4aM5C+ROiYV5bY0oXjAJf3HE5DdqSV0eVch4lGnUVNaAimYezX5TbQIYsFlj4cTJAtjv
 EH3DXmyoz4t/xh+j88tSvKh3T+a0svGBBetHxFsXh4WvpdU++DLlyWi+RZw+En2nddg6qAXx4+K
 qh63bD+cuYTAmPCKMJJwCFc1SITGTFc6ffIxRl8U+JVEK7mjwoJACKw6Cf1mne6YOzYkJya4Bru
 TI3aPsnUQ4VIE/yt3Xg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960d157 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QeOGaa-XQxNk_RVdTJwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4i45hpB1C7u7_zGdtG3baNB8LFC7Os7s
X-Proofpoint-ORIG-GUID: 4i45hpB1C7u7_zGdtG3baNB8LFC7Os7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090071

On 1/9/26 9:30 AM, Yongxing Mou wrote:
> Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
> mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
> to the appropriate DP-mode values.
> 
> Additionally, the HPG specifies that the LDO value should be set to 0 when
> in DP mode. These misconfigurations can lead to link training failures on
> certain dongles.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 13feab99feec..5b0d774bd715 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -122,6 +122,13 @@ static const u8 dp_swing_hbr_rbr[4][4] = {
>  	{ 0x1f, 0xff, 0xff, 0xff }
>  };
>  
> +static const u8 dp_swing_hbr_rbr_v1[4][4] = {
> +	{ 0x07, 0x0f, 0x16, 0x1f },
> +	{ 0x11, 0x1e, 0x1f, 0xff },
> +	{ 0x16, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};

For these platforms, I see 4 tables of settings:

(Low/High) Swing/Pre-em for (Low/High) HBR

None of them exactly match your change 

[...]

> -	ldo_config = edp->is_edp ? 0x0 : 0x1;
> +	ldo_config = !edp->is_edp ? 0x0 : 0x1;

You'll notice that this is further wrong, because for eDP, it should be
0x81 at low-swing-high-HBR and 0xc1 at low-swing-low-HBR, and 0 at both
cases of high-swing

Please split the LDO change into a separate commit because it touches
more platforms

Konrad


