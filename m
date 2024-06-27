Return-Path: <linux-arm-msm+bounces-24474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C991A84A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C31EE2840D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0739194AF3;
	Thu, 27 Jun 2024 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ftO65CXM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680031946B8;
	Thu, 27 Jun 2024 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719496127; cv=none; b=njEvYTWa+gDmfWWcIFWnn5oQwAMW7QW7UrP7FLt+SYYT8X3RNjU07rSZdE4nTSSCTlcgLiJdBOYUHnMQX6sdaQ6T0va1mH0DuTXGXRlev267EpCxrMxOZPa32XBZGvuQwsXr75e8C6qJZUH8Jt0TeM+nIe99kbXQ4rEPYH+pqWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719496127; c=relaxed/simple;
	bh=cocmvvpYzS373Zson0OV7k7L9zx2ghMdncO1Wj0A5Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MmNiSP1/HovQ524O6Rx6MlVHUm6rvKbnzPoPPRc+sADOS70IR5tFC7CcLXmCadsDVwyHtaOlIAGJ4c2MlWOxhuZ+OoZTtVDIx/KepOzVqdCiTghheGgbIzQl4QV5zRvAPkcs0eTMf3zJfHDwNgG2SbiPqRTtnlXe4kWFIdsUL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ftO65CXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RD6FXK027216;
	Thu, 27 Jun 2024 13:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sunZxUyt487LjiCTkHh5aPa/ti1QKjKiGhk414XqTM=; b=ftO65CXM7pNHa55e
	bb1t1xjhRJg/mjuSUUvgIPX4SEIKcHMwyQjm8STXEwnMPtjU1E68imvaKr/8wl3b
	NLFTF5gGk2kh9V0F8Ej1dPYxg3fdMTCd8aMG2ripP0zA6k8HWtlvKWYTZ2Ib94q1
	sPr24xj5OoPLjHzNcVZBzOFnjiSVY2tm6OtdIzolreM9oIX7JDcMgRIgE/pKZN0I
	i2KWIuH1MdEbvRpUw0BWvFqGOsrcZdBnyTK1H8NaFWl8wBuQadlvMJOOZFcXNJst
	GLebvFS7fq6DtB56wwMMWBvXcpIaXJammL3i8zDjd7/oiAswsxJsSZ5sH4RneDBQ
	PBqm6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjs42k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:47:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RDlqd6031310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:47:52 GMT
Received: from [10.50.52.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 06:47:42 -0700
Message-ID: <62beeb3e-494c-43d8-b539-30ec4eac3fe6@quicinc.com>
Date: Thu, 27 Jun 2024 19:17:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>
CC: <catalin.marinas@arm.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <krzk+dt@kernel.org>,
        <geert+renesas@glider.be>, <neil.armstrong@linaro.org>,
        <nfraprado@collabora.com>, <mturquette@baylibre.com>,
        <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
        <netdev@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <m.szyprowski@samsung.com>, <arnd@arndb.de>,
        <richardcochran@gmail.com>, <will@kernel.org>, <sboyd@kernel.org>,
        <andersson@kernel.org>, <p.zabel@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
 <171941612020.3280624.794530163562164163.robh@kernel.org>
 <eeea33c7-02bd-4ea4-a53f-fd6af839ca90@lunn.ch>
 <4bf9dff9-3cb4-4276-8d21-697850e01170@quicinc.com>
 <bf87c34e-a4ff-4e03-9d6a-dc365fec06a5@kernel.org>
Content-Language: en-US
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <bf87c34e-a4ff-4e03-9d6a-dc365fec06a5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8HG0pE4TV2I03JOKoNoZ7ep-0x8WaxJ3
X-Proofpoint-ORIG-GUID: 8HG0pE4TV2I03JOKoNoZ7ep-0x8WaxJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_09,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270104



On 6/27/2024 1:12 PM, Krzysztof Kozlowski wrote:
> On 27/06/2024 07:25, Devi Priya wrote:
>>
>>
>> On 6/26/2024 10:56 PM, Andrew Lunn wrote:
>>> On Wed, Jun 26, 2024 at 09:35:20AM -0600, Rob Herring (Arm) wrote:
>>>>
>>>> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
>>>>> Add NSSCC clock and reset definitions for ipq9574.
>>>>>
>>>>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> ---
>>>>>    Changes in V5:
>>>>> 	- Dropped interconnects and added interconnect-cells to NSS
>>>>> 	  clock provider so that it can be  used as icc provider.
>>>>>
>>>>>    .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>>>>>    .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>>>>>    .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>>>>>    3 files changed, 360 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>>>>    create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>>>>    create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>>>
>>>>
>>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>>
>>>> yamllint warnings/errors:
>>>>
>>>> dtschema/dtc warnings/errors:
>>>> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
>>>> FATAL ERROR: Unable to parse input tree
>>>
>>> Hi Devi
>>>
>>> Version 4 of these patches had the same exact problem. There was not
>>> an email explaining it is a false positive etc, so i have to assume it
>>> is a real error. So why has it not been fixed?
>>>
>>> Qualcomm patches are under a microscope at the moment because of how
>>> bad things went a couple of months ago with patches. You cannot ignore
>>> things like this, because the damage to Qualcomm reputation is going
>>> to make it impossible to get patches merged soon.
>>>
>> Hi Andrew,
>> Very sorry for the inconvenience.
>> I had run dt_binding_check locally on V4 patches and did not face any
>> errors. I somehow missed to notice the binding check error that was
>> reported on V4. Thus I went ahead and posted the same in V5.
>> Will ensure such things are not repeated henceforth.
> 
> If the warning is expected, e.g. due to missing patches, it's beneficial
> to mention this in the changelog (---). Otherwise all maintainers my
> ignore your patch because you have issues reported by automation.
> 
Sure, got it

Thanks,
Devi Priya

> Anyway, up to you.
> 
> Best regards,
> Krzysztof
> 

