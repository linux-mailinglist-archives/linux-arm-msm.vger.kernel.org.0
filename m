Return-Path: <linux-arm-msm+bounces-33896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D4998C4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 17:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28E9FB3041D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAC31CBEB1;
	Thu, 10 Oct 2024 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cUEmsXnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD91A08B1;
	Thu, 10 Oct 2024 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728572255; cv=none; b=rLyMMhfK1WUcC5Vu2gR4XVA1OmDB8KWXiaOIWBQx6DTeFUtfRZF1oVE0MrgpdLRQ5I+Ha57liFIoLECaie4bI+nm79TCh0AF3/qjI/jDSCsn5J6vZ3t44BycriSDfxNeyNb46y6ToNWCUzdXRj+FcvG4TP7ceES6yRNCBstGW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728572255; c=relaxed/simple;
	bh=6s1o0OZV5/ljAuMxNzowh++cNJdGI5BQln275WO3obA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=teJyAy8xNPQDoiq0QM0hPW+wfps8TY7CeLqhxzav9GnUm0b9DHWnTPta3OAMQu6viLChJtrezpW8ZAbgsMCIROdffa9BGYezsONhawZp3ZxEP8ItC7C+9ECzcMQhc8ZMxSnVfe3H4C1ceJTsETiGO+gwRPLJu84TLo27hJyHnHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cUEmsXnG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AEeDFL006940;
	Thu, 10 Oct 2024 14:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWccwnb/rSY1kxtpT37tSxJo7pTRUbn0UeQduJUQDTQ=; b=cUEmsXnGHMuhN+8a
	j+bNrwi0gZanN1b3MPyu/u0cacubGQTj8tqxlb8HAk/0qGTlOqMV7KsuALR0hWnt
	mGZ1svg7iZ5ObjoQ6V/TD4zFrCGgKpxIlm7u7JJ4L+HInZruB38WeJSI04uZkV2P
	fRtr9kfeOOmofdXIak0njaAePlik0vKgPJ0a8jPeBXMkbbplczrbAfApRGCwGSH1
	yUVXpBTSsCpIcyy0zvSDODS4rj+oBLHGR6B0VP7gE/fuCtsxfRo9tlsmvQA1aKF+
	tOXoD+UYBP32qgXWyM/mo4hpTir1Tkz5rKDXHq9N2u+1VRRyKlSJ3nMqrcAVbF4i
	4t9c6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426gw2g1qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:57:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AEvSTg032238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 14:57:28 GMT
Received: from [10.216.26.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 07:57:24 -0700
Message-ID: <fe3ebd31-946c-499f-ac96-2cf71c6752e6@quicinc.com>
Date: Thu, 10 Oct 2024 20:26:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
 <20241009195636.2649952-2-quic_kriskura@quicinc.com>
 <xwidjnw3fqc2slwl3vftw7yi4j7juiw6rwszjhtxepqd6zz33s@ncoi4aikbb4e>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <xwidjnw3fqc2slwl3vftw7yi4j7juiw6rwszjhtxepqd6zz33s@ncoi4aikbb4e>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AHOkvGcF6wzO9-peE8DvuHZhc8uM4drI
X-Proofpoint-ORIG-GUID: AHOkvGcF6wzO9-peE8DvuHZhc8uM4drI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100099



On 10/10/2024 7:52 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 01:26:35AM GMT, Krishna Kurapati wrote:
>> Add support for USB controllers on QCS8300. The second
>> controller is only High Speed capable.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 165 ++++++++++++++++++++++++++
>>   1 file changed, 165 insertions(+)
> 
> [...]
> 
>> +
>> +		usb_2: usb@a4f8800 {
>> +			compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
>> +			reg = <0x0 0x0a4f8800 0x0 0x400>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB20_MASTER_CLK>,
>> +				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_USB20_SLEEP_CLK>,
>> +				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
>> +			clock-names = "cfg_noc",
>> +				      "core",
>> +				      "iface",
>> +				      "sleep",
>> +				      "mock_utmi";
>> +
>> +			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
>> +					  <&gcc GCC_USB20_MASTER_CLK>;
>> +			assigned-clock-rates = <19200000>, <120000000>;
>> +
>> +			interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
>> +					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
>> +			interrupt-names = "pwr_event",
>> +					  "hs_phy_irq",
>> +					  "dp_hs_phy_irq",
>> +					  "dm_hs_phy_irq";
>> +
>> +			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +
>> +			resets = <&gcc GCC_USB20_PRIM_BCR>;
>> +
>> +			interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
>> +			interconnect-names = "usb-ddr", "apps-usb";
> 
> As this is a USB2-only host, shouldn't it also have qcom,select-utmi-as-pipe-clk ?
> 

Hi Dmitry,

Thanks for the catch. You are right, it needs to be added according to 
bindings. Since I would be sending another patch after this series to 
enable the second controller, would it be fine if I add it in that patch 
or do you suggest updating this one.

Also I see some others are not using it as well, like sc7280 which also 
might need to be updated.

Regards,
Krishna,

>> +
>> +			status = "disabled";
>> +
>> +			usb_2_dwc3: usb@a400000 {
>> +				compatible = "snps,dwc3";
>> +				reg = <0x0 0x0a400000 0x0 0xe000>;
>> +				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
>> +				iommus = <&apps_smmu 0x20 0x0>;
>> +				phys = <&usb_2_hsphy>;
>> +				phy-names = "usb2-phy";
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,dis_enblslpm_quirk;
>> +			};
>> +		};
>>   	};
>>   
>>   	arch_timer: timer {
>> -- 
>> 2.34.1
>>
> 

