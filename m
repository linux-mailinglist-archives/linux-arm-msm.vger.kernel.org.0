Return-Path: <linux-arm-msm+bounces-25407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B4929123
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 07:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 582201F23256
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 05:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A327517722;
	Sat,  6 Jul 2024 05:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CZK3I+0E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683B847A;
	Sat,  6 Jul 2024 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720243366; cv=none; b=a3TVWw/mT7LLDUxiYJMJ/+89f1uwTf1ZMoP0AGap1Kn8GqyZBeYMu3Vb0+49bC6TiXM3FU/37xcycpintPP4quQLYUOctyaDnsZk6Mg5GTBHtM6qMrI/TVI19HfxiYulLSAZKrXaYN9Zo10ExNAs+C6iMSUhOR+3nrkcinHoY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720243366; c=relaxed/simple;
	bh=rmxLVa8uCp6DHXJ0HoO/miegT4CBhHRwl9IrK3u8KqM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Rvo0WHGaPAId/+yH8YDnyX1yytkpnxH4tOlMgizAn0NsA3nOMeLetKGr4nhGT/bKbpfBioMIJMY5GoZFos1UIlViy1qcwc/9grsGa3/64sQz3TNgpXj74GhoRqdj/YdPJkzQdrMwZKGv0ZO5O+XDPWZpiRqjtBlh4uY/olDu0Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CZK3I+0E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4662sLul020013;
	Sat, 6 Jul 2024 05:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Z8c5/BRJkcuDvXowiIkvzSl0gmaQinmIo2MJaNQ7yo=; b=CZK3I+0EGzUevD4O
	CqqtuAKD15xfhdJfivqoekRmZpgP4VaAoTxwHKSBocNKEorYdSn1Cz7kRIPEs68i
	F+ENRmnWewa5FRcqX+VUFj2X4PJ+9n/cKrKg5HMjYmpWL54Eh27tKKDhH/XZ4uJO
	l3SGbkthoo+PsQNBwjrpVu4uwfBAulXVwhZdEeIKpa9fK2pizJU5liFnGZpoMNuc
	a9noA1yaXyPyn1R0jWbVyxKBM7V2m4BepCErowu7vIwwksH1w6eO3SFmUddtZDSH
	4F977RIN5CyQsALwWSNaulf1YLJmSOqBiroIU5nrOcc0M7bPOa52DIzyb/fSXPLy
	9rCEcQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwg4qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Jul 2024 05:22:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4665MWLj003340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 6 Jul 2024 05:22:32 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 5 Jul 2024
 22:22:28 -0700
Message-ID: <8b7a9bcf-6660-47bc-adc7-4e9a26548f29@quicinc.com>
Date: Sat, 6 Jul 2024 13:22:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: arm:
 qcom,coresight-static-replicator: Add property for source filtering
From: Tao Zhang <quic_taozha@quicinc.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jie Gan <quic_jiegan@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Mike Leach <mike.leach@linaro.org>, <coresight@lists.linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Song Chai <quic_songchai@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <devicetree@vger.kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
References: <20240705085152.9063-1-quic_taozha@quicinc.com>
 <20240705085152.9063-2-quic_taozha@quicinc.com>
 <172017590249.2933726.1790899873101654561.robh@kernel.org>
 <5ee373ed-abef-4611-a355-44668a85d0a7@quicinc.com>
Content-Language: en-US
In-Reply-To: <5ee373ed-abef-4611-a355-44668a85d0a7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uHQIVaWhrqKDXw_jWvZWn--wnlvgQALI
X-Proofpoint-ORIG-GUID: uHQIVaWhrqKDXw_jWvZWn--wnlvgQALI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-06_02,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407060038


On 7/5/2024 11:23 PM, Tao Zhang wrote:
>
> On 7/5/2024 6:38 PM, Rob Herring (Arm) wrote:
>> On Fri, 05 Jul 2024 16:51:50 +0800, Tao Zhang wrote:
>>> Add a new property "filter_src" to label the source corresponding
>>> to the output connection for a static replicator. By combining
>>> a funnel and a static replicator in devicetree, a new device that
>>> supports multi-port input and multi-port output is implemented.
>>> In order to match the output port with the input port and
>>> successfully build the trace path, add this new property to
>>> indicate the data source corresponding to this output port.
>>>
>>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>>> ---
>>>   .../arm/arm,coresight-static-replicator.yaml   | 18 
>>> +++++++++++++++++-
>>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: 
>> ^port@[01]$: Missing additionalProperties/unevaluatedProperties 
>> constraint
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: 
>> endpoint: Missing additionalProperties/unevaluatedProperties constraint
>>
>> doc reference errors (make refcheckdocs):
>>
>> See 
>> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240705085152.9063-2-quic_taozha@quicinc.com
>>
>> The base for the series is generally the latest rc1. A different 
>> dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>
> Yes, I didn't see this errors in running 'make dt_binding_check', I 
> will re-run this check
>
> according to your suggestion.
>
>
> Best,
>
> Tao

After upgrading dtschema and installing 'yamllint', I saw the above 
errors in running

'dt_binding_check'. I will fix them and update in the next patch series.


Best,

Tao

>
>>
>> Please check and re-submit after running the above command yourself. 
>> Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your 
>> schema.
>>
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

