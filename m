Return-Path: <linux-arm-msm+bounces-24400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 496C1919E95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 07:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6CA41F21A19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 05:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AAA1CA9E;
	Thu, 27 Jun 2024 05:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kjPCOQyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF8B1A702;
	Thu, 27 Jun 2024 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466001; cv=none; b=OZGG6IG2PKQMVbMReWANKNWMI+CjF4VA50doIfZ9mqlnndqT5Y8NxFKMbjf7VvWOIhPPV22QdM+LdSo5jj+EkybUmOMUbrZ4FCCEyR0ORCyXrn5wnPgN3BMVNctoi8WOkbJ1Q5fkYt/6ohoKkB6zqEMPXQCVT13pBg7ewMzOpxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466001; c=relaxed/simple;
	bh=OuR9NleHXA3ZQdw1usDlCmtjq83kCMS29H9Cz2AqACs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sgKC4nC+V5zhuLY/l/F4QkBDXmtMIA/33d9qIXGTu4a4Gote7FDZp7l8LlVsfxnIcYrWFATlIcKes0ZQlLxkMU2Wmcz6wM1KTihBlGYd8A5L4r2MdlqzJUX7E7B92637am2W24GA1NaDFl1j3H26YwEKDfbBKWohsEq8mPSYCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kjPCOQyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R0DRtE003766;
	Thu, 27 Jun 2024 05:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYpXKHV1kel9Zds03gh2BxHVDdcoNxDveVlVPuZhkgk=; b=kjPCOQyxGovZJTCj
	OPnm8pGQek/O8oafBsRh3k4WrV0X0ZdJePu1qGoSJxyuzDYxsn/sFFK4DvUC5Y39
	wocQkxzuwpnEoqKfx58Gu8u8w1+uJDRMVKTagInbE9e/JIDewRRWgLTspjlI4Tm+
	c4Uhc4TzAWGJtBe78ZVvDYc63OjzgVOBdVoEKJ/sArKpsxqvPxu8p0YYBNGcZy6k
	/3Wv1unh0AD+kH6yKGc82RNm2B8ErA3yNm8JBLl9Mu2OyCd5lODuSq4io9Fv7rhv
	TnSZCSupDMquBvZc/nzROLeGAV0SgdzxkA1F69inG3IK8nG7HIHVzC+GRf0k0vVC
	RJIs+w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaf3v70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 05:26:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45R5QAV4032328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 05:26:10 GMT
Received: from [10.50.52.175] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 22:25:53 -0700
Message-ID: <4bf9dff9-3cb4-4276-8d21-697850e01170@quicinc.com>
Date: Thu, 27 Jun 2024 10:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Andrew Lunn <andrew@lunn.ch>
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
Content-Language: en-US
From: Devi Priya <quic_devipriy@quicinc.com>
In-Reply-To: <eeea33c7-02bd-4ea4-a53f-fd6af839ca90@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9NOepCBt7OGnFxvhr4ou74KtrvgMHq_q
X-Proofpoint-GUID: 9NOepCBt7OGnFxvhr4ou74KtrvgMHq_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406270039



On 6/26/2024 10:56 PM, Andrew Lunn wrote:
> On Wed, Jun 26, 2024 at 09:35:20AM -0600, Rob Herring (Arm) wrote:
>>
>> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
>>> Add NSSCC clock and reset definitions for ipq9574.
>>>
>>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>   Changes in V5:
>>> 	- Dropped interconnects and added interconnect-cells to NSS
>>> 	  clock provider so that it can be  used as icc provider.
>>>
>>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>>>   .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>>>   .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>>>   3 files changed, 360 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>>   create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>>   create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
>> FATAL ERROR: Unable to parse input tree
> 
> Hi Devi
> 
> Version 4 of these patches had the same exact problem. There was not
> an email explaining it is a false positive etc, so i have to assume it
> is a real error. So why has it not been fixed?
> 
> Qualcomm patches are under a microscope at the moment because of how
> bad things went a couple of months ago with patches. You cannot ignore
> things like this, because the damage to Qualcomm reputation is going
> to make it impossible to get patches merged soon.
> 
Hi Andrew,
Very sorry for the inconvenience.
I had run dt_binding_check locally on V4 patches and did not face any
errors. I somehow missed to notice the binding check error that was
reported on V4. Thus I went ahead and posted the same in V5.
Will ensure such things are not repeated henceforth.

Thanks,
Devi Priya

> 	Andrew

