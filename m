Return-Path: <linux-arm-msm+bounces-47848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DAA337A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 06:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE8F3A8FB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 05:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165BD206F31;
	Thu, 13 Feb 2025 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BdXUWieJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDC206F0A;
	Thu, 13 Feb 2025 05:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739426224; cv=none; b=CFovjAXem7AuxTeomLmWM4l1PusAQQ0Ug3H90tkGMkT05kmm4zAEVdw9npiYgpiBXoNLDQMS+ul3iL3l99BZiYSEfredwEcOjBqibMCNrX09xnMySMZPdzedYxlpZY605k94S17DVxD2Yt6+IUWFcf2/zI/+KtAYZ0TQihB96M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739426224; c=relaxed/simple;
	bh=t6vm80pX918SnG39aG001InDFHetyH8W+Kc6Gog2Mqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z4CUOSIHlBNDnmGvDKoHYKpcIjAQxnv0Y9RL0h+ldoR9aK8nBihLR5VC4hkWaHo/R+brLaZQ4VDGJvAJF0jMARw0TufXY5dvo3jrpF/WEtddnW7LigktZNCca+wmkLoDMT68icH3aApc5awfV0jHKDHbLrKjoB1VyJOixVajVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BdXUWieJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CMG7q1015782;
	Thu, 13 Feb 2025 05:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2E7T03XEtIuOmFR09Rj8VLTT6c0rjtm2QPOxz4TyOZA=; b=BdXUWieJOup5xnKE
	cYPcIghmzbxNWdZCWUZjqW8ojpgwhImsZoanQcaI4uu650XrFnwSgLpPwrNHBjRN
	RXgR0uBtCyCHFC7Szy0cvAsI/G7HO9qXmIP6/SlGmdH69fJkW65xleqcSD2HbvZP
	nTUnE6/PzYAUhtOu7gx99whKFcepiYRNqWIr4PQCcVMzBPxu3pt/0+HX5fMO4VG1
	tGAlCLHQKgdJaiHXE7gEy4PEo+HfO4VFXmrtf2X36sPXPMWZEoCWzCKTCbysLXep
	AjAVk7Au6Df8OYJs68kVeT+jGai+H2KEHSn7qMmKGT3Ee64feoPJuAySHmtyzRYv
	qT2LEw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgm0tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 05:56:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D5uwCd006397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 05:56:58 GMT
Received: from [10.231.216.52] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 21:56:55 -0800
Message-ID: <6149d02f-21a2-459e-91f2-6c91b5093807@quicinc.com>
Date: Thu, 13 Feb 2025 13:56:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: qcs8300-ride: enable BT on
 qcs8300-ride
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
 <20250211104421.1172892-2-quic_chejiang@quicinc.com>
 <eebcc0e7-4f87-45d5-8ad4-9d24145ef5b2@kernel.org>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <eebcc0e7-4f87-45d5-8ad4-9d24145ef5b2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5NFkJH06kej0QcmVirww76aDDRUC5bAl
X-Proofpoint-GUID: 5NFkJH06kej0QcmVirww76aDDRUC5bAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=912
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130043

Hi Krzysztof,

On 2/11/2025 7:03 PM, Krzysztof Kozlowski wrote:
> On 11/02/2025 11:44, Cheng Jiang wrote:
>>  	};
>>  };
>>  
>> +&uart2 {
>> +	status = "okay";
>> +	bluetooth: bluetooth {
> 
> Why do you need the label?
> 
Yes, label is not needed. 
>> +		compatible = "qcom,wcn6855-bt";
>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en_state>;
>> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>; /* BT_EN */
>> +
>> +		vddio-supply       = <&vreg_conn_pa>;         /* bt-vdd-ctrl1-supply */
>> +		vddbtcxmx-supply   = <&vreg_conn_1p8>;        /* bt-vdd-ctrl2-supply */
> 
> Only one space before '='.
> 
> I think this has multiple test failures.
> 
Ack, Will change in next version. 

> Best regards,
> Krzysztof


