Return-Path: <linux-arm-msm+bounces-49483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D9A45CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58F201881A18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01A718FC7B;
	Wed, 26 Feb 2025 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KmORgz1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470BE258CD9;
	Wed, 26 Feb 2025 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568638; cv=none; b=GLi11anXEfFQW0TAKyCuniJKt/HkRTwvrxitj4vu5LB7PbmHxEfmn4lGkMX0gN3gVu4kj2O4wzH7C6vk7SiCRThOugParnYyfqE5QkpO4B7Q0sZz5/kclbV1QQTWKCL3aF7tWEiXAclFPGxhiw6hAWqoHJu0gbrwGcAU65g+w4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568638; c=relaxed/simple;
	bh=7zKqr91Zvq8RyPlC0fiIML3PACxg0cY2NUHSLWJSKDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Le//IHoVa5edmiBxHe460xq9Zh+9U8/IPLlSSFqSU2DLVxdF1u/UAFHni/BszKjZHhZHG8wR6W+fTYQuYg1OBvio1RZIb3IqVgTLF2B2VnbONoBotaWIgmcOR1t8usCw4TaC+b24mHuv8dd5wWQp0Xb660aIj+8aLnio2OaB/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KmORgz1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9eBu1000916;
	Wed, 26 Feb 2025 11:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFLgsDbkBekPrfEZSEkgS2B4pQUnwvrYLl+RPjmZVjs=; b=KmORgz1jXuYJ1KXk
	TONlK1yPvswIqqsyPlBdIJm1hr5xXQDgKvJ+5qIWyFVgLAG/3Y4WbZKkZH2MDKTV
	soNrfkfLYk1V+0njsDPkRjAghSD/nX2te7l1QTiUxkPMTOrjJ8Kq4SJOR+WkI21g
	ysf4BcKYBOsNMAzoSIGGnGW7QMUC0/LMNC1paYVUUzMrSuu9hiXJnrbKpcFYRBJQ
	XEgJB0RqmjIxkPsPdoPKcWF3JQEaQjCaBGjdKKtSeyrbYXkKB/iOtetnEqxAcG2c
	66LfrF9wJk2CbuP8gU3zs/v3KXdJ/SaWmvzRKY/m9VrJpc94Qjt1Pw9NkOkQb+bg
	/eaM/w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu99r64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QBH4ij006951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:04 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 03:16:58 -0800
Message-ID: <913b8fd3-ffc2-45d9-a8bc-e52a05b85c81@quicinc.com>
Date: Wed, 26 Feb 2025 19:16:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-1-8afc6584afc5@quicinc.com>
 <d1c945bd-a738-4f01-8b93-c2a03b190c34@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <d1c945bd-a738-4f01-8b93-c2a03b190c34@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iDBqUvS80_ldkndGANAj87Vmnc2agPGD
X-Proofpoint-ORIG-GUID: iDBqUvS80_ldkndGANAj87Vmnc2agPGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260089



On 2/26/2025 7:09 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 12:05, Yuanfang Zhang wrote:
>> +
>> +  compatible:
>> +    items:
>> +      - const: qcom,coresight-tnoc
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
>> +    description:
>> +      Physical address space of the device.
> Not much improved - still items are not listed. Which binding did you
> choose as an example as I asked to? (so I can fix it)
> 
qcom,coresight-tpda.yaml

> Best regards,
> Krzysztof


