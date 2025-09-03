Return-Path: <linux-arm-msm+bounces-71875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD7B4222B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B756B189E53F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C1530ACEA;
	Wed,  3 Sep 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLYIyPT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57522304967
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906913; cv=none; b=TJ96BuIsT466GiLwUd+EB259WfOv2MIpj5J+85MolJuVTsGPKfjncm6A6UWWn+yLru09QDdGaS4QNCSx1odXM0+6+O4DnQ3BdtT5cdJPv9sXbR4c2NY3Vp7DO/PsGyMYMTuixuE7BHhCPJZMM7/LDUN9qiST7xMzgUMA0+Xmw+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906913; c=relaxed/simple;
	bh=NFp8TcPhS5de2EGnbzYmg4peWf8FnC+LhNlv906c6JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO36jrrxQvBNI0epFSadOP1q4FrfmL7wiKq///5e3xsYwVc52JbxY+r7PokZwhR+eJDvvdsedgAP3xCIyxCMn9N6dt6UbTTP7qB9bEwttymDCSy4tHP3PEp9XMBZsia/gZKBICx6Xw9a6HawtqFaTHEU4US80F2iOGuRHOw//fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLYIyPT4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF4bu004692
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 13:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fYfnbja81zbttAC6psme4l73O+c9YkR4VUUb+N1Yzo=; b=JLYIyPT4p0HbU8Sr
	qiWeTOx9Ai4HHR440PdYhdI7ki4MiUXrPY+cf1jdKRlSnNsKT/3lkadOP2krWbSp
	Ne0xpBANyzwKwuvz4ZBDh/6c6BIPBNFIwxT7oK1F3U6u4pBSnc5dQFTYivMKbqI7
	BidKi0qcx7XDFvNH149Sax2Oral+KBDLt8HBBQvozW98X3H1yx+ChZMw9Xctr41o
	QvRqKlGrEF0Dlb9Z652RcoLqa0Bl+0H6V9ZCdn7L5ia9I88M/fF9y1O8OMsaUKgU
	uBttRTbEvWoHQ5cxZHsCoApc/6FmC6O7ZYiF7NZ1S65+jSxwdhwQ8CzGAik5erWK
	+XVPqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpc0hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 13:41:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso15879951cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906910; x=1757511710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fYfnbja81zbttAC6psme4l73O+c9YkR4VUUb+N1Yzo=;
        b=SjWfcVdrg6rhq+tIvW5/BUp7saGZ5FZIf8FALBHm8sT8ovb9KUr6O9BIUMoVGm4L8g
         o6I3rRcjKXbgQlQNPtjWMEPZm0ASLuvtZxhZ2x6d+vAhKov7Dxr2eiuy8IAMfLdSVTSd
         mcXe/pQ88gUPYc2sXsYYRGX7XVaVL29AcYd9IPLfw/FiBZDWpDHIBW4rtlMNStqEzmGG
         AD0ycgaIIcyBz6aaQihOgXXkcsB003sqWGbPctxBgPK9TcJ0kzBa3wVT7nll8MyjkESk
         IyVi7NButUrq17ypQ6+Yhp7R+VnCA6f5ij5Dmf/4OmBkpA5kclaNRUOATk7EqSaOsN5u
         V7MQ==
X-Gm-Message-State: AOJu0YzZU5FB3ji3KxYInoxDCMtQd4YP7KS0nAz8j96B8WJ9SWUYeYL+
	C74tF5ca6lnQDDqXTGYKUYiQs+0FKF5clRgO1HV7vyduB1CrrM3KFVJCqGxv4ClMVjunA04/7BJ
	TSVrVBY8dXE90A2Tywd8oZQiHX9fRHTo3bLUdZBHDYNaeBcQwJTrvLlnA6WzwqERxHM2c
X-Gm-Gg: ASbGncvk/T1LygTC/TTAd1KxDhXeevuVogtGVHwzBSzGzdCIBFMh1ttbz7Zpe9VFQku
	fjOoUD2uWlISyvbYGj6HbmZXxpssCqLGY4DqVAZGC7PnursLQEQRqepcbxxzcOJw3urnlqL04Cn
	I2RZZ8eZ79aIl9klHv9OEEQ2zt1n1+5fUHJ26xOIejeeI0j1WqRuyGG2OPQZntE2ckKtlT91CVz
	GK0L5ogAm3pkuH4rkwo0kw9c7srvbi2zsY49UbXAxRNtHcLSnD/Nr7iAOVj39TDty2K1MNPRpBW
	zVy5jjG470uxZRm6DhTs4VHUUvrEtZtR/MJ4VRFOoGBJKUJUxdiFqvZk8bPAeMJaMKAoLsiyv2W
	4RBIXh3jsUzpY981J5sj6qg==
X-Received: by 2002:ac8:5d12:0:b0:4b2:d0eb:1e7 with SMTP id d75a77b69052e-4b313f90e37mr141155081cf.11.1756906910388;
        Wed, 03 Sep 2025 06:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPdTWyFNZv0wrE6s7lYHY+t1NrlyBkHlYgUSBucbQO6LODUUme+aa57ScVuOXFRfZKPEXFg==
X-Received: by 2002:ac8:5d12:0:b0:4b2:d0eb:1e7 with SMTP id d75a77b69052e-4b313f90e37mr141154451cf.11.1756906909528;
        Wed, 03 Sep 2025 06:41:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04110b94cbsm968406466b.93.2025.09.03.06.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:41:48 -0700 (PDT)
Message-ID: <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:41:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ugrdukou_k9WAC354kj1uR5k3gZ3kELd
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b8459f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OhcfVZcqRUJJiLbfGB8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ugrdukou_k9WAC354kj1uR5k3gZ3kELd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX9z+ZBiGME2EY
 Hv/GLbsmyAlJUhhy0097p8zcaRDIxFoRZXrMdf0Zg3prbnVgR1EwegwGSbrXK06werZ6Ax3uXgo
 jL/o5toAR7rnNcqlHDQDiM+6RQ6Y9GsxD+jEiRtk8d3jJFTuTWNESvM/FCl2spRBQn4m/ji5e3U
 D785nyJ4Cs+HSK+qgvoY60xniBZfemWnT/MwVWvB62MjFbzO72AUneQ41qJwHPzMpixng0mtzmU
 EEkqcAVlpCNLO6oW4Y/DCDCFCs2kwJGMBYska9Q21nhpM2palBT6tSUMzcCmsDvSJ5mCw1x2Tv0
 qrgEH7hMWl+TWbvdXo2gRlLqhlZVnmx3Ahhn34mgCu8Wu+KWB2VcmrkOYBeJ2quT6nOQTjRf6tW
 FSyT5qY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Update Qualcomm DT files in order to declare extra stream pixel clocks
> and extra register resources used on these platforms to support
> DisplayPort MST.
> 
> The driver will continue to work with the old DTS files as even after
> adding MST support the driver will have to support old DTS files which
> didn't have MST clocks.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
> @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;

Something's not right here

Konrad

