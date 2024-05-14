Return-Path: <linux-arm-msm+bounces-19813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8C8C4B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 05:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469311C2102F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 03:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9058B653;
	Tue, 14 May 2024 03:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q53s3NS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9587B645;
	Tue, 14 May 2024 03:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715656499; cv=none; b=cpLcGRayKy/abjvmHYUvTFFS6zJO1lVuanfIHWUvNfdxj6a4OraEuf4KzqnG1KL7vR5issX8F5/+A1xy7EWyxiArqPHmrpJru6X6OPRBwr/Q3f2gueMsECMXG0OkGvevktzycl7QZxIA1tAcEsiYELTProxmW9xKhscoWGhq4xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715656499; c=relaxed/simple;
	bh=QbqVBfQNoYjDk/o0VprLKiXeXk6JhqHR8BTYi43LpLg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=n1cCKie1pXfXzHyHX1oBYc2QMjMxKOwoGMoTESqz9xuTMGSVtbHoqHJCRDD/KEM0H1ZnyKO+Zy4fPyVP9E12nY1IXfVSvq4EexYMuq01o7YUcxgXxnl9q5LlcimTvykg1qgM5gOrOO2TeFZJdkGzSKi9ycw5rcHMWgYA1bO2NNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q53s3NS4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8svH024231;
	Tue, 14 May 2024 03:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:from:subject:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lhiZUR02R0SWrwr3dvTvUIP0NvYrnDtZcWB6iVMfBn8=; b=Q5
	3s3NS4nUMPqvw8fAoAgVuKY10zLTK7o0hLuUhrPBxRytOTzM2KlI9qk2gVLfWedJ
	sHiFBG/AwQSkOOz6LAyggbLahQzUd42M/eJI19/3RYzUZTud+f4Y+oP0+6sE84Tu
	biUXRFYRwuIlCgaHlT+f0pZwnaDv8/XE5Wb/Ijhh5NrngK4FgoN0OTKqCy6x/+Ld
	Lf1m+PsM5ipstn8/rEkg5LSZwzNdDLsfGD6E12wYkCKzicpiks2ZkKXqSHFEDwqv
	S9rHXxJ9vSdcoIiXzgoW/4yLE7gBy2b/CWECpl0UryOtC9+mbzKFVJ5iOD5D3/+s
	ZZaB2lsao0KQRROmw7Eg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1ymq579v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 03:14:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E3EcAW006727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 03:14:38 GMT
Received: from [10.216.57.43] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 20:14:27 -0700
Message-ID: <3f6faea5-575d-46db-3a7b-ed6dbde060ea@quicinc.com>
Date: Tue, 14 May 2024 08:44:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Amrit Anand <quic_amrianan@quicinc.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple
 DT
To: Caleb Connolly <caleb.connolly@linaro.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        <peter.griffin@linaro.org>, <linux-riscv@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, Simon Glass <sjg@chromium.org>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
 <a5eac9d5-1e88-4d7a-b8e8-677f6d116782@linaro.org>
Content-Language: en-US
In-Reply-To: <a5eac9d5-1e88-4d7a-b8e8-677f6d116782@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -yV4KEYXNc3XSkcHYWdAkYL7u1Bw6tM-
X-Proofpoint-ORIG-GUID: -yV4KEYXNc3XSkcHYWdAkYL7u1Bw6tM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405140023


On 3/14/2024 8:05 PM, Caleb Connolly wrote:
> On 14/03/2024 14:20, Caleb Connolly wrote:
>> Hi Amrit,
>>
>> On 14/03/2024 12:11, Amrit Anand wrote:
>>> Qualcomm produces a lot of "unique" boards with slight differences in
>>> SoC's and board's configuration. For eg, there can be SM8150v1 on MTPv1,
>>> SM8150v1 on MTPv2, SM8150v2 on MTPv2, SM8150v2 on MTPv2 with a different
>>> PMIC, SM8150v2 with no modem support and so on. For instance, suppose we
>>> have 3 SoC, each with 4 boards supported, along with 2 PMIC support for
>>> each case which would lead to total of 24 DTB files. Along with these
>>> configurations, OEMs may also add certain additional board variants. Thus
>>> a mechanism is required to pick the correct DTB for the corresponding board.
>>>
>>> Introduce mechanism to select required DTB using newly introduced device
>>> tree properties "board-id" and "board-id-type". "board-id" will contain
>>> the list of values of "qcom,soc-id", "qcom,board-id", "qcom,pmic-id" or
>>> "qcom,oem-id". "board-id-types" contains the type of parameter which is
>>> entered. It can be either "qcom,soc-id", "qcom,board-id", "qcom,pmic-id"
>>> or "qcom,oem-id".
>> Thanks for working on this, it's nice to finally see this logic
>> documented in the kernel.
>>> Qualcomm based bootloader will use these properties to pick the best
>>> matched DTB to boot the device with.
>>>
>>> Signed-off-by: Amrit Anand<quic_amrianan@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++++++++
>>>   1 file changed, 90 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 7f80f48..dc66ae9 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1100,6 +1100,76 @@ properties:
>>>         kernel
>>>         The property is deprecated.
>>>   
>>> +  board-id:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>> +    minItems: 2
>>> +    description: |
>>> +      Qualcomm specific bootloader uses multiple different identifiers
>>> +      (qcom,soc-id, qcom,board-id, qcom,pmic-id, qcom,oem-id) to select
>>> +      single Devicetree among list of Devicetrees. For different identifiers,
>>> +      the selection can be done either based on exact match (where the
>>> +      identifiers information coming from firmware should exactly match
>>> +      the ones described in devicetree) or best match (firmware provided
>>> +      identifier information closely matches with the one of the Devicetree).
>>> +      Below table describes matching criteria for each identifier::
>>> +      |----------------------------------------------------------------------|
>>> +      |  DT property  |  Individual fields   |   Exact  |  Best  |  Default  |
>>> +      |----------------------------------------------------------------------|
>>> +      | qcom,soc-id   |                                                      |
>>> +      |               |  Chipset Id          |     Y    |    N   |     -     |
>>> +      |               |  SoC Revision        |     N    |    Y   |     -     |
>>> +      | qcom,board-id |                                                      |
>>> +      |               |  Board Id            |     Y    |    N   |     -     |
>>> +      |               |  Board Major         |     N    |    Y   |     -     |
>>> +      |               |  Board Minor         |     N    |    Y   |     -     |
>>> +      |               |  Subtype             |     Y    |    N   |     0     |
>>> +      |               |  DDRtype             |     Y    |    N   |     0     |
>>> +      |               |  BootDevice Type     |     Y    |    N   |     0     |
>>> +      | qcom,pmic-id  |                                                      |
>>> +      |               |  Slave Id            |     Y    |    N   |     0     |
>>> +      |               |  PMIC Id             |     Y    |    N   |     0     |
>>> +      |               |  PMIC Major          |     N    |    Y   |     0     |
>>> +      |               |  PMIC Minor          |     N    |    Y   |     0     |
>>> +      | qcom,oem-id   |                                                      |
>>> +      |               |  OEM Id              |     Y    |    N   |     0     |
>>> +      |----------------------------------------------------------------------|
>>> +      For best match, identifiers are matched based on following priority order::
>>> +      SoC Revision > Board Major > Board Minor > PMIC Major > PMIC Minor
>>> +
>>> +  board-id-types:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description:
>>> +       Each field and helper macros are defined at include/dt-bindings/arm/qcom,ids.
>>> +    minItems: 2
>>> +    items:
>>> +       oneOf:
>>> +         - const: qcom,soc-id
>>> +           description:
>>> +              Matches Qualcomm Technologies, Inc. boards with the specified SoC.
>>> +              2 integers are needed to describe a soc-id. The first integer is the
>>> +              SoC ID and the second integer is the SoC revision.
>>> +              qcom,soc-id = <soc-id  soc-revision>
>>> +         - const: qcom,board-id
>>> +           description: |
>>> +              Matches Qualcomm Technologies, Inc. boards with the specified board.
>>> +              2 integers are needed to describe a board-id. The first integer is the
>>> +              board ID. The second integer is the board-subtype.
>>> +              qcom,board-id = <board-id  board-subtype>
> This is a recursive definition. You partially described the individual
> fields above, you should do that here.

The information about these fields are documented in header 
include/dt-bindings/arm/qcom,ids.h
sent in patch 1.

> What is DDR type? What information is encoded that doesn't make sense to
> describe elsewhere in DT?
>
> Same for "bootdevice type", why would you pick a different DT based on
> whether the bootloader was loaded from UFS or NAND? Why does this
> information belong in DT?

We can have multiple DT for different DDR types and boot device types. 
In order to distinguish different DT when
all other parameters are same, we are using DDR type, boot device type 
as distinguishable parameters.

>>> +         - const: qcom,pmic-id
>>> +           description: |
>>> +              Qualcomm boards can be attached to multiple PMICs where slave-id (SID)
>>> +              indicates the address of the bus on which the PMIC is attached. It can be
>>> +              any number. The model for a PMIC indicates the PMIC name attached to bus
>>> +              described by SID along with  major and minor version. 2 integers are needed
>>> +              to describe qcom,pmic-id. The first integer is the slave-id and the second integer
>>> +              is the pmic model.
>>> +              qcom,pmic-id = <pmic-sid pmic-model>
> Same questions here, why don't you just walk the DT and read the
> compatible properties of PMIC nodes?
>>> +         - const: qcom,oem-id
>>> +           description: |
>>> +              Matches Qualcomm Technologies, Inc. boards with the specified OEM ID.
>>> +              1 integer is needed to describe the oem-id.
>>> +              qcom,oem-id = <oem-id>
>>> +
>>>   allOf:
>>>     # Explicit allow-list for older SoCs. The legacy properties are not allowed
>>>     # on newer SoCs.
>>> @@ -1167,4 +1237,24 @@ allOf:
>>>   
>>>   additionalProperties: true
>>>   
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/arm/qcom,ids.h>
>>> +    / {
>>> +         model = "Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform";
>>> +         compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
>>> +
>>> +         #board-id-cells = <2>;
>>> +         board-id = <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(1)>,
>>> +                    <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(2)>,
>>> +                    <QCOM_BOARD_ID(IDP, 1, 0) QCOM_BOARD_SUBTYPE(UFS, ANY, 1)>;
>>> +         board-id-types = "qcom,soc-id",
>>> +                          "qcom,soc-id",
>>> +                          "qcom,board-id";
>> Forgive me if this is a particularly cynical view, but this seems
>> incredibly blatant, the "qcom,board-id" property is deprecated for
>> various good reasons, just using a key/value map where "qcom,board-id"
>> is a key doesn't change that. There are two main issues I have with the
>> proposal here:
>>
>> 1. This breaks backwards compatibility, millions of production devices
>> with bootloaders that will never receive another update might be
>> compatible with the downstream "qcom,board-id" property, but they won't
>> work with this.
>> 2. A top level board-id property that isn't namespaced implies that it
>> isn't vendor specific, but the proposed implementation doesn't even
>> pretend to be vendor agnostic.

ok, will try to redefine it. Meantime, since Elliot has some suggestions 
from his EOSS conference presentation,
will also co-work with him towards making another attempt at vendor 
agnostic approach as well.


>>
>> U-Boot also has some ideas around this issue, there you can pass in
>> multiple DTBs and provide some board specific "best match" function.
>> I think there's definitely some value in exposing this information, but
>> there's no good reason to define the same data as `qcom,board-id` while
>> breaking production bootloaders.
>>> +
>>> +         #address-cells = <2>;
>>> +         #size-cells = <2>;
>>> +    };
>>> +
>>> +
>>>   ...

