Return-Path: <linux-arm-msm+bounces-39376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2413F9DB34D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 08:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46B2164991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 07:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F3C1482F3;
	Thu, 28 Nov 2024 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jr7NOJCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C683CC1;
	Thu, 28 Nov 2024 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732780546; cv=none; b=LowbkiDnnXVQVc0kmo7neZWbf79bDpFe7rX84SZ2n/DhrJvwHOjXnC171C+8o4PHPX1FIPFWFVG2h7PjUsIqnaUYmjNzKeRbhjftIDpKrrpDkB4tBT7vNfzdJir1qRpnvH+C/qLrrNW/KSOBPEMWWYtxXTr+6o2YtXbTsal91EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732780546; c=relaxed/simple;
	bh=dMwUHDT3HfUtPDzXFRr971v/a7XZjkNcxYoIsDVxqkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MhWqGTuyVlCHLNRRHRmhTi+v8qSkEqRT/p0F2wOEckhg6PBtmDDaHM+qWLYVlgryChzC4zwu5e3eF9z+Tg8KSkcHJ+6lnnbXS8HotCTEKwvDaDSx0VEBSJYLCuOMtEoCkqxtIZq7WRBUm8njGkW2sZ9peJSeFzfJy5HXLOaZkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jr7NOJCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS3vCcZ000782;
	Thu, 28 Nov 2024 07:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2Bfq7NxtvWIyhWsTvIOk4uTSf47vxkSUcnABSvuLRE=; b=Jr7NOJCHTlGPfkhz
	uxpnmWzriB/iJ/90BAt93l8GAXbcS/VBcE5Sn5yjIufZ6Uxr4miQt7CciuOFAYu1
	c9lHiPrvB/dQbF3sbRLRkCRobnNFGi2GyQ/ukFK+5mbzDek1Mk4higDRh+VImEzW
	Flbbq+YlXAab6t89SE3mEVhVW8a35Z6qJwAEvAgm0JJr4vzpp3+IcdmyOPZK72oX
	oFZbt8Q43aIFWDOjCGUuKvCkCtxN1olFWX3WY5YlTbJ/+/81vAMY6EFCaHkMPAVi
	Pa/AlX2AFDTBbQ9N3/oQQN6f0PRXF1lMR0ZCVNyUN+qQEaHonDzkDnV5vBprczbb
	a6hqWQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 436h2mgg72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 07:55:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS7tdRY002020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 07:55:39 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 23:55:33 -0800
Message-ID: <624393e7-0681-41c3-9008-de50cdf997b5@quicinc.com>
Date: Thu, 28 Nov 2024 15:55:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: Adds SPMI support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
 <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-1-28af84cb86f8@quicinc.com>
 <wtnsepmoulfhm5ydbu7udtsrexaogaiqjyt737g6a2bhf4drnv@jwmktibj2swd>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <wtnsepmoulfhm5ydbu7udtsrexaogaiqjyt737g6a2bhf4drnv@jwmktibj2swd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DqahfMbYaIQear_irqcOd0hml2VeNty9
X-Proofpoint-ORIG-GUID: DqahfMbYaIQear_irqcOd0hml2VeNty9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=951 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280061



On 11/26/2024 7:50 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 26, 2024 at 05:35:05PM +0800, Tingguo Cheng wrote:
>> Add the SPMI bus arbiter node for QCS8300 SoC which connected
>> with PMICs on QCS8300 boards.
> 
> Could you please comment, what is the version of the SPMI controller /
> arbiter?
Sure, let me add the version information in the commit message.
> 
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 2c35f96c3f289d5e2e57e0e30ef5e17cd1286188..03bf72d6ec5c9ec92f6f53df9253c8c5953e13c4 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -939,6 +939,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>   			#clock-cells = <0>;
>>   		};
>>   
>> +		spmi_bus: spmi@c440000 {
>> +			compatible = "qcom,spmi-pmic-arb";
>> +			reg = <0x0 0x0c440000 0x0 0x1100>,
>> +			      <0x0 0x0c600000 0x0 0x2000000>,
>> +			      <0x0 0x0e600000 0x0 0x100000>,
>> +			      <0x0 0x0e700000 0x0 0xa0000>,
>> +			      <0x0 0x0c40a000 0x0 0x26000>;
>> +			reg-names = "core",
>> +				    "chnls",
>> +				    "obsrvr",
>> +				    "intr",
>> +				    "cnfg";
>> +			qcom,channel = <0>;
>> +			qcom,ee = <0>;
>> +			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "periph_irq";
>> +			interrupt-controller;
>> +			#interrupt-cells = <4>;
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +		};
>> +
>>   		tlmm: pinctrl@f100000 {
>>   			compatible = "qcom,qcs8300-tlmm";
>>   			reg = <0x0 0x0f100000 0x0 0x300000>;
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thank you & BRs
Tingguo


