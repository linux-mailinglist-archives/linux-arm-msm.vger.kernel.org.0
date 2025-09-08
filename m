Return-Path: <linux-arm-msm+bounces-72627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD4B497BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4AD3B6955
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7AB313E1A;
	Mon,  8 Sep 2025 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G6Q9XeQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2943323CB;
	Mon,  8 Sep 2025 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354393; cv=none; b=TIZRbF0FRsynqRjM3VVPiNtN9mcnTRKIQxaI9CXczEOepvSM3yIlgjWAf4DcDJtZQzfdzGx0MKOnaBqXijuiQwSPMzz9wqCKZk7oleiKeXKSd52iEtete3EvyLCjEbZAsyZLsf4USBMQ9Bjl+JeyN9PExgr7qzHOUZImH75So5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354393; c=relaxed/simple;
	bh=ZHvuOMEO3ukVoJNFDwKi/wgcyZbKLYo4GGFt3xieORk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l8TdM/lHFLXzMLjm9MnkGlxwPnd3K9cEq+Qco+tC4XbMzCtiRBvyRTVnGMapZS21UpkRv3TzUZOAzLJdVslEkSQ1mr3WQJAy3z8pvcY+2QnDsQBgq1JU9Lv0oCRpJLkt1aQL227EM5JwJO0mY0RBbKcAokiFEvYN7+hzK72EQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G6Q9XeQq; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588HxcpB106810;
	Mon, 8 Sep 2025 12:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757354378;
	bh=EU5GwglEyvepplMbXCqNsoY5dqOrAzJSIFT38Sqpqs0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=G6Q9XeQq/GVkMDmda26zeuVXWd3C/UlTFQfWTEs+zZh0C7FLXB6xbXPAmjNjHi6fc
	 90JMceCOryEZNb6Bz+i6BFkKArsFyprX7OciSzRMsc+0/S59W/vZFAmAMMnMdN7EO2
	 PlrNZaHExjVuIHkaIh24upVXgCgLJx3NH6aOsi6Q=
Received: from DFLE20.ent.ti.com (dfle20.ent.ti.com [10.64.6.57])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588HxcfG2574848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Sep 2025 12:59:38 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Sep
 2025 12:59:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Mon, 8 Sep
 2025 12:59:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 12:59:37 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Hxbk91301805;
	Mon, 8 Sep 2025 12:59:37 -0500
Message-ID: <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
Date: Mon, 8 Sep 2025 12:59:37 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
To: <rob.clark@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Viswanath Kraleti
	<viswanath.kraleti@oss.qualcomm.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
 <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 9/8/2025 9:19 AM, Rob Clark wrote:
> On Mon, Sep 8, 2025 at 6:39 AM Ryan Eatmon <reatmon@ti.com> wrote:
>>
>>
>>
>> On 9/6/2025 6:24 PM, Rob Clark wrote:
>>> On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
>>>>> From: Ryan Eatmon <reatmon@ti.com>
>>>>>
>>>>> The files generated by gen_header.py capture the source path to the
>>>>> input files and the date.  While that can be informative, it varies
>>>>> based on where and when the kernel was built as the full path is
>>>>> captured.
>>>>>
>>>>> Since all of the files that this tool is run on is under the drivers
>>>>> directory, this modifies the application to strip all of the path before
>>>>> drivers.  Additionally it prints <stripped> instead of the date.
>>>>>
>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>>>>> ---
>>>>> The files generated by gen_header.py include the source path to the
>>>>> input files and the build date. While this information can be useful,
>>>>> it inadvertently exposes build system configuration details in the
>>>>> binaries. This hinders binary reproducibility, as the output will
>>>>> vary if the build environment changes.
>>>>>
>>>>> This change was originally submitted to the linux-yocto-dev kernel [1]
>>>>> to address binary reproducibility QA errors. However, the fix is generic
>>>>> enough to be applicable to the mainline kernel and would benefit other
>>>>> distributions as well. So proposing it here for broader inclusion.
>>>>>
>>>>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
>>>>> ---
>>>>> Changes in v2:
>>>>> - Corrected author id
>>>>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
>>>>> ---
>>>>>    drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
>>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>
>>>>
>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>
>>>> Rob, WDYT?
>>>
>>> I'm revisiting this one, in the context of trying to re-sync
>>> gen_header.py with mesa.. but it is only changing the contents of
>>> comments, so it's not quite clear to me how this ends up mattering for
>>> binary reproducibility.
>>
>> The reason it matters is that for Yocto, the generated header file is
>> identified as a file that needs to be installed into the sysroot.  All
>> files going into the sysroot are checked to make sure they do not
>> contain dates and/or paths to the build directory contained within.
>> Since this is a generated header file that is included in the sysroot we
>> needed to strip out the path and date.
>>
>> The idea for the reproducible builds are that the same files on a
>> different a machine at a different time should produce 100% identical
>> files.  Including paths and dates violates that tenet.
>>
>> Hope that helps explain why we needed this.  So long as the
>> gen_header.py is being called to generate header files then we need to
>> maintain the reproducible aspect.
>>
> 
> My plan is (was?) to just replace the entire comment header with simply:
> 
>    /* Autogenerated file, DO NOT EDIT manually! */
> 
> That said, I'm not entirely sure why these files should get installed
> into the sysroot?  I'm not super hands-on familiar with Yocto, so
> maybe there is a good reason.. but if there is, maybe the plan to
> remove the license/etc from the comment header isn't such a good idea
> after all?

The generated header files would be part of a linux-headers package that 
would be needed to build other packages as part of the distro.  And so 
the header files are all checked against the rules.  A linux-headers 
type package is common for distros to have available.


> BR,
> -R
> 
>>
>>> That said, since the generated files are no longer checked in to mesa
>>> or the kernel, we could probably just drop all of this if it mattered.
>>>
>>> BR,
>>> -R
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
>>
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


