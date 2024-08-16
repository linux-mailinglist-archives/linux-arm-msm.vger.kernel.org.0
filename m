Return-Path: <linux-arm-msm+bounces-28766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539E954331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 09:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B5E1C25246
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3EE144D1E;
	Fri, 16 Aug 2024 07:42:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B2E1448EB;
	Fri, 16 Aug 2024 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794129; cv=none; b=oLCLVtlUhQ0lNUSYKhtCEO+0zNQgJI8kKDgekJLb7DCLSk9rAojLOM2WyB45AUWT0gf+P5bJxEvT34PFY5x91mLcS0Iu7IGdtJQcLUf6BRoxnuPJlJj0bCRU6AhfIfrpXvGOkM4aSJ1SFb/84H0wHevVOYbf7KJvnVCychqq06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794129; c=relaxed/simple;
	bh=71714VbQ+BlxKUx9p0xPBiDs9trNBypsFVhfzoyUX7M=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=W6OB4I8JFx2XCOoku85PmTFrwVikaP6RPvMk2seO7cv5c0Nf9rNiIdy+REdn7AIED5EvKlMiD8EW07bdxCC7e6//MaQ2GQX2wRq+aJtjHiJWdLCni0J6xatUujhTNwTbjbPsqEfJ63PzXsbgU481dqL7cAB4coAw0EDk8w1Xv4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WlYpL2ddlz1T7Rm;
	Fri, 16 Aug 2024 15:41:30 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AB7518006C;
	Fri, 16 Aug 2024 15:42:02 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 16 Aug 2024 15:42:01 +0800
CC: <yangyicong@hisilicon.com>, Shuai Xue <xueshuai@linux.alibaba.com>, Jing
 Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jonathan Corbet
	<corbet@lwn.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
	<quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
	<quic_ramkri@quicinc.com>, <quic_parass@quicinc.com>,
	<quic_mrana@quicinc.com>
Subject: Re: [PATCH 3/4] perf/dwc_pcie: Always register for PCIe bus notifier
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-3-ca47d153e5b2@quicinc.com>
 <55303289-bb41-4e67-9912-4cf4335244ca@huawei.com>
 <2d882c88-fd56-c512-0dcc-8825ba920b51@quicinc.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <82a28788-eed8-6cff-c2ee-fb4b421ae53c@huawei.com>
Date: Fri, 16 Aug 2024 15:42:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2d882c88-fd56-c512-0dcc-8825ba920b51@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/8/16 11:51, Krishna Chaitanya Chundru wrote:
> 
> 
> On 8/15/2024 7:19 PM, Yicong Yang wrote:
>> On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
>>> When the PCIe devices are discovered late, the driver can't find
>>> the PCIe devices and returns in the init without registering with
>>> the bus notifier. Due to that the devices which are discovered late
>>> the driver can't register for this.
>>>
>>> Register for bus notifier even if the device is not found in init.
>>>
>>> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
>>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>> ---
>>>   drivers/perf/dwc_pcie_pmu.c | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
>>> index c115348b8d53..aa1010b44bcb 100644
>>> --- a/drivers/perf/dwc_pcie_pmu.c
>>> +++ b/drivers/perf/dwc_pcie_pmu.c
>>> @@ -741,8 +741,6 @@ static int __init dwc_pcie_pmu_init(void)
>>>             found = true;
>>>       }
>>> -    if (!found)
>>> -        return -ENODEV;
>>>         ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>>>                         "perf/dwc_pcie_pmu:online",
>>> @@ -753,9 +751,11 @@ static int __init dwc_pcie_pmu_init(void)
>>>         dwc_pcie_pmu_hp_state = ret;
>>>   -    ret = platform_driver_register(&dwc_pcie_pmu_driver);
>>> -    if (ret)
>>> -        goto platform_driver_register_err;
>>> +    if (!found) {
>>> +        ret = platform_driver_register(&dwc_pcie_pmu_driver);
>>> +        if (ret)
>>> +            goto platform_driver_register_err;
>>> +    }
>>>
>>
>> This doesn't match the commit.
>> > If any device is found at this stage, we cannot use them since you don't
>> register a driver.
>>
> If the device is not found then only we are skipping platform driver
> register otherwise driver will be registering with the platform driver.
> 

think about the case that devices already discovered before module init.
without the change here we'll register both the platform devices and driver
but with the change here we'll only register the platform devices without
the related driver to probe them.

Try to register the driver and notifier unconditionally will solve the issue.
It'll probe the device and register the PMU if later device is added by
the bus notifier.

Thanks.

> - Krishna Chaitanya.
>>>       ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
>>>       if (ret)
>>>
> 
> .

