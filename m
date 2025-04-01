Return-Path: <linux-arm-msm+bounces-52970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E522A77E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 17:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5898164EA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 15:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6D7206F19;
	Tue,  1 Apr 2025 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdqFhjyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C4206F13
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520016; cv=none; b=TeRF0EDjgjGiPiMe8OjRQOuT9sHKDcdlHBXrG0h3A3HogOVdVoMPWLNRwS//GQwpw/fWGOzCv7vPsYMyegRTvtCNinqKcjs3vpOzt32MxL6ZHNd/I7DpIChDjjCPoAWLlXKjNZ13Yqqt8aI3P1x3BFrJIs3ZrkllaEjgYuFmWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520016; c=relaxed/simple;
	bh=XWZpITGhdYWR6looe59OiP8nzIwFT10XRIqyP7h37Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLpWV5PgdoKBEokNSrFnQaqy8WsmtyUVgDfb8F5ozo6LhYjFfSYSqnbJwU96GoRS7KZuxa/7SccBEZyWBb39K9hwWJcnIh7/wd/nEpEqpUvebFoFk7r7XvwEq22KfHPJFaO5C5+B6jC0s7loa07hzRnpORsbxi/rKnvTAEYTIEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdqFhjyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5318L27j008422
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 15:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBzQhhw7AwypkzcbLw3+6ZQqF1oYgVeh+QeBkcqytNY=; b=IdqFhjyxWFSv9Xkk
	cNYIM1zOpRxT0pJobm/9z92acTYmoWHH18wzDIw6Txj9q0ASrG2OZ29mtd6hIaZf
	VaC35Ouv5zUdifn6nQqLiQ12HqaofpvM143lKhuym0CWpoDD0itpzxtmZ25UcLTh
	Vmeg18nTmXfrXFlLvGZgSQkslUI0IXwFtpsPlQON8rMQQT2y0RmdpXMH1wkfBVXc
	yR60qWk7HInuw42zWEsT8g5rFTSNXOKFNMJOnWETTBI7ge+fI29IHjRNi+A6NOJB
	bjuurb4PmO0RSLCYhQ72LtKVH/glJJ2K/Fv/uIG+TIqtv9TncZfn+PGrC5JrAiEk
	+z7ypg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnjuub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 15:06:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso16539036d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 08:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520011; x=1744124811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBzQhhw7AwypkzcbLw3+6ZQqF1oYgVeh+QeBkcqytNY=;
        b=owCgaetLmO1dlBn5RVsjScxk4xg82MzUFA7xlLInuVmZHya+7emdboVH7/T6/rihQp
         TlO7OOCQlJZz9M+t5EGgYpB5i9ZTDdRf9HPT8MIzv8jiF8qIgBfi0KP/TGuBi38hx+hG
         pW28aJdY+4r8GNkaB6edxrDv6c/67mYCzOejL+KB85iTCaXtW+RXnIl07G+wFbqeNv3q
         UD+aStck4gHm/3L5pEbAAO7SLy0aoeKgevxL0egsKsXrgIuvUJPHoSYpPg1teOcT7cad
         110EW0W0NGEsuWEasb5ZyFKyiBigQIvFCtqBE+P1IsKA9bD18FNzhHEDG9X8pzhF0h0H
         tmRw==
X-Gm-Message-State: AOJu0YykLLAZUnTsfPR0eY2ynSDOKQoK/rGazPGRWdb7aPSC11OJF3I1
	H+z07g6pMiJ7uvIIkwjHXptl7AmvzNGpDrEdNX9Avn7i7rg241M2Mb6bgUtNPPFparjzDED+8Gq
	mU/3azysG1ysHmdADxZQPdC6Yfo9quwcxLqGXnwBDSh+d7vLVMe6nj/Qe/DFeZQmH
X-Gm-Gg: ASbGncvH4oKdbC+36hd0fO36rOPHPOFcxX0kCeg/k5xANclsl/CcZCb0xRSJitXQfk9
	nQ/Bo5i4VBx4DkUq5ti/9mDTVFaO1yRy61ESLamrXLn2m9zZ9QD8/hdkW3yBDgLDZZ/ET1ahaKj
	DTjYWkC5DTJhA0Qp+8eOCftvRpIsRSA5trsLARiyOkTvg4SyHM1S0hpgozYTh+IA8tC/l+9rxDX
	1Y2XFuZF/qj20PuePHaO/vHy5wLXVBD8B08Fy0UQpOM8IEyuU0XbU/v9osorD/2d05Dzf13pRtv
	r+2Jg/cXvninPVyop7znonTRXcJoeQypV7WRLv8HlP8VOXMxmVg5M15xbvu8VvGfhRrmPA==
X-Received: by 2002:a05:620a:390c:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c75c8e672emr154145785a.2.1743520011490;
        Tue, 01 Apr 2025 08:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+KMPv3hD6XZnbdPueLRjBSSQpzTwuK5+yXel6txrdpq3uKO+0M/qKdybY5KK0izvh1hsCIA==
X-Received: by 2002:a05:620a:390c:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c75c8e672emr154143285a.2.1743520011014;
        Tue, 01 Apr 2025 08:06:51 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dc4adsm771748166b.157.2025.04.01.08.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:06:50 -0700 (PDT)
Message-ID: <741aed9e-83e6-472f-a26d-2ee9da999057@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 17:06:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm2290: Add CCI node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <y> <20250401143619.2053739-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250401143619.2053739-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I_YV34yfou1hnQkRrHTu6c29bFIUK4Yj
X-Proofpoint-ORIG-GUID: I_YV34yfou1hnQkRrHTu6c29bFIUK4Yj
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67ec010c cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=STQ2a8oQ04ts6E9hehUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010094

On 4/1/25 4:36 PM, Loic Poulain wrote:
> Add Camera Control Interface (CCI), supporting two I2C masters.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 44 +++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index 7fb5de92bc4c..927dbfe61e4a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -646,6 +646,20 @@ data-pins {
>  					bias-pull-up;
>  				};
>  			};
> +
> +			cci0_default: cci0-default-state {
> +				pins = "gpio22", "gpio23";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				pins = "gpio29", "gpio30";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

Please put these above the sdc pins, so that we get a by-pin-index sorting

>  		};
>  
>  		gcc: clock-controller@1400000 {
> @@ -1603,6 +1617,36 @@ adreno_smmu: iommu@59a0000 {
>  			#iommu-cells = <2>;
>  		};
>  
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x5c1b000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "camss_top_ahb", "cci";
> +			assigned-clocks = <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			assigned-clock-rates = <37500000>;
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-names = "default";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
The change looks good, please update the property order / styling with
this submission for x1e:

https://lore.kernel.org/linux-arm-msm/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-4-edcb2cfc3122@linaro.org/

Konrad

