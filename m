Return-Path: <linux-arm-msm+bounces-95181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOcmBrgVp2ncdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:09:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B291F46AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 18:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 408B03029A88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 17:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE2F370D7F;
	Tue,  3 Mar 2026 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8mjnHgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87505370D55;
	Tue,  3 Mar 2026 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557732; cv=none; b=im/T8txCO77gal3dG3e3PSgP12atP5Ova1izx2vFQz/Ck/t8hgO68+f2VHHgd2wx6pYjU53XpvA+I2kz5zpXyDy8GZJ9W+k0seimS35Ocy6nyCh/9RY4VLjVQhDsWmYaE+CcD0xsULrcMIBltYXdMaaougqpB952dGcFGNMVtnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557732; c=relaxed/simple;
	bh=0899M90yE/0vfANLYTT04NKHa3DPkxuOqYvMDDceb8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqKHf5HJMYTpdmhxUwHkQ9XKTuz0dHzfvxoY4jLrX1do5pbqr1CtItlAAJfIQbfLlXf5dojJoetYW/acsCC3euMT/uJI4UI90BLHJJk/huUXAsMWQeB0P9N648RggsMNZ2bsz/Vun0spnSbfLKHyw0beRgu8pMcL7yJypxZNb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8mjnHgd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F439C116C6;
	Tue,  3 Mar 2026 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557732;
	bh=0899M90yE/0vfANLYTT04NKHa3DPkxuOqYvMDDceb8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8mjnHgdiWS4kMcax+ziRaVDeeSCgxeiSb9TJmljKvMagNWMQbJWh7HIhnoPMez3i
	 pWkrLrRu69ZaD32Pt2BAqDoElnIjgNVihGK/XxqJagSUf/TKn8stl/luFbMI30/QkL
	 j7lzx/cM59q1c6XQLcCX5tgY4Ec0QZOJqJ4T3oyTAoKqXqxBLLmQBhC451rolwG3Pg
	 ZuaCVD018omKxsdz1PnKKWodPvFzhwG+JNazI82kNatuN707f9blL1Ki/DhIfD5uVS
	 NMhMK8ZkOJByX9C3wMnepLJDYI4V1dGbiiEpsq0+qg1XWgHcM+FurX5uy0SsXyVA2z
	 Pa6/HgTKoVcKA==
Date: Tue, 3 Mar 2026 22:38:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, cros-qcom-dts-watchers@chromium.org, 
	Brian Masney <bmasney@redhat.com>, Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and
 clock voting calls for ICE
Message-ID: <4a76fuanyf45d56p64qmc7c3qcovbzt7jc27uern4lr4bchl6n@l6buzvakrrcg>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <vimd3tbnu4mr2uqporj7d4fv23aq2cb6e5een43yz5spe4u2xx@ufyzb2lzlc6j>
 <b32c7091-b2c4-443d-b58e-759b471f67db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b32c7091-b2c4-443d-b58e-759b471f67db@oss.qualcomm.com>
X-Rspamd-Queue-Id: A9B291F46AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95181-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:11:06PM +0530, Harshal Dev wrote:
> Hi Manivannan,
> 
> On 2/20/2026 8:14 PM, Manivannan Sadhasivam wrote:
> > On Fri, Jan 23, 2026 at 12:41:35PM +0530, Harshal Dev wrote:
> >> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> >> de-coupled from the QCOM UFS driver, it should explicitly vote for it's
> >> needed resources during probe, specifically the UFS_PHY_GDSC power-domain
> >> and the 'core' and 'iface' clocks.
> > 
> > You don't need to vote for a single power domain since genpd will do that for
> > you before the driver probes.
> >
> 
> Unfortunately, without enabling the power domain during probe, I am seeing occasional
> clock stuck messages on LeMans RB8. Am I missing something? Could you point me to any
> docs with more information on the the genpd framework?
> 

genpd_dev_pm_attach() called before a platform driver probe(), powers ON the
domain.

> Logs for reference:
> 
> [    6.195019] gcc_ufs_phy_ice_core_clk status stuck at 'off'
> [    6.195031] WARNING: CPU: 5 PID: 208 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x174/0x18c
> 
> [...]
> 
> [    6.248412] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    6.248415] pc : clk_branch_toggle+0x174/0x18c
> [    6.248417] lr : clk_branch_toggle+0x174/0x18c
> [    6.248418] sp : ffff80008217b770
> [    6.248419] x29: ffff80008217b780 x28: ffff80008217bbb0 x27: ffffadf880a5f07c
> [    6.248422] x26: ffffadf880a5c1d8 x25: 0000000000000001 x24: 0000000000000001
> [    6.248424] x23: ffffadf8a0d1e740 x22: 0000000000000001 x21: ffffadf8a1d06160
> [    6.248426] x20: ffffadf89f86e5a8 x19: 0000000000000000 x18: fffffffffffe9050
> [    6.248429] x17: 000000000404006d x16: ffffadf89f8166c4 x15: ffffadf8a1ab6c70
> [    6.347820] x14: 0000000000000000 x13: ffffadf8a1ab6cf8 x12: 000000000000060f
> [    6.355145] x11: 0000000000000205 x10: ffffadf8a1b11d70 x9 : ffffadf8a1ab6cf8
> [    6.362470] x8 : 00000000ffffefff x7 : ffffadf8a1b0ecf8 x6 : 0000000000000205
> [    6.369795] x5 : ffff000ef1ceb408 x4 : 40000000fffff205 x3 : ffff521650ba3000
> [    6.377120] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000928dd780
> [    6.384444] Call trace:
> [    6.386962]  clk_branch_toggle+0x174/0x18c (P)
> [    6.391530]  clk_branch2_enable+0x1c/0x28
> [    6.395644]  clk_core_enable+0x6c/0xac
> [    6.399502]  clk_enable+0x2c/0x4c
> [    6.402913]  devm_clk_get_optional_enabled+0xac/0x108
> [    6.408096]  qcom_ice_create.part.0+0x50/0x2fc [qcom_ice]
> [    6.413646]  qcom_ice_probe+0x58/0xa8 [qcom_ice]
> [    6.418384]  platform_probe+0x5c/0x98
> [    6.422153]  really_probe+0xbc/0x29c
> [    6.425826]  __driver_probe_device+0x78/0x12c
> [    6.430307]  driver_probe_device+0x3c/0x15c
> [    6.434605]  __driver_attach+0x90/0x19c
> [    6.438547]  bus_for_each_dev+0x7c/0xe0
> [    6.442486]  driver_attach+0x24/0x30
> [    6.446158]  bus_add_driver+0xe4/0x208
> [    6.450013]  driver_register+0x5c/0x124
> [    6.453954]  __platform_driver_register+0x24/0x30
> [    6.458780]  qcom_ice_driver_init+0x24/0x1000 [qcom_ice]
> [    6.464229]  do_one_initcall+0x80/0x1c8
> [    6.468173]  do_init_module+0x58/0x234
> [    6.472028]  load_module+0x1a84/0x1c84
> [    6.475881]  init_module_from_file+0x88/0xcc
> [    6.480262]  __arm64_sys_finit_module+0x144/0x330
> [    6.485097]  invoke_syscall+0x48/0x10c
> [    6.488954]  el0_svc_common.constprop.0+0xc0/0xe0
> [    6.493790]  do_el0_svc+0x1c/0x28
> [    6.497203]  el0_svc+0x34/0xec
> [    6.500348]  el0t_64_sync_handler+0xa0/0xe4
> [    6.504645]  el0t_64_sync+0x198/0x19c
> [    6.508414] ---[ end trace 0000000000000000 ]---
> [    6.514544] qcom-ice 1d88000.crypto: probe with driver qcom-ice failed
>  
> >> Also updated the suspend and resume callbacks to handle votes on these
> >> resources.
> >>
> >> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> > 
> > Where is the Fixes tag?
> 
> Ack, I will add it in v2 of this patch.
> 
> > 
> >> ---
> >>  drivers/soc/qcom/ice.c | 20 ++++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >>
> >> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> >> index b203bc685cad..4b50d05ca02a 100644
> >> --- a/drivers/soc/qcom/ice.c
> >> +++ b/drivers/soc/qcom/ice.c
> >> @@ -16,6 +16,8 @@
> >>  #include <linux/of.h>
> >>  #include <linux/of_platform.h>
> >>  #include <linux/platform_device.h>
> >> +#include <linux/pm.h>
> >> +#include <linux/pm_runtime.h>
> >>  
> >>  #include <linux/firmware/qcom/qcom_scm.h>
> >>  
> >> @@ -108,6 +110,7 @@ struct qcom_ice {
> >>  	void __iomem *base;
> >>  
> >>  	struct clk *core_clk;
> >> +	struct clk *iface_clk;
> >>  	bool use_hwkm;
> >>  	bool hwkm_init_complete;
> >>  	u8 hwkm_version;
> >> @@ -310,12 +313,20 @@ int qcom_ice_resume(struct qcom_ice *ice)
> >>  	struct device *dev = ice->dev;
> >>  	int err;
> >>  
> >> +	pm_runtime_get_sync(dev);
> > 
> > This is not needed as the power domain would be enabled at this point.
> 
> Would this be enabled due to the genpd framework? I am not observing that
> during probe. Because this call is made by the UFS/EMMC driver, perhaps you
> mean the situation at this point is different?
> 

If you pass 'power-domains' property in DT, genpd will power it ON at this
point.

> > 
> >>  	err = clk_prepare_enable(ice->core_clk);
> >>  	if (err) {
> >>  		dev_err(dev, "failed to enable core clock (%d)\n",
> >>  			err);
> >>  		return err;
> >>  	}
> >> +
> >> +	err = clk_prepare_enable(ice->iface_clk);
> >> +	if (err) {
> >> +		dev_err(dev, "failed to enable iface clock (%d)\n",
> >> +			err);
> >> +		return err;
> >> +	}
> > 
> > Use clk_bulk API to enable all clocks in one go.
> 
> Ack, I'll use clk_bulk_prepare_enable().
> 
> > 
> >>  	qcom_ice_hwkm_init(ice);
> >>  	return qcom_ice_wait_bist_status(ice);
> >>  }
> >> @@ -323,7 +334,9 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
> >>  
> >>  int qcom_ice_suspend(struct qcom_ice *ice)
> >>  {
> >> +	clk_disable_unprepare(ice->iface_clk);
> > 
> > Same here.
> 
> Ack, clk_bulk_disable_unprepare() would look good.
> As Konrad pointed out, if iface clock is not present in DT, thse APIs are
> fine with NULL pointers here.
> 
> > 
> >>  	clk_disable_unprepare(ice->core_clk);
> >> +	pm_runtime_put_sync(ice->dev);
> > 
> > Not needed.
> > 
> >>  	ice->hwkm_init_complete = false;
> >>  
> >>  	return 0;
> >> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>  	if (IS_ERR(engine->core_clk))
> >>  		return ERR_CAST(engine->core_clk);
> >>  
> >> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
> >> +	if (IS_ERR(engine->iface_clk))
> >> +		return ERR_CAST(engine->iface_clk);
> >> +
> > 
> > Same here. Use devm_clk_bulk_get_all_enabled().
> 
> As per discussion on the DT binding patch, I can do this once we decide to break the
> DT backward compatibility with a subsequent patch which makes both clocks mandatory.
> For v2, I am planning to continue to treat the 'iface' clock as optional via
> devm_clk_get_optional() API.
> 

Even if you do not mark 'iface' as 'required', this API will work just fine. It
will get and enable whatever clocks defined in the DT node. It is upto the
binding to define, what all should be present.

> > 
> >>  	if (!qcom_ice_check_supported(engine))
> >>  		return ERR_PTR(-EOPNOTSUPP);
> >>  
> >> @@ -725,6 +742,9 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >>  		return PTR_ERR(base);
> >>  	}
> >>  
> >> +	devm_pm_runtime_enable(&pdev->dev);
> >> +	pm_runtime_get_sync(&pdev->dev);
> > 
> > If you want to mark & enable the runtime PM status, you should just do:
> > 
> > 	devm_pm_runtime_set_active_enabled();	
> > 
> > But this is not really needed in this patch. You can add it in a separate patch
> > for the sake of correctness.
> 
> If my understanding is correct, I need to call pm_runtime_get_sync() to enable
> the power domain after enabling the PM runtime to ensure further calls to enable
> the iface clock do not encounter failure. Just calling devm_pm_runtime_set_active_enabled()
> will only enable the PM runtime and set it's status to 'active'. It will not enable
> the power domain.
> 

Again, you DO NOT need to handle a single power domain in the driver, genpd will
do it for you. If that is not helping, then something else is going wrong.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

