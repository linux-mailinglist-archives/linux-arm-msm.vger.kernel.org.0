Return-Path: <linux-arm-msm+bounces-91290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNYoKL+XfGmJNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:36:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8BBA1EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DE50300406F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D936C0B5;
	Fri, 30 Jan 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbyHDKe5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F0242D6C;
	Fri, 30 Jan 2026 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772987; cv=none; b=EMmde+ZxQF+FNDWa+BGvpCajyFKIW/fJXm8zxYIlb+lfJdtUf//mHXhx3e8JQZRCF/sPe6WJIm+H/6aZIcm2uR+J12NH9ATIxVN2JiWyQ7zliW2Cgow8zIANELqxNDMZv/Ux2OmP04ePeue5wkDSccE7himJnA7FlrUph8MUvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772987; c=relaxed/simple;
	bh=jyP8UFUCJn0UvJdr5ojW7aKqDlco0cu49Uk40l47+Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LM1FBKYa6JnsVVl+L8XdMdsgns4EJmdylwSnnIDfaX8DVQmt+K+PWOH+Ct/HMWdIz5B27O6S+ZJvKL2BTgb3B0pb9QBQQOypPWHyAAA4udqGUaDQllyfhPIFrgq0IkHnAw8GCTydmEYqJEDaD2qyL/ljZCvhnVjtDjSYdMXmOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbyHDKe5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96206C4CEF7;
	Fri, 30 Jan 2026 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769772986;
	bh=jyP8UFUCJn0UvJdr5ojW7aKqDlco0cu49Uk40l47+Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbyHDKe5McLn4+4STOatu2vO8QkmdOx2VdAt/YxLiZ/WNstO9/u7k+xh7/whlZ+NG
	 ylDxC1nfsSfs90DIQ6gxrwnM05UhO/WgBU/4zafwjvyfZiIfJ6dI7CS4u2LDb3FCFn
	 6DiZsnQkpxY0W4WmtFZqlFyHcdbB5vqVDF/eJf7Smu1yTmRllG13u7Bxr/8bE7TQKd
	 rPZEotZkwQoOiWNRvKCjlwwFOE9IZ1hvkldNXU/0tQUIrM21qdaj5pIu/GvbnuM9p8
	 cEV9gHbctgnaWQZTlftzlew2RlKFypA3bAoCdE0schv4qnID8LYCiJNB9m647/WSt+
	 IJEZ6fyUz+z6w==
Date: Fri, 30 Jan 2026 17:06:20 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
	mani@kernel.org, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Avoid probe deferring for un-supported
 ICE feature
Message-ID: <aXyXtK10_t-OBOxn@sumit-xelite>
References: <20260130091118.147379-1-sumit.garg@kernel.org>
 <4ad700f3-da8f-4175-9172-3fc4d87d8152@oss.qualcomm.com>
 <aXx_UDTkdYHY04FR@sumit-xelite>
 <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f629971-94cb-44aa-9502-4f5ebfd63937@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91290-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADB8BBA1EE
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 10:59:18AM +0100, Konrad Dybcio wrote:
> On 1/30/26 10:52 AM, Sumit Garg wrote:
> > On Fri, Jan 30, 2026 at 10:34:26AM +0100, Konrad Dybcio wrote:
> >> On 1/30/26 10:11 AM, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> ICE related SCM calls may not be supported in every TZ environment like
> >>> OP-TEE or a no-TZ environment too. So let's try to avoid probe deferring
> >>> when it's known that ICE feature isn't supported.
> >>>
> >>> This problem only came to notice after the inline encryption drivers were
> >>> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> >>> Enable SCSI UFS Crypto and Block Inline encryption drivers").
> >>>
> >>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> >>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>> ---
> >>>  drivers/soc/qcom/ice.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >>> index b203bc685cad..ab9586b8caf5 100644
> >>> --- a/drivers/soc/qcom/ice.c
> >>> +++ b/drivers/soc/qcom/ice.c
> >>> @@ -652,7 +652,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >>>  		dev_err(dev, "Cannot get ice instance from %s\n",
> >>>  			dev_name(&pdev->dev));
> >>>  		platform_device_put(pdev);
> >>> -		return ERR_PTR(-EPROBE_DEFER);
> >>> +		return NULL;
> >>
> >> Wouldn't this wreck the "actually need to defer" case, i.e.
> >>
> >>
> >> qcom,ufs probes first
> >>   calls devm_of_qcom_ice_get()
> >>     "ice" reg is missing, non-legacy case
> >>       qcom,ice is absent (not yet probed)
> >>         return NULL
> >>
> >> ...
> >>
> >> qcom,ice probes
> >>
> >> ?
> > 
> > Since qcom,ufs depends on qcom,ice via a phandle, so isn't the probe
> > orderering automatically taken care off? Or that isn't the case here?
> 
> No, that's guaranteed by devlink only with certain properties.

Okay I see. The other alternate solution I can come up is following to
keep the deferred probing intact. Let me know your thoughts on this:

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index ab9586b8caf5..76bf9f94fbaf 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,

        if (!qcom_scm_ice_available()) {
                dev_warn(dev, "ICE SCM interface not found\n");
-               return NULL;
+               return ERR_PTR(-ENODEV);
        }

        engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
@@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
        }

        ice = platform_get_drvdata(pdev);
-       if (!ice) {
+       if (IS_ERR_OR_NULL(ice)) {
                dev_err(dev, "Cannot get ice instance from %s\n",
                        dev_name(&pdev->dev));
                platform_device_put(pdev);
-               return NULL;
+               if (PTR_ERR(ice) == -ENODEV)
+                       return NULL;
+               else
+                       return ERR_PTR(-EPROBE_DEFER);
        }

        link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
@@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
        }

        engine = qcom_ice_create(&pdev->dev, base);
-       if (IS_ERR(engine))
+       if (IS_ERR(engine) && PTR_ERR(engine) != -ENODEV)
                return PTR_ERR(engine);

        platform_set_drvdata(pdev, engine);

> In this case though, I think it could make sense to add it to the
> "suppliers" list in drivers/of/property.c.
> 
> I don't know if vendors adding their custom properties there is a
> pattern that +Rob will be happy about though..

Not sure if that's a shorter path as I would like to see fix for this
issue backported as well.

Aside, not sure how much stable ICE feature itself is as I got following
crash with QLI boot firmware on Kodiak:

[    5.172970] SError Interrupt on CPU6, code 0x00000000be000000 -- SError
[    5.172986] CPU: 6 UID: 0 PID: 241 Comm: (udev-worker) Tainted: G   M                6.19.0-rc5-next-20260115-gc1a0fee87a05 #9 PREEMPT 
[    5.172996] Tainted: [M]=MACHINE_CHECK
[    5.172999] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
[    5.173003] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    5.173010] pc : qcom_ice_create.part.0+0x6c/0x24c [qcom_ice]
[    5.173024] lr : qcom_ice_create.part.0+0xe4/0x24c [qcom_ice]
[    5.173035] sp : ffff8000810fb860
[    5.173037] x29: ffff8000810fb860 x28: ffff8000810fbcc0 x27: ffffb38718304084
[    5.173046] x26: 0000000000000000 x25: ffff8000810fbcc0 x24: ffff0000832ff068
[    5.173052] x23: 000000000000003d x22: 0000000000000000 x21: ffff00008144fc10
[    5.173058] x20: ffff0000832ff380 x19: ffff8000815e8000 x18: 000000000000000a
[    5.173063] x17: 000000000404006f x16: ffffb38728601480 x15: ffffb38729fbefc8
[    5.173068] x14: ffff8000815f1000 x13: ffffb3872a0ab208 x12: ffffb3872a0ab000
[    5.173073] x11: 0000000000008000 x10: 0000000000159ff8 x9 : 0000000000000003
[    5.173079] x8 : ffff00008083ccc0 x7 : 0000000000000000 x6 : 0000000000077064
[    5.173084] x5 : ffff8000810fb744 x4 : 0000000000000000 x3 : ffff0000832ff480
[    5.173089] x2 : ffff0000832ff540 x1 : ffff00008e0c8000 x0 : ffff00008083cc60
[    5.173096] Kernel panic - not syncing: Asynchronous SError Interrupt
[    5.173100] CPU: 6 UID: 0 PID: 241 Comm: (udev-worker) Tainted: G   M                6.19.0-rc5-next-20260115-gc1a0fee87a05 #9 PREEMPT 
[    5.173107] Tainted: [M]=MACHINE_CHECK
[    5.173109] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
[    5.173111] Call trace:
[    5.173113]  show_stack+0x18/0x30 (C)
[    5.173125]  dump_stack_lvl+0x60/0x80
[    5.173132]  dump_stack+0x18/0x24
[    5.173137]  vpanic+0xf8/0x2dc
[    5.173143]  abort+0x0/0x4
[    5.173149]  add_taint+0x0/0xbc
[    5.173154]  arm64_serror_panic+0x70/0x80
[    5.173161]  arm64_is_fatal_ras_serror+0x34/0xac
[    5.173167]  do_serror+0x58/0x74
[    5.173173]  el1h_64_error_handler+0x38/0x60
[    5.173184]  el1h_64_error+0x6c/0x70
[    5.173189]  qcom_ice_create.part.0+0x6c/0x24c [qcom_ice] (P)
[    5.173196]  qcom_ice_probe+0x58/0xa0 [qcom_ice]
[    5.173202]  platform_probe+0x5c/0xa4
[    5.173208]  really_probe+0xbc/0x2ac
[    5.173217]  __driver_probe_device+0x78/0x118
[    5.173225]  driver_probe_device+0x3c/0x178
[    5.173233]  __driver_attach+0x90/0x184
[    5.173241]  bus_for_each_dev+0x7c/0xdc
[    5.173248]  driver_attach+0x24/0x3c
[    5.173256]  bus_add_driver+0xe4/0x20c
[    5.173263]  driver_register+0x68/0x130
[    5.173271]  __platform_driver_register+0x20/0x2c
[    5.173276]  qcom_ice_driver_init+0x24/0x1000 [qcom_ice]
[    5.173283]  do_one_initcall+0x60/0x1d4
[    5.173289]  do_init_module+0x54/0x240
[    5.173296]  load_module+0x16fc/0x1c60
[    5.173302]  init_module_from_file+0xd8/0xf0
[    5.173309]  __arm64_sys_finit_module+0x1b8/0x334
[    5.173315]  invoke_syscall.constprop.0+0x40/0xf0
[    5.173320]  el0_svc_common.constprop.0+0x38/0xd8
[    5.173325]  do_el0_svc+0x1c/0x28
[    5.173329]  el0_svc+0x34/0x104
[    5.173337]  el0t_64_sync_handler+0xa0/0xe4
[    5.173346]  el0t_64_sync+0x198/0x19c
[    5.173352] SMP: stopping secondary CPUs
[    5.174472] Kernel Offset: 0x3386a7e00000 from 0xffff800080000000
[    5.174475] PHYS_OFFSET: 0xfff1000080000000
[    5.174478] CPU features: 0x600000,000b8001,4008c501,0400720b
[    5.174482] Memory Limit: none
[    5.175510] Calling EFI runtime from NMI context
[    5.177177] Calling EFI runtime from NMI context
[    5.178490] Calling EFI runtime from NMI context
[    5.179729] Calling EFI runtime from NMI context
[    5.180928] Calling EFI runtime from NMI context
[    5.182074] Calling EFI runtime from NMI context
[    5.183218] Calling EFI runtime from NMI context
[    5.184319] Calling EFI runtime from NMI context
[    5.185387] Calling EFI runtime from NMI context
[    5.186404] Calling EFI runtime from NMI context
[    5.569397] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

-Sumit

