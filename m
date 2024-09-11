Return-Path: <linux-arm-msm+bounces-31518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F58975692
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 17:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84C22834CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 15:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561091A38F4;
	Wed, 11 Sep 2024 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2f4RELd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F901A303D;
	Wed, 11 Sep 2024 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726067612; cv=none; b=FEJO4rs+5cYaVz6y0DAtJt/uHZGk1LG2VMUpjbf0EDDpHK4mf6tZxsDXzVFCAjU6uzvrD39T/CG+sV4X01rgEPZMEGza5GEjJDr8YZjz7DJoAl5ZFJnlOZWJU+wcfUJ8nJWknGvzsX7ZJr0C1riE7m8iusUf09w0cXwVNctuyJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726067612; c=relaxed/simple;
	bh=MVCgEyxv+AauaUKMyFtIUdARbJeBlFEnA33AzU6YXAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qXk0L1e0RyiwD1VIUFy0xE0vjWkGQx54s7FW5vgzWk3K8GZ3V6JRGT5vTsfRrvWPGJnRD43K9GivrE8MTkmvsF+2bYuVJ33+c5N5lQRkq8W99SdOatMxd0CsO/xUOtRgatp6AYCmaZJTuQ+kSrmia0hpcDE3ySiE6TPbaTQtFec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2f4RELd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BEmA22010826;
	Wed, 11 Sep 2024 15:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdkNZkA3UrxgClH6jU33gXtn0b47NHyHYCHQ5Be1CZw=; b=k2f4RELda+BbPsRY
	2DtuuBPuisWUpHr0B11/x0Tj3vKONKtze5GAcPUs5ezjPU0nBY+LBom7fqJhwxc2
	FYI6Bg8EWAB35670LNkz5Q4nVGw6h2o9OqRzsizvFsy0qW996qXJlawhPJ/V3Fup
	oRW/cYX1S2ikHO5HnmSkUdx07KxR0OKtFPIDEYGINAdmBd3L1fXiZ6KnDWkNp5ze
	uflIAvsf35SLW9YoMyqfhnTSOgBgBh3T6vEV4rZQqXzOCfC2mBOMXsh2faFd6ij4
	eMQ1mjybjAHsFaiqV77vC2oDLnMIPN48Go3T4k/RjwIkxdYK5NKPUrQ7jls2vR8c
	Ko8XSQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy519y49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:13:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BFDOw5020177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:13:24 GMT
Received: from [10.216.26.164] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Sep
 2024 08:13:21 -0700
Message-ID: <e95b3c9c-12f1-4dc0-8bc1-db92f4b2338f@quicinc.com>
Date: Wed, 11 Sep 2024 20:43:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 RESEND] arm64: dts: qcom: sa8775p: Add UART node
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20240827083252.5817-1-quic_vdadhani@quicinc.com>
 <98e7dc28-4413-4247-bad1-98b529f6d62d@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <98e7dc28-4413-4247-bad1-98b529f6d62d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Hz0tiSKS0krEUH2Ad96ZBSN2YE9buYP5
X-Proofpoint-GUID: Hz0tiSKS0krEUH2Ad96ZBSN2YE9buYP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=944 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110115

Hi Krzysztof, Thanks for review.

On 9/6/2024 5:55 PM, Krzysztof Kozlowski wrote:
> On 27/08/2024 10:32, Viken Dadhaniya wrote:
>> Add missing UART configuration for sa8775.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
>>   1 file changed, 231 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index e8dbc8d820a6..0c95a23aecec 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -1,6 +1,7 @@
> 
> 
> Please don't grow the file. At least not with above explanation. There
> is no sa8775p according to what I have been just told.
> 
> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
> point of view and insists on new approach of dropping sa8775p. Therefore
> this change does not make much sense in the new approach.
> 

Qualcomm has decided to keep current SA8775p and don’t have plan to drop 
SA8775p support. Hope you are in consensus and help with further review.
Updated commit log and Posted v2.

> Best regards,
> Krzysztof
> 


