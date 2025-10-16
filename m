Return-Path: <linux-arm-msm+bounces-77641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E4BE5590
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 22:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728B31A6822A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428C72DE6F9;
	Thu, 16 Oct 2025 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6uWQEdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C027421D3EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645718; cv=none; b=YOKmfbt0pMwcpph2ZEAQQ3DyRjkscya1vhh3Ik+nw5LDRidUcDE1eXlttgTaU6xYqFrkSR+7rKvQTispPwnA/gma8LDS9U8xEGDrulFylUe4cp0X2Crb/xAeRHaYRA6EsEkRygvcVR9xmIwxmsAFcFIzqCNDs6oOSl8b0tQ+GTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645718; c=relaxed/simple;
	bh=wPqImp611aCZjTLetms3dJbHlLAZwRO5YDLgqdiV4I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XejSiIxQejMoPTdK3EL1DdYAK59/yXOIIetHYmAeQ5uyUiBpPgh9qMEO7Y3SUDAeSpvlzSndjofhRp6qcUBsr86MCLOjg3kSYzLYCMLba/CzT08Sh7qD5hvCAiR9LdubOky3k7ER2ycam3FGBgpPzeCZ0D1bIc9nwqg8WrWnCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6uWQEdv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GENiTs024770
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9zBcpy2TVGpV6SdEbPYF0b4m
	pBJ4QckghSj4HE7U+Z0=; b=U6uWQEdvwc0Atp6F/+uCApeLSUsymXEe4pHLtXao
	i8NlEGgPilQYtDRy5RAmjrXbBMIRWy1dEEYOrvfitNOJvjF8ezUAohNAJQrIbxTT
	sGJj4JP47vIt1OZxxyPhy/baVufsqdQF9qwwPceQ0wgJOLKrL9WC+OxFPNlTW+4I
	HwnP9YgD9Yfun3o081dWWNpjw74Fa1qPOFSmckY6Qaq/wDCdgBUXJHQMmJRIjVay
	4JvNmf0BNXza2ZsheozKSGcBwzHJIjCVqhcBIcIGL4x/34q16diC0+XQ7T5Ll9Sz
	+lpQlgRhGLI4u1Ub0a5J72PhLOIozLPkYO25V0+a4S7jIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff11n5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 20:15:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78f28554393so37653016d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645705; x=1761250505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zBcpy2TVGpV6SdEbPYF0b4mpBJ4QckghSj4HE7U+Z0=;
        b=h5bbbwf+XH1N8AMGoCpnhE68veBzSyqfJxav+zXRIg9zoZjd0n3e0aHZ90m//JoZ7Z
         FFxCATRTG4rAkAchhpRSiQ00PIZamKgvbn4VpyBBKJNgveD6Bb/nPOVZsZfwYugOj7G8
         HIKGiiMivkOuUkYMKaxZaECL5ZKvMk3G3pyZL/GZcqtUG2NGJaDQDtPHevUoF0zlejD1
         7OSDq8rjEGYzDgBpcrHdIckhoSVMQSdKuBW9VvM83m3doHttmK6P0EZdQB3hCwLp1r7o
         QU6s4CooE9MnuNpe2wQaaayWdH+RjzJp0HL1Bs1F+OaImJfG//rzE5py9a3A0sDBcTev
         DheQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJZr+5djT1IfPF8FbEGQwL/flbtSSZMZpUlzLoORiXEOH/T6pfVrfa9SEc/DLNz2kMETguGYIV5/qL0k3@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFN4oldnRJT5+nwD7rjqd/9UTYugexcM4OHsV1jpvQoO/SzzN
	znp18kZqR58ij1XJvfrjW+NFSTU6shhmItxqqxKQID9zm4OF9OhoaAZE1d/lf0wamIBnwTVONCs
	VkiP/NwDygZ1IG6EWK9BG5CTrQ3kdHCADZeeH9vJxi4GgD0bSHk3+2EumfBFL2xPKoSxD
X-Gm-Gg: ASbGncv/KYx+XBBG6cajpIfc0JyrV+wMwRv8/7XNj/rskn/FO9Q4UaMhnm5+maMXTWS
	0XIAGHQEiI3qoAfDaX0BUPtOCjDb4WxaAMy10u7l/oHvowoo8j+SqQQ+CFzLfbTgvbl/yaMC4U5
	HdzefZ+PX6wojbaPNNVk7/iYUjanOpUYsu7cBFbNceL8vApDlpb8qiq3+gPV4sz7MExvU0Cbd9W
	yabVgMB9wKwA/gECnu1QvoBKPzeT7EDQDqJBYKpHmI/Zqa+AhqEr4VJIxts1Yat1ixSjCFjHk1r
	2Ch/3YpyymrT4SkOgozmQDHcQc/GqzifiRspvZEgwb3dhe5814whEEVRm27+DaPPh30O5VMx7xV
	hnPix4db1U1kpEir7kL9rE7MabglzTVko8u0V/tmfb2/HD4HqlI7Bqvdd0Bkw7AAtEH9zkxvOzJ
	9SrGzi8e056DI=
X-Received: by 2002:a05:622a:1103:b0:4e8:9086:e6fc with SMTP id d75a77b69052e-4e89d273e19mr19028811cf.18.1760645705060;
        Thu, 16 Oct 2025 13:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe5fnMVrV7X7OK0iMbXtKG9SypwzE4pSZ+g5Jctt4v8KdtBGL8mmMoU8EYU/SoOlRUrLoUiw==
X-Received: by 2002:a05:622a:1103:b0:4e8:9086:e6fc with SMTP id d75a77b69052e-4e89d273e19mr19028171cf.18.1760645704394;
        Thu, 16 Oct 2025 13:15:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088580ae2sm7280651e87.117.2025.10.16.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:15:03 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Message-ID: <rung7om2fvwmfyihgsnn7j2b6pak7sjt2ayzy42ovugroti4jy@wt6chj662llr>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8Of6aKrs8YDA
 TYIsBZ2stnX7fGNQMfnx2JeNzPAjpQZl1OOeYb+sDSkgApVlrusuAi/v11j01YRVgtMBGvpvYR/
 DDxUyEOIAVB8RJBH9SsPLPav67ulSLiMR577RLYRtti9TPqD4xb0P7xgxE1jBrXLITWMZI9gzuR
 uk0vjtWDGxt+fw+G434grPTkF10dD0N77mXIdhbwHHnPiclB/kV/tJA9JhidxhF4ifN3dQOxEKS
 JwI+vQL7fD1hyth4J9cR+I4/er3oqmsa9HRfMCihV2Uv5znJdyZrfuDM/8ObmsQvZiEzjpgN2kG
 +RKgCY/vrIpKkdNMq/nDImfBeSvjJgFDzBEHXUfnQ==
X-Proofpoint-GUID: 4BEzK1zj6o_gPK1xat4sOVN1crnZUZ1h
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f15253 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HryFia7_YQCGBQHkU4YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 4BEzK1zj6o_gPK1xat4sOVN1crnZUZ1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Thu, Oct 16, 2025 at 06:17:02PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe panel Tearing Effect (TE) GPIO line.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index a8e87507d667b..b663345de0214 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -460,6 +460,7 @@ display_panel: panel@0 {
>  		vci-supply = <&panel_vci_3v3>;
>  		poc-supply = <&panel_vddi_poc_1p8>;
>  
> +		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;

Isn't it GPIO 10?

>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
>  		pinctrl-0 = <&panel_default>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

