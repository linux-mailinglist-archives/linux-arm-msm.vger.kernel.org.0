Return-Path: <linux-arm-msm+bounces-52490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2EA70D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 23:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70CFC167CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 22:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E5D1991D2;
	Tue, 25 Mar 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qkqh6+Rg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B4269806
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742943215; cv=none; b=W35RKyMSK4E9m9W+14yRIlUL/SSbOaRNG33jc+btwi1d4uMO6HiA+oZDCfH4WECQsLXEv86GiHAz82QLKOje62Du1HhIu8HM6Ouviaj5KfboQjJJU+K2tnWJlwkOkQ8CSG48mPJ7Epi3aaVErgs+P0vl9IrQrQmm2Tgk/1FEY24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742943215; c=relaxed/simple;
	bh=8U1QTg3MRbZS2lVomHqPTnXhotN0HeJLHsYhRpR1b2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLWmepk3g03IQZEuK4Zip7cPCexIK0xwXcdf2NW0mwVevZQ0kE7uH8knETTwpgUekjRLxttg8/kKOzWSOI9rHayLF+0uU+0IYGPJ490V+OXAiXz8ytIFblC2OZkNRudTGeSF5EjfG349XI3do7if19h7aZlZjUedWKD13T8IsA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qkqh6+Rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGaVae018357
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 22:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISr8+dBWyTIzSsULCAkQWoC3BzZVNdqq3K1nqr4wE6E=; b=Qkqh6+RgtYCoPoC3
	wo4rMFWn3RZtc22heLFRygSl+t29KvNeZH4VWEo+7Bik3mZG8mH9b7ObHU3hLiV9
	Qjz7por8jovSYJfH4Bt3z/9d3s4LNOr3x/eEb5PEGx9CrhoC2QwItfIP59ezVrbl
	UsSdmCY/sacFeU8oQCpR8x/LLyt/YXgm8D8hk9/wGgx3BEKRfAVCaVU4wElITqDl
	vSxjF2tRJTCGiIhlWZYWNwIzFSLxnQGkv6j6Ql4Flw/NtKZSw7YwG+PaOb2XWVDz
	x/3IeW2cW3+16W86/1XS1GsZyoEwtQJprWkw6UJD4CjyvRwarz4ngPMJH7SyhTHe
	xpuQvA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9guk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 22:53:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so1079377385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742943212; x=1743548012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISr8+dBWyTIzSsULCAkQWoC3BzZVNdqq3K1nqr4wE6E=;
        b=Qjn65b1iPtA/djJPDrbuPuzXqo3UJ4tmJ6dFBciaAioh8Oh31D+MWZHhvFkcC5rX3r
         jp91VUcB1HbC68rKi2tzbjG1/YDWFuVcrKUUEG32B3A7qJtf/OVR0oCAUQJ2GU60c01r
         uZCr3939dD3N8/18p/LCdLFTFndVHuB7fcAvVj0vuwiU88yPv2kahZ9STm4gnvPQFMuA
         l1sEJbRven+DRK9KS0PuvTt7cDDlkTzUfbiggWw/9AkyOixSA0fsDLOu+yfbQ3XS4gxh
         UlnL1dA/Mz2j046ZX8Os7WuCFEQEHHmIMV5q831JMo+NJPOjJnCzGcQA4MR/cJCKIYlN
         n9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt42jvE6rsiOCgJzpEKIlmQC0L9hgkuWFmQUnqTzxQtTV1EjaLAnOl2EBhjAQ8TTGs0K7JRxAsjbj9Tzz3@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9M7f6kTK+RV+QVM5wBhCxg/s2tNxnyXKb8NxOmtEyjYSKcwg
	Ilk+pNBNgjjw+41qclcU0MgEDug46LGrZacJhYDBtfWBelO75lQ88C3STGzncfEmayAMna4xM5g
	usbnos90z1yCDOXdd6oRip4Jy1BcNLR8XNwYCuHEFrKg1/MVZDJMZZX8guFMVq6p8
X-Gm-Gg: ASbGnct5UCJ9valzTas0kc+UKGaKqgUdznjD2xk8magIiul1cYoipLuR5ReRKSD22gy
	UTWxCySgq3OzE50FYt+EzRGmOKY++hYEd9VX2ejHWedOf+FjeCJq6mwGP/+VUBy/J+fTeKUIciG
	5PNTyajGRw6J9wRQ0NtdgmQfGWBVJstIzrS3Wx0dlrNd/m0tjdYLPw4jCg8nxBChRHyJq5iDDeV
	l/xU6nV8rAndHnzesCK+FWJdzEqwvSwhnSrYa97PMCUkbTChu3jkqm8qumU0vvYaqwGzzEgsaiq
	ze8pYbd3OlhDj2JcAVq2bkw/ArdmZpi8mCU4EyYCxomxNum04h9vUpSIIFQTiWMJnuXyceritqh
	ZM4b50a46oSP7KmgszmyA2pnHqy1U9zXTiMiKYg9JDBbsvLt4xUr7UJPGFFfp2EnYj4EtRiq7
X-Received: by 2002:a05:622a:244a:b0:476:8df3:640 with SMTP id d75a77b69052e-4771dd607admr257212521cf.7.1742943211584;
        Tue, 25 Mar 2025 15:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHODyifLoz5i0q58PQeZo1XvH6zAoXLnIzD+z+TyAnPlm3+1Ne2pP5fbmTwMB+77onwLgSaEA==
X-Received: by 2002:a05:622a:244a:b0:476:8df3:640 with SMTP id d75a77b69052e-4771dd607admr257212191cf.7.1742943211094;
        Tue, 25 Mar 2025 15:53:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:112:599c:156e:7946:30e2:6502? (2001-14bb-112-599c-156e-7946-30e2-6502.rev.dnainternet.fi. [2001:14bb:112:599c:156e:7946:30e2:6502])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbde2sm1622300e87.123.2025.03.25.15.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 15:53:30 -0700 (PDT)
Message-ID: <2cfdf7f3-56a6-495e-83cf-1921a2e0ef8d@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 00:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
To: Christopher Obbard <christopher.obbard@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zy3M8jeBiam7iCxxVHHy32QWN4IC5_Ji
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e333ec cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=wNHophStVnEZgpLo_8MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Zy3M8jeBiam7iCxxVHHy32QWN4IC5_Ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250152

On 25/03/2025 21:21, Christopher Obbard wrote:
> Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> valid non-zero MIN and MAX values. This patch reworks the logic to
> fallback to the max value in such cases, ensuring correct backlight PWM
> configuration even when the bit count value is not explicitly set.

I don't think this matches the eDP standard. It tells to use MIN if 
BIT_COUNT is less than MIN, if I understand it correctly.

> 
> This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> values.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 51 ++++++++++++++++++++++-----------
>   1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..734b7b8e46394de21837cda6ca1b189413b25cd8 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3964,7 +3964,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>   {
>   	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
>   	int ret;
> -	u8 pn, pn_min, pn_max;
> +	u8 pn, pn_min, pn_max, bl_caps;
>   
>   	if (!bl->aux_set)
>   		return 0;
> @@ -3975,8 +3975,40 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>   			    aux->name, ret);
>   		return -ENODEV;
>   	}
> -
>   	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +	if (ret != 1) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +			    aux->name, ret);
> +		return 0;
> +	}
> +	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> +	if (ret != 1) {
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> +			    aux->name, ret);
> +		return 0;
> +	}
> +	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> +	if (ret != 1) {
> +		bl_caps = 0;
> +		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> +			aux->name, ret);
> +	}
> +
> +	/*
> +	 * Some eDP panels report brightness byte count support, but the byte count
> +	 * reading is 0 (e.g. Samsung ATNA40YK20) so in these cases use pn_max
> +	 * for pn.
> +	 */
> +	if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> +	    && pn_max)
> +		pn = pn_max;
> +
>   	bl->max = (1 << pn) - 1;
>   	if (!driver_pwm_freq_hz)
>   		return 0;
> @@ -4003,21 +4035,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>   	 * - FxP is within 25% of desired value.
>   	 *   Note: 25% is arbitrary value and may need some tweak.
>   	 */
> -	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> -	if (ret != 1) {
> -		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> -			    aux->name, ret);
> -		return 0;
> -	}
> -	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> -	if (ret != 1) {
> -		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> -			    aux->name, ret);
> -		return 0;
> -	}
> -	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -
>   	/* Ensure frequency is within 25% of desired value */
>   	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>   	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> 


-- 
With best wishes
Dmitry

