Return-Path: <linux-arm-msm+bounces-25173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC1D92638C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848C61F233D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90D317BB1D;
	Wed,  3 Jul 2024 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dov1aW0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256A17B518;
	Wed,  3 Jul 2024 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017430; cv=none; b=YRqhev9yZZKnDFyd8I6CiboAPQwJftTqXpCHRejV2bU+nMY72H5J+BB/U00zH5oPkXvZBYeeTx1i72bzjnXZLhIK5/5i6bWoPQAiXyBt/PH1RWjKYkO1CgkkKRtr0HxD4JBZmUx6kFBi1UZPsXL7f6TCrJsEfB77G8+HsprWkd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017430; c=relaxed/simple;
	bh=2HKsoTPO70jWY8GNUtboK7NINwmpeSOEj8p0y/gUHZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GHCXOUw5L33qUECrL2gb6pVB4q+qnJydKDUYQqv8QwuwRwJUqZ4F4+3QWlNLyOjONna24P199gYOcN4vyvE1T9T7AOQ5YZlvj0HYt/XZOIKTSzrSYTvuees0n3d5ZrBwUn44eG3UPHO7JBmhIwj9p0XMisrdc46oMD9AtF+As9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dov1aW0h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463BHewl028772;
	Wed, 3 Jul 2024 14:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrGsbPro8nNIIllkEn91AAHo9TfT4jh0MI6fm3MOhQI=; b=Dov1aW0h4w5PeN4l
	K8QNMaFITdtbldqYe1TzptznRTb/l6xkkMTzDYTHQb7f+C+EQD87eK7CYbZ1t8jp
	LrydP3Pg++81pmAFfwcjX72ED2UZ5UBBjvKrQVFdJjzWDBvHiczhmdYZLf8/4DXi
	1ZMWPolpsS3K1Kbjra7mgip86HUIT2rC1Yd+0Qv8wnRKwzLeowSjtIE3Qx6+aoVl
	WsiXwgfBitx0Win+cWq9d4Xggwx/1aglPfh9GaygAEf4RLK8fgbMqtER1JvZ1TLw
	FcKxAQKypblmfQdkNWbqqTbAzM1QyE4A/HV+keDjRU19iyK4BM6eMBwME1ta+GR0
	YZhM2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kctka3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 14:36:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463Eafuo003014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 14:36:41 GMT
Received: from [10.50.18.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 07:36:31 -0700
Message-ID: <f00442b3-9e49-4f78-b09c-52fb72e8322c@quicinc.com>
Date: Wed, 3 Jul 2024 20:06:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Rob Herring (Arm)"
	<robh@kernel.org>
CC: <catalin.marinas@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <krzk+dt@kernel.org>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <nfraprado@collabora.com>,
        <mturquette@baylibre.com>, <linux-kernel@vger.kernel.org>,
        <dmitry.baryshkov@linaro.org>, <netdev@vger.kernel.org>,
        <konrad.dybcio@linaro.org>, <m.szyprowski@samsung.com>,
        <arnd@arndb.de>, <richardcochran@gmail.com>, <will@kernel.org>,
        <sboyd@kernel.org>, <andersson@kernel.org>, <p.zabel@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
 <171941612020.3280624.794530163562164163.robh@kernel.org>
 <5ccbfde6-f26a-4796-abac-e8d6a18c74e7@quicinc.com>
 <f0f08f0d-3bc6-4649-ad31-b46f0748c6ef@kernel.org>
Content-Language: en-US
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <f0f08f0d-3bc6-4649-ad31-b46f0748c6ef@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AlDgz2VtBQjYPE6TC5dNIOmTCA-TKeM4
X-Proofpoint-ORIG-GUID: AlDgz2VtBQjYPE6TC5dNIOmTCA-TKeM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030107



On 7/2/2024 6:44 PM, Krzysztof Kozlowski wrote:
> On 02/07/2024 14:13, Devi Priya wrote:
>>
>>
>> On 6/26/2024 9:05 PM, Rob Herring (Arm) wrote:
>>>
>>> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
>>>> Add NSSCC clock and reset definitions for ipq9574.
>>>>
>>>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    Changes in V5:
>>>> 	- Dropped interconnects and added interconnect-cells to NSS
>>>> 	  clock provider so that it can be  used as icc provider.
>>>>
>>>>    .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>>>>    .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>>>>    .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>>>>    3 files changed, 360 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>>>    create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>>>    create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>> make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dtb] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
>>> make: *** [Makefile:240: __sub-make] Error 2
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240626143302.810632-5-quic_devipriy@quicinc.com
>>>
>>> The base for the series is generally the latest rc1. A different dependency
>>> should be noted in *this* patch.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit after running the above command yourself. Note
>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>> your schema. However, it must be unset to test all examples with your schema.
>>> Hi Rob,
>>
>> We tried running dt_binding_check on linux-next and we do not face any
>> sort of errors.
>>
>> However in case of v6.10-rc1, patch[1] failed to apply as the dependent
>> patch[2] is not available on rc1.
>>
>> [1]
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240626143302.810632-3-quic_devipriy@quicinc.com/
>>
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240531&id=475beea0b9f631656b5cc39429a39696876af613
>>
>> Patch [2] does not hold any functional dependency on this series but has
>> a patch rebase dependency.
>>
>> The Bot has went ahead and tried running the dt_binding_check on patch
>> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240626143302.810632-5-quic_devipriy@quicinc.com/
>> which is dependent on patch [1] and hence the issue was reported.
>>
>> Is this the expected behaviour?
> 
> If you expect your patch not to be ignored after such feedback, explain
> briefly missing dependency in changelog. I think Rob told it many times
> already.
> 
> Otherwise you will get this message *every time* and maintainers might
> ignore your patch, due to unresolved reports from automation.

Hi Krzysztof,

We posted our patches based on linux-next and the bot was trying to run
the dt_binding_checks on rc1 wherein patch [1] failed to apply as
patch [2] was missing on rc1 but was available on linux-next. The patch
application failure on rc1 was the reason behind the binding error and 
there were no dependencies on linux-next.

Thanks & Regards,
Devi Priya
> 
> Best regards,
> Krzysztof
> 

