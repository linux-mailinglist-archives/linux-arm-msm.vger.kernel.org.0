Return-Path: <linux-arm-msm+bounces-27601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FAD943C72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 02:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7DC1C21E1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F5F1BF339;
	Thu,  1 Aug 2024 00:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XQdMejH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8A1BF319;
	Thu,  1 Aug 2024 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471426; cv=none; b=sNZHVc7DrKdfLr6en+Xz6TYsGH6An2hepYaDM460eeNiEzjtv07iwN+c9BH6JxfXKAdXguQWWnry4ZNQV0jhAvKPxyuvzEFjipObmoYIyrcf8wxZ0AglyzOfkymO79ziy2n2RfnRMnPEt+ebVaiK6eHr0F87UI08x4AFoWxJy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471426; c=relaxed/simple;
	bh=UxzIzk0acordVPiyRVtqNZDfFAq6Jwx51e+JobKskso=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RXbS3guFKQLe4WW+4d96OeQg/NsBJdyo9rKCR+sZqaqglr67DbmcoQm62Oxo7BMoN/EEALoVYHUzyCTVMNt9afa60dU6L5wrSsR2uvjP35qC4FnT/rle4f7K6uyVP6m10Cov82da1veQRXFKBYLHMLKpnBqfyMfESmFXjB3y0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XQdMejH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4710GcT7010022;
	Thu, 1 Aug 2024 00:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nt8WMNzCLrQRoOfcX2ADcVIciyuEmWgx2qcrKQTA7Nw=; b=XQdMejH4nDeW5z5S
	Pmou1MstyswnbACi4/VchBpfQG0R59Qc/rsDe31r5vPUGXWIqbVYzH2oFQzs8DQz
	SiK1NMtM4yZ7NGXFGqpdl+AN6wRbuL6vqG4GP5dbM2LYKgg7UpE9rRup9PYz1kDV
	fU6Q7EJcrDmGpLfcF2XwDtALkWWB40e3OKWpn5LEBaOsPmH8//79Bsf1NbG7PMVJ
	s2b9FGLRO7Sr3cElYdXT9sur0ko+0cEYjWzzgJLd3F+MnUo9SNAWKHRozPAkavw6
	O6caUvj9yA/bS9PtmBBEd4mEOg0dJnq7L9E0kXaNcsUPWuPsp36eXQlkzrOzsNMe
	IVXylg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qnba9uge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 00:16:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4710GwV8001987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 00:16:58 GMT
Received: from [10.110.31.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 17:16:58 -0700
Message-ID: <cc02dc38-3986-4b28-a167-30150ea4cc6c@quicinc.com>
Date: Wed, 31 Jul 2024 17:16:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: soc: qcom: eud: Add usb role switch
 property
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-3-quic_eserrao@quicinc.com>
 <7aec2a72-3276-4837-87fb-ac974588fd53@kernel.org>
Content-Language: en-US
From: Elson Serrao <quic_eserrao@quicinc.com>
In-Reply-To: <7aec2a72-3276-4837-87fb-ac974588fd53@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vC1Ct4tTXhi1AtrpxMV_6OkVB72wCDbG
X-Proofpoint-GUID: vC1Ct4tTXhi1AtrpxMV_6OkVB72wCDbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310168



On 7/30/2024 10:36 PM, Krzysztof Kozlowski wrote:
> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>> EUD hub is physically present in between the USB connector and the
>> USB controller. So the role switch notifications originating from
>> the connector should route through EUD. Hence to interpret the usb
>> role assigned by the connector, role switch property is needed.
>>
>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> index fca5b608ec63..0fa4608568d0 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> @@ -37,6 +37,10 @@ properties:
>>      items:
>>        - const: usb2-phy
>>  
>> +  usb-role-switch:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: Support role switch.
> 
> So both EUD and DWC3 controller (as this binding states) are role switching?
> 

Yes. EUD would receive roles from the connector and relay it to the DWC3 controller. In addition to these roles, the DWC3 controller
would also receive roles from EUD itself (related to USB attach/detach events).

Thanks
Elson 

