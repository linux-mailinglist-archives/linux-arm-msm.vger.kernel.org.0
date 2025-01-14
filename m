Return-Path: <linux-arm-msm+bounces-44977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F77A10243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 09:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F570164699
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C41284A5C;
	Tue, 14 Jan 2025 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JbHQFKHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022E24024E;
	Tue, 14 Jan 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736844005; cv=none; b=kBiG7SUSDD5O1P6JckZfTiAY0Imn1seZ73BQIQ/r/XV/UI3NmSWUjOBhKkYkuQr2TMzhpjuNzFfdIRnx8Mq5oEn5HUJ7mZ4dhkrZ3RftaSGlFjjiK1e/66BgjhOsB1vOjAM7UXAf334de8F/jpgZpEuADPFKyxotTwu/tTIUbiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736844005; c=relaxed/simple;
	bh=+Nv2NBrwmCCZ1xgruSVVyKBPVnNh9HXjMKgk4WydGHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RG5EZTJT8lgHUqdJ6t62mVQ6TSIKtd2veUUjMDsRtA3XW047ABrbgYlOXcSttfcS9lkdZqbSBzYrar6wMxyKQz8y9sTemUgLevaD6kPAW38chM0xS2I2NWkFWwWGC/Za9Wb0JSCP0/rgQ1c9Pk4Z+8oDv7Tj2wtUJl4V1YrA2Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JbHQFKHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2roq3008802;
	Tue, 14 Jan 2025 08:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHQaAstEqNv45AdrcWHch1WADxggkaEEPu1wSZb46fg=; b=JbHQFKHNDxSDFkTk
	oKv+L74+wIr6bWfXZEf6N9CrdOgV0lpEL+UmubyaFTFJJ/5+h4k8kTAAwhR8F3CA
	4AfHWgg5qQpc1B1Peffcr51CU4ZxBqX4yLP4mEztCfssSpHJSTGvTPHZbaMnYBml
	Wmw7tFvr1d6sW7lsgLa5tUHDjVkj0ZoD4jon4FHoN2j6PIciV4XkiQgv+ktPN8P5
	74OkcvCnuouYEt426gKfCk41NfutKFp6OJ1KKw6OZoZA6uGQj+OlL/HeYzM1bC7D
	BU+AMuvzOTatzoN5YYbCAdfRd7zV5CfsiKaPfNJD+KzRwwWKlpM+jZDUO8gq8RxC
	9L4PjQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fhtrnfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 08:39:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E8dnMT004055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 08:39:49 GMT
Received: from [10.253.75.207] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 00:39:44 -0800
Message-ID: <87423e4e-a766-49b5-8ca8-5a79329a7bfc@quicinc.com>
Date: Tue, 14 Jan 2025 16:39:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: net: qcom,ethqos: Correct fallback
 compatible for qcom,qcs615-ethqos
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250113-schema_qcs615-v3-1-d5bbf0ee8cb7@quicinc.com>
 <d3i5hmkft77xm5jxcpfapnjmodsbmpyeklvcxtrqfvk2fqnonx@ajoc7pguzr36>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <d3i5hmkft77xm5jxcpfapnjmodsbmpyeklvcxtrqfvk2fqnonx@ajoc7pguzr36>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Ed3In4mdJ-1VaekFLBzeMp8wg8oDHvr
X-Proofpoint-ORIG-GUID: 1Ed3In4mdJ-1VaekFLBzeMp8wg8oDHvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=395
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501140071



On 2025-01-14 16:03, Krzysztof Kozlowski wrote:
> On Mon, Jan 13, 2025 at 05:15:39PM +0800, Yijie Yang wrote:
>> The qcs615-ride utilizes the same EMAC as the qcs404, rather than the
>> sm8150.
>> The current fallback could lead to package loss, and the ethernet on
> 
> Packet? Package?

I made an error in word usage, and I will correct it.

> 
>> qcs615-ride was not utilized by anyone.
> 
> I don't get how this part of sentence is connected to previous part. I
> see the "and" but what do you want to say here? Packages with qcs615
> board were lost, therefore the ethernet was not used by anyone? Or
> packets could be lost and this means ethernet cannot be used?
> 

The word 'and' represents two independent facts without implying a 
logical relationship between them. The two facts correspondingly lead to 
the two conclusions in the next sentence.

>> Therefore, it needs to be revised,
>> and there is no need to worry about the ABI impact.
> 
> Again, Oxford comma of joining entirely independent claues. Can you
> filter this via someone / ChatGPT / Google grammar / Outlook grammar?

All the sentences here have been polished by Copilot. I will reorganize 
them for better understanding.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Best Regards,
Yijie


