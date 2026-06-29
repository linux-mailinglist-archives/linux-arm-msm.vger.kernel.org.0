Return-Path: <linux-arm-msm+bounces-115218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /p5SDXC7QmpKAQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 20:37:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E26DE164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 20:37:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OCc7RPq7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115218-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115218-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 972F13008E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6E339A048;
	Mon, 29 Jun 2026 18:37:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F02773D3;
	Mon, 29 Jun 2026 18:37:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758252; cv=none; b=jBJEFKi1OuqR6MW/jTs/HT3pRT70FddlL5gvjDltL8jbpqF9gTWJV6Gipk/14jbWk4V9i1bINQy0sBU9X4drKbQxwCTjrRkUImM1d/YHrBxl1vWYoeUJjitJgRBRt1y5Bn5vZfA46kclygYFhbvAH/ox9DnI5zM7gN9xANL+q7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758252; c=relaxed/simple;
	bh=U/GD3njGPJZ6cyC69hIyOZoHm8SMjBNpuBG1/Y/igqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9orOMZxyNJ255rR+A9Hyujfkl1AlieH0Urqn5x1r+trNn6Egi32E78DvbYkKa8uZOxRdWHgHD5Y/nDVg9f9JyHe79OZSXbx5ZK77dhbuL5kvG74yVDxuwGCnxelgFs1eY/frr+/ywseAfsI0oBIXxUoiWPfBU8hXqNlzl+O0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCc7RPq7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BED1F000E9;
	Mon, 29 Jun 2026 18:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782758250;
	bh=XPiPL74SAk+eqBZk4tlvJWkRykwdPpKnj7n4ELAjaCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OCc7RPq7MpD/xjWQlz2RCGwTT16lLKAYQ9WcZgmVoMhM5jZ4MkUQ5IhrqvCoZLSua
	 E5EliCwA3upMoR7bbt5N6jfkrIHfxxmBZTUBkw304ZGoqln7qaqwoF/9dSu0+knBzD
	 hiuh4joLze0JlBVrP7E+y9+bBdf7m2gsJMJHEP9WTBePLfyfmDaVGqTcZEgzOii1dq
	 WFXuICp21eTQtv04ZKABgixnb2URSe9tHcuLXdCdDrhyi+ZcE80UAlpSQaVENlf6wV
	 lpSOEUQl9Zn44rUFqYt2m2msgOWcFi85HcZ1sqALiXMcrsQfNormch4BT0dEPoGtUS
	 W1QBfg0zcizXQ==
Message-ID: <a2b90b4b-bcc1-49d1-b44f-1932d3f79dbe@kernel.org>
Date: Mon, 29 Jun 2026 20:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: implement sync_state support
To: dongxuyang@eswincomputing.com, Brian Masney <bmasney@redhat.com>,
 Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Min Lin <linmin@eswincomputing.com>
References: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
 <20260617092538.1098-1-dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260617092538.1098-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dongxuyang@eswincomputing.com,m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,m:linmin@eswincomputing.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-115218-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,eswincomputing.com:email,oldschoolsolutions.biz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 959E26DE164

On 17/06/2026 11:25, dongxuyang@eswincomputing.com wrote:
>>
>> The existing support for disabling unused clks runs in the late initcall
>> stage, and it has been known for a long time that this is broken since
>> it runs too early in the boot up process. It doesn't work for kernel
>> modules, and it also doesn't work if all of the consumers haven't fully
>> probed yet. Folks have long recommended to boot certain platforms with
>> clk_ignore_unused to work around issues with disabling unused clks.
>>
>>
>> Let's go ahead and add a framework-level sync_state callback for the clk
>> subsystem. If a driver doesn't have a sync_state callback configured,
>> which is the 99+% use case today, then let's set it up to use the
>> clk_sync_state() introduced in this commit so that no driver changes
>> are needed.
>>
>>
>> At the time of this writing, there are currently only 7 clk drivers that
>> implement sync_state, and all are Qualcomm SoCs where they interact with
>> the interconnect framework via icc_sync_state(). A shared helper has
>> been created for this platform that calls clk_sync_state(). It is
>> expected that any new clk drivers that want to implement their own
>> sync_state will also need to call clk_sync_state() at the end of their
>> custom sync_state callback.
>>
>>
>> There will be several stages of disabling unused clks:
>>
>>
>> - The first phase will be executed at late_initcall and it will only
>>   disable unused clks that do not have a struct dev.
>> - The sync_state callback will be invoked for each clk driver once all
>>   consumers have probed.
>>
>>
>> This is based on previous attempts by Saravana Kannan and Abel Vesa
>> that are linked below.
>>
>>
>> This change was tested on a Thinkpad x13s laptop.
>>
>>
>>     [    0.308051] clk: Disabling unused clocks not associated with a device
>>     [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
>>     [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
>>     [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
>>     [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
>>     [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
>>     [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
>>     [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
>>     [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
>>     [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
>>     [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
>>     [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
>>     [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
>>     [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
>>     [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
>>     [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
>>     [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks
>>
>>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>> Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
>> Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
>> Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
>> ---
>>  drivers/clk/clk.c | 72 ++++++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 59 insertions(+), 13 deletions(-)
>>
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 9cb2b42d1be4..7a15cceec620 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -1442,14 +1442,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
>>  	clk_core_unprepare_lock(core);
>>  }
>>  
>> -static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>> +/*
>> + * Returns true if @core should be skipped during an unused-clock sweep for
>> + * @dev.  When @dev is NULL the sweep is the global late_initcall pass; when
>> + * @dev is non-NULL the sweep is a per-device sync_state pass.
>> + */
>> +static bool clk_core_skip_unused(struct clk_core *core, struct device *dev)
>> +{
>> +	/*
>> +	 * At late_initcall, skip clocks that belong to a device — they will be
>> +	 * handled at sync_state time.
>> +	 */
>> +	if (!dev && core->dev)
>> +		return true;
>> +
>> +	/* When called from sync_state, only process clocks for this device. */
>> +	if (dev && core->dev != dev)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static void clk_unprepare_unused_subtree(struct clk_core *core,
>> +					 struct device *dev)
>>  {
>>  	struct clk_core *child;
>>  
>>  	lockdep_assert_held(&prepare_lock);
>>  
>>  	hlist_for_each_entry(child, &core->children, child_node)
>> -		clk_unprepare_unused_subtree(child);
>> +		clk_unprepare_unused_subtree(child, dev);
>> +
>> +	if (clk_core_skip_unused(core, dev))
>> +		return;
>>  
>>  	if (core->prepare_count)
>>  		return;
>> @@ -1467,7 +1492,8 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>>  	}
>>  }
>>  
>> -static void __init clk_disable_unused_subtree(struct clk_core *core)
>> +static void clk_disable_unused_subtree(struct clk_core *core,
>> +				       struct device *dev)
>>  {
>>  	struct clk_core *child;
>>  	unsigned long flags;
>> @@ -1475,7 +1501,10 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>>  	lockdep_assert_held(&prepare_lock);
>>  
>>  	hlist_for_each_entry(child, &core->children, child_node)
>> -		clk_disable_unused_subtree(child);
>> +		clk_disable_unused_subtree(child, dev);
>> +
>> +	if (clk_core_skip_unused(core, dev))
>> +		return;
>>  
>>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
>>  		clk_core_prepare_enable(core->parent);
>> @@ -1508,7 +1537,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>>  		clk_core_disable_unprepare(core->parent);
>>  }
>>  
>> -static bool clk_ignore_unused __initdata;
>> +static bool clk_ignore_unused;
>>  static int __init clk_ignore_unused_setup(char *__unused)
>>  {
>>  	clk_ignore_unused = true;
>> @@ -1516,7 +1545,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
>>  }
>>  __setup("clk_ignore_unused", clk_ignore_unused_setup);
>>  
>> -static int __init clk_disable_unused(void)
>> +static int __clk_disable_unused(struct device *dev)
>>  {
>>  	struct clk_core *core;
>>  	int ret;
>> @@ -1526,7 +1555,10 @@ static int __init clk_disable_unused(void)
>>  		return 0;
>>  	}
>>  
>> -	pr_info("clk: Disabling unused clocks\n");
>> +	if (dev)
>> +		dev_info(dev, "clk: Disabling unused clocks\n");
>> +	else
>> +		pr_info("clk: Disabling unused clocks not associated with a device\n");
>>  
>>  	ret = clk_pm_runtime_get_all();
>>  	if (ret)
>> @@ -1538,16 +1570,16 @@ static int __init clk_disable_unused(void)
>>  	clk_prepare_lock();
>>  
>>  	hlist_for_each_entry(core, &clk_root_list, child_node)
>> -		clk_disable_unused_subtree(core);
>> +		clk_disable_unused_subtree(core, dev);
>>  
>>  	hlist_for_each_entry(core, &clk_orphan_list, child_node)
>> -		clk_disable_unused_subtree(core);
>> +		clk_disable_unused_subtree(core, dev);
>>  
>>  	hlist_for_each_entry(core, &clk_root_list, child_node)
>> -		clk_unprepare_unused_subtree(core);
>> +		clk_unprepare_unused_subtree(core, dev);
>>  
>>  	hlist_for_each_entry(core, &clk_orphan_list, child_node)
>> -		clk_unprepare_unused_subtree(core);
>> +		clk_unprepare_unused_subtree(core, dev);
>>  
>>  	clk_prepare_unlock();
>>  
>> @@ -1555,11 +1587,16 @@ static int __init clk_disable_unused(void)
>>  
>>  	return 0;
>>  }
>> +
>> +static int __init clk_disable_unused(void)
>> +{
>> +	return __clk_disable_unused(NULL);
>> +}
>>  late_initcall_sync(clk_disable_unused);
>>  
>>  void clk_sync_state(struct device *dev)
>>  {
>> -	/* Will fill in */
>> +	__clk_disable_unused(dev);
>>  }
>>  EXPORT_SYMBOL_GPL(clk_sync_state);
>>  
>> @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>>  	core->dev = dev;
>>  	clk_pm_runtime_init(core);
>>  	core->of_node = np;
>> -	if (dev && dev->driver)
>> +	if (dev && dev->driver) {
>>  		core->owner = dev->driver->owner;
>> +
>> +		/*
>> +		 * If a clk provider sets their own sync_state, then it needs to
>> +		 * also call clk_sync_state(). dev_set_drv_sync_state() won't
>> +		 * overwrite the sync_state callback, and this call will fail
>> +		 * with -EBUSY.
>> +		 */
>> +		dev_set_drv_sync_state(dev, clk_sync_state);
>> +	}
>>  	core->hw = hw;
>>  	core->flags = init->flags;
>>  	core->num_parents = init->num_parents;
> 
> Hi Brian,
> 
> Thank you for the patch set. I tested this in my tree on Sifive HiFive 
> Premier P550, and it behaved correctly.
> 
> Tested-by: Xuyang Dong <dongxuyang@eswincomputing.com> # hfp550

If I understand correctly your platform, you tested nothing. You
executed no code from common part and no code from the drivers listed
here. This is not a real test in such case.

When you test code, please actually be sure you execute the tested code.

I am afraid the tag is not applicable.

Best regards,
Krzysztof

