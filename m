Return-Path: <linux-arm-msm+bounces-41982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7229F0AB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C3D282FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EE21B392F;
	Fri, 13 Dec 2024 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty1UiBt1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18AD1B414B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088657; cv=none; b=RlZL4IyYdUp2LLvkVSgHr+8ZdATAXRF9D1WvUwHuQOB9xFef0hLkpKWXP3vbI2wnzvvMWI4fNnWKL2tQ3htm97bWvHyihQyCdDiZMHqdwAyEjxN7GhigXvZVyFVW7WC2NgM2n/wl0Cx+Xw6sfZFFQDpA5YZBZ6WG3IRW8UfNmu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088657; c=relaxed/simple;
	bh=K+cyT7IH7s13bj/nzoms8a0X++/cCDX95iiwNa5P4dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZAIeHjJdhnf/Pog/xZKlNZW9cx5gXGHJTetoE3P4uzLVvP4KQPH5qEPN0K97u31zD5Hx6+CcqSGbeW9MlTEwRfGed0qwuwBMwyXUf6Fpl6OemgLKO5pX6a7BLaJn8HiABX2wCQVhU/JNDfTMa+1XyqYpkj8WFvp3IlJCWrrDhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty1UiBt1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD3AUfU000455
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22DdllJUx8c525feb9BABGaXYzEDkdsU1L5H+dtpqJk=; b=Ty1UiBt1pMVbIqjG
	uTAczAQNfUqNz+JS0mmWcqXkmGhu8NzcOlWEurDv0ylOSLDm/UrVDeyzgmI+6Hz6
	M/sYoolyV8482tKuzx2LyVF8PQP/ENexWPdU2yy0ygdmifYOW/Lx0Qg7sfx95DwM
	tNdNwbt2CgIM4xaJcxBYyu0vNop0remU9UrazB+pFTSFSSep51GR5SD4R7EqxSE3
	t9lu62faWanIbRuZdF32t/m1q8ZwXXHPw0RCCa6g6tUgg/8y2zc6zHFpVV6krvkJ
	4g2uiP0ccT2+fpsedkZ4HdgMW/z1il9tQ+yb3xTzzM/pvZ2x+LrPLbSkIFKN73Uz
	kM6xfA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4me8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:17:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8824c96cdso4566146d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088654; x=1734693454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22DdllJUx8c525feb9BABGaXYzEDkdsU1L5H+dtpqJk=;
        b=W2Phkf5s4F2C7+qEgm699SS4ALc1UVANyKBexzT7WeeMgtnAuTYWpYfKdU490DUAEN
         SfEFRpV8H0oxkrPrYSkrzBu8ChmI6R8AYp8rbBOescU+D3z93ZGC4YWZ7P89/FtopB5x
         n1uBxeOblcg0BXtH/rhDuOJuWk8ZnADPMDYEuNKWaQdwIv1G+2KNeUCmsHBNSNKPhJXK
         bxwOpQfDJpPqu2c2vyJnj8iLYa82Rw3g9LnVvAyrbGhKH3s9NY+hOuTVDIX8QMM1EKLg
         SeRXbRH9ng8IhwsAenlDdgDM4kgulTPMn0xyKZ2TkGxOV66f4vV+CMj6UZYp5dRIUNO0
         kPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXjGUr7JMqJ9PmrryfRLHCTlcL6EDBZtWRDcT2hADqNVP5cLL+CL/NPAR2Gddt0nDGgZh5qnLnp9+0hheo@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtQkwayyTxMV24E18v99tabWSQiUhVwA/64JVMYoVwjgrRmJ6
	zPRpFOSdfUVNXlEcz+cQHWY6pxq1UpS/M0NHT2JyNWNRhfoxzRq/magocIGHeUcSipTE8yMsihr
	WLJyFU1ardKWkhlzTUp/boY1dJ0pe5mPKtG6fHqhZO+JFqlmb1IIOttdSUL+n8ZM7
X-Gm-Gg: ASbGncsz+vjCY9f3CB0cpDPQteCF0DyeFMuK55UjDW19cMeTroBmtVdJvIaEdRNR6/o
	TOPTLYSkK/Rz6FauXOu5nD1AlmzfLd9OpPl4fvoKckwj80LalayFgNaRC8SaQO/gg7kNXXqystW
	3vPADEeNDxiOygBYD0OGpenWygfx3pFEYuuJMyfbMHJ4nt1ca0vRx+YO/srWBPl9Lt9c2ylIQz6
	pADsAoXLAP2z2y0Vi3ecvPLt/dVph2MdCirgB9SlWPiivbWnOq5thjw2MQqpJ8CSaiUyS41tqgm
	nfDBLmC3AL6vP3viuQfta+dFX5e4YDy7tkFd
X-Received: by 2002:a05:620a:1a95:b0:7b6:d089:2749 with SMTP id af79cd13be357-7b6fbf0713fmr117969985a.7.1734088654021;
        Fri, 13 Dec 2024 03:17:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD+GDmKeinZ6iYtcXL0S/mpK+8aIUpXK3aOY+mNBKrJvpqSkt1hyGsBzayOsJI+bMandu74A==
X-Received: by 2002:a05:620a:1a95:b0:7b6:d089:2749 with SMTP id af79cd13be357-7b6fbf0713fmr117969185a.7.1734088653665;
        Fri, 13 Dec 2024 03:17:33 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab88d930a9sm27933266b.95.2024.12.13.03.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:17:33 -0800 (PST)
Message-ID: <f38e0aa3-e10e-4e5a-923a-76686baf2482@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 12:17:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
 <20241206191900.2545069-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206191900.2545069-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OAnKqlF2IpvG2lG9AIJMYVC8ea-NEoEv
X-Proofpoint-ORIG-GUID: OAnKqlF2IpvG2lG9AIJMYVC8ea-NEoEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130078

On 6.12.2024 8:18 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 178 +++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..afe7113df4af 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4426,6 +4426,184 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sc7280-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc1000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0accf000 0x0 0x1000>,
> +			      <0x0 0x0ace0000 0x0 0x2000>,
> +			      <0x0 0x0ace2000 0x0 0x2000>,
> +			      <0x0 0x0ace4000 0x0 0x2000>,
> +			      <0x0 0x0ace6000 0x0 0x2000>,
> +			      <0x0 0x0ace8000 0x0 0x2000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acbd000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0accb000 0x0 0x4000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,

This one's permanently enabled, you can drop it

> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,

Is GCC_CAMERA_SF_AXI_CLK required too?

> +				 <&camcc CAM_CC_ICP_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CLK>,
> +				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_camera_ahb",
> +				      "gcc_cam_hf_axi",

No other binding calls it that, please use `gcc_axi_hf` for
consistency

Other than that, looks good

Konrad

