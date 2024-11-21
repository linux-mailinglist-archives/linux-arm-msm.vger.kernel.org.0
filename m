Return-Path: <linux-arm-msm+bounces-38621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E5A9D482C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF7A4B21496
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4871AA1DC;
	Thu, 21 Nov 2024 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FMOHRkVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD984230986;
	Thu, 21 Nov 2024 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732173795; cv=none; b=jEUX6xKdLuRlcb70l1gfBBxg1lbzwSo6vjwAptUT7TPCbXQAJKrxeKtt/y1cQOGjwGp84sau/bdvLXsLMu9IPWwnAfiqEniBi0ITH+wx1DvzUmkhPw1HGwyj+ifcAo9dW/8UKCrHBNGqYHlOwDp4S8v6DUH8S0JdQfmAI08D0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732173795; c=relaxed/simple;
	bh=pBnaY2Iv9nvpxKeRkxW26VonrHN9dPu2hJtZeXPPPHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oS4YIAC3T+Dqf12yyTQxitWDd6TYKvrRqVvwiIbIqv2vw5f+0+VnG9yabQvXqfpEzmLkPsK3XizOXIYJOZ6O9gZaNbz2l9TiutdEzS6qaLvLGMw/MaMz9o/pwkEZ7IHh3pPz3vz8TzWGPMATrB5kYo1d7Q/2Pmm6ighPEy5CXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FMOHRkVQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKL25jU007912;
	Thu, 21 Nov 2024 07:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgQUtubfOBG5geImrHXZ4Dt4bTICf1nzS3URNUfWFoM=; b=FMOHRkVQFWf81SnA
	lKLlpeg/cBpnSurK2+5Vow0tRB1TKnlIPoEFGm3dGNiJUKGNbOUlAu5/PJBQlM3q
	Qp2TZ1J4w1jiuZYgY/XH+LW7kgyUSwarqIH7q66ul5wwayWVxyhjl75fBGwm2PmY
	X+2m5qndRrk5fHfHMccgcyzqDoClVEGCVfIh0DxYRfsBn8mMrM5KJAGrEG4/fOs9
	8/n8U8Y3A/4kVeSh1lnLo6qcIUc6EpoYkJHY6NZEX7rLXFsbu/N5SOAEP+NESXL5
	i4TlV2MtKvNRadEiP9wydoHSMqPOUIDRyjxmj68FK4uYDIxt0nOEJ0woeNIqYkOc
	WTf6vQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvkk21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:23:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL7N1w6014582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:23:01 GMT
Received: from [10.64.68.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 23:22:49 -0800
Message-ID: <4226d136-034f-4b7f-a82b-e370ef265958@quicinc.com>
Date: Thu, 21 Nov 2024 15:22:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: PCI: qcom: Document the QCS615 PCIe
 Controller
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <quic_shashim@quicinc.com>, <kernel@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_qianyu@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <neil.armstrong@linaro.org>, <andersson@kernel.org>,
        <linux-kernel@vger.kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <kw@linux.com>,
        <lpieralisi@kernel.org>, <bhelgaas@google.com>,
        <linux-phy@lists.infradead.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>,
        Krishna chaitanya chundru
	<quic_krichai@quicinc.com>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_kaushalk@quicinc.com>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-4-quic_ziyuzhan@quicinc.com>
 <173192264707.1449621.6365585789543415603.robh@kernel.org>
Content-Language: en-US
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <173192264707.1449621.6365585789543415603.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YtXgdrAzVmuJomfqdKrzYyl1mIDXDO4y
X-Proofpoint-GUID: YtXgdrAzVmuJomfqdKrzYyl1mIDXDO4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210056

The dependency is missing, I will update in coverletter

On 11/18/2024 5:37 PM, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml: properties:resets: 'anyOf' conditional failed, one must be fixed:
> 	'minItems' is not one of ['maxItems', 'description', 'deprecated']
> 		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
> 	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
> 	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
> 	1 is less than the minimum of 2
> 		hint: Arrays must be described with a combination of minItems/maxItems/items
> 	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
> 	from schema $id:http://devicetree.org/meta-schemas/reset.yaml#
> Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.example.dts:24:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
>     24 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> Seehttps://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241118082619.177201-4-quic_ziyuzhan@quicinc.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in*this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

