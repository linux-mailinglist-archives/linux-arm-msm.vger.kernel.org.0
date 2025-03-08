Return-Path: <linux-arm-msm+bounces-50705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122BA57B6F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D714A7A3B34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838FA1C3C14;
	Sat,  8 Mar 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhGn7ZsS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC6167DB7
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741446454; cv=none; b=TGPhOIgQLCzv1eyvosswYGZbhlr2T1fqB1VqUonDkCPgf8AeYEYoG7GditDe8wISzAk93FlnCxS+mWUulmjIB3CWW3gDz2YtQxGnkFIk11d9G/g/y+TmXv53vlJ+lgS/5YI81ejyVzHApMxxIJ92d4PEA+PV4NqGX1HaVkI+4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741446454; c=relaxed/simple;
	bh=ClXkDW+t+1FLdQ5NSOYSoeq05rtHJHwc7FDPRS/JpoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdKqV/bVs9whZl0ASotoC8a+GCG4IKpLlZhEplYD2WkAGUWqT3zJ3Gux1TBmc++ZmIaNSgoH60pBTpolf/HcdNw+Azjx2lFMIcP4YV7h8y1GrwpcfS7QV3WRS4cjcbGLUP4wrUcD8JneZk9EGn8TvIC64f+pW5BiE+XKUb2IdXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhGn7ZsS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52875ZYG000682
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 15:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gGa4aZilPyCyYaUtOkyKJLgEGpI8bxypefG7qwCZ+M=; b=QhGn7ZsS3LO0WODO
	oRf1M2GnRuCy1OnVi7pwmk5bkxm07W4HD+Hdgrqc6udDywKidh2GQcWbCDW1em8q
	KGdezKiyvA4+2a2xwei7sOFksWugzh3vkEA47uU46TYm4tXFP8zVbdt7vCMsDlp/
	e8QgekpnPgAOdkoF/p3WwNy3mLR3scauqyF9b8hInq5Nhcaohu60r+aveFptooVr
	kpR4VYZ1Rduvl+8sCu/1rPvUU/a2TKqOs7hOviU4WMhis/I5rQuzGeQtaOkqPEBR
	AV6vPlPprXi0O8iwn/3pqEzTptF2TaUK7jYFpCg73sAovsWAjJl4trmAaQNuJVdX
	DJTlJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk0qps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 15:07:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso616361cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 07:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741446451; x=1742051251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gGa4aZilPyCyYaUtOkyKJLgEGpI8bxypefG7qwCZ+M=;
        b=bot8BawDSixxZMASgFx6Ads6rhUeldzPgvVjR9XIdpgP8kGVNYgkLT+NbsSAyfYpu4
         TMudPrM79yQkiWhTnc89+tCU2vk5BFBBy+N95pe6DyPhjoayax2SGgBEdeFWSH3q3ozo
         yIGam1TY+7J0Kwaj+nJafNqbuQBNBXZBge+oY+eym6WVWaWfHlihqOLaNVeGTotj8uar
         e03qsO7ucbQGC1WdDIqURqTo0YLCi+2cydIg0wnJrdoBJ5ueGvg5o7i5h1DJw639eNIp
         MiCW87JnKT/XZTsz3kV+TOGZlueVqAhmTCqIviJbdHGXgu24tQUU6jtJU/ocK/otFpiu
         bZiA==
X-Gm-Message-State: AOJu0YzTEaD6/Ug/ix3BmVgfWVBDNXEQS304ujR1wYyaqSWA8Ge8okU+
	YEq4yDtfseXe84IUX6TbXU+M/eVmvKhxj2p0BkfQtsVNSQZcesiB0JDxBewK4V6Jb5Aj0QwR/Wr
	sX/6aLXJG6Y5pib3ci1ZWn1aJ0Luf1GKmpuMAf2+dwLnHb+TJsjKVZg0Ew8gINGlmglEAp9VQ
X-Gm-Gg: ASbGnctLfctRPmZvUmjPxgDyixuVoKlCe1cWZ1j35kCeB2dwF0VL+/OsIUx6DXEoDwo
	TlmH6g0UyJAvLZwr2QuWRDDLv2hr9bTD/E8EneXfCde/IVZUvL0MRPeFp14iRTGPxE+i8JcOh6O
	SGrxqlg13fH91ijXKIwMib24oIWtoo0agTKt0tm3lSl9Cj5u8F3eFWiqBND099zHAlrzP3/ydIj
	A7qhcam39FnXhyihXpu9tG0Ar5KvpERkxu860vXEyMdlHdg3YupEb/0zDaT0FLMD5feAD8iQW+I
	zOHP6qxzR5TUOwBQQyMOxNsSRSQdcKbS/dEU+Qk9TNoqgXBt9Soq71+IGmk8EGlYrMe7iA==
X-Received: by 2002:a05:622a:1342:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47666c9c2efmr15222191cf.12.1741446450576;
        Sat, 08 Mar 2025 07:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG16fJ1s25av/19NCMWWvw3UdbNssC4iChQRcYwnRiDIAmzLAMyr8NziGv9MuhUVNksyID2cQ==
X-Received: by 2002:a05:622a:1342:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47666c9c2efmr15221891cf.12.1741446450220;
        Sat, 08 Mar 2025 07:07:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac284f76a22sm24449066b.149.2025.03.08.07.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:07:29 -0800 (PST)
Message-ID: <aca09e7c-53e2-45a3-8281-7df9951549eb@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:07:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67cc5d33 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=wuHw7GjLwNk9Z1BGEEEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IupHiY5kRjGe9ZmWppshTKc7UEDKWR08
X-Proofpoint-ORIG-GUID: IupHiY5kRjGe9ZmWppshTKc7UEDKWR08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=971 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080113

On 4.03.2025 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

Please follow property order / general style found in x1e80100.dtsi

> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

Konrad

