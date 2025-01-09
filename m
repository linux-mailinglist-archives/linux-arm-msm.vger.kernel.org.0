Return-Path: <linux-arm-msm+bounces-44535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D8A071BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B826E7A2087
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024752153E0;
	Thu,  9 Jan 2025 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h+cSdeHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C22594BA;
	Thu,  9 Jan 2025 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415703; cv=none; b=OguxVyqsxAaNhfa+eTJd6LLE7m9mD7KiSv3lsuzbaD1gt5PwPaIXi8rWniOyj1KF18+K4OSOxEtV0bs3/WQD5ddcAJFmWh16GDIGDU209pWB9xbhEewzm+Ct8FDwTmD726qtAA3qFWLYFipa98EsMTXtvS9m6t1jHQte9E17KQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415703; c=relaxed/simple;
	bh=vuEZG1PMLchMh3XQ4elhZSmleMf1TzbztnvViOcgimk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mzM7BBd5Q+lG5PAliOsJEJ8eSsJd5h27IrJTQRaYgGeaBCCAHFUxSkM9FrQRMctlOKjw8e8dEdHKr3RuOH/LY2FUFUleY1yDb4u8MRg2teXrK8oCHBHg+X7qdi8aMvL5/fj32VjiTGhWmHmZvjrvyRGBb63arnUdLJoeFhlJun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h+cSdeHF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509418HD030410;
	Thu, 9 Jan 2025 09:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udUa7bk/hrwoFCjuZkG/t6Uv8mEKZl/WvNR7tJspIQY=; b=h+cSdeHFs5Fpp3Ge
	7pxlauZAboPy03Kv+6WJFFA35OMOiMDBsk9KwEP1Uo/M/0FbKwf2Bp+uWbkp4nPm
	FTB9c+fgEFUhfYo9vZ0ybrj9xl7C31rfqneSq5qOC8N0Dhyz7kJ2euA4rvBq1ZP3
	lhY9ZStyTVuknZCh56pzu/7Qza6/6yXFvSisnjNs6yVoneZgsq1XkCsBAzTdeWQb
	fdQleOTZ9aN9ORdV1TFfbrUJecB9KvwSP5W3hGLDvuR60QqmWVs3t0QjYI46Pb94
	LCncfKLlE3oIL3PYc2mq241uModofTgP0UqJfWsYaab9Crsql03k+955ONhdNETY
	BjIfPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442727rrhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:41:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5099faVB004432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 09:41:36 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 01:41:32 -0800
Message-ID: <7ef6b1ff-b2ee-4b6e-a645-440c0af11c59@quicinc.com>
Date: Thu, 9 Jan 2025 17:41:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs8300: add DisplayPort device
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ritesh Kumar
	<quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-1-e3d13dec4233@quicinc.com>
 <45643708-c138-4c77-85ce-fa7d49f2aa72@oss.qualcomm.com>
 <d536bbf0-4e8a-424b-b885-a22870bfbf31@quicinc.com>
 <fcio2ikemgmvy636vpyvhth7qbzp43x2nebbo2qh7roalxjlvw@ssgsc5cfh4w3>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <fcio2ikemgmvy636vpyvhth7qbzp43x2nebbo2qh7roalxjlvw@ssgsc5cfh4w3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4PrmmePzwUUxGq-cFfI1UT1k1a01bliq
X-Proofpoint-ORIG-GUID: 4PrmmePzwUUxGq-cFfI1UT1k1a01bliq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=788 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090078



On 2024/12/27 3:57, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 03:03:46PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2024/12/6 5:36, Konrad Dybcio wrote:
>>> On 27.11.2024 11:45 AM, Yongxing Mou wrote:
>>>
>>>> +
>>>> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>>> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
>>>> +				clock-names = "aux",
>>>> +					      "cfg_ahb";
>>>
>>> power-domains = <&rpmhpd RPMHPD_MX>;
>>>
>> emm,we use RPMHPD_MMCX in qcs8300 mdss and dpu..
>>> (or maybe even MXC?)
> 
> But it is a DP PHY, not a MDSS or DPU. Is the PLL being sourced by MMCX
> or by MX?
> 
Hi, thank for pointing it.We confirm it, and this should use RPMHPD_MX 
not RPMHPD_MMCX.

