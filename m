Return-Path: <linux-arm-msm+bounces-35351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6979A9AE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51131C2101F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6769514F9CC;
	Tue, 22 Oct 2024 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TsVZ5mB3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1514F124;
	Tue, 22 Oct 2024 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581938; cv=none; b=mFPfjSY9kNKOhmgJpjv3+yDT63brTzb6lIiwjEAR7pFY4c5pvdOgMQEh/DsqrOGM/j7M/x60xP9WwuW7sOBTuFlPfqgd0QXjUdbMHBBgkFzDtuR3gn0At9Uegrwn3GVGdpvtgaQhZopNOCp42UTwoPGljZ82D9olZbSIxGie8CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581938; c=relaxed/simple;
	bh=E1Z73kP5PEOqDyoewzqb404XJZ5cALXJMtPwftv3YCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A/Bv8i/7jBwrw9YuLUwesieAJGGTlNohcdfYTAbWUdkiVyEogbYgZw4fxknPjrfa+NnVAKUsKnWxpQvjKdyxswuk19ZC8mQmkMtHzRMmPQk0b01EwDfYjGQeM0KJxcnrDxSeHo6793XEjllfZpB6b7ShJwXti3FH5wzP5kMMiQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TsVZ5mB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LKUNlm018231;
	Tue, 22 Oct 2024 07:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7hOqvWKfwShsUb0xDCp83yRwWwvxEhCtulITtm1ICo=; b=TsVZ5mB3MFSLUaxy
	TGYeJsGLQzE1aVuP3mg5nfkJXb5g2/V3QJ+a+4xWJUI2jrwL7+rIViZK/wUvIATs
	7TdNIooMmVLCIuPwqVfTzeOcNpiDrhPi2K2KWz11DGeGCLe+K9sHgbbTWJ28uinr
	byO81jH/Zd2dkeoxZBLogY+TyZs9xIO7A30CjIETvV1VnBHPAMYm9j/LfRtRLQyR
	ZUVj3Tzsbz2ZCr5HcxFs5SaVRCmolKhE6YdUGerf0c1ZEICken2DZgjhvV2TZN3T
	tds2CsL6TH5Czw+/1TWvWi+PjZG7dEmpxvYgPKYT4waFkOpnzW1CrFNYwZWtiuL0
	i9LP9Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tsq8t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:25:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M7PRLh026995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:25:27 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 00:25:22 -0700
Message-ID: <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>
Date: Tue, 22 Oct 2024 12:55:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
 <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
 <3765cf3d-8477-45a7-af0e-b0c78f41eaad@kernel.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <3765cf3d-8477-45a7-af0e-b0c78f41eaad@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cl2EvZWMF51Qa-unApiv5whUawjYAyQY
X-Proofpoint-ORIG-GUID: cl2EvZWMF51Qa-unApiv5whUawjYAyQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxlogscore=995 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1011 bulkscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220047



On 10/8/24 17:41, Krzysztof Kozlowski wrote:
> On 08/10/2024 14:10, Dmitry Baryshkov wrote:
>> On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
>>> On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
>>>> +/*
>>>> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
>>>> + *
>>>> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
>>>> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
>>>> + */
>>>> +#define QCOM_DDR_LEVEL_AUTO	0x0
>>>> +#define QCOM_DDR_LEVEL_PERF	0x1
>>>
>>> I could not find any driver using these. Can you point me to usage in
>>> the drivers?
>>
>> It's well hidden. These are the raw values used for DDR_QOS memory.
> 
> So not a binding? Then these should be dropped.

I am not sure why the term "well hidden" was even considered :(
The driver just reads them from dt and passes them along. If you
want the dt to list magic numbers 0/1 instead I can do that as well.

-Sibi

> 
> Best regards,
> Krzysztof
> 

