Return-Path: <linux-arm-msm+bounces-47588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3AA30CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B871883FE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDDB1F3D49;
	Tue, 11 Feb 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti7IvCwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC61D514B
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280681; cv=none; b=jcEhtD9KCFy825XVk36x2F5Ti9Psw5TL4vdPS0SJNpUwlAh8D3LlBSxigmTwcx8/9MNZXMxb7d7FPyzwI6j2PEoOXsFWBjzzuuhJ75oV047h9I56YasePPLu9bzdqFgZzSi61W8Yfa29SMeSMKu61sV+jaB+leGcD8Tor3KpXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280681; c=relaxed/simple;
	bh=RwTJfBaMW2/pa9J/hvPQKduFjwLKJq8rtjLr+5PGP+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekVQqTrZ+nyCimZithtDUBDyvLYqMCHO4H8etgB3KeCemlNzyexSFV0nZo9KEvExxILoo+HLAfv4B7mqQiGFk4/LUhORWb2ZKU+weeFBYHMd7C7ksI3CSodgmO/n0i2uI6t0BkAU5m9bSo1f3+3KSslryMupX6jq8smCr048DmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti7IvCwY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBHpbi026413
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8gfsxl5wjBXJWzy9IZRbAg+/QZ7NlWDPkHV4SG/aR4=; b=Ti7IvCwYBE7joAfU
	J6wsCP1oRWJ77hUTaDlvc6KN+efAAh324fftecNig1lGEE1Uxx59ZNw6/WGILaJD
	Kc4mwBZpC44ijC5bpiUd0okiLfOMOBTwQZbzZ4hWMRri/jOtqLCtOaBiortGMzmW
	fYWA9wuLUqi7WKomIvyDHmsi+NBDwcKgEA3yNS/MIVrxfMHFDdB9xy4JVpL3i748
	ZQ1pLVpVb8J+JcSvXkGsUUGOAH8mT9FbA74O34+JxhsykezZBZw5RnuFxcZY0k6E
	WpSliveD4lJB/8vC4MOXynL4BrSe4jTrNVxtyGu5IejbjRmQoINk4pwkS3vPtojM
	2ocGiQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j58e6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:31:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e4521c35c6so9857006d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280678; x=1739885478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8gfsxl5wjBXJWzy9IZRbAg+/QZ7NlWDPkHV4SG/aR4=;
        b=sWq9eAEpxkjsj9CXRsMGtY8ycYl8dKRSPrRusqpPaIPkjI0g7RMzP6LEQZMrL5es48
         EbIaldhZ7Dgkj75N4WvW/235gwA0Uer59gUb6WcHIyyTnIdX3J0wBL+9Z2QsCmTTTP9R
         Uq+cZ/1+hNJcGFSxT5Ybi0R8GuBa1uVX+6nhwfa+yfApcc9IupiDWkRKBSVglUOi51pD
         +66/COJ6GmQf44tRq28Lcregx0VRR/ZGoVTr++mazlbw1XGoiyUlpwu3WO+ZHB3/uZiX
         fWhsul68UMQjqGnE6DZSPyCC4rHZ7pRI7aeSGtgqXlQVvqRQiFsA4aFs//a9heyxTrs2
         g63g==
X-Forwarded-Encrypted: i=1; AJvYcCV0VwizqD7aIreLUb+iV/WfJRrger4o4u+M4GeAfhnCVPXlPllknD3jnMNQQ+Q3wC37sxIyckNU4UwPQf8c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwcn6ijJmiTlSOjvhe9azmFtoUfhGfEfwii/UcNJpRMXrojxVr
	Lo279jX68OmRBLViGLFOdaIehUs9Qa85KLsVVTFzxHomKxWBDisJ7GH3jwhiWsRJLudxbacOimw
	42IfU6Hw4jFS4C82eilKopNozF/9VqQlBAM1dP7NXvUP4zRSUJW82Pb+TfiXylPA5
X-Gm-Gg: ASbGncsDyS5MIBz32/X0bFa/DaGP3TMqes74SHpt9ti3vzAw3QX7YoPTPBVJDjt+ihf
	xk8KazzD3/GawbWbBlChyG5iLv7M25tFgxFdswBqIPxG60QJbQxf2a+iezBRizliICL3X8wvrn+
	fK1qZtc5diae8jNm5X0Uc4CE8e5pWfN5Eg2V+Ujk83JaWVO2tTyAOxlM9tHEXocLjE/Qwi63RKx
	mjEmEKhwg1H2SEofFF5XArkLZil7UQxkSLF5kbe8aV2RnSke50qtUwVDMoqI79uRi/clDmTojcF
	s7y5qs1fneP+EQ7+wKMz+soL3merbGbT58NvRtG8KJd0dASPGj33r0P2JfU=
X-Received: by 2002:a05:6214:c65:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6e468dacecamr11867016d6.7.1739280678096;
        Tue, 11 Feb 2025 05:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZpgOADXexGty6sVFgmRdsYA39yzSbEDl4lVKreV5wAGJ5UPSGTJjaEwsdYbIYB6FhRH6giA==
X-Received: by 2002:a05:6214:c65:b0:6d8:b562:efcd with SMTP id 6a1803df08f44-6e468dacecamr11866796d6.7.1739280677621;
        Tue, 11 Feb 2025 05:31:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dae77599sm159225066b.30.2025.02.11.05.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:31:17 -0800 (PST)
Message-ID: <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
To: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
        fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux@mainlining.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250203181436.87785-5-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1Cp8VuHK8P5Q3auGrOFLhyJ6IwqpIf6F
X-Proofpoint-GUID: 1Cp8VuHK8P5Q3auGrOFLhyJ6IwqpIf6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=971 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110089

On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> Enable the Adreno GPU and configure the Visionox RM692E5 panel.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
> Note:
> Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
> ---
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> index a5cda478bd78..cda317b49d5c 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> @@ -52,6 +52,8 @@ framebuffer0: framebuffer@e1000000 {
>  			stride = <(1080 * 4)>;
>  			format = "a8r8g8b8";
>  
> +			display = <&panel0>;

This is allowed by bindings but doesn't seem to do anything

> +
>  			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>  				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>  				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> @@ -757,6 +759,10 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
>  &gpu_zap_shader {
>  	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
>  };
> @@ -823,15 +829,44 @@ &ipa {
>  	status = "okay";
>  };
>  
> -/* MDSS remains disabled until the panel driver is present. */
> +&mdss {
> +	status = "okay";
> +};
> +
>  &mdss_dsi {
>  	vdda-supply = <&vdd_a_dsi_0_1p2>;
> +	status = "okay";
>  
> -	/* Visionox RM692E5 panel */
> +	panel0: panel@0 {

Is there going to be a panel1, too? ;)

Please drop the 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

