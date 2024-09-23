Return-Path: <linux-arm-msm+bounces-32173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F303F97E4C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 04:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA352811A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 02:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73A210E9;
	Mon, 23 Sep 2024 02:25:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0732F624;
	Mon, 23 Sep 2024 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727058335; cv=none; b=Xd/eOjCUxo6mvfRc5I2A0HFI3rsNNKh+JQ0yoTEpWQfh1JV37ZLhjvFKL2aIeSX8I3rggnj38iHPEOz+SS8t2l8lxRSQMrlW8EJqRtC30z5aTf6HMKAntyxrLSEBzSagJlSHzQHjGmxPeW8GJIYnCa+X/+r33Es83YCZfyo6qF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727058335; c=relaxed/simple;
	bh=tuv/Eufnqn2f/+q9GttHygXKbvrfb9m337Oel0VJs1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y98JfhOKnHckCfXngG9hKIzQ2cUb1yGH3v/2qEaeqwLvXRj746/mmswngAQoKof2TcWXzDuoXLfQILLTjK1CSaFAwZ95uGEzLcuQNVTxvk6fki34BtlfcOUxqmd/9XYevzp4QPFGGoEwS5Ycq3S9sNFor5oqP9/9bUeHJsGbjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XBmvn5PxHz1HK1Y;
	Mon, 23 Sep 2024 10:21:41 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id A620C1A0188;
	Mon, 23 Sep 2024 10:25:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Sep 2024 10:25:28 +0800
Message-ID: <04cf9e68-ef69-dade-0b56-205a3aa4e653@huawei.com>
Date: Mon, 23 Sep 2024 10:25:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <stephan@gerhold.net>, <loic.poulain@linaro.org>,
	<ryazanov.s.a@gmail.com>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240920100711.2744120-1-ruanjinjie@huawei.com>
 <lqj3jfaelgeecf5yynpjxza6h4eblhzumx6rif3lgivfqhb4nk@xeft7zplc2xb>
 <Zu1uKR6v0pI5p01R@linaro.org>
 <CAA8EJprysL1Tn_SzyKaDgzSxzwDTdJo5Zx4jUEmE88qJ66vdFg@mail.gmail.com>
 <Zu165w1ZzLiRvXOp@linaro.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Zu165w1ZzLiRvXOp@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/9/20 21:38, Stephan Gerhold wrote:
> On Fri, Sep 20, 2024 at 03:05:13PM +0200, Dmitry Baryshkov wrote:
>> On Fri, 20 Sept 2024 at 14:44, Stephan Gerhold
>> <stephan.gerhold@linaro.org> wrote:
>>>
>>> On Fri, Sep 20, 2024 at 01:48:15PM +0300, Dmitry Baryshkov wrote:
>>>> On Fri, Sep 20, 2024 at 06:07:11PM GMT, Jinjie Ruan wrote:
>>>>> It's important to undo pm_runtime_use_autosuspend() with
>>>>> pm_runtime_dont_use_autosuspend() at driver exit time.
>>>>>
>>>>> But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
>>>>> is missing in the error path for bam_dmux_probe(). So add it.
>>>>
>>>> Please use devm_pm_runtime_enable(), which handles autosuspend.
>>>>
>>>
>>> This would conflict with the existing cleanup in bam_dmux_remove(),
>>> which probably needs to stay manually managed since the tear down order
>>> is quite important there.
>>
>> Hmm, the setup and teardown code makes me wonder now.
> 
> Yeah, you ask the right questions. :-) It's really tricky to get this
> 100% right. I spent quite some time to get close, but there are likely
> still some loopholes. I haven't heard of anyone running into trouble,
> though. This driver has been rock solid for the past few years.
> 
>> Are we guaranteed that the IRQs can not be delivered after suspending
>> the device?
> 
> I think bam_dmux_remove() should be safe. disable_irq(dmux->pc_irq)
> prevents any further delivery of IRQs before doing the final power off.
> 
>> Also is there a race between IRQs being enabled, manual check of the
>> IRQ state and the pc_ack / power_off calls?
> 
> Yes, I'm pretty sure this race exists in theory. I'm not sure how to
> avoid it. We would need an atomic "return current state and enable IRQ"
> operation, but I don't think this exists at the moment. Do you have any
> suggestions?

Maybe use IRQF_NO_AUTOEN flag to reuqest irq and enable_irq() after that?

> 
> Thanks,
> Stephan

