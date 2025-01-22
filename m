Return-Path: <linux-arm-msm+bounces-45775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E1AA18E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BE987A3D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D162046A4;
	Wed, 22 Jan 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gWKUQ/2D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA406170A15;
	Wed, 22 Jan 2025 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737536838; cv=none; b=bRJaaWHBGfJlfvLFrpUOXWQ65Pg83FUm7yn/wrK7ZBf+AxyWlmdp9sCLafmaA1MNOSgvL2qT5r4sIl5DNt0NXYkS5srMLQzi2Zt21QGujmx2HmO438XByOFaUqAu7NHq27fmPnPBdfVoWgo4DqU1VpUIV9KQk6Ay6isErKjTGMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737536838; c=relaxed/simple;
	bh=2l+F5XC9edzXnJQ56/2tCUgD8rAgCzyVfxpKiMXpYmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o9+Kfn1ZfciGjHjtNAT+Ilo8JKWlgobHxVaTw4yzP7RZd8q3sIZcrok4dztUyn1hXkNLLM/p0aD+0icrbHr4T2tZsGAtZO/jFEJA/CMnhiJce/LzJFjcKfajPjjluX1W/zepy1YiT70BNzC+8SZP/JzEpSWTLlAGR+LG3leSZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gWKUQ/2D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4XT7N029449;
	Wed, 22 Jan 2025 09:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkQFLh6xLHsI2CxC96/YoRHNzOH+kkMYSIC+Pxqdhdo=; b=gWKUQ/2Dgnv+3NBj
	bXUOHQoWyh0NWIf05dH/A2uxKuFboNcQdeFT0sCXEj6ni/E0LVU6snwIAwNbPNnG
	/8BOLtUFHDTTqOStsec7bthFNZwLjLPaddT85QbpfgITIwAUQbvcsRe9a13K5FB6
	kb5O1uUYVxX6ed/33Ab/0mbrhEtY76zGyr1azLKfbiBYwZuUOEbRo8c/z919K3N3
	Lu7u/G5JtJ26jMKRnjtFcy+WUkWPeg0XTTQHB92Oeaqq2WcfMzYus6aqVI9ulJkl
	R4fmhgzQTN374C0TdetaS1x2KY4HhkrwryIeDyfX2QCpPlln5HrJjody6upi9tlt
	BhTTQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44asrnrks3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:06:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M96j4X013601
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 09:06:45 GMT
Received: from [10.253.35.93] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 01:06:28 -0800
Message-ID: <fad78436-8263-46af-b669-3bcd75f036a4@quicinc.com>
Date: Wed, 22 Jan 2025 17:06:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <Z4-Z0CKtiHWCC3TM@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: odx1Rgb5QmadLm_bSlJHMe-MZJhxbKP0
X-Proofpoint-ORIG-GUID: odx1Rgb5QmadLm_bSlJHMe-MZJhxbKP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220065



On 2025-01-21 20:57, Russell King (Oracle) wrote:
> On Tue, Jan 21, 2025 at 01:47:55PM +0100, Krzysztof Kozlowski wrote:
>> On 21/01/2025 08:54, Yijie Yang wrote:
>>> The Qualcomm board always chooses the MAC to provide the delay instead of
>>> the PHY, which is completely opposite to the suggestion of the Linux
>>> kernel.
> 
> You still need to explain why it's preferable to match this in the mainline
> kernel. Does it not work when you use the phylib maintainers suggestion
> (if that is so, you need to state as much.)

Okay, I will include that explanation in the next version.

> 
>> How does the Linux kernel suggest it?
> 
> It's what phylib maintainers prefer, as documented in many emails from
> Andrew Lunn and in Documentation/networking/phy.rst:
> 
> "Whenever possible, use the PHY side RGMII delay for these reasons:
> 
> * PHY devices may offer sub-nanosecond granularity in how they allow a
>    receiver/transmitter side delay (e.g: 0.5, 1.0, 1.5ns) to be specified. Such
>    precision may be required to account for differences in PCB trace lengths
> 
> * PHY devices are typically qualified for a large range of applications
>    (industrial, medical, automotive...), and they provide a constant and
>    reliable delay across temperature/pressure/voltage ranges
> 
> * PHY device drivers in PHYLIB being reusable by nature, being able to
>    configure correctly a specified delay enables more designs with similar delay
>    requirements to be operated correctly
> "
> 
>>> The usage of phy-mode in legacy DTS was also incorrect. Change the
>>> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
>>> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
>>> the definition.
> 
> If the delays dependent on the phy-mode are going to be implemented at
> the MAC end, then changing the PHY mode indicated to phylink and phylib
> to PHY_INTERFACE_MODE_RGMII is the right thing to be doing. However,
> as mentioned in the documentation and by Andrew, this is discouraged.
> 
Adding delay by the MAC side is generally discouraged, but the current 
driver configuration sequence was designed to do so. We need to follow 
this approach until we can rewrite it, correct?

-- 
Best Regards,
Yijie


