Return-Path: <linux-arm-msm+bounces-52068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2E2A6A2D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C640046326A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7F5222572;
	Thu, 20 Mar 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LPBc6Cie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5511A5BBA;
	Thu, 20 Mar 2025 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463606; cv=none; b=QmCSmsnDUell7tI+zEJI1VGCFfgFdRgUkH4lVjRHeODxpAoLt39cSmlS8ZsdPSLntryewB5B7VFjxjqQ50objisrRF4jmyiRinfcU3ZjxprD5vYJ1PjdQLfm9NHcFROIp+BtnSUq7boAM2dm+ZdEFexB+a/xkqPogMoUFnykQKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463606; c=relaxed/simple;
	bh=YPSv+cPLzN2mLw9R5RCtzikphK6zub3UgEqVaeZdzmc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=JJ6zMQSrweMbgOlCKVz63g1D7B1whMB4xJF/Ns4d4+jvcDzYm3+FocoKVm45igg/G3y60qWhl8aj6ye07kwoAXe4tSLpugMFR215msoHxlf6gCvbh+NrN6PJKiMi9++yWmpzhQugPU/0C/jJa+qYLfIaOUnK6NCFta27jqPbGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LPBc6Cie; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K8rIOx025746;
	Thu, 20 Mar 2025 10:39:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	20q7a2xxFrdIQirIJS+Dwfid39JttP9IZBfIWTznNdo=; b=LPBc6CieKwit8O/y
	R3I9ufssXRDSwEOS8S1oSZIoTBa/vOxiHu/7kvnSsCb3eL1j3cKvMGUgaARi+qax
	fHD8FRlKwg2uBhkv2kScO/nn9NUdqecxDxqQHNwVOe39yTNW1fmiReyhmGHIKnlJ
	Y5x58LHPPPVTs9RmcMKue/MLSsWzyI14JbRnmGWHcJhVx0KO7nN0a8dvNeyGkGQO
	l7m5+Bgwgv87wT947Bwd9+X7F61gKGAyJLEIUIhv8OMjdM/DsQj1ucYqu0n+LDMg
	wbKtdfRZSw2ijUtvVJ4t22eOU6fstQIyQpQXtLRe2fWdGeDzsWiEOYjb7u3UN6xl
	bSvh2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuc8mxdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 10:39:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C44140059;
	Thu, 20 Mar 2025 10:38:20 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EAF07CB7B1;
	Thu, 20 Mar 2025 10:37:15 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:37:15 +0100
Received: from [10.252.18.22] (10.252.18.22) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:37:14 +0100
Message-ID: <05adb008-c4f0-4003-aef4-6ce6dbbfd392@foss.st.com>
Date: Thu, 20 Mar 2025 10:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <imx@lists.linux.dev>,
        Saravana Kannan <saravanak@google.com>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        <devicetree@vger.kernel.org>, Fabio Estevam
	<festevam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, <linux-kernel@vger.kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
 <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
 <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
Content-Language: en-US
Organization: STMicroelectronics
In-Reply-To: <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01



On 3/20/25 10:21, Arnaud POULIQUEN wrote:
> 
> 
> On 3/20/25 00:04, Rob Herring wrote:
>> On Wed, Mar 19, 2025 at 10:26 AM Arnaud POULIQUEN
>> <arnaud.pouliquen@foss.st.com> wrote:
>>>
>>> Hello Rob,
>>>
>>> On 3/18/25 00:24, Rob Herring (Arm) wrote:
>>>> Use the newly added of_reserved_mem_region_to_resource() and
>>>> of_reserved_mem_region_count() functions to handle "memory-region"
>>>> properties.
>>>>
>>>> The error handling is a bit different in some cases. Often
>>>> "memory-region" is optional, so failed lookup is not an error. But then
>>>> an error in of_reserved_mem_lookup() is treated as an error. However,
>>>> that distinction is not really important. Either the region is available
>>>> and usable or it is not. So now, it is just
>>>> of_reserved_mem_region_to_resource() which is checked for an error.
>>>>
>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>> For v6.16
>>>>
>>
>> [...]
>>
>>>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>>>> index b02b36a3f515..9d2bd8904c49 100644
>>>> --- a/drivers/remoteproc/stm32_rproc.c
>>>> +++ b/drivers/remoteproc/stm32_rproc.c
>>>> @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>>>>  {
>>>>       struct device *dev = rproc->dev.parent;
>>>>       struct device_node *np = dev->of_node;
>>>> -     struct of_phandle_iterator it;
>>>>       struct rproc_mem_entry *mem;
>>>> -     struct reserved_mem *rmem;
>>>>       u64 da;
>>>> -     int index = 0;
>>>> +     int index = 0, mr = 0;
>>>>
>>>>       /* Register associated reserved memory regions */
>>>> -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>>> -     while (of_phandle_iterator_next(&it) == 0) {
>>>> -             rmem = of_reserved_mem_lookup(it.node);
>>>> -             if (!rmem) {
>>>> -                     of_node_put(it.node);
>>>> -                     dev_err(dev, "unable to acquire memory-region\n");
>>>> -                     return -EINVAL;
>>>> -             }
>>>> +     while (1) {
>>>> +             struct resource res;
>>>> +             int ret;
>>>> +
>>>> +             ret = of_reserved_mem_region_to_resource(np, mr++, &res);
>>>> +             if (ret)
>>>> +                     return 0;
>>>>
>>>> -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
>>>> -                     of_node_put(it.node);
>>>> -                     dev_err(dev, "memory region not valid %pa\n",
>>>> -                             &rmem->base);
>>>> +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
>>>> +                     dev_err(dev, "memory region not valid %pR\n", &res);
>>>>                       return -EINVAL;
>>>>               }
>>>>
>>>>               /*  No need to map vdev buffer */
>>>> -             if (strcmp(it.node->name, "vdev0buffer")) {
>>>> +             if (strcmp(res.name, "vdev0buffer")) {
>>>
>>> I tested your patches
>>
>> Thank you.
>>
>>> The update introduces a regression here. The strcmp function never returns 0.
>>> Indeed, it.node->name stores the memory region label "vdev0buffer," while
>>> res.name stores the memory region name "vdev0buffer@10042000."
>>>
>>> Several remoteproc drivers may face the same issue as they embed similar code.
>>
>> Indeed. I confused myself because node 'name' is without the
>> unit-address, but this is using the full name. I've replaced the
>> strcmp's with strstarts() to address this. I've updated my branch with
>> the changes.
> 
> This is not enough as the remoteproc core function rproc_find_carveout_by_name()
> also compares the memory names. With the following additional fix, it is working
> on my STM32MP15-DK board.
> 
> @@ -309,11 +309,11 @@ rproc_find_carveout_by_name(struct rproc *rproc, const
> char *name, ...)
>  	vsnprintf(_name, sizeof(_name), name, args);
>  	va_end(args);
> 
>  	list_for_each_entry(carveout, &rproc->carveouts, node) {
>  		/* Compare carveout and requested names */
> -		if (!strcmp(carveout->name, _name)) {
> +		if (strstarts(carveout->name, _name)) {
>  			mem = carveout;
>  			break;
>  		}
>  	}
> 
> I just wonder if would not be more suitable to address this using the
> "memory-region-names" field.
> 
> The drawback is that we would break compatibility with legacy boards...

Errata:
The drawback is that we would break compatibility with legacy DTs...

> 
> I let Mathieu and Bjorn review and comment
> 
> 
> Else with the fix in rproc_find_carveout_by_name(),
> 
> -for the stm32_rproc:
> reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> tested-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> - for the st_remoteproc
> reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> Thanks,
> Arnaud
> 
> 
>>
>> Rob
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

