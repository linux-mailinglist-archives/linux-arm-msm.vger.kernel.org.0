Return-Path: <linux-arm-msm+bounces-7876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35E8385DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 03:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D27A290B64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 02:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069C9812;
	Tue, 23 Jan 2024 02:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GaoeJVxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948541846;
	Tue, 23 Jan 2024 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705978700; cv=none; b=daF7Vpk0t6iSyl3Qfhchbybmdy9S2jIURiVOieLi+owHV5CCGC59Y0vYRl+bdrcYBws9lrBYanaUSwhHDB0bicK5ZwguVE687xsLOw8sMGQfRXjhKNsU7KGY0tUSx8LJILWfz6dV1MHPdOgpcMo9ap40B/clSEVLYm5ywzXE6Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705978700; c=relaxed/simple;
	bh=tlDmOqwReCHs6fP1x8o4x0/aKJn0oPY+EMnCy04O8T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZSJsUjVnX/O/WJS7lOYyJjSfnYxHuCl6YjQTYAiBSs1g6iVinWEb4IcvJTbtTSvd5eSd/mLcphMv3QWRgaOqdz4N+wOqD4pJoTan7uIW7+f6GqtvWx/1Hue0wERsd2O14JOOLVRIxwwHfYDFgqHHvSrPfipMU2IECgmG+ZAaH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GaoeJVxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N1sKiu007418;
	Tue, 23 Jan 2024 02:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=glWiCJwWmJZEov++upjRy8OXRumeXSJ8z4rNe7l0Vg8=; b=Ga
	oeJVxFyn04PkkpDpPqTfuURWRhIxsbM0Qeb1dNe455W6fsC1ZG7aZf5bZODLWIIQ
	rHVsHg334hytBb+fwnyMdn5Xk2Qt5G6c1JW6+mRJwwFrsVFpci/cWA3k8D9PLB1s
	LH9Lr/NTsDpsSvHnwcXr+MGSoErvk0CqPjKBYVrAxQ1fhjh3S9MH6dGfzGbWbhI+
	WfhCyuj4nJjTDWVBG6pQ/Ye0CGOb29M2zzREb3Wsau1pVNYpz53EDNaneY3J2l/c
	l9UVkoeEg93+lHw5VXW3IqA9/i15Qg7IJn8nJMizCgRTTIpOOuBEaXvK1CIRhC8C
	DGs3DITJfMhu82tvMwMg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vsq7w24k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:58:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40N2wD50011636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:58:13 GMT
Received: from [10.110.32.149] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 18:58:09 -0800
Message-ID: <884f92ac-4d1a-9f0c-29ad-9d5833f10863@quicinc.com>
Date: Mon, 22 Jan 2024 18:58:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Brian Masney
	<bmasney@redhat.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Eric Chanudet
	<echanude@redhat.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_ymg@quicinc.com>, <kernel@quicinc.com>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
 <Za5xj8S3Gs7N-UUc@x1> <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3yl3uby4vpTxUPl2xevXjEBvrfa-CEmF
X-Proofpoint-ORIG-GUID: 3yl3uby4vpTxUPl2xevXjEBvrfa-CEmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230019

On 1/22/2024 12:02 PM, Bjorn Andersson wrote:
> On Mon, Jan 22, 2024 at 08:45:51AM -0500, Brian Masney wrote:
>> Hi Dmitry,
>>
>> On Fri, Jan 19, 2024 at 10:35:43PM +0200, Dmitry Baryshkov wrote:
>>> This kind of change sets a very bad precedent. This way old kernels
>>> become incompatible with the updated firmware. For me it looks like
>>> Linux kernel suddenly being unable to boot after the BIOS upgrade.
>>> Generally memory map updates should be disallowed after the board hits
>>> the production and the DT is published and merged. There can be other
>>> users of DT. BSD systems, U-Boot. We spend sensible efforts in making
>>> sure that DT is an ABI: newer kernel remain compatible with older DT
>>> files. We expect the same kind of efforts from device manufacturers.
>>>
>>> I think unless there is a good reason, the memory map update should be
>>> reverted on the Qualcomm side as a breaking change.
>>> If this kind of update is absolutely necessary, it might be better to
>>> define a new set of board files utilising the new memory map, marking
>>> existing DT files as legacy.
>>
>> This is on a development board that's not in production yet, so
>> personally I think this change is fine. It's in all of our best
>> interests to have SoC vendors push their code upstream early, even if
>> it means that later on we need to make memory map changes like this.
>>
> 
> The problem I have with the patch is that I don't know which precedence
> it sets, because the commit message indicates that we have a new
> firmware version, while Eric's report lacks this information.
> 
> As long as everyone with access to the hardware agrees that breaking
> backwards compatibility is the right thing to do, I'm not against it.
> 
> But then again, if the support is under active development, why would
> anyone run a stable@ kernel on this thing?
> Or are you asking for it to be included in v6.8-rc, so that you guys
> have a "stable" tree to do further development (with this patch) on?

I agree with what Bjorn is mentioning here. Why we are freezing the kernel version
here/commit of it here. Memory map can change during the active development
and this target is under active development. 

New board file approach doesn't work - since how do you select the new 
board file? Both old and new board file will still point to the same
platform type and version.

We also saw recently that IOT SOCs which are similar to in some
sense Mobile SOCs are having the different map. The same almost
same SOCs used in the different product segments like Chrome
and Mobile and IOT can have different memory map as well. The good
part there was that they had different soc-id and it will be easier
to differentiate them. 

As Brian M mentioned earlier, we want soc vendors to submit the support
for their SOCs and platforms on top it as early as possible and it means
such memory map changes will continue. Even memory map changes
continue even few months after the commercial s/w release in certain cases
due to critical bugs were found in some usecases which warrants the changes. 


-- 
---Trilok Soni


