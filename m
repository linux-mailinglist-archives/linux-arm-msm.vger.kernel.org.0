Return-Path: <linux-arm-msm+bounces-38591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECDB9D4682
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 649A22811A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 04:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13E813B787;
	Thu, 21 Nov 2024 04:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fBlF0e2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6E912B169;
	Thu, 21 Nov 2024 04:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732162352; cv=none; b=cGi7jw39YsFt63ibqMjaZbm2QaFiyem9UHDqF1QWZnjsp7JxaqAZExdTP55ukQZ4Sz/fgO2LrcmxLPu5weij0SQTuCTTK5r3Qck3lwvos2bsfIdjOFrzfmhxX3A3qB0U8uQS6E9Ka29HJOSe544BcRuqW7WUbYfyMyV01nD+VEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732162352; c=relaxed/simple;
	bh=tRxFYv+MD/7TYjDZas1s52wE3uAKqXw+1ECygh1LjFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q4V/v8ujcy3ppYj/k3/dpmRgK1mKa0OXP75RstE6cnedqMWeJ+UPCz6LudRYEnO1kBy4fcAPqiWBCVKKdrOKaCdiKzheZZ2TeOgaQ4rXoWrjXovIJI92ImkNpID2hnUBVNQS/OrvQPKaYR214Q0rBxM6iQNm7tlwsJRgZbED5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fBlF0e2s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK26EO005916;
	Thu, 21 Nov 2024 04:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz/FBwQrY132juxwXiPsTKF6DcwmRg0A7kNHvHSCnIQ=; b=fBlF0e2syz6gDrPJ
	FaKvjsofVEc/CI8S5xuCVnv2p/lQnkOMAAl8SUMOuyNOrAb5dWksMKxSXBBo7Rll
	9mGEtiKaeesyS5Tdrm/sq+nl6SikukE0mD/ODnCYjLcElboIwVFGEclhqTqsCQsf
	RFm+PweMmI3Pt38PY3l4msbUCsabPihvdAjw7QDlNgqy+l4WDtZn4YMVI2g1d7En
	h8Nmnd8tCgLrkyR33QhXgu7c6TxyR8508nRxjhugbZ9GH/+N0m+rJA2bRwHgKFfO
	TYP+4RvAy8Ha62j2drzyYp4r0LDwbHNKKvK3RZzlF1GQ8lKk4V1OdRRfx6jQOaQ3
	26jP9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t23c6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 04:12:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL4COri011429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 04:12:24 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 20:12:19 -0800
Message-ID: <44932c08-000f-4e6c-89b3-d7556a0a7a88@quicinc.com>
Date: Thu, 21 Nov 2024 12:12:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: bluetooth: Add qca6698 compatible
 string
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-3-quic_chejiang@quicinc.com>
 <smwxrjvdvyxw6tknucl6fb5jpjau2q4jcyjxpunbtt5ep6xsr4@ztuyfkrwgxoo>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <smwxrjvdvyxw6tknucl6fb5jpjau2q4jcyjxpunbtt5ep6xsr4@ztuyfkrwgxoo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CyerFLAsEMZxIsTgOWsEIZSl2GfwxrX5
X-Proofpoint-ORIG-GUID: CyerFLAsEMZxIsTgOWsEIZSl2GfwxrX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210029

Hi Dmitry,

On 11/20/2024 6:44 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 05:54:26PM +0800, Cheng Jiang wrote:
>> Add QCA6698 qcom,qca6698-bt compatible strings.
> 
> Why? Is it the same chip as WCN6855 or a different chip? Is it
> completely compatible?
> 
They are different chips. But it's compatible with WCN6855.
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 9019fe7bcdc6..527f947289af 100644
>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> @@ -18,6 +18,7 @@ properties:
>>      enum:
>>        - qcom,qca2066-bt
>>        - qcom,qca6174-bt
>> +      - qcom,qca6698-bt
>>        - qcom,qca9377-bt
>>        - qcom,wcn3988-bt
>>        - qcom,wcn3990-bt
>> @@ -175,6 +176,7 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,qca6698-bt
>>                - qcom,wcn6855-bt
>>      then:
>>        required:
>> -- 
>> 2.25.1
>>
> 


