Return-Path: <linux-arm-msm+bounces-38734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C909D57E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F789281072
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 01:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBD43B1A1;
	Fri, 22 Nov 2024 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Txz7z3sZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404AA31;
	Fri, 22 Nov 2024 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732240537; cv=none; b=BzwggTpgUlx73t/OpAtjgIi0jE+c0iFVcyLUxS7G8J7cl43yDitiVPNiiY+tYYQ+SIhBndFS/2SxGQEN39dSfcd8/3rkGmJd7HfKE/1c3878oDPkcDBhKQssnvb9WenUpg8SYdk3vZ9/mv9Y1/GX+lNXsUQ5z2fkSzI0tAgPXwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732240537; c=relaxed/simple;
	bh=DSTJxqipcPbydlYj+s0y1VX/NGDpFVcREaAVSRjBbRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y//gEcl8llKvTFc3BOxHqSBeZZiVyUcInahw03NbOz2OiWXavHAzbNnZtkP4gXL2kZvLDKtWiziSvrRFWicWZyPlUFeICLzkXdXV4wubtxuPVFXlMpKsLdRXm3ssQLkFJ/UqdVXl2STDYqqOd0HHnfQRJoNfZz5/ipgXeEUCHNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Txz7z3sZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALKLlDT019613;
	Fri, 22 Nov 2024 01:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdXsykcoSzLHUg1ZOBfKv7oFlN5m18jwzcV8M6T1FOc=; b=Txz7z3sZGLBWOz3C
	VNJlhmSZoV2ajD45hAIjvA9dpFVQO4d4W5WDuXbbvCev3wrbIY3alAw/uhPBmzfd
	l0suimWjMSC5xmtlSYhd3Fbj7mhgu7XSPT6GutzhaaUmr2CqKCUjygFvP2CJYkws
	/Pry9dauyNvyB1HyQ42HvLfxksfgbI6i0uuzK6OHcxlbtCRpqmlYIvow1zws824D
	XyEdPn853Y84bCtCtFXn9NKmS49IQHl1WQ1MDyJrxjASFni39uCaIUMJE6ev1Ylm
	uJ7K/6SOfR0D+eEM7JiATRLoSRx5I/fYJkzDHdRWrHu8THF/P1Q2v0BhWUvwjgPE
	hTEE2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hnx6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:55:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM1tS7g019016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:55:28 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 17:55:23 -0800
Message-ID: <e8645b6c-7f78-4051-9e29-2276197714ed@quicinc.com>
Date: Fri, 22 Nov 2024 09:55:20 +0800
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
 <44932c08-000f-4e6c-89b3-d7556a0a7a88@quicinc.com>
 <CAA8EJpq1u6ngze81LKAcGzQEJz=yJ-u6MjvRMJHdKp3aPVnewg@mail.gmail.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <CAA8EJpq1u6ngze81LKAcGzQEJz=yJ-u6MjvRMJHdKp3aPVnewg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U2jZFR-qxQhxhouD9WWmjTUbZaaZKTdC
X-Proofpoint-GUID: U2jZFR-qxQhxhouD9WWmjTUbZaaZKTdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220014

Hi Dmitry,

On 11/22/2024 12:28 AM, Dmitry Baryshkov wrote:
> On Thu, 21 Nov 2024 at 06:12, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 11/20/2024 6:44 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 20, 2024 at 05:54:26PM +0800, Cheng Jiang wrote:
>>>> Add QCA6698 qcom,qca6698-bt compatible strings.
>>>
>>> Why? Is it the same chip as WCN6855 or a different chip? Is it
>>> completely compatible?
>>>
>> They are different chips. But it's compatible with WCN6855.
> 
> So, do we really need new compat? Will/can it use the same firmware?
We need to use a different firmware. Let me check if using 
"firmware-name" allows us to omit the new soc type. 
From the driver's perspective, the only change is the need to load a 
different firmware.

> 
>>>>
>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>> ---
>>>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> index 9019fe7bcdc6..527f947289af 100644
>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      enum:
>>>>        - qcom,qca2066-bt
>>>>        - qcom,qca6174-bt
>>>> +      - qcom,qca6698-bt
>>>>        - qcom,qca9377-bt
>>>>        - qcom,wcn3988-bt
>>>>        - qcom,wcn3990-bt
>>>> @@ -175,6 +176,7 @@ allOf:
>>>>          compatible:
>>>>            contains:
>>>>              enum:
>>>> +              - qcom,qca6698-bt
>>>>                - qcom,wcn6855-bt
>>>>      then:
>>>>        required:
>>>> --
>>>> 2.25.1
>>>>
>>>
>>
> 
> 


