Return-Path: <linux-arm-msm+bounces-45371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A923A149C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 07:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D1E87A26F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 06:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A101F75AB;
	Fri, 17 Jan 2025 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f+Gaz+zB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4C3FB3B;
	Fri, 17 Jan 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737095806; cv=none; b=MCYTvHnxwFI0AAyFlg6naOeNRDPlWs08WrGDI5mFXbEdSOtYCekXz3XHLnz7DYrFXDZUHFtVG7D/h7X68DekfP1L8Q5FchSgmhIG4JKDXnEt6MEgyrURfYkyZrJQTpX1gty5NCChODJ4go68FJX/bzdN9QHgq6MTlcsQ9Hn2mn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737095806; c=relaxed/simple;
	bh=hF//7dvl18nYbOw/SJrm+TWBs1kAXk/61pxa2tqyDaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LsQpBU2ud+OWYdoJP9iWEoOHAFddEHyZPMYbNXJuVx2y5xjEEAiXTr2HX+5i9aFHWOu8xQxRyE0DVz6RdvItCWKOV/gHSpjWBo+OsH58tkJr0tJRYUFEApgcFcX3WqWFN2FZ5J9d9tkr7Qj3GuSxmr3GhicArW6fAB8qzGxPC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f+Gaz+zB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKwsgu028844;
	Fri, 17 Jan 2025 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRCdsIRhV24bmNemeHwOVjnXqRXoMU94hjVeWdnzEOk=; b=f+Gaz+zBYzftXYaM
	rGUxvC4tLzFN9Kgwje5LHtvPJyWCxQ1PXUJmKSrvysRA3zRW1Z0nBMcPLPS2eKd4
	LO6nqo5DJtL1rgfac47N/LdTidmwtcrR11NQYx0Db34NW5VbNC04pVL6bHGoV2zA
	1OZTSBsSnWOp6GNeSsxmkbyFUuXe62pLCgdhpJ01F5l/eP7PjwksGNCC34ubt5ww
	SX6LfA/Ok9c4vasi5i3X78O0eMxrYlJwfOasPquCoJAcBgFScFiRRnT6NkRq+ER6
	VnWvI0wwF4wjo72AF4VC0uksYTE0+LDLDtir9WFAEDdVUcc3lBK5XynryYuavkfN
	54qAtg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4479mf913m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 06:36:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H6abpx013629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 06:36:37 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 22:36:32 -0800
Message-ID: <48cfd337-e691-7f10-71df-f6389e098e67@quicinc.com>
Date: Fri, 17 Jan 2025 12:06:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <sudeep.holla@arm.com>,
        <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <quic_nkela@quicinc.com>, <quic_psodagud@quicinc.com>,
        <abel.vesa@linaro.org>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
 <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com> <86plnf11yf.wl-maz@kernel.org>
 <ZyTjiiGc2ApoID9Y@hovoldconsulting.com> <86o72z10b6.wl-maz@kernel.org>
 <ZypOY-NCDN9fdMAR@hovoldconsulting.com> <86ed3p1rdq.wl-maz@kernel.org>
 <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
 <Z1HK4qIF9dT3x1OY@hovoldconsulting.com>
 <f504b325-e4a8-c297-a09f-6a2158fa1a1b@quicinc.com>
 <Z4Dt8E7C6upVtEGV@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z4Dt8E7C6upVtEGV@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mNbzKfEAFkrQ0YSmHZLSxjDsKcD8cpRe
X-Proofpoint-ORIG-GUID: mNbzKfEAFkrQ0YSmHZLSxjDsKcD8cpRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_02,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=819 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170051



On 1/10/25 15:22, Johan Hovold wrote:
> On Mon, Jan 06, 2025 at 05:52:48PM +0530, Sibi Sankar wrote:
>> On 12/5/24 21:16, Johan Hovold wrote:
> 
>>> As Marc said, it seems you need to come up with a way to detect and work
>>> around the broken firmware.
>>
>> The perf protocol version won't have any changes so detecting
>> it isn't possible :(
> 
> But there could be other ways, see below.
> 
>>> We want to get the fast channel issue fixed, but when we merge that fix
>>> it will trigger these crashes if we also merge cpufreq support for x1e.
>>>
>>> Can you expand the on the PERF_LEVEL_GET issue? Is it possible to
>>> implement some workaround for the buggy firmware? Like returning a dummy
>>> value? How exactly are things working today? Can't that be used a basis
>>> for a quirk?
>>
>> The main problem is the X1E firmware supports fast channel level get
>> but when queried it says it doesn't support it :|. The PERF_LEVEL_GET
>> regular messaging which gets used as a fallback has a bug which causes
>> the device to crash. So we either enable cpufreq only on platforms
>> that has the fix in place or live with the warning that certain messages
>> don't support fast channel which I don't think will fly. I've also been
>> told the crash wouldn't show up if we have all sleep states disabled.
> 
> We certainly want cpufreq enabled also on the current/older firmware
> which have these bugs.
> 
> Based on the above, it sounds like your fix:
> 
> 	https://lore.kernel.org/lkml/20241030125512.2884761-2-quic_sibis@quicinc.com/
> 
> is correct even if it triggers the crash on machines with buggy firmware.
> 
> Why can't you add a quirk for x1e platforms that makes sure that the
> driver always uses fastchannel level get?

Makes sense but introducing anything like ^^ needs consensus from
the scmi maintainers but for obvious they won't comment on this
thread :| . I'll repeat the same question on another thread.

-Sibi

> 
> You know it is supported (and as has to be used) even if the buggy
> firmware says it's not. Just set the corresponding attribute bit
> unconditionally based on the DT machine compatible (or fall back to the
> current implementation which theoretically other broken fw
> implementations may also be relying on), or similar.
> 
> Johan

