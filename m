Return-Path: <linux-arm-msm+bounces-28424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC1950D82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 22:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FF02B26024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9789F1A4F11;
	Tue, 13 Aug 2024 20:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VljHwBeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA7E1A3BAC;
	Tue, 13 Aug 2024 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579445; cv=none; b=gt1HoHdM1nbBuHHXlrwcTF4lhASzRvdm8cuJ1vjTXmqV02rSCuoePW8fQRI4RszdLW9UjzL9yCjcTojX+naJF0fy+5hXc2m4cO7LLxsPwm0xvgVJyQgZu2hwPQ/FCikFB+LSW3pJSeHcvkjRko5F4/fCDxW/nLAf7Jw35tNH8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579445; c=relaxed/simple;
	bh=+Npvfp8NSzv6+BWy9xk5foyIWDSG9LTmA1VnFOsrxew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gvHJSv/+LdbVREDcr7FXHDPjUKb6DxZ4KdiN5ICDw/SxeHyboOmk2dV3tbykk1Edrlq0ndS0LTOF3+rd1LCU+pWuvZmxjRAmB2cFEAj2pdm4EpaAO9idg2mRUwWYe6QFPB/goaTDdS12ow5R23bHMyrPU8Khjj3fDGS4R4EYwL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VljHwBeh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DCGalM005644;
	Tue, 13 Aug 2024 20:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Al0COlWtxPvz9k7iEu0xiRFveGatmDKFzjD4MOn3VBc=; b=VljHwBeh+p8Wh4VN
	BxhCgnSt6Tjb4LI9LsQZejNJtZySOPDBJ8hY6S1pTwnoMewwlDba/DyQ4CO03ihp
	91FTqe6kx47JA1w0GyR+9Bt8Cr/c9+kYMojC584BLXfGUtCHbxasP64H2Fgdgio6
	LbA+ZRcSoDML+gFzD1p2zpec7j/7rrFq5Uuy/LhRcfGpEr4QTK6KXH4ChMDPny2J
	H4lcEQ9+6JdO5aeEw8zt0bzsV0jFc05iDRPUQvfX7WmPs4GPgEzhh9RsHtxzVycy
	xTI8BpUQHJYPgv+zglym/GpO6AOQEnAnE0MxTSrWc9xDCviMeP5QBtxHwAgYOE06
	J3unGw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18y12dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 20:03:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DK3vWG009675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 20:03:57 GMT
Received: from [10.71.108.157] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 13:03:57 -0700
Message-ID: <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
Date: Tue, 13 Aug 2024 13:03:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Souradeep Chowdhury
	<quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4hqBSQeGN_q9JJfpmTe-YaTcStwpTx-e
X-Proofpoint-ORIG-GUID: 4hqBSQeGN_q9JJfpmTe-YaTcStwpTx-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_10,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=957
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130144



On 8/8/2024 4:00 AM, Krzysztof Kozlowski wrote:
> On 07/08/2024 20:32, Melody Olvera wrote:
>> The EUD can more accurately be divided into two types; a secure type
>> which requires that certain registers be updated via scm call and a
>> nonsecure type which must access registers nonsecurely. Thus, change
>> the compatible strings to reflect secure and nonsecure eud usage.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> index f2c5ec7e6437..476f92768610 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> @@ -17,8 +17,8 @@ properties:
>>     compatible:
>>       items:
>>         - enum:
>> -          - qcom,sc7280-eud
>> -      - const: qcom,eud
>> +          - qcom,secure-eud
>> +          - qcom,eud
> Commit msg did not explain me why DT bindings rules are avoided here and
> you drop existing SoC specific compatible.
>
> This really does not look like having any sense at all, I cannot come up
> with logic behind dropping existing users. You could deprecate it, but
> then why exactly this device should have exception from generic bindings
> rule?

Understood. I won't drop this compatible string. Is alright to add the 
additional compatible as is?

Thanks,
Melody
>
> Best regards,
> Krzysztof
>


