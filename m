Return-Path: <linux-arm-msm+bounces-80716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85162C3F0BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 09:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3613AF3C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 08:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619F32FFDF4;
	Fri,  7 Nov 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxSkVNhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qg6d7G8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709B24EF8C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505936; cv=none; b=bMd/sz4MJ1P27tqoO/9XDQqkmQjFwJH4PFak02C+VJ+BfCnJEtHJZtvJZoOoxE14zQZO3+B6OcwI8/j/j1zqH30jlzpLaOy6uDeJCx/2pG00s6jJrJl6AT8B0WSQWzuMVI4bL+7i7CCLoE0awoVryhWaYRI8byrFtZrEoZy9/9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505936; c=relaxed/simple;
	bh=609zwU9+9E0L/bqHk8paGZTAAEgh2l28t5Dk8vu5Zr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZBtGgyJZwFuo08a7SMU3fqKCs5+kBwbNMyeTO78OximhpMOUMtdaCThoyGitzmCTfTsaiOwTtHlBoHBqXuJnsyzudDU3VTnAPR32A/7SslV7HZwT4/3o/abMySRcHokOoOUpapZrwg0CiBIFBLy2L1Yly+bgvALpTZ1k3FonRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxSkVNhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qg6d7G8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A774UWe630889
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 08:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn9MVujSeUQg7Dj4W0694p+5S0bGJYjJQ6rQW7mue3Q=; b=LxSkVNhTpZButxID
	knOUvd7Y7gCfXWAyhBFKxBOzDtiR4NYZMNc8i7tJehlv2p4ushQX2hPDWZdxD1Bc
	cPtcpjp8xtS6qd3YVirgRjdejqtpayzUcKnQJE59LoAG/XujTw1qnvnk7rld1jiG
	e/UbpbCEkFLe716oKLCCn6VgYt9KqT9tuhQt3qOlk8TkCAmMSuyjkGwo9FjREtt2
	DsPnkTC9atTwRsFoHmOg6Tdqoza05l41S/nymeXvpV+XwAftxUllAMvDgmKX2si9
	mdqagA/7POHU0UIhhtI7G4XgMqlDroVrz1fclD/TFfMPTWT5SdCaBLZiwWWcXyVc
	NH+B2w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92231y6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:58:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eb86039d9aso1419631cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 00:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505933; x=1763110733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cn9MVujSeUQg7Dj4W0694p+5S0bGJYjJQ6rQW7mue3Q=;
        b=Qg6d7G8lGKFaYolQSoRznaPeWQD+BTUEAL+Y/M4B3rCIz4H25pX++CNpilbvm5lPzF
         1aHd1AW4A1/1NHPAvQXsIwG/JF0NEka0npswSX7DFtLuRMrZF1NzVLGJJBTD991vGyuR
         V148Np/Taqpftn04grF9x510WCFPl5Zj5XyeaJHjDRw4BiBwCsdCjAm2d0e0mjtw9wNS
         b/JUNnUNgWiYt2bRg1Un82URAABc8NH5KstKORjd6Dkwe51YbCOtqYkRMc/ixzj/f3O3
         fjFouY00ahAYFhmefPsyEaThmrlA6IBZH6VzNNiPGrEXQ6KnoH8r/7J7CXLE4Xk8uCKZ
         ozAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505933; x=1763110733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cn9MVujSeUQg7Dj4W0694p+5S0bGJYjJQ6rQW7mue3Q=;
        b=UqSi1nHSWRz5nTB+7eQj4lKckAjJvTX3CCYk6L2RN5HppCBzVzVhjZGIuceWfpeshQ
         LQicQkscDChQd+Ye6vHH3uaeWPrvQiAbDGBOxT596sQnrOUm8VvfGXxXhUpykh0beqtE
         +n8MACchqlk8KlWqWbcEwWhu8mmTotCHKttAITDGwKU5e/1/ofZ3hQFRo3O6GM3Li9eC
         twPs/r50LxXCwQM2Yp3FthRmKoXyHFoJRQfPx5ItGpEmK1A0/0h1wdxmXDA+QhZJfGDW
         CVBfUgZ+m4P6DFMURAUIK0XkAEFMprmqXNqJMo29ER6V9w6b1FgzAsqlTyENpmCoXYr+
         g3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUDVVIffQfgTNtczW8igSGdjupNcp9PQR+9RR+z+9Z9gwZCnUVSQFnXuDCKAq0T7BcU1bZ5ND+PU79ADIx1@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGB/EcVuzq0jrBEXKcvUEJOkjSowXb1f9gyd9pS2p0C6oh+L2
	ThZGMmSGSHRigBzglE/3WTAAvW0iRZ8mH5exBhJDOheMGepAI5OhYy4phuaOTPDnaaKi/ikW9VX
	RdGqksGe1Vw8V4iAjQialHWhbzFtGhhjPRbAqvJw+EfUsT2AFjZNrOTAj9DdM/7hOs93p
X-Gm-Gg: ASbGncswOpDi1sRDuQR7UbbXPgtK2VFmAeRJcHPSsAtzZtGXtrVKTYX1AGycpDckP9l
	kKmKZOOTSz3lXnJah/Dlzc6pqTFYvc3q6zkn0BCiTEodiGezx6x5zf5T4aYmNQHSnBszu0BeFDH
	OxVrENE2d0AXjnWFYIGTBz8vWRuNDPC48NoVp16tKrkzCz/uGJFuHlRwBKCweYpJOpg2STydrng
	IQAgGsrJt8OBvV2qoMaDX8D79YUpgdopSiRBFv77Q1P79a5omzt5PNbMdhzjRSba8JXKgWIhOi1
	smnyNmRLF3Ork0h3SVb4QQV7lZR6+TPW6IIH24fgvJ1QiBidg0SUtUuZ4b2NiQdAPUCHiKPeHiZ
	mKuF2Y+JF8EaXj/5fLHSMDVaJUsfLFwTt57KHjHL4WrWlgDbOFznAFaDl
X-Received: by 2002:a05:622a:1341:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed949705e3mr18347901cf.4.1762505933025;
        Fri, 07 Nov 2025 00:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3yissiuXnLprAb0tOmfzOXBuXxz3L4rCYCtZnWOoindSmuz5Umn/9KnJzzWMWahvXwcLBeg==
X-Received: by 2002:a05:622a:1341:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed949705e3mr18347771cf.4.1762505932549;
        Fri, 07 Nov 2025 00:58:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8141e6sm3807288a12.15.2025.11.07.00.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:58:52 -0800 (PST)
Message-ID: <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:58:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MSBTYWx0ZWRfX/PEC+Y+3lcYp
 fNTaPojYRw14p/o/4cs/QbB6bBHvITPtv74gNHUCFWKMSJ+qHXKi/hoZqvO+vpUHlRlCFJZYx8k
 QGRHJrIjKDv3JDNLK93piwjM3GUCMDybqQ+EdDriMN7H4OzFvD5kc0JTXL6toqSrkSGdqBbQTKU
 ARl4nJBl7+uXdbvIgZl8fLEwi5sLG2ZJwpOuLDrTzDgVGZi0wX58n7f0HOeXK5m4aZqiyo7432P
 FLM+JRkYkbexKY9Ny66L1xs891lBP2I4mgRpi0pGLjUZiNZP02pmDN0VlZSjUx+PFn8DB4xX2k2
 jw6xs5Oj5OxgThXmCtdF7mdrzKyXwYrUB8Q9pZpjA2KBV2Rxg8gado+QkVWXnN3z/gvD59ME2XM
 2ULj//Pwoxh1AGjUkRxCjf2ko6rmIg==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690db4cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DZDN4dxgVV-jXp9GYI4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f3coO3r7yLrPGSjwK3rXSWZhe4tegC7A
X-Proofpoint-ORIG-GUID: f3coO3r7yLrPGSjwK3rXSWZhe4tegC7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070071

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> This patch skips RGMU core initialization and act more like a
> gmu-wrapper case.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  	/* Enable fault detection */
> -	if (adreno_is_a730(adreno_gpu) ||
> +	if (adreno_is_a612(adreno_gpu) ||
> +	    adreno_is_a730(adreno_gpu) ||
>  	    adreno_is_a740_family(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);

Downstream sets this to 0x3fffff, but IDK if having a timeout too
large is an issue

Konrad

