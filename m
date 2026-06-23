Return-Path: <linux-arm-msm+bounces-114061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g8LOD6fZOWq4yAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 02:56:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBDC6B3096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 02:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=I1KDKWzZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114061-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114061-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F86303AAA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 00:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5463859E0;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C258740D56A;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176159; cv=none; b=j0btPHUQl6kd/KiUkuxz3rBzjYj8IKz7Oh51Q7oowYSVHl/EtovT8zX0hCEQx7o16OKcfB9ilynInll/IrhLCX9hUAC8mi+4ifqWPS9Fs55/8HNA9R4FtwDC9GNciBdl0ByVlcF1V4d/ZAuyc0jGkIDgPJIxr90nRBFRz4eTYis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176159; c=relaxed/simple;
	bh=O3h+r3KMVJ2BTpp0cvTdaW3R2CnFXiiBiYPuDmFfHv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qb2nKIQMllQjQWLKN/UMjkCkhVsEMJXtlGsG7hqT9pCVXL8rP5oBOXnTiNO/k0AnVkcEPpWj5iejNetAiMlX48nydZdRqxoW1Q/aKoh2p4dOcmvvkon3hIxze3kwd4fjzgkgJ1+euo1/47d87D/xPfnuiTYo0bMHGPEsPitWaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1KDKWzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4974DC2BCC9;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=O3h+r3KMVJ2BTpp0cvTdaW3R2CnFXiiBiYPuDmFfHv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I1KDKWzZ05p2vEB9ZiL8dlaQ3Sv2kboq9k/QGP9FkaFIVFuhBXqU5q64AfynPYREy
	 6GSbxaQY7NqW+0Dtkrh/OTpNVXtvQaOlCPvgHbDT1zoCKO6eTJuomRf/+V1juEBsON
	 E6X9tKDK91rDM/C4lRmRbWrSpl+54SZf7V3H+pfOlYFet0fr53lShb8nZjTGEvLEcr
	 vPvqIx2c9NEYf2RVAOy7Qt9jl3aI4/rpGYJqEakwigcxI+SgxGPv90WIr3lhjurtFQ
	 fFQ0ujpsPYMjQW8Xgi4S/oXq/hYGzVCX9V9LIU6NMRyLBJhVsJ9xz+XKgGGyTVFBVf
	 JJCMgy1ksqBCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3191FCDB466;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:22 -0400
Subject: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=4544;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=Nkcn4urkSzO8xVsWhGDA3qPh5MIpKzECwfoMwJPmbeM=;
 b=2VndCX5WEP4sJ4zXlSVdNf635h5yO9ULJwd3imAAL8DT4Qlqv9EG9o460Gip0qDb6BehVETmC
 FjFevWKU9cfAwmUzfu0xC5f54vhpTPpbqMj+09WbWfzlJO1fcCFheS3
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114061-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,proton.me:replyto,proton.me:email,proton.me:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BBDC6B3096

From: Esteban Urrutia <esteuwu@proton.me>

Both of these changes allow the framebuffer to show upon boot and let
the mdss driver take over afterwards.
Before, none of these actions were possible. Only mdss takeover was
possible, but screen had to be turned off first.

OLE configuration may have been a misinterpretation... that's not
something that's done on the downstream driver.

Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
clk_rcg2_shared_no_init_park_ops fixes this warning as well:

[    0.075780] ------------[ cut here ]------------
[    0.075791] disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
[    0.075812] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#3: swapper/0/1
[    0.075840] Modules linked in:
[    0.075856] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S                  7.1.0-rc2+ #320 PREEMPT
[    0.075870] Tainted: [S]=CPU_OUT_OF_SPEC
[    0.075877] Hardware name: Motorola ThinkPhone by motorola (DT)
[    0.075887] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    0.075897] pc : update_config+0xd4/0xe4
[    0.075906] lr : update_config+0xd4/0xe4
[    0.075914] sp : ffff80008005b9f0
[    0.075921] x29: ffff80008005ba00 x28: 0000000000000004 x27: ffff000782892200
[    0.075937] x26: ffff0007823a46c0 x25: 0000000000000004 x24: ffffffffffffffff
[    0.075953] x23: ffff0007823a0240 x22: ffffdbc0a0940220 x21: ffffdbc0a0940220
[    0.075967] x20: ffffdbc0a0dcb388 x19: 0000000000000000 x18: 0000000000000048
[    0.075981] x17: 0000000000000014 x16: 0000000000010008 x15: fffffffffffea870
[    0.075996] x14: ffffdbc0a0c5d580 x13: ffffdbc0a0c5d600 x12: 00000000000001ee
[    0.076010] x11: fffffffffffea870 x10: fffffffffffea828 x9 : ffffdbc0a0c5d600
[    0.076024] x8 : 3fffffffffffefff x7 : ffffdbc0a0cb5600 x6 : 00000000000001ef
[    0.076038] x5 : 3ffffffffffff1ee x4 : 00000000000001ee x3 : 0000000000000000
[    0.076052] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00078066adc0
[    0.076067] Call trace:
[    0.076074]  update_config+0xd4/0xe4 (P)
[    0.076085]  clk_rcg2_shared_disable+0x50/0x80
[    0.076096]  clk_rcg2_shared_init+0x10/0x20
[    0.076107]  __clk_register+0x1b4/0x9ec
[    0.076118]  devm_clk_hw_register+0x5c/0xd4
[    0.076128]  devm_clk_register_regmap+0x44/0x84
[    0.076139]  qcom_cc_really_probe+0x304/0x514
[    0.076149]  disp_cc_sm8450_probe+0x104/0x200
[    0.076160]  platform_probe+0x5c/0xa4
[    0.076172]  really_probe+0xbc/0x2ac
[    0.076182]  __driver_probe_device+0x80/0x154
[    0.076193]  driver_probe_device+0x3c/0x184
[    0.076203]  __driver_attach+0x90/0x18c
[    0.076213]  bus_for_each_dev+0x7c/0xdc
[    0.076224]  driver_attach+0x24/0x30
[    0.076233]  bus_add_driver+0xe4/0x20c
[    0.076243]  driver_register+0x68/0x130
[    0.076251]  __platform_driver_register+0x20/0x2c
[    0.076260]  disp_cc_sm8450_driver_init+0x1c/0x28
[    0.076273]  do_one_initcall+0x60/0x1d4
[    0.076287]  kernel_init_freeable+0x24c/0x2d4
[    0.076299]  kernel_init+0x24/0x140
[    0.076311]  ret_from_fork+0x10/0x20
[    0.076323] ---[ end trace 0000000000000000 ]---

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/dispcc-sm8450.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 2e91332dd92a..b99d3eb5e195 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -614,7 +614,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
@@ -1824,8 +1824,8 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
 
-		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
-		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
+		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
+		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
 	} else {
 		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);

-- 
2.54.0



