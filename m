Return-Path: <linux-arm-msm+bounces-42727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A89F73A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 05:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A14A1891C58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 04:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D76B8634D;
	Thu, 19 Dec 2024 04:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lPfTzq3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0883C0C;
	Thu, 19 Dec 2024 04:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734581852; cv=none; b=bqb0znZaDG20AVFUCG4tTib2FrbpgRjvB+btNzZfFRsXxBtwNMfv7/+ilWfGUCbP+fcrDrDdZWSocOO7LviJzYCwcfgkV+pDdDmqKm20f9FzCIHWhP+JW2o9dqO8mIK3DYH5OYbvBblJ8xLyHWXfGq2spp12mZd2egHpGc8Eenc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734581852; c=relaxed/simple;
	bh=rzzLbuaL+gCEDUAbTrM40bSx9TxAQ79DwjvRS+XTg/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eeYZ+A6tqmdE4RgSjHCIvfU1lQOWTUXecUAgp6elz8gFyENojNH7XekSTajFNk/EBpWfw00itEg5SJAuwAL0S+phXlJLB8U2lMfrabgTj0ZOjUofFAxMd3Lkuy+SI7hiMQ6vNY7OWznd1JjMlL8tY2/ayCLqA6u7Yc+Q4x4IQ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lPfTzq3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKLMqp025887;
	Thu, 19 Dec 2024 04:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhpWDSEzTrABOoyXKFChvh9K2H5zC9PcxIMY5CQV0YE=; b=lPfTzq3MJtbUUdYj
	guRgWnwu+cbFata3q1mvhZhMY3Tx+mbjw2jHr0FVzzg0ClkZj9ClluLgdNrJHG6/
	FPHrNLX971UPYm4Q+GuGhSetLvmWnlj0I26+prZaC2sKOPRCDVZYVI/gUF93DVW5
	l68G9mjks+Gq2IYpMDp1nRn4QYbAINXix63UA2vqG7COhVKkABi/szP1GqqueCMX
	aJeqwd97qIprTY25cmPHuLjLYWMjv93U0c7pRXrIMvjTDxU4K6svH18HwaBiSNDe
	ZPC/GqRZoxGDnThWGjZ2xr0rsZ5ZylF79fJY+xEQqhf04+knYmOWyL0XPS0IvX64
	Iz/o8A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m5bnrv83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 04:17:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ4HJCa001170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 04:17:19 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 20:17:15 -0800
Message-ID: <d6d176ac-e08a-4877-a5de-83e8b070fe47@quicinc.com>
Date: Thu, 19 Dec 2024 09:47:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
 <nvhrhnfls2i4sb6rrlax2dh3hf5thfttrq54bgug2jc7ol26rj@cnk5dtampfes>
 <e15bc97d-eef3-4e49-badf-5b3afbc113d9@quicinc.com>
 <3h2ur3wv3tso3qxv4ws2af4vmvdjdpvhax5smngszaaaotvgku@bo2q5cmhds2z>
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <3h2ur3wv3tso3qxv4ws2af4vmvdjdpvhax5smngszaaaotvgku@bo2q5cmhds2z>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fwQZ68ebbxroM1avTkCrJ02w6iRmzmCY
X-Proofpoint-ORIG-GUID: fwQZ68ebbxroM1avTkCrJ02w6iRmzmCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 mlxscore=1 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=1
 suspectscore=0 malwarescore=0 mlxlogscore=206 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190030



On 19-12-24 08:37 am, Dmitry Baryshkov wrote:
> On Wed, Dec 18, 2024 at 05:18:50PM +0530, Prashanth K wrote:
>>
>>
>> On 18-12-24 04:57 pm, Dmitry Baryshkov wrote:
>>> On Wed, Dec 18, 2024 at 03:56:48PM +0530, Prashanth K wrote:
>>>> Enabling U1 and U2 power-saving states can lead to stability and
>>>> performance issues, particularly for latency-sensitive or high-
>>>> throughput applications. These low-power link states are intended
>>>> to reduce power consumption by allowing the device to enter partial
>>>> low-power modes during idle periods. However, they can sometimes
>>>> result in unexpected behavior. Over the years, some of the issues
>>>> seen are as follows:
>>>>
>>>
>>> [..]
>>>
>>>>
>>>> This series was earlier started by Krishna Kurapati where he disabled
>>>> U1/U2 on some SM targets. I'm extending this to more devices including
>>>> Auto, Compute and IOT platforms. On a side note, this quirk has been
>>>> already included on some mobile targets like SM8550/8650.
>>>
>>> Why are you resending previous patches rather than adding another series
>>> on top of it?
>>>
>> Hi Dmitry,
>>
>> RFC had only one patch with quirks (to disable u1/u2) only for few
>> targets (SM8150, 8250, 8350, 8450). It was later decided to split it
>> into per-file commits as per the review comments. Hence I clubbed
>> Krishna's changes along with few more targets. Let me know if this needs
>> to be changed.
> 
> No, it's fine. The text in the commit message lead me to a wrong
> conclusion.
> 
Ok sure.
>>
>>>>
>>>> Changes in v2:
>>>> - Removed the wrongly added quirks from tcsr_mutex node.
>>>> - Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/
>>>
>>> What was changed in v3?
>> It was supposed to be "Changes in v3" instead of v2.
> 
> Then where is a changelog between RFC and v2?
> 
> Please consider switching to the b4 tool, it handles such issues for
> you.
> 
Ok, Should I send a new version updating the cover letter?
>>>
>>>>
>>>> Link to RFC:
>>>> https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi
>>>>
>>>
>> Regards,
>> Prashanth K
>>
> 


