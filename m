Return-Path: <linux-arm-msm+bounces-39512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D333E9DBEB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94506280E42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A5C42AA5;
	Fri, 29 Nov 2024 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HAPzzdYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236F479CD;
	Fri, 29 Nov 2024 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732847417; cv=none; b=GU2KZvxcuTAcLQS/jc3pupnqAmKWmsI0YlxwnuCI+AWxlJ53ogaefxnt2kABKrI5mDVVJ5dtvPUfc4/oMlcNKqjOuPrPERMjm0mVvXHjdRGqu3cHZpqqIYVW6Cmbrcxu4kFr4qmxBIKAh6BYAxZaqU7tloNY3TduZQdyaFsA9rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732847417; c=relaxed/simple;
	bh=lTjN6zOL+tSTbVS5455NvZKxDX716Aids13dVEhSqMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oRA1AkZGKQeBrR2G0iOyDwJBGF/0bmyciyuOhkJbH3F7p8SNH3v4GcdZkYlaXT6XS2E10fQmyoNirReXNFnEUwcdVGCwIbLJxeOdKNtfppbUZzlWq2ufvAhOhTBvl+KvcDyejQytzZ+go+/fyY5f4iZUEMVZyPkh7hzMGVrpZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HAPzzdYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASLZ9iL011311;
	Fri, 29 Nov 2024 02:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kc2rd6moJCmCqjm9gKu5QXYDeCITrVgfEMD1bXJitdY=; b=HAPzzdYqOPLJcl6U
	m2OsLPoYtA/hnm/s0yvP2lCnI6b/XoviHJ9BxVS5JPxdtSOmVYr8RYhswWBkZeAa
	v3AC2JG8XsgOYKgDU7yYqCNYMhFMyQTuXegxvGmGMyvyOe7V0Ols05G5VhtQMov6
	1MkMgvrNIp4XCFdYcfnFOBdL5HRN8+I25M/clhuYntcbBhBtdpbzo0CUt925f6wk
	wmY7IftKMiXIw1n0AQ+yCyIQVbUkwJRZArKtr7vVZnARjdXqqjRXR1ujDScWmwLg
	dUM8GCrhhLMkGj+HwClw5puzQovGSu641KUbal8WPhRoASYRWMdKeBqHLivAYc6A
	LigEUw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw47wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:30:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2U8JX007819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:30:08 GMT
Received: from [10.239.28.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:30:04 -0800
Message-ID: <cd82ea16-7c37-41cf-bfb1-7cc6d743d8e9@quicinc.com>
Date: Fri, 29 Nov 2024 10:30:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: net: Add QCA6698 Bluetooth
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
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_jiaymao@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-3-quic_chejiang@quicinc.com>
 <jaq7tjdq4srboo7m4byfofdbigy5hyeeqwyrgh72t23xgwb65m@lz5yivskxbwd>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <jaq7tjdq4srboo7m4byfofdbigy5hyeeqwyrgh72t23xgwb65m@lz5yivskxbwd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bTkBdVNV5xCoIXiScpOPNJO_qVR7X34D
X-Proofpoint-ORIG-GUID: bTkBdVNV5xCoIXiScpOPNJO_qVR7X34D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290019

Hi Dmitry,

On 11/28/2024 8:58 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 08:09:21PM +0800, Cheng Jiang wrote:
>> Add the compatible for the Bluetooth part of the Qualcomm QCA6698 chipset.
> 
> ... 
> And you have misssed to explain why do you need to add it and how it is
> different from WCN6855.
> 
Got it. I just explain in the dts/driver change, forget to explain here. 

If use the firmware-name solution, do we still need add the new compatible
string for qcom,qca6698-bt here? The driver may not use this string.   
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 7bb68311c..82105382a 100644
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
>> @@ -170,6 +171,7 @@ allOf:
>>            contains:
>>              enum:
>>                - qcom,wcn6855-bt
>> +              - qcom,qca6698-bt
>>      then:
>>        required:
>>          - vddrfacmn-supply
>> -- 
>> 2.25.1
>>
> 


