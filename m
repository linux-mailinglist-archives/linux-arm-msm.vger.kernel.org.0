Return-Path: <linux-arm-msm+bounces-36033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37B9B19E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 18:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA14B1C21060
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 16:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9981D0BAE;
	Sat, 26 Oct 2024 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lnuZKIMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8680168BE;
	Sat, 26 Oct 2024 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729961786; cv=none; b=vDVBdU5fQZlyJAM+QJ2F8s2Sdn9YbcLap5I+hGZuExFBk+rIGPuJI0ftyGx2CeN8cF/yErih2Z7/TEQzUbr6RZBDXxKUq7z6vbRM8n5b8lniPESerY9er5FZde4JDYRFsMn5ZpZ1c3AD78mAGeiMxn4g/QhCSaaOlbD8to5lpVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729961786; c=relaxed/simple;
	bh=QWX9Al1eRR+lMqa5aPqbsyfWiys6rAg2lSJQhS4Mq9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nWL79fHYmCJ+cNW3DNNxRd4hEbzHwhuVFYOMUQncBvEsxIZCuGIEE5fajiHSdV9ExoZWkOFaGN3Lb3AgmFj3IsVuLvEHq6Lz3WgsHXv7JPsUNdkUPGzm43kC9RiAfSUn0Ogl7CRi9DvrawaVi+dqbIAIXOXkfxOIVvront8BTPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lnuZKIMK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49QB4I0l010720;
	Sat, 26 Oct 2024 16:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+W4fH0PAlH4u00A+szfB8MvrLS0lorLwzsBYBKhTWQ=; b=lnuZKIMKWa1GyRc7
	7RTBiIdVV8fx1jwIfg2a1xy9cmj4f5bwj51nHNkk8E6YvzTcYM/I2136T5PrmQY1
	jIkVxhmTYGBdDxLFEeuYhrYg8qEuftYF/aaGz6CtlAXclbzj918GUD93mBm/HPcU
	kF57HEbcHaqMVpDMNUU1UOzrQjsWlakJ9QE2TwkYX/3h/kMvScx0rDAwMJDVZGl8
	FdZTaNfte1afxXJuX6kU9uXfiT/e3IIPujHwNKA7RMXdonSaDOdueI6wzS3KcA7+
	mx/Bf2a/p8MNjtmc3c03zUGWBViTICro13fMrTdJnRQoBc9hFTjh9zlRJye2GeLo
	lss/5Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gs6e188h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Oct 2024 16:56:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49QGuHaZ009860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Oct 2024 16:56:17 GMT
Received: from [10.216.11.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 26 Oct
 2024 09:56:13 -0700
Message-ID: <2da5e869-ae44-45b1-a751-8b5edfcdbd30@quicinc.com>
Date: Sat, 26 Oct 2024 22:26:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
 <20241011074619.796580-2-quic_kriskura@quicinc.com>
 <297dbc48-4c34-4bac-822c-be3ae2d00d32@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <297dbc48-4c34-4bac-822c-be3ae2d00d32@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yh_QLpL1yVgwpAoe8WKbMB-S8h_42FxX
X-Proofpoint-GUID: Yh_QLpL1yVgwpAoe8WKbMB-S8h_42FxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260143



On 10/25/2024 11:58 PM, Konrad Dybcio wrote:
> On 11.10.2024 9:46 AM, Krishna Kurapati wrote:
> 
> The commit title should include a `qcs8300: ` part, like others in
> the directory (see git log --oneline arch/arm64/boot/dts/qcom).
> 
>> Add support for USB controllers on QCS8300. The second
>> controller is only High Speed capable.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 168 ++++++++++++++++++++++++++
>>   1 file changed, 168 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 2c35f96c3f28..4e6ba9f49b95 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -1363,6 +1363,174 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>   				qcom,remote-pid = <5>;
>>   			};
>>   		};
>> +
>> +		usb_1_hsphy: phy@8904000 {
>> +			compatible = "qcom,qcs8300-usb-hs-phy",
>> +				     "qcom,usb-snps-hs-7nm-phy";
>> +			reg = <0x0 0x8904000 0x0 0x400>;
> 
> Please pad the address parts to 8 hex digits with leading zeroes.
> 
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "ref";
>> +
>> +			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
>> +
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		usb_2_hsphy: phy@8906000 {
>> +			compatible = "qcom,qcs8300-usb-hs-phy",
>> +				     "qcom,usb-snps-hs-7nm-phy";
>> +			reg = <0x0 0x08906000 0x0 0x400>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "ref";
>> +
>> +			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
>> +
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		usb_qmpphy: phy@8907000 {
>> +			compatible = "qcom,qcs8300-qmp-usb3-uni-phy";
>> +			reg = <0x0 0x8907000 0x0 0x2000>;
>> +
>> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>> +				 <&gcc GCC_USB_CLKREF_EN>,
>> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +			clock-names = "aux", "ref", "com_aux", "pipe";
> 
> Please make this a vertical list like in the node below.
> 
> [...]
> 
>> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
> 
> QCOM_ICC_TAG_ALWAYS, see x1e80100.dtsi
> 
>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>> +			interconnect-names = "usb-ddr", "apps-usb";
>> +
>> +			wakeup-source;
>> +
>> +			status = "disabled";
>> +
>> +			usb_1_dwc3: usb@a600000 {
>> +				compatible = "snps,dwc3";
>> +				reg = <0x0 0x0a600000 0x0 0xe000>;
>> +				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
>> +				iommus = <&apps_smmu 0x80 0x0>;
>> +				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
>> +				phy-names = "usb2-phy", "usb3-phy";
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,dis_enblslpm_quirk;
> 
> That's a very low number of quirks.. Should we have some more?
> 

snps,dis-u1-entry-quirk;
snps,dis-u2-entry-quirk;
snps,dis_u2_susphy_quirk;
snps,ssp-u3-u0-quirk;

I would actually like to add these as well, but there is no precedent in 
upstream as to what quirks to add for usb nodes, so I kept only a couple 
of them. Ideally downstream we disable u1u2 for almost all targets 
because of some issues in the past. (atleast during tethering use cases, 
but I need to double check though).

> Should it also be marked dma-coherent?
> 

ACK.

Regards,
Krishna,

