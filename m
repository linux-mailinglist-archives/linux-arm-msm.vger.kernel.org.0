Return-Path: <linux-arm-msm+bounces-28371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB46950470
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7879528459F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5811991D8;
	Tue, 13 Aug 2024 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jughurPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80C92262B;
	Tue, 13 Aug 2024 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723550870; cv=none; b=PV26C3Hr7rMC6E3uHnbHOGoS2Hbyci8o69O/OPlo64jLXghp/QWqGzWT3fNNlA/eTAK4+W8pvjApQf66YXqOgMGxTnwlGWXIB2Vk9rSA40Tn0KixLB3K2c2g78VdIxQIr5gizhQtXVxWtyWEuljICcqDPfugHdGAO9OSWWHDmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723550870; c=relaxed/simple;
	bh=eboqPDFBQBeHXdKa2+N374z8eTUgt6A+omNECwR9BdM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=aw0mevfXlOX59PBYdjps7RRbogRJVzG1kROMYX3cmATkt1dpsVD0VgCyvznnamFmo85Ps1p3Kk1V0sm5VnrHAJbsdJplIPTQmHpEp2EyubkFqR6zeKywBgHVPMzZ11FfrBZPDwBfFuib7iL+32LcrWdT/CDTV2Oq/jRCrDQ/zTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jughurPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D4bde3021398;
	Tue, 13 Aug 2024 12:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAgyaTKkoWXNtcaRI74DXqrR9yRQ3PKCrjmt7l19c9I=; b=jughurPfn3IrCsir
	gCzmL+2ASzjmX6kPqZ6FfF2Olbtb6UcDcXBdRocu+YMfRdsRH0504d7kvnq7bM25
	rZsoSyQgdaT9TlRc/2Iqz3UeJS0v78mmwe9OSsXJKxX600WzQ6FAgUqlzxfPB0+/
	VtKTmRctZAAe/ZpadHqAfBmDuvzERKXfmgOsuOmMQsTHErs8FgsLZaunOGFt2nM1
	JRiV7oF0SmoDZOi5ZlbQjqTAuz/z80mh/CITSFLQuHlF5c1MNo5XjLzKQj1RqO4f
	YeKpG/S1+BslVpqr5t0Kz2QRdl6r/jWWRGYRYpf6wJ90Cu3iBdQWxCyFjJQ4KXAX
	SzKegw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1g7yjq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:07:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DC7ZUd003966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:07:35 GMT
Received: from [10.253.33.134] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 05:07:31 -0700
Message-ID: <cd8ac2dd-e56d-4551-b3bf-6994c2064f1b@quicinc.com>
Date: Tue, 13 Aug 2024 20:07:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable Qualcomm IPQ common PLL
 clock controller
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-3-b0631dcbf785@quicinc.com>
 <afbf0554-56a5-4df0-9e4b-97c065d78bb3@kernel.org>
 <41aea3f3-d21a-4d8e-a91a-0fe06947c75f@quicinc.com>
 <379dc513-2eb5-4d33-a09e-e8861dddc502@lunn.ch>
Content-Language: en-US
In-Reply-To: <379dc513-2eb5-4d33-a09e-e8861dddc502@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wvl6s8UG0d8YoLotil6OsCOBM22MjdxJ
X-Proofpoint-ORIG-GUID: Wvl6s8UG0d8YoLotil6OsCOBM22MjdxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_04,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=636 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130088



On 8/9/2024 9:34 PM, Andrew Lunn wrote:
> On Fri, Aug 09, 2024 at 07:36:35PM +0800, Jie Luo wrote:
>>
>>
>> On 8/8/2024 10:41 PM, Krzysztof Kozlowski wrote:
>>> On 08/08/2024 16:03, Luo Jie wrote:
>>>> The common PLL clock controller provides fixed rate output clocks to
>>>> the hardware blocks that enable ethernet function on IPQ platform.
>>>
>>> That's defconfig for all platforms, so how anyone can guess which one
>>> you target here? Be specific, which company, which Soc, which board
>>> needs it.
>>>
>>
>> Sure, I will update the commit message as below to provide the details
>> required.
>>
>> The common PLL hardware block is available in the Qualcomm IPQ SoC such
>> as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
>> related hardware blocks such as external Ethernet PHY or switch. This
>> driver is initially being enabled for IPQ9574. All boards based on
>> IPQ9574 SoC will require to include this driver in the build.
> 
> Does it provide more than Ethernet clocks? I'm just wondering why the
> name `common`, when it seems pretty uncommon, specialised for Ethernet
> clocks on a couple of SoCs.
> 
>     Andrew

No, this block does not provide any other functionality other than
allowing this PLL to be configured for supplying clocks to Ethernet
devices. The hardware programming guide names this block as the 'CMN'
block, so we included the 'cmn' phrase in the driver namespace. However,
I will update commit message to clarify that 'cmn' is the block name and
it does not provide any other function other than enabling clocks to
Ethernet related devices.



