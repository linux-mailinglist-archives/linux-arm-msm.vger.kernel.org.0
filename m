Return-Path: <linux-arm-msm+bounces-8187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3983B964
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 07:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 465F0B23B68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 06:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D220710A23;
	Thu, 25 Jan 2024 06:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pxQY5+xg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81CC3D7A;
	Thu, 25 Jan 2024 06:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706162723; cv=none; b=fxNtQBIJ7+WHuE+uK1zFjcsNFY+PnQ98xv3CYmqtv3RwHOQ9DQBX9xreWKFQinA2cS1qC2WFk2OuGS0f6Z/cKPYgCKzdP+vbnOiv3ipR8Jpijystds0dv+Mk1T3urbzhMQBHGX/LVFcLE6KK0kp+gbTIOXnbEmozh3QaXSayj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706162723; c=relaxed/simple;
	bh=ubjajx2G6nwEmRHyFYk/G0ic5wAK0ffGpq2sWyrobEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GhiMHGNvVrIkBzeuNJFtpz3NopvA+8Jb8vGUfQ7X/IzSUT4QY8h4oDLhv36y1fxDZcq9QkouTRPRyhH2y1DBXdAz66WBcG8OpPUt1pVS9n6CbnzPkg9IbmbVTgMRZ+zJFZLy7jaiZLeIKskOciQ8yjhLMVsxLk+PfArSg5St5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pxQY5+xg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P4xuQn028304;
	Thu, 25 Jan 2024 06:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ma1QEXR/YOXhzfJcJCX+pLFVHETvVJ80OwD89I5Fo8E=; b=px
	QY5+xgH9OQHEgO9v9kdeSag27smuTS39foKZnGaNnezRhkZudqmh+w8eAUQQmQXS
	uKjxK2DY7xRjc51haxEdyFNIDLSvSPckmFigICgp8KzskP4xl5rXw2PRxEL79Kee
	AdGnK6mDPhbYLsbWO1JdMsgHcL7xoRDZ78YI8J/mHSejqKoPy8zjO3L1fs8EkJlK
	hMgOmnH+8/mC/LH++uN0StLT6k0aqMxtIKTZ9U7DijGHhOBqZGppxMwQpPap8toa
	Wm2aGtcnBtX+9ma4hb2AKQtv/1WJR/ac/0nN3Rw6ai2qnmiC3JnNFo4CLldQctY0
	CnHtw+9KpoxOtGh4HZlQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vu1ccj99q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 06:05:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40P65E4j020864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 06:05:14 GMT
Received: from [10.110.44.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 22:05:10 -0800
Message-ID: <95fe9354-afbc-635e-09c8-0106f2a27850@quicinc.com>
Date: Wed, 24 Jan 2024 22:05:10 -0800
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Brian Masney
	<bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>,
        Ninad Naik
	<quic_ninanaik@quicinc.com>, <andersson@kernel.org>,
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
 <884f92ac-4d1a-9f0c-29ad-9d5833f10863@quicinc.com>
 <CAA8EJpq74G7Et=vuc-K0y_wKCEiM0=YVyb7TcosAnbvOFMWDMg@mail.gmail.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <CAA8EJpq74G7Et=vuc-K0y_wKCEiM0=YVyb7TcosAnbvOFMWDMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5eaxOiynRQMIzGyYxYvT22tQr0vDcLJ6
X-Proofpoint-GUID: 5eaxOiynRQMIzGyYxYvT22tQr0vDcLJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_02,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250038

On 1/22/2024 10:23 PM, Dmitry Baryshkov wrote:
> On Tue, 23 Jan 2024 at 04:58, Trilok Soni <quic_tsoni@quicinc.com> wrote:
>>
>> On 1/22/2024 12:02 PM, Bjorn Andersson wrote:
>>> On Mon, Jan 22, 2024 at 08:45:51AM -0500, Brian Masney wrote:
>>>> Hi Dmitry,
>>>>
>>>> On Fri, Jan 19, 2024 at 10:35:43PM +0200, Dmitry Baryshkov wrote:
>>>>> This kind of change sets a very bad precedent. This way old kernels
>>>>> become incompatible with the updated firmware. For me it looks like
>>>>> Linux kernel suddenly being unable to boot after the BIOS upgrade.
>>>>> Generally memory map updates should be disallowed after the board hits
>>>>> the production and the DT is published and merged. There can be other
>>>>> users of DT. BSD systems, U-Boot. We spend sensible efforts in making
>>>>> sure that DT is an ABI: newer kernel remain compatible with older DT
>>>>> files. We expect the same kind of efforts from device manufacturers.
>>>>>
>>>>> I think unless there is a good reason, the memory map update should be
>>>>> reverted on the Qualcomm side as a breaking change.
>>>>> If this kind of update is absolutely necessary, it might be better to
>>>>> define a new set of board files utilising the new memory map, marking
>>>>> existing DT files as legacy.
>>>>
>>>> This is on a development board that's not in production yet, so
>>>> personally I think this change is fine. It's in all of our best
>>>> interests to have SoC vendors push their code upstream early, even if
>>>> it means that later on we need to make memory map changes like this.
>>>>
>>>
>>> The problem I have with the patch is that I don't know which precedence
>>> it sets, because the commit message indicates that we have a new
>>> firmware version, while Eric's report lacks this information.
>>>
>>> As long as everyone with access to the hardware agrees that breaking
>>> backwards compatibility is the right thing to do, I'm not against it.
>>>
>>> But then again, if the support is under active development, why would
>>> anyone run a stable@ kernel on this thing?
>>> Or are you asking for it to be included in v6.8-rc, so that you guys
>>> have a "stable" tree to do further development (with this patch) on?
>>
>> I agree with what Bjorn is mentioning here. Why we are freezing the kernel version
>> here/commit of it here. Memory map can change during the active development
>> and this target is under active development.
>>
>> New board file approach doesn't work - since how do you select the new
>> board file? Both old and new board file will still point to the same
>> platform type and version.
> 
> The developer knows which firmware version is used. So the user can
> select the correct DT file manually. There is no need to pack all
> files together.
> Also it might be nice to bump the platform version when performing
> such drastic changes.

Well - we can do that and pick the DT we want, but please understand
that as a community we don't allow such memory map changes it will
be going to stop SOC vendors from contributing early for the ARM platforms,
which is a regression in my view. 

This will also make SOC vendors to move the memory maps out of the
DT to some bootloader code which we won't be able to access due
to the location on their websites and versions. We may not want to
be in such situation as well. 

> 
>>
>> We also saw recently that IOT SOCs which are similar to in some
>> sense Mobile SOCs are having the different map. The same almost
>> same SOCs used in the different product segments like Chrome
>> and Mobile and IOT can have different memory map as well. The good
>> part there was that they had different soc-id and it will be easier
>> to differentiate them.
> 
> Having device-specific memory maps is also fine.
> 
>>
>> As Brian M mentioned earlier, we want soc vendors to submit the support
>> for their SOCs and platforms on top it as early as possible and it means
>> such memory map changes will continue. Even memory map changes
>> continue even few months after the commercial s/w release in certain cases
>> due to critical bugs were found in some usecases which warrants the changes.
> 
> So, can one handle such changes? Are we going to publish a list of
> kernels to be used with the corresponding firmware images? Then what
> if the developer wants to update just the kernel? Just to get this or
> that non-platform-related feature. Or vice versa, what if the user is
> stuck with an older kernel because some driver gets broken in the main
> branch (which unfortunately happens sometimes)  Or what if the memory
> map patch gets backported via the AUTOSEL process?
> Unlike the Qualcomm binary distributions, the firmware and the kernel
> version are no longer connected.
> 
> That's why I keep on saying that memory map is an ABI. If it gets
> changed, it is a completely new, incompatible platform.

I don't think that in-development platform should be treated it such. Like
other ABIs we can mark the board as experimental before they get frozen.

I see ABIs in the kernel which starts w/ the EXPERIMENTAL before they
get stable state, so why not these platforms? I don't want to discourage
SOC vendor developers from submitting their platforms. 

Let's just mark these boards as EXPERIMENTAL in the Kconfig or anywhere
else we decide. 

-- 
---Trilok Soni


