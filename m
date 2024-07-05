Return-Path: <linux-arm-msm+bounces-25389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D222928B97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 17:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34E7DB25F17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 15:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B043F16B747;
	Fri,  5 Jul 2024 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="maj+Npc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7A14A62E;
	Fri,  5 Jul 2024 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720193004; cv=none; b=gDtJ0Y4zqb744WLNAt+Txu3bcLyy774iC4LrYeY48EryUUak0qqUEIfcq3LIzBKpj0Ugm51gy1XzCLYmF9ch1ZkPpenG/q6Qg8AqiWyvC+GBZ+ZRciyhcv3mXzishzj4s3tem+O1VI2+zePXK012z9sZ4ZnB7eIiFJ8EbXK8ZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720193004; c=relaxed/simple;
	bh=vMGT4AZjWRF1Ju5kXvo191g8lbBZ1bFe0vECnmqaQAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X9KqaOWo4u8GU2QjDLHMXOb2OGH+bAwq6cmV7ATtD125dSn0/UxjAPoHBZfqCuNjwU9IeUws1cf55Iqezri2yBUcB2Ec4D7jBQe+mbgd5KvBWk8NZyjx8y7Bw0KCYJbD6zjK75a2pmHTpXTY4eiLVr9wqRK2veRxLt2jQCLbQ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=maj+Npc0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4659bVWH012943;
	Fri, 5 Jul 2024 15:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxEIK2I8gW9X589r/yuYkg4MIfn7+vy7CW4LLUIvbrs=; b=maj+Npc0yFZMyePz
	oHfRR7ctvMKSpzb1as5ATTcFSuCxqlWM6hvdbrgFMN4uiXHDXrrLR8g29TCZtc3u
	5XpXaX6RJANz3PB9jbauSrJUTG/AKypTiZrZ8/6BHTldfodCHLeXWwnhnFpmApLi
	Bnq+R74wNPyHySZFkxy9SPNUwu58DTXYATTXGuwP7fviiTLZVwqszjF4B5UmymVO
	TFMeO0BY02URHPNhzn5U6NDk4bLAxd3zrS88J9AOAlo3nLyqMc2mnajWKLggb6Sj
	hsZLY3witvaficWmotawaaZgn6YyftYSuFKtyA54c5sa2EjyAVGBj9p3AVgtjR9N
	KpaobQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404yr9eyhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 15:23:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465FN8XW013861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 15:23:08 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 5 Jul 2024
 08:23:03 -0700
Message-ID: <5ee373ed-abef-4611-a355-44668a85d0a7@quicinc.com>
Date: Fri, 5 Jul 2024 23:23:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jie Gan <quic_jiegan@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Mike Leach <mike.leach@linaro.org>, <coresight@lists.linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        James Clark <james.clark@arm.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Song Chai <quic_songchai@quicinc.com>, Leo Yan
	<leo.yan@linaro.org>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, <devicetree@vger.kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-2-quic_taozha@quicinc.com>
 <172017590249.2933726.1790899873101654561.robh@kernel.org>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <172017590249.2933726.1790899873101654561.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4IqDtG7AUMEyBqwuX_WO3utuJKlT_XC2
X-Proofpoint-ORIG-GUID: 4IqDtG7AUMEyBqwuX_WO3utuJKlT_XC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050111


On 7/5/2024 6:38 PM, Rob Herring (Arm) wrote:
> On Fri, 05 Jul 2024 16:51:50 +0800, Tao Zhang wrote:
>> Add a new property "filter_src" to label the source corresponding
>> to the output connection for a static replicator. By combining
>> a funnel and a static replicator in devicetree, a new device that
>> supports multi-port input and multi-port output is implemented.
>> In order to match the output port with the input port and
>> successfully build the trace path, add this new property to
>> indicate the data source corresponding to this output port.
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> ---
>>   .../arm/arm,coresight-static-replicator.yaml   | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: ^port@[01]$: Missing additionalProperties/unevaluatedProperties constraint
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: endpoint: Missing additionalProperties/unevaluatedProperties constraint
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240705085152.9063-2-quic_taozha@quicinc.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade

Yes, I didn't see this errors in running 'make dt_binding_check', I will 
re-run this check

according to your suggestion.


Best,

Tao

>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

