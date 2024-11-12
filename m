Return-Path: <linux-arm-msm+bounces-37636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE89C5C3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 16:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 004931F21D3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82783202F73;
	Tue, 12 Nov 2024 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jN8uBDPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9509202630;
	Tue, 12 Nov 2024 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731426513; cv=none; b=Sio62pu+/BZue5dLQXLIpApn2M73WOSWpukUS9WbbrPuAqqhiUWtrumjNgJrMnGyskvWHvg3OBoAz1tW317QAIj3Kx/noZOdhEBvhdho1fWz5TQBVLpCIDKkLeD6nqhPP0srmDOmhyn4mvzLqXGrNJh0bBCzX0YjPqlKtLHs/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731426513; c=relaxed/simple;
	bh=GwwNhUBLIcPHhWY4SQF05yyn1FVx5ic5AYp/6/AkZLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=enuu2wmAqosJwiLSTI34+fggxD07sfUTQyPkKds6eki149J7ttdvB/TDbMStnwqQ3wVkcPWyLk+myHO3HbGPwkIBuek3453eqVhsYeH1Vsm/RgNeEUv4yLQk6+Hiz7JYF6vn055ifojq8YC1ldrcETErRe/WYS6HpttLi5f+CrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jN8uBDPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACC517w032123;
	Tue, 12 Nov 2024 15:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VV0lIDnndbJ3AJw+poTnIcbd8rUqFdwT6PiA3+seiv0=; b=jN8uBDPUGcRFRUnW
	WGE3C4cD5EQOELjWPzEEZurpJvxu3M2v6jEv7KE3s6zNc43AXCUUOXEv24vVAgev
	QIFpLw/MbHMJ3azhjDb3pmk/1c/zf7BFFCvzstL84qUATnd7nrKQd9xnu4hVbYE2
	+sTyydgMOJkhJ2CmXdmjPp/M9VLok49MlmgjYvbFT6bUmfWvWcpE66EKjteXseSw
	xtuOuWXKXctdl4Yv6ag1j8SOHaPA6q0ecHl+8W2Btv/5SOWLjpgRlViZiLmNYrjd
	u8vR0O29Bx3sOr53DKmqAef6dJBFsjbRFiwubPaPzBt/BYBTq8mlb+0y9YQFvZXQ
	oLbQvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkynwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 15:48:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACFlxsv030962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 15:47:59 GMT
Received: from [10.216.16.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 07:47:54 -0800
Message-ID: <fb28e81b-2a0d-4a34-a8e6-d4e7812fbcd2@quicinc.com>
Date: Tue, 12 Nov 2024 21:17:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Konrad Dybcio <konradybcio@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
 <20241105164946.2357821-2-quic_kriskura@quicinc.com>
 <dbd8ae86-03a5-4b33-b774-846788bf8b89@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <dbd8ae86-03a5-4b33-b774-846788bf8b89@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MpjBLaDlCipk2odoxYBEjKG9a9Z59SO2
X-Proofpoint-GUID: MpjBLaDlCipk2odoxYBEjKG9a9Z59SO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=836 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120126



On 11/12/2024 4:34 PM, Konrad Dybcio wrote:
> 
> 
> On 11/5/24 17:49, Krishna Kurapati wrote:
>> Add support for USB controllers on QCS8300. The second
>> controller is only High Speed capable.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
> 
> [...]
> 
> (the PHYs look good)
> 
>> +        usb_1: usb@a6f8800 {
>> +            compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
>> +            reg = <0x0 0x0a6f8800 0x0 0x400>;
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges;
> 
> Please match the property style with x1e80100.dtsi's dwc3 node

Meaning adding the 3 properties to before the starting of dwc3 node ?

> 
> [...]
> 
>> +
>> +            usb_2_dwc3: usb@a400000 {
>> +                compatible = "snps,dwc3";
>> +                reg = <0x0 0x0a400000 0x0 0xe000>;
>> +                interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
>> +                iommus = <&apps_smmu 0x20 0x0>;
>> +                phys = <&usb_2_hsphy>;
>> +                phy-names = "usb2-phy";
>> +                snps,dis-u1-entry-quirk;
>> +                snps,dis-u2-entry-quirk;
>> +                snps,dis_u2_susphy_quirk;
>> +                snps,dis_u3_susphy_quirk;
>> +                snps,dis_enblslpm_quirk;
> 
> maximum-speed = "high-speed"

Ideally this is not needed for the driver to operate. Can I add this 
property when I send the patch to enable second controller on ride 
platform ? Only reason I ask is this is not a blocker and it would need 
another rebase.

Regards,
Krishna,

