Return-Path: <linux-arm-msm+bounces-2067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BCD7F9EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5975EB20F84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A966C1A711;
	Mon, 27 Nov 2023 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jWS0lV+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5973101;
	Mon, 27 Nov 2023 03:49:26 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARB3G7R023323;
	Mon, 27 Nov 2023 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oUuLdVyesXk1FBSpoe8O/kpXBhAsMocetEcxPvq3ts4=;
 b=jWS0lV+zkBQBf+bXkaKipIaaycwYTucVNASnd0mYpw3k1Vo6F+7GLEA82Xbj2HnDRhmx
 mQshqioI1OoYMBjvriowTAbA4v9y/3RrOnxF2C3B4NbOflKViejGz+m+jsEVcqNatCRw
 28bYTVnymgWGJhZcZm4xRIjhgELYzjbLiACI108MIPiZ+9ciLTadjhiIX2nsUcEu2Fs4
 NfJ8rUWqEeFSBlCNFFWuzUU0qTvWQjxM82WqZ/bq1UXs233Cp+v/nfwqH5Qlp3qZMvEs
 TnrbiK4Kue8hC6J8KxQXBy4xjPJXTxzT8GlxITUjwbsJu0ey1D5mgi020Gan40RMI4wK jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk9adm17p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 11:49:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARBnEat016991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 11:49:14 GMT
Received: from [10.217.219.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 03:49:08 -0800
Message-ID: <1341f3d2-f20f-af2b-fd6e-bfe63a32630f@quicinc.com>
Date: Mon, 27 Nov 2023 17:19:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_vpernami@quicinc.com>,
        <quic_parass@quicinc.com>
References: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com>
 <20231107-refclk_always_on-v2-1-de23962fc4b3@quicinc.com>
 <CAA8EJpqvCJsft3Y-m2ZYORBg=6P7EhT-PsCSkuQ4xaxuf3KOwA@mail.gmail.com>
 <20231108-surgical-yelling-7314b68c0289@spud>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20231108-surgical-yelling-7314b68c0289@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oB4cY0b_PFjbrYAkkiRiYVDtEAB4y0-X
X-Proofpoint-GUID: oB4cY0b_PFjbrYAkkiRiYVDtEAB4y0-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_09,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270080


On 11/8/2023 9:22 PM, Conor Dooley wrote:
> On Tue, Nov 07, 2023 at 03:01:47PM +0200, Dmitry Baryshkov wrote:
>> On Tue, 7 Nov 2023 at 14:26, Krishna chaitanya chundru
>> <quic_krichai@quicinc.com> wrote:
>>> Document qcom,refclk-always-on property which is needed in some platforms
>>> to supply refclk even in PCIe low power states.
>>>
>>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> index 2c3d6553a7ba..263291447a5b 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> @@ -93,6 +93,13 @@ properties:
>>>     "#phy-cells":
>>>       const: 0
>>>
>>> +  qcom,refclk-always-on:
>>> +    type: boolean
>>> +    description: If there is some issues in platform with clkreq signal
>> nit: there are some
>>
>> However this still doesn't describe what kind of issues with clkreq
>> you observe. I mean, clkreq is just a GPIO pin.
>>
>>> +      propagation to the host and due to that host will not send refclk, which
>>> +      results in linkdown in L1.2 or L1.1 exit initiated by EP. This property
>>> +      if set keeps refclk always on even in Low power states (optional).
> Dimitry's issues with the property aside, putting "(optional)" in the
> description is meaningless - qcom,refclk-always-on isn't listed in the
> required properties section, so therefore has to be optional.
>
> Cheers,
> Conor.

I removed the optional flag and updated the description.

- Krishna chaitanya.

>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>>
>>> --
>>> 2.42.0
>>>
>>>
>>
>> -- 
>> With best wishes
>> Dmitry

