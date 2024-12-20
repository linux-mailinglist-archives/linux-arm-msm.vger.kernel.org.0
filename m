Return-Path: <linux-arm-msm+bounces-42895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 555AF9F8B36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FB0F7A2A76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 04:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD23F70805;
	Fri, 20 Dec 2024 04:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FCdQRge5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19682594B5;
	Fri, 20 Dec 2024 04:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734668693; cv=none; b=Po4eZWq/AAThuEVr3pmyHsXFSzlc8DuCw1N5uDg34vaZ/bM4PtbQA7S+k3H8eunXXYbe38mRF+Et/vjqXVapVA/Q8n8UeaLhlNsCWEiL9SnDOTAgYkerzRufFKr1B6jM8ps/qjSA9eREBssHewmBruJ/dyNI5efjJKzqrs2Joyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734668693; c=relaxed/simple;
	bh=yCmayIMr0GIa6WLqK+0nsr8QYs5SR56Xo+xRS03AWxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vrit9x0tFPOa/0MmDMtgd6rsv8qkPMYdISBhoUqREkvQRbIUNgLPRfoz+zde7T2Gva1jO7s7d1vvYeMZIQhNHnXauRYzVK7ioyhaB9lEfKvb4g74rKL8qLNykJAGTTlOvIiNksniIMf8C34sJifZLtwjY29SlHvcErBmjDQjTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FCdQRge5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJJrTC8024244;
	Fri, 20 Dec 2024 04:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+hvYf8mHz0xstHiSYxN+t0ygbhxjtvv1k2pYv2Wewg=; b=FCdQRge5eOhtXQRg
	UsvrnzIsIq6/9ieHNJIXw4XpkMnTIJstXAQM0v2WJfAIPqMXpjzIp+1UyQdiBANt
	q5Rhnnm22p74ToCqSoCu98boFQDwcHUjLa99Anp7u5S6DMKz6I5hhTLMZ5s2VWcZ
	Cei707ijS1hY72j9bEodzmPNxFdBztNl5LqlBjOxGI36eStkkfkSq0nF6rxJZIrE
	G0ECv2eo7tnV+u+PwNuRKsWwZ5PuvoU93g0Iev8hKGSZPRo7eNruYMjRBMSIlE0N
	HxzvoEdiNllrnnU7esUZ7aLDLzC2B6yVeR7FxVUIJNQChmUnWRa97e2K+Npf4zBi
	YCW2Ig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mt1wry7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 04:24:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK4Odnd024120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 04:24:39 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 20:24:36 -0800
Message-ID: <ea44fe5e-d058-429b-a8aa-2f78bf98b05f@quicinc.com>
Date: Fri, 20 Dec 2024 09:54:33 +0530
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
 <d6d176ac-e08a-4877-a5de-83e8b070fe47@quicinc.com>
 <h4e5jmbglic5aa5e3fyqr3elvso2lotekafqhu7v3h56nbfwf2@qq7lqpptyrai>
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <h4e5jmbglic5aa5e3fyqr3elvso2lotekafqhu7v3h56nbfwf2@qq7lqpptyrai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YKs0zvp2GKQxAq1XGUcsh4BdEmvMPuJ-
X-Proofpoint-ORIG-GUID: YKs0zvp2GKQxAq1XGUcsh4BdEmvMPuJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=469 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200035



On 19-12-24 06:44 pm, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 09:47:12AM +0530, Prashanth K wrote:
>>
>>

[...]

>>>>>> Changes in v2:
>>>>>> - Removed the wrongly added quirks from tcsr_mutex node.
>>>>>> - Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/
>>>>>
>>>>> What was changed in v3?
>>>> It was supposed to be "Changes in v3" instead of v2.
>>>
>>> Then where is a changelog between RFC and v2?
>>>
>>> Please consider switching to the b4 tool, it handles such issues for
>>> you.
>>>
>> Ok, Should I send a new version updating the cover letter?
> 
> 
> For now you can provide data in the reply. Just make sure to include it
> in the cover letter if the patchset gets reposted.
> 

Sure, will update it if I post next version, here's the delta

Changes in v3:
- Removed wrongly added quirks from tcsr_mutex node.
- Link to v2:
https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/

Changes in v2:
- RFC patch was split into series of per-file commits.
- Added the quirks to more targets (Auto, IoT, Mobile, Compute).
- Link to RFC:
https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi

Thanks in advance,
Prashanth K

