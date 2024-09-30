Return-Path: <linux-arm-msm+bounces-32752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0079989D90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1981C20F9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AD9185B48;
	Mon, 30 Sep 2024 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JsZUd5fX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5A183CA9;
	Mon, 30 Sep 2024 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727686957; cv=none; b=JgKTSXhiSEysNMr3mWB9YaWB2MfeWdarb/OvbmADpw/nzjqMe+sUWbI2Chwf7siCXJuntBMJFYq8YonucFk+8KIfKgUGyXLIOGHcZjZJh8WcIIjVfCm+Hsd/U2gYWlU5hi+491y3AJkmAbn7kq0ERuPzyxqc8QWw14gJWeREBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727686957; c=relaxed/simple;
	bh=/A2IpXIL2K41ulfZwfZj/W7YA8EZBkC9G5vpdYy/QCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U82XdTP+XbD62JbGceIvahhcbPXcWOMSUxW5H2x/HTs/gxla67atMXd2PSbG1UhUT747T+QGLYzKgTWRrgf6pXNfi02JLopI07NrokR/kgJmSnun6vrXZ9VjGb8mIeOtMc6JnFb4XObJSkJpOwWFAfN140E0PIbwqRNW/ccQjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JsZUd5fX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TLv5fF031959;
	Mon, 30 Sep 2024 09:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNX5YhowYy+eVjnzuyMs3w2HI0xLolYtOn4aoWW1iOY=; b=JsZUd5fXATgwLzn+
	mTwWUtQS30MjJNZmzDWLxS+C6dwZsGWElRBv7Dc7Fa64f1DcGp3wf1ifxi9rAGMs
	Vs5MNLQ6+LUnQ3rUxyRzB/LmyTqhuxD68RdP/mPjPytFxFosvxy/i+L08ySVPUX8
	W1BIkk822lSuAbU9iuZ4ksRn8RQjb6f/iq7EVLmP43+gKDDtWC9zGriD3VXpew/t
	MqCD4/fm9uFnHtv4zu0VUObPnM0n8AwC8tIBbBla5s0tGqWUUjVVbYZDS600ZRm4
	bPSAFnr+sZIiPzv77WkPaMVYUBup47RagmRy83NfXPMMdzw+/a+HpOYJHP4myqSg
	4rHudg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xaymc4k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:02:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48U9291M017417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:02:09 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 02:02:01 -0700
Message-ID: <6bd73b6e-dde7-4bbf-b367-3479bbedf483@quicinc.com>
Date: Mon, 30 Sep 2024 14:31:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
        <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
        <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
        <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kalyant@quicinc.com>, <quic_jmadiset@quicinc.com>,
        <quic_vpolimer@quicinc.com>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-2-quic_mahap@quicinc.com>
 <ZvVgmFUs2bwfEoWD@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <ZvVgmFUs2bwfEoWD@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YpPzTDr9dkWwX9yJvwLbswVE89-G7XaX
X-Proofpoint-GUID: YpPzTDr9dkWwX9yJvwLbswVE89-G7XaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300065


On 9/26/2024 6:54 PM, Bjorn Andersson wrote:
> On Thu, Sep 26, 2024 at 04:31:33PM +0530, Mahadevan wrote:
>> Document the MDSS hardware found on the Qualcomm SA8775P platform.
>>
>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
>> ---
>>
>> [v2]
>> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
>> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>>    adding proper spacing and indentation in binding example, dropping unused labels,
>>    dropping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> No concerns with the changelog, but please adopt b4 (go/upstream has
> instructions) for sending patches upstream.


Sure, will follow while posting next patch.


>
>> ---
>>   .../display/msm/qcom,sa8775p-mdss.yaml        | 239 ++++++++++++++++++
>>   1 file changed, 239 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> new file mode 100644
>> index 000000000000..e610b66ffa9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> @@ -0,0 +1,239 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. SA87755P Display MDSS
>> +
>> +maintainers:
>> +  - Mahadevan <quic_mahap@quicinc.com>
> Please use Firstname Lastname, if possible


My name has only First name,  can I please go ahead with this.


>
>> +
>> +description:
>> +  SA8775P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
>> +  DPU display controller, DP interfaces and EDP etc.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
> [..]
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    display-subsystem@ae00000 {
>> +        compatible = "qcom,sa8775p-mdss";
>> +        reg = <0 0x0ae00000 0 0x1000>;
> #address-cells and #size-cells are 1 in the example root node, so drop
> the two 0 entries.
>
>> +        reg-names = "mdss";
>> +
>> +        /* same path used twice */
> What do you mean? All three paths below are unique.


Yes all three are paths are unique, its same sm8450-mdss.
Will remove the comment /* same path used twice */.


>
>> +        interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
>> +                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
>> +                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +                        &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +        interconnect-names = "mdp0-mem",
>> +                             "mdp1-mem",
>> +                             "cpu-cfg";
>> +
>> +
> Regards,
> Bjorn


Thanks,
Mahadevan


