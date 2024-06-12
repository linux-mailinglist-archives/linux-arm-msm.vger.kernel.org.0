Return-Path: <linux-arm-msm+bounces-22389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8B904E70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EF92831E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2564A16D33D;
	Wed, 12 Jun 2024 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8BL+cqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322016D33A;
	Wed, 12 Jun 2024 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182104; cv=none; b=izG+ciEG2EN81XKSpCkd9Wa3/+uo3HjJG8ziVoXkVFoywGdVyNpxpl3m2o57dt/4TLf9wenr50RkVUItogPHb2JoOs7p8a3BgVU0k9UPzX1aZiSeY4yuRcu9rf6E1Xg4Ox0mYkMH4M4lVW5qocRY639jdVOQ1pSh7rQqcUKU6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182104; c=relaxed/simple;
	bh=3F/WlERHmnGgoTDaBuqDnp0G93kr8brnnmE5UHbts80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kkxt5BOUYve/7o2LHv5uEqnz/npip/Pqyo6V0uFAtqf6reYccmVIndCcXt3n+qLdCtd98IrPIbpmy2HckZjzrKNg25Lts//MCF3KBQegCmB+qZtw8PANgwDDQ+WHZTfwYse2gXw1MrMWHuelo5SCKUbYyMGUc0HnZ0l634/uhnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8BL+cqz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A01C3277B;
	Wed, 12 Jun 2024 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718182103;
	bh=3F/WlERHmnGgoTDaBuqDnp0G93kr8brnnmE5UHbts80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8BL+cqznkWMIxQA17NwXLf+71f87b//JRml+m9cMkSVXLEeq1niRgCINOEAKACfj
	 QE6/OLX5pdZ7kk7b6L/b0SCuGergeFo8ZkBntoE//qgZ+jhYRmdwIJ0VDUYKaO4CEk
	 8DacRxhEz2vNxhEowUbJUV/ZpsjKP93XaRR71YnfFbRdwcU19V/n1Ae43Gc+RwPFzW
	 NX5Q/bBi+uA1mzfD40R5jPK4hJk8F0DDGx64Hdpo0I14i+MkOY22P9FB6PUziJEzGv
	 7+0+0Q8gr4R+EcYYR238DllGxTbFYhtU80CIbxiQGvIrVdiu8zXJSMFHUcuiIi8Cjr
	 dlQ0iVvDzV53A==
Message-ID: <e24cfd23-6f77-46a0-b020-9cb3daef6930@kernel.org>
Date: Wed, 12 Jun 2024 11:48:17 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <a7194edd-a2c8-46fc-bea1-f26b0960e535@linaro.org>
 <Ziov6bWBXYXJ4Zp8@hu-varada-blr.qualcomm.com>
 <27f4f3dd-9375-40cf-8c8f-1c4edf66e31b@linaro.org>
 <ZjNdTmmXucjtRxJt@hu-varada-blr.qualcomm.com>
 <c015b3a5-2213-4ebd-b960-d97ed1fe7062@kernel.org>
 <ZjshR0ekcn0gxwOa@hu-varada-blr.qualcomm.com>
 <CAA8EJpqENsojPQmCbma_nQLEZq8nK1fz1K0JdtvLd=kPrH_DBw@mail.gmail.com>
 <1a08ef42-b52f-4c97-90d7-e7fdee7725b4@linaro.org>
 <Zmgb+OjdBNw71sC1@hu-varada-blr.qualcomm.com>
 <176137e5-6312-4d46-97b6-c4494bc1c61b@kernel.org>
 <ZmlAdETV0+6Md8HC@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <ZmlAdETV0+6Md8HC@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.24 9:30, Varadarajan Narayanan wrote:
> On Tue, Jun 11, 2024 at 02:29:48PM +0300, Georgi Djakov wrote:
>> On 11.06.24 12:42, Varadarajan Narayanan wrote:
>>> On Thu, Jun 06, 2024 at 04:06:01PM +0200, Konrad Dybcio wrote:
>>>> On 8.05.2024 10:10 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, 8 May 2024 at 09:53, Varadarajan Narayanan
>>>>> <quic_varada@quicinc.com> wrote:
>>>>>>
>>>>>> On Fri, May 03, 2024 at 04:51:04PM +0300, Georgi Djakov wrote:
>>>>>>> Hi Varada,
>>>>>>>
>>>>>>> Thank you for your work on this!
>>>>>>>
>>>>>>> On 2.05.24 12:30, Varadarajan Narayanan wrote:
>>>>>>>> On Tue, Apr 30, 2024 at 12:05:29PM +0200, Konrad Dybcio wrote:
>>>>>>>>> On 25.04.2024 12:26 PM, Varadarajan Narayanan wrote:
>>>>>>>>>> On Tue, Apr 23, 2024 at 02:58:41PM +0200, Konrad Dybcio wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 4/18/24 11:23, Varadarajan Narayanan wrote:
>>>>>>>>>>>> IPQ SoCs dont involve RPM in managing NoC related clocks and
>>>>>>>>>>>> there is no NoC scaling. Linux itself handles these clocks.
>>>>>>>>>>>> However, these should not be exposed as just clocks and align
>>>>>>>>>>>> with other Qualcomm SoCs that handle these clocks from a
>>>>>>>>>>>> interconnect provider.
>>>>>>>>>>>>
>>>>>>>>>>>> Hence include icc provider capability to the gcc node so that
>>>>>>>>>>>> peripherals can use the interconnect facility to enable these
>>>>>>>>>>>> clocks.
>>>>>>>>>>>>
>>>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>
>>>>>>>>>>> If this is all you do to enable interconnect (which is not the case,
>>>>>>>>>>> as this patch only satisfies the bindings checker, the meaningful
>>>>>>>>>>> change happens in the previous patch) and nothing explodes, this is
>>>>>>>>>>> an apparent sign of your driver doing nothing.
>>>>>>>>>>
>>>>>>>>>> It appears to do nothing because, we are just enabling the clock
>>>>>>>>>> provider to also act as interconnect provider. Only when the
>>>>>>>>>> consumers are enabled with interconnect usage, this will create
>>>>>>>>>> paths and turn on the relevant NOC clocks.
>>>>>>>>>
>>>>>>>>> No, with sync_state it actually does "something" (sets the interconnect
>>>>>>>>> path bandwidths to zero). And *this* patch does nothing functionally,
>>>>>>>>> it only makes the dt checker happy.
>>>>>>>>
>>>>>>>> I understand.
>>>>>>>>
>>>>>>>>>> This interconnect will be used by the PCIe and NSS blocks. When
>>>>>>>>>> those patches were posted earlier, they were put on hold until
>>>>>>>>>> interconnect driver is available.
>>>>>>>>>>
>>>>>>>>>> Once this patch gets in, PCIe for example will make use of icc.
>>>>>>>>>> Please refer to https://lore.kernel.org/linux-arm-msm/20230519090219.15925-5-quic_devipriy@quicinc.com/.
>>>>>>>>>>
>>>>>>>>>> The 'pcieX' nodes will include the following entries.
>>>>>>>>>>
>>>>>>>>>>           interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
>>>>>>>>>>                           <&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
>>>>>>>>>>           interconnect-names = "pcie-mem", "cpu-pcie";
>>>>>>>>>
>>>>>>>>> Okay. What about USB that's already enabled? And BIMC/MEMNOC?
>>>>>>>>
>>>>>>>> For USB, the GCC_ANOC_USB_AXI_CLK is enabled as part of the iface
>>>>>>>> clock. Hence, interconnect is not specified there.
>>>>>>>>
>>>>>>>> MEMNOC to System NOC interfaces seem to be enabled automatically.
>>>>>>>> Software doesn't have to turn on or program specific clocks.
>>>>>>>>
>>>>>>>>>>> The expected reaction to "enabling interconnect" without defining the
>>>>>>>>>>> required paths for your hardware would be a crash-on-sync_state, as all
>>>>>>>>>>> unused (from Linux's POV) resources ought to be shut down.
>>>>>>>>>>>
>>>>>>>>>>> Because you lack sync_state, the interconnects silently retain the state
>>>>>>>>>>> that they were left in (which is not deterministic), and that's precisely
>>>>>>>>>>> what we want to avoid.
>>>>>>>>>>
>>>>>>>>>> I tried to set 'sync_state' to icc_sync_state to be invoked and
>>>>>>>>>> didn't see any crash.
>>>>>>>>>
>>>>>>>>> Have you confirmed that the registers are actually written to, and with
>>>>>>>>> correct values?
>>>>>>>>
>>>>>>>> I tried the following combinations:-
>>>>>>>>
>>>>>>>> 1. Top of tree linux-next + This patch set
>>>>>>>>
>>>>>>>>       * icc_sync_state called
>>>>>>>>       * No crash or hang observed
>>>>>>>>       * From /sys/kernel/debug/clk/clk_summary can see the
>>>>>>>>         relevant clocks are set to the expected rates (compared
>>>>>>>>         with downstream kernel)
>>>>>>>>
>>>>>>>> 2. Top of tree linux-next + This patch set + PCIe enablement
>>>>>>>>
>>>>>>>>       * icc_sync_state NOT called
>>>>>>>
>>>>>>> If sync_state() is not being called, that usually means that there
>>>>>>> are interconnect consumers that haven't probed successfully (PCIe?)
>>>>>>> or their dependencies. That can be checked in /sys/class/devlink/.../status
>>>>>>> But i am not sure how this works for PCI devices however.
>>>>>>>
>>>>>>> You can also manually force a call to sync_state by writing "1" to
>>>>>>> the interconnect provider's /sys/devices/.../state_synced
>>>>>>>
>>>>>>> Anyway, the question is if PCIe and NSS work without this driver?
>>>>>>
>>>>>> No.
>>>>>>
>>>>>>> If they work, is this because the clocks are turned on by default
>>>>>>> or by the boot loader?
>>>>>>
>>>>>> Initially, the PCIe/NSS driver enabled these clocks directly
>>>>>> by having them in their DT nodes itself. Based on community
>>>>>> feedback this was removed and after that PCIe/NSS did not work.
>>>>>>
>>>>>>> Then if an interconnect path (clock) gets disabled either when we
>>>>>>> reach a sync_state (with no bandwidth requests) or we explicitly
>>>>>>> call icc_set_bw() with 0 bandwidth values, i would expect that
>>>>>>> these PCIe and NSS devices would not function anymore (it might
>>>>>>> save some power etc) and if this is unexpected we should see a
>>>>>>> a crash or hang...
>>>>>>>
>>>>>>> Can you confirm this?
>>>>>>
>>>>>> With ICC enabled, icc_set_bw (with non-zero values) is called by
>>>>>> PCIe and NSS drivers. Haven't checked with icc_set_bw with zero
>>>>>> values.
>>>>>>
>>>>>> PCIe:   qcom_pcie_probe -> qcom_pcie_icc_init -> icc_set_bw
>>>>>> NSS:    ppe_icc_init -> icc_set_bw
>>>>>>
>>>>>> I believe sync_state is not getting called since there is a
>>>>>> non-zero set bandwidth request. Which seems to be aligned with
>>>>>> your explanation.
>>>>>
>>>>> This doesn't look correct. sync_state is being called once all
>>>>> consumers are probed. It doesn't matter whether those consumers have
>>>>> non-zero bandwidth requests or no.
>>>>
>>>> /sys/kernel/debug/devices_deferred may have some useful info, too
>>>
>>> /sys/kernel/debug/devices_deferred seems to be empty
>>>
>>> 	# mount | grep -w debugfs
>>> 	none on /sys/kernel/debug type debugfs (rw,relatime)
>>>
>>> 	# cat /sys/kernel/debug/devices_deferred  | wc -l
>>> 	0
>>>
>>> Added the following print to icc_sync_state,
>>>
>>> 	@@ -1096,6 +1096,7 @@ void icc_sync_state(struct device *dev)
>>> 		struct icc_node *n;
>>> 		static int count;
>>>
>>> 	+	printk("--> %s: %d %d\n", __func__, providers_count, count);
>>> 		count++;
>>>
>>> 		if (count < providers_count)
>>> 			return;
>>>
>>> icc_sync_state seems to be called once,
>>>
>>> 	# dmesg | grep icc_sync_state
>>> 	[   12.260544] --> icc_sync_state: 2 0
>>>
>>> Since 'providers_count' is greated than 'count' icc_sync_state
>>> seems to return before doing anything.
>>
>> Is there also another interconnect provider on this platform, other
>> than the gcc? Check for DT nodes that have the #interconnect-cells
>> property.
> 
> Yes there are two interconnect providers
> 
> 	# find /proc/device-tree/ -name '#interconnect-cells'
> 	/proc/device-tree/soc@0/clock-controller@1800000/#interconnect-cells
> 	/proc/device-tree/soc@0/clock-controller@39b00000/#interconnect-cells
> 
> 	Note:	gcc => clock-controller@1800000
> 		nsscc => clock-controller@39b00000
> 
>> Are all providers probing successfully?
> 
> Yes. I printed the return value of their probe functions...
> 
> 	# dmesg | grep probe:
> 	[    0.037815] --> gcc_ipq9574_probe: return 0
> 	[    2.078215] --> nss_cc_ipq9574_probe: return 0
> 
> 
>> All providers must probe, as there might be paths that cross multiple
>> providers and we can't get into sync-state with a topology that is
>> only partially initialized.
> 
> It does look like both the providers' probe has completed. And,
> there aren't any paths that cross providers
> 
> 	interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
> 			<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
> 
> 	interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
> 			<&gcc MASTER_SNOC_PCIE3 &gcc SLAVE_SNOC_PCIE3>;
> 
> 	interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
> 			<&gcc MASTER_SNOC_PCIE2 &gcc SLAVE_SNOC_PCIE2>;
> 
> 	interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
> 			<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> 
> 	interconnects = <&nsscc MASTER_NSSNOC_PPE &nsscc SLAVE_NSSNOC_PPE>,
> 			<&nsscc MASTER_NSSNOC_PPE_CFG &nsscc SLAVE_NSSNOC_PPE_CFG>,
> 			<&gcc MASTER_NSSNOC_QOSGEN_REF &gcc SLAVE_NSSNOC_QOSGEN_REF>,
> 			<&gcc MASTER_NSSNOC_TIMEOUT_REF &gcc SLAVE_NSSNOC_TIMEOUT_REF>,
> 			<&gcc MASTER_MEM_NOC_NSSNOC &gcc SLAVE_MEM_NOC_NSSNOC>,
> 			<&gcc MASTER_NSSNOC_MEMNOC &gcc SLAVE_NSSNOC_MEMNOC>,
> 			<&gcc MASTER_NSSNOC_MEM_NOC_1 &gcc SLAVE_NSSNOC_MEM_NOC_1>;

Are the above consumers also probing successfully? Especially the one with
the nsscc paths? Is nss_cc_ipq9574 also using icc_sync_state? Sync state
will be called when all consumers of the specific provider are probed.

The idea of sync state is to allow all consumers to probe and to request
their paths. Only after that, the framework will take into account the
bandwidth values that has been requested from consumers and disable unused
paths.

Sorry, but i am doing a bit of guessing here as i am missing the complete
picture. So you add interconnect-cells to nsscc, but what is this DT node
that requests the nss and gcc paths? I am failing to find these on the
mailing lists.

BR,
Georgi

