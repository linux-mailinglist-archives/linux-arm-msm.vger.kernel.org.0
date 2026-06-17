Return-Path: <linux-arm-msm+bounces-113523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OvLDNmtoMmo3zgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:27:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5F697E53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:27:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113523-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113523-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F320300B84B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD56439FCBF;
	Wed, 17 Jun 2026 09:27:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86513947AE;
	Wed, 17 Jun 2026 09:26:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688423; cv=none; b=mnYcgEqzAHwu2+sT6vUWHE954kpDIK+kVBP872qN0e2KzDCy6zxU5V7Vx3Fz82taaswr+dWr6Km4DnOGLhVrRUsclCotj+kjEa/dz712DlHz0djPVHDD0+H50P7A8H7PqEf9R6BXAtBLssFJcnSC8/PNgV8wwg4vjp4zivUywlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688423; c=relaxed/simple;
	bh=4uspS+qzJUfvhm23h7VIAm7QzP8k+ERJkxgTiRQpW+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lX5KmL1J0wxpRhCbkit6IGEg92gExdpMKuxMOyUTegiqVRLamNxD+59q4JuQZRf5NSN9nOLzf69qLE3xYAoyghkTcCEex9ANBPmZSZf2vrWu9zFphf3NR4g9N9prsvAGKO9QOYBGWtt1o1lMfbs5aff90gs7NyzHF9CPCt85SLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgDn+55JaDJqaDIqAA--.45314S2;
	Wed, 17 Jun 2026 17:26:34 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: Brian Masney <bmasney@redhat.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Min Lin <linmin@eswincomputing.com>
Subject: Re: [PATCH 5/5] clk: implement sync_state support
Date: Wed, 17 Jun 2026 17:25:38 +0800
Message-Id: <20260617092538.1098-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
References: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDn+55JaDJqaDIqAA--.45314S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWxKryfXw17Jw18tF1rXrb_yoWfXryrpr
	WxAFy5Cr48XFWxWFnxXr1vyFnavw18KFyfWF15C3s7JFnxJrnakF4xC34UXF1DJrykC3y3
	ArWjyrn8uw4xtrJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVW8ZVWrXw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTR
	CeHqDUUUU
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,m:dongxuyang@eswincomputing.com,m:linmin@eswincomputing.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	FROM_NEQ_ENVFROM(0.00)[dongxuyang@eswincomputing.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER(0.00)[dongxuyang@eswincomputing.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113523-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oldschoolsolutions.biz:email,eswincomputing.com:email,eswincomputing.com:mid,eswincomputing.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51B5F697E53

> 
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> 
> Let's go ahead and add a framework-level sync_state callback for the clk
> subsystem. If a driver doesn't have a sync_state callback configured,
> which is the 99+% use case today, then let's set it up to use the
> clk_sync_state() introduced in this commit so that no driver changes
> are needed.
> 
> 
> At the time of this writing, there are currently only 7 clk drivers that
> implement sync_state, and all are Qualcomm SoCs where they interact with
> the interconnect framework via icc_sync_state(). A shared helper has
> been created for this platform that calls clk_sync_state(). It is
> expected that any new clk drivers that want to implement their own
> sync_state will also need to call clk_sync_state() at the end of their
> custom sync_state callback.
> 
> 
> There will be several stages of disabling unused clks:
> 
> 
> - The first phase will be executed at late_initcall and it will only
>   disable unused clks that do not have a struct dev.
> - The sync_state callback will be invoked for each clk driver once all
>   consumers have probed.
> 
> 
> This is based on previous attempts by Saravana Kannan and Abel Vesa
> that are linked below.
> 
> 
> This change was tested on a Thinkpad x13s laptop.
> 
> 
>     [    0.308051] clk: Disabling unused clocks not associated with a device
>     [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
>     [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
>     [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
>     [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
>     [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
>     [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
>     [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
>     [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
>     [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
>     [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
>     [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
>     [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
>     [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
>     [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
>     [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
>     [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks
> 
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
> Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
> Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
> ---
>  drivers/clk/clk.c | 72 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 13 deletions(-)
> 
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9cb2b42d1be4..7a15cceec620 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1442,14 +1442,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
>  	clk_core_unprepare_lock(core);
>  }
>  
> -static void __init clk_unprepare_unused_subtree(struct clk_core *core)
> +/*
> + * Returns true if @core should be skipped during an unused-clock sweep for
> + * @dev.  When @dev is NULL the sweep is the global late_initcall pass; when
> + * @dev is non-NULL the sweep is a per-device sync_state pass.
> + */
> +static bool clk_core_skip_unused(struct clk_core *core, struct device *dev)
> +{
> +	/*
> +	 * At late_initcall, skip clocks that belong to a device — they will be
> +	 * handled at sync_state time.
> +	 */
> +	if (!dev && core->dev)
> +		return true;
> +
> +	/* When called from sync_state, only process clocks for this device. */
> +	if (dev && core->dev != dev)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void clk_unprepare_unused_subtree(struct clk_core *core,
> +					 struct device *dev)
>  {
>  	struct clk_core *child;
>  
>  	lockdep_assert_held(&prepare_lock);
>  
>  	hlist_for_each_entry(child, &core->children, child_node)
> -		clk_unprepare_unused_subtree(child);
> +		clk_unprepare_unused_subtree(child, dev);
> +
> +	if (clk_core_skip_unused(core, dev))
> +		return;
>  
>  	if (core->prepare_count)
>  		return;
> @@ -1467,7 +1492,8 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>  	}
>  }
>  
> -static void __init clk_disable_unused_subtree(struct clk_core *core)
> +static void clk_disable_unused_subtree(struct clk_core *core,
> +				       struct device *dev)
>  {
>  	struct clk_core *child;
>  	unsigned long flags;
> @@ -1475,7 +1501,10 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  	lockdep_assert_held(&prepare_lock);
>  
>  	hlist_for_each_entry(child, &core->children, child_node)
> -		clk_disable_unused_subtree(child);
> +		clk_disable_unused_subtree(child, dev);
> +
> +	if (clk_core_skip_unused(core, dev))
> +		return;
>  
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
>  		clk_core_prepare_enable(core->parent);
> @@ -1508,7 +1537,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  		clk_core_disable_unprepare(core->parent);
>  }
>  
> -static bool clk_ignore_unused __initdata;
> +static bool clk_ignore_unused;
>  static int __init clk_ignore_unused_setup(char *__unused)
>  {
>  	clk_ignore_unused = true;
> @@ -1516,7 +1545,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
>  }
>  __setup("clk_ignore_unused", clk_ignore_unused_setup);
>  
> -static int __init clk_disable_unused(void)
> +static int __clk_disable_unused(struct device *dev)
>  {
>  	struct clk_core *core;
>  	int ret;
> @@ -1526,7 +1555,10 @@ static int __init clk_disable_unused(void)
>  		return 0;
>  	}
>  
> -	pr_info("clk: Disabling unused clocks\n");
> +	if (dev)
> +		dev_info(dev, "clk: Disabling unused clocks\n");
> +	else
> +		pr_info("clk: Disabling unused clocks not associated with a device\n");
>  
>  	ret = clk_pm_runtime_get_all();
>  	if (ret)
> @@ -1538,16 +1570,16 @@ static int __init clk_disable_unused(void)
>  	clk_prepare_lock();
>  
>  	hlist_for_each_entry(core, &clk_root_list, child_node)
> -		clk_disable_unused_subtree(core);
> +		clk_disable_unused_subtree(core, dev);
>  
>  	hlist_for_each_entry(core, &clk_orphan_list, child_node)
> -		clk_disable_unused_subtree(core);
> +		clk_disable_unused_subtree(core, dev);
>  
>  	hlist_for_each_entry(core, &clk_root_list, child_node)
> -		clk_unprepare_unused_subtree(core);
> +		clk_unprepare_unused_subtree(core, dev);
>  
>  	hlist_for_each_entry(core, &clk_orphan_list, child_node)
> -		clk_unprepare_unused_subtree(core);
> +		clk_unprepare_unused_subtree(core, dev);
>  
>  	clk_prepare_unlock();
>  
> @@ -1555,11 +1587,16 @@ static int __init clk_disable_unused(void)
>  
>  	return 0;
>  }
> +
> +static int __init clk_disable_unused(void)
> +{
> +	return __clk_disable_unused(NULL);
> +}
>  late_initcall_sync(clk_disable_unused);
>  
>  void clk_sync_state(struct device *dev)
>  {
> -	/* Will fill in */
> +	__clk_disable_unused(dev);
>  }
>  EXPORT_SYMBOL_GPL(clk_sync_state);
>  
> @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  	core->dev = dev;
>  	clk_pm_runtime_init(core);
>  	core->of_node = np;
> -	if (dev && dev->driver)
> +	if (dev && dev->driver) {
>  		core->owner = dev->driver->owner;
> +
> +		/*
> +		 * If a clk provider sets their own sync_state, then it needs to
> +		 * also call clk_sync_state(). dev_set_drv_sync_state() won't
> +		 * overwrite the sync_state callback, and this call will fail
> +		 * with -EBUSY.
> +		 */
> +		dev_set_drv_sync_state(dev, clk_sync_state);
> +	}
>  	core->hw = hw;
>  	core->flags = init->flags;
>  	core->num_parents = init->num_parents;

Hi Brian,

Thank you for the patch set. I tested this in my tree on Sifive HiFive 
Premier P550, and it behaved correctly.

Tested-by: Xuyang Dong <dongxuyang@eswincomputing.com> # hfp550

Best regards,
Xuyang Dong


