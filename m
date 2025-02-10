Return-Path: <linux-arm-msm+bounces-47442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC81A2F2A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17AA3A21ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE5E24FBFB;
	Mon, 10 Feb 2025 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lmOpWvPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710AD24FBE6;
	Mon, 10 Feb 2025 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203930; cv=none; b=ad/yySLDXvlvIh7bJ3t6VbQogqElPpn2NvAoZWEtGVSjAa+jPVLLl6G2n+d1sHyao825RKhGCPfVAL6SrSzAUPTvWLSHpWn1jA7fSUfYZM4jM4FbAEPHQhTrRigfglc+TDIP4Gl6iB5y6+hWofNe9dj7UEi9IvGWrEeAXQD9wvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203930; c=relaxed/simple;
	bh=Xj9KH2Oophbhe83Fe05D/lMXzapALIz6LoZ/gHvZlD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VzuW3eCT5o2FFQjUZpnxuP5GveQlwNyrdRJOD18TTUu31A0t8b7F/49TKeI2ivvdKwCnflMf3EUCyAKnmO440bZio0vFBXcoNJpkxKMzsPyXpvDK8WskmyY0qGYLeAA55u7seyBHId6pPUbFTXgC0KRk6D4WzpY73eHJo7pxpOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lmOpWvPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HlE7001431;
	Mon, 10 Feb 2025 16:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKPMrlJEpL5C75uiFqCxo4gekloyrrP6igMu4fzz58w=; b=lmOpWvPISaKl2kj4
	cQ1E/dtm8iRC/ByAkvo1851K5JPfhaBJG/ckkjhX6JfLfX331Y0c4bzIw9gNa73L
	0U9ko2Awl8bRll33CfTHoqu6BAUJJrjuCK31c6R20Dxpk54p6TbvrugyU5EzatX5
	Frx/JYoiFEKTKyIsjhAkPI13iJtgXmna4X742oH3ZG11YKVCU3ebvZSO+QUU3HEk
	ae9ifuJocmDxvn85zOdkONt+h0d/+sPFdmvBrpqQQKjcYiLMj9ue+HY+tlsv4CMe
	I1IkibexN3hwDXgoFPKavS//CVsD4sQurbB9irS3fDW9JCvKpaoZAwhAWkRAB+6L
	CMIwGQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxh29v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGC0Sa027609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:00 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 08:11:56 -0800
Message-ID: <93cc3419-bd01-4725-9ce9-40a99075a105@quicinc.com>
Date: Mon, 10 Feb 2025 21:41:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
 <f643c57e-de01-4372-a1b1-7ebde319d0a4@quicinc.com>
 <c7cc1453-d54f-46f7-86da-275636eaed84@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <c7cc1453-d54f-46f7-86da-275636eaed84@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ezc-EtvXRS8ypoiIQoeaBKvzPJQ3KF-w
X-Proofpoint-ORIG-GUID: ezc-EtvXRS8ypoiIQoeaBKvzPJQ3KF-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=974 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100133



On 2/9/2025 5:16 PM, Krzysztof Kozlowski wrote:
> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>> I will remove minItems and MaxItems, will list Items with description.
>>>>
>> Wanted to check if below way is fine ? Because some of the ask to drop
>> constraints are already present in other i3c yaml files.
>>
>> if not, could you please help share example removing constraints and
>> listing item ?
>>
>> == Sample ==
>> properties:
>>     compatible:
>>       enum:
>>         - qcom,i3c-controller
>>
>>     reg:
>>       type: array
>>       minItems: 1
>>       maxItems: 1
>>       items:
>>         type: integer
>>       description: Base address and size of the I3C controller registers.
> 
> 
> I really do not understand this sample. That's not a DT schema code.
> Please open existing Qcom bindings and look how it is done.
> 
Added changes looking at existing i2c and i3c dt-bindings. Please help 
review latest.

> Best regards,
> Krzysztof


