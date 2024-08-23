Return-Path: <linux-arm-msm+bounces-29366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CF95D132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 17:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C506A1F2347C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 15:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703701891A3;
	Fri, 23 Aug 2024 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZUF8uYZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF51586D3;
	Fri, 23 Aug 2024 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426190; cv=none; b=Wg984V4Gyq8mozL5hRiU2t4QXmWpPDAHAhADASssdsTDMti+zmRJfnIHBViClP8L2PH2Gu2bte8TAAct4X+6PylBc+LRJOywJmoZNi/7nNgSI2pFibmBu1GaVJVQ9GudKOW0PwIHewpx57TZhuhxmovz7/swQ5f+ahrXFSxbKzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426190; c=relaxed/simple;
	bh=KIGu8KPJ4wD+6srlXDln8w2+UkY+JiFysbcZeTtgnv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gZFGrcJSKbUB8ILvZWM2dEnB8vNJiDsrKyYMV6FrXjbhYkSpPVXhWQ5Cz54PraAcvMYhbnIv29sdxJ0hMc+80OCeJpws5g26kANabVS8eo4JKWOhjkxRYzO4lvywPCIkV4nlUILItVemm78rYZqhnVNep/pRUGaPC1oZVLir8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZUF8uYZk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NEAcxe010554;
	Fri, 23 Aug 2024 15:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SYvZ/8Nyxyzj5yWb8bM+vn9zItFjjNckEx4h1QlisZY=; b=ZUF8uYZkHaA+IR6L
	/+fj+sBks8hP24xc3pnhkUzzY0C5lDvWtGPuXe4ktToS+2kJVu72cYRKlT/ezTlf
	JPzADCCSptRZ55qxMCSS3h6+E1e/anR936vYH20+24nc9m2T3qO0IMTRotbQTYml
	TseiI5av2xDy0uqVAp9VPhahjlRp3GgIp8BG1CKqxPo7QPVVf9xBzOH3lPZLQ6mk
	m+2DDAoGgpR8vHjU1s55VHqWqaowl6r4CSB7IBN4rV0NEepuVXMALT6rM5ih79vt
	Xgr6EgCH2Wa9iMY1lduWV3spLvS3J1BROB/RuMmVYGI0jAIEnIav1EFzpXtYyLgN
	ldc7TQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 416mnm9nkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 15:16:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NFG9mb006227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 15:16:09 GMT
Received: from [10.253.73.208] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 Aug
 2024 08:15:55 -0700
Message-ID: <1b8f9678-a51d-4088-a475-2818200c9ba5@quicinc.com>
Date: Fri, 23 Aug 2024 23:15:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
To: Ziyang Huang <hzyitc@outlook.com>, <krzk@kernel.org>
CC: <andersson@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <catalin.marinas@arm.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mturquette@baylibre.com>,
        <quic_kkumarcs@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>, <robh@kernel.org>, <sboyd@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <will@kernel.org>
References: <be2eae05-6deb-49fb-94ce-cb5e3a5bd1ba@kernel.org>
 <TYZPR01MB5556648ABB617F62EF865A61C98F2@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <TYZPR01MB5556648ABB617F62EF865A61C98F2@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K4Q6lYm8ZVTcohq6w0ryIrSbqByZAhAY
X-Proofpoint-GUID: K4Q6lYm8ZVTcohq6w0ryIrSbqByZAhAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_11,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=747 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230113



On 8/23/2024 12:12 AM, Ziyang Huang wrote:
>> Yes, I double checked again with our hardware team and the
>> documentation. CMN is just a short form of "common" with no additional
>> information in the guide.
> 
> Hi luo jie,
> 
> I'm a free developer who was trying to add the ethernet support for
> IPQ5018[1]. And I'm also trying to write the same driver in the V2 patch.
> 
> When I was trying to write this driver, I was also confused about the
> 'CMN' whcih I can't find any description.
> 
> But finally in WiFI documents, I found the same word explained as
> 'Component'. There may be different. But I think this is a better
> explanation than 'common'. So I named this driver to
> QCOM_ETH_CMN (Qualcomm Ethernet Component Driver).

Hi Ziyang,

We have confirmed from our SoC team that 'CMN' is used as a short
form of "common" for the CMN PLL block in the documentation. The
'component' reference that you may have found in the Wi-Fi document
should not apply to this Ethernet specific CMN PLL block. This CMN
PLL block provides a similar function on all IPQ SoCs including
IPQ5018.

Also, note that while this driver is initially enabled for IPQ9574
SoC, we plan to extend it to other SoC later once the driver is
accepted. Similarly we suggest enabling the IPQ5018 support for
CMN PLL on top of this driver.

> 
> Hope this can help something.
> 
> [1] https://lore.kernel.org/all/TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/
> 


