Return-Path: <linux-arm-msm+bounces-26404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5BF9336CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1BF6B20E43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 06:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E4217997;
	Wed, 17 Jul 2024 06:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oFCH7Wf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97DD14F6C;
	Wed, 17 Jul 2024 06:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197269; cv=none; b=qrAoAxwNA520o+VmUzzzg8xjDCAdrmOGnoEgqhCrxnBCu09f7YEx6E5wtZzAOvzEfmSoiGfDJpdVu2COeISVUZRJBhdLnW9Q8KBcXRnUU0bpA6ULg2IzA7V7GqRP/B3fxuRvHo6UJMJ08WFDZpGJbDFabraDr6nPOAkfw3Zt6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197269; c=relaxed/simple;
	bh=fp9pWdN7nQ259Pbax33SgaIQltaM0tNJnOcdOMyAuGk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=gmqu2BhatiYEGO8jWJWlzBQuR84m6I+d3Ol6laUZuNxRStufrf5ObWL/0TERPwkLjCLxZY/JfdlJduQV7jWyb4v/1Cu3T2Jz5njvDQ62mx3okxj56LE9CUIFt02SawPax7rv7FoJd2Quuv4Ujp2uoUOhJvQTduZ18xV623bbZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oFCH7Wf5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHfFF3024207;
	Wed, 17 Jul 2024 06:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiwUCxXHB26DbZ2DFDb9MYBu/nLfDOIAzQSLSUM0J8c=; b=oFCH7Wf5HZADgzBZ
	8hE3S+XsOO7/m8Kp3UBtbFq7Vut4TrVFcJyxEflzPemsd7zfv4vKhYZgczxZ3Vvn
	fAi5s9zwbDGPAVFmRCo0EAAq0Gy73SJKy+wQmvInnjoFi6bG0iRbuDEBt/yvm/A2
	1us1M/+1SSx9X6ttsZNZHpol9bQ/kfMnDpKV8V6TxtK8UljhUEvYEBd1XqTzLL6N
	sj4v2JB3YGLJlojcLrUttFZI1th10ldT4+CEXT3IkKlJwZeS85CCllaK/aHiwv+L
	pXEmQNxy7S3nU0+QUUqhERMntaq2i4VVqG3ICqZrAEU9oJuFyClA/S2+WmQw32U+
	fpedpw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfu1a1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 06:20:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46H6Knjn002662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 06:20:49 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 23:20:42 -0700
Message-ID: <f773f3e2-dace-427e-b9e3-e211d9cf6574@quicinc.com>
Date: Wed, 17 Jul 2024 14:20:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings
 for QCS9100
To: Rob Herring <robh@kernel.org>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>
 <20240710162745.GA3212156-robh@kernel.org>
 <3b8684f0-c89d-1a76-6bc5-93ced59dc51c@quicinc.com>
 <51302de0-5e4c-4e2a-85a0-e22549baa13c@quicinc.com>
 <20240711200354.GA2482879-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20240711200354.GA2482879-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cKBbtlWO0T6JKU0hJqEyLEFxBrrss12I
X-Proofpoint-ORIG-GUID: cKBbtlWO0T6JKU0hJqEyLEFxBrrss12I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170046



On 7/12/2024 4:03 AM, Rob Herring wrote:
> On Thu, Jul 11, 2024 at 06:05:57PM +0800, Aiqun Yu (Maria) wrote:
>>
>>
>> On 7/11/2024 12:45 AM, Trilok Soni wrote:
>>> On 7/10/2024 9:27 AM, Rob Herring wrote:
>>>> On Tue, Jul 09, 2024 at 08:46:19PM +0800, Tengfei Fan wrote:
>>>>> Document the compatible string for USB phy found in Qualcomm QCS9100
>>>>> SoC.
>>>>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>>>>> platform use non-SCMI resource. In the future, the SA8775p platform will
>>>>> move to use SCMI resources and it will have new sa8775p-related device
>>>>> tree. Consequently, introduce "qcom,qcs9100-usb-hs-phy" to describe
>>>>> non-SCMI based USB phy.
>>>>>
>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>> ---
>>>>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>>>>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>>>>> While the QCS9100 platform is still in the early design stage, the
>>>>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>>>>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>>>>
>>>>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>>>>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>>>>> The QCS9100 device tree patches will be pushed after all the device tree
>>>>> bindings and device driver patches are reviewed.
>>>>
>>>> I'm not convinced this is not just pointless churn. Aren't we going to 
>>>> end up with 2 compatible strings for everything? SCMI should just change 
>>>> the providers, but otherwise the consumers are the same. I suppose if 
>>>> clocks are abstracted into power-domains (an abuse IMO) then the 
>>>> bindings change.
>>>>
>>>> Why do we need to support both SCMI and not-SCMI for the same chip?
>>>
>>> IOT SKU of this SOC is using the non-SCMI solution and Auto SKU
>>> of this SOC is using the SCMI based solution due to additional
>>> safety requirements. 
>>
>> More add-on information, IOT SKU which have qcs9100 soc mounted will
>> have firmware releases which support non-scmi solution.
>> And AUTO SKU which mounted with SA8775p will have different firmware
>> releases which support SCMI solution.
> 
> Yes, I understand the difference. My question is why should upstream 
> support that? Normally, I wouldn't notice or care, but the churn of 
> renaming everything makes me notice. Why do the maintainers need to 
> review all these extra changes because QCom couldn't figure out their 
> plans?

Upstreaming prematurely, prior to finalizing all solutions, will have a
significant pain point like this. I recognize the extra workload
involved in reviewing these changes, but our aim is to minimize future
maintenance efforts. SA8775p with non-SCMI resource solutions is going
to be deprecated.

The SA8775p is currently undergoing active development, with Qualcomm
firmware updates altering essential resources such as clocks,
regulators, etc. designs, to align with safety requirements.
> 
> So after you duplicate all the compatible strings, what's next? Changing 
> all the SA8775p bindings which is an ABI break? Presumably, some 

Yes, ABI is going to break/evolve as sa8775p moves to scmi based
infrastructure. Auto product line intends to subsequently submit
corresponding changes for sa8775p while derived part qcs9100 support,
continue evolve in conventional manner.
> bindings may not change at all? In that case, you don't need any rename.> I have no visibility into what's coming next, so please educate me.


For instance, in this binding, ‘clk’, ‘resets’, and other elements are
mandatory if ‘compatible’ includes qcs9100. However, after the SCMI
resource solution is checked in, for ‘compatible’ containing sa8775p, it
may only require ‘power-domains’ and ‘power-domain-names’.”

A reference to one SCMI resource solution RFC, which will definitely
require some changes, can be found here[1]:
[1]
https://lore.kernel.org/lkml/1709657858-8563-4-git-send-email-quic_sriramd@quicinc.com/

The proposed solution(with compatible differentiation) will exhibit the
following differences in addition to the current RFC.[1] :

1. Both have SCMI and non-SCMI support in the same driver.
The binding documentation will specify that ‘qcs9100’ compatibility
requires properties such as ‘clk’, ‘reset’, ‘vdd’, etc., while ‘SA8775p’
compatibility necessitates properties like ‘power-domains’,
‘power-domain-names’, etc., as mandatory.

2. having a /delete-property/ becomes unnecessary.
The proposed solution will introduce a completely new SA8775p.dtsi from
the outset. The current qcs9100.dtsi will not be included into this new
SA8775p.dtsi.

3. Driver C files will not eliminate calls to ‘clk’, ‘vreg’, etc.
Instead, they will differentiate with a ‘qcs9100’ compatibility to
include operation with legacy "clk", "vreg" calls, while ‘sa8775p’ will
incorporate operations calls for ‘power-domains’, and so on.

4. "hsphy,fw-managed" property to indicate SCMI resources is not necessary.
Current patch have been using a DT property " hsphy,fw-managed;" to
figure if it is SCMI based vs non-scmi. While it is going to be
suggested to be designed to use "sa8775p" compatible.

Further more:
LinaroConnect presentation on qcom SCMI approach here[2]:
[2]https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte

> 
> The minimal amount of changes here is you are stuck with the existing 
> identifiers for the non-SCMI SKU. Then you can add a "new SoC" for the 
> SCMI SKU. You might not like the names now, but you picked them and are 
> kind of stuck with them.

SA8775P is already announced Auto SOC for our OEMs. We can't ask for
creating new Auto SKU to show the solution w/ SCMI like "SA8775P<XYZ>".

Since the current code of SA8775P is matching w/ what is required for
the purpose of QCS9100 s/w architecture the clear rename was proposed.
It will also look odd to IOT customers to see their SOC DT file starting
w/ the SA8775P.

For the current Qualcomm device trees in upstream, we still use ‘soc’
naming in the base soc device tree, which is consistent with our current
hardware SOC naming convention. The basic <soc_name>.dtsi is, by
default, aligned with the current market name of the SOC.

Welcome comments and suggestions on the information we have proposed above.
> 
> Rob

-- 
Thx and BRs,
Aiqun(Maria) Yu

