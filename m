Return-Path: <linux-arm-msm+bounces-98921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBCFAgQxvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:35:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936C2D9AC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C3973092AE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210B33803CE;
	Fri, 20 Mar 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rTF2KC8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F537472A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006345; cv=none; b=GFBYepCsoFkxD8sSezGi5r/kSQPjzEPoppkhzCguDrASQG8FxCMT2Fdc+5F+zbldTpiZHgG8YgzcTArQ8so6b+HobDE9C5ks9RdbVz/bLOPduz+dD1Ln+FHntD6MvdiPF9ETHq55fu6PBv+WPgOEO4RltULriRuR9zQ0Su6pTm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006345; c=relaxed/simple;
	bh=+fL5mv3TZAmrovq/o10magmkmino24rOm1Q6+vAXjwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=lHrq31mmiMR5qG7U0g1aZhDrEYOEBss7j+IjrGaugV8qnTc6EDFzYTfzYrzO99U0dNpe4NpOZF1JvVH1x2SxQV5U/SDutW0yKWO0WOL9z2fOQhMXGtcHxeu6UD/8oYQOJ4vUJwYZQDmvcYai28kGijf/nFAWkrWxI0YNRWegRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rTF2KC8/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260320113220euoutp02dc96c066d1984ce5e1f38dc95738cdbe~eiV4TSjPQ1026410264euoutp02O
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:32:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260320113220euoutp02dc96c066d1984ce5e1f38dc95738cdbe~eiV4TSjPQ1026410264euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774006340;
	bh=LLty6+iwLl6TUkZPG7nqcBV+Iss3cBNP5/ejo4+dv6o=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rTF2KC8/zfe8DvaPBt6Dh7a+EjOvQQnFgjK1Cpl/EUAcxd/tDcKBFqkpGNJP+By/i
	 EcIFF7T9RS3irSzJgGp8nipgipHYd/TH1bjIKXo+pH13jZJ0qn6TFEAhLvfECPp8j9
	 XwAIsVRkHcEy7jQe+ZHVb1x56EX6dzhebIXvpEuQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35~eiV32pQkW1983419834eucas1p1_;
	Fri, 20 Mar 2026 11:32:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260320113218eusmtip1d4cc60bb6cfde824cf6094c66aa1c827~eiV23QJXY0992709927eusmtip1J;
	Fri, 20 Mar 2026 11:32:18 +0000 (GMT)
Message-ID: <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
Date: Fri, 20 Mar 2026 12:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Dmitry
	Baryshkov <lumag@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260312112321.370983-9-val@packett.cool>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
X-EPHeader: CA
X-CMS-RootMailID: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
References: <20260312112321.370983-1-val@packett.cool>
	<20260312112321.370983-9-val@packett.cool>
	<CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98921-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.530];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5936C2D9AC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 12.03.2026 12:12, Val Packett wrote:
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
>
> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
> Signed-off-by: Val Packett <val@packett.cool>

This patch landed in yesterday's linux-next as commit. In my tests I 
found that it triggers the following warning on RB5 board:

------------[ cut here ]------------
dsi0_phy_pll_out_dsiclk already disabled
WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x1ac/0x1bc, CPU#1: 
kworker/u32:6/120
Modules linked in: ...
CPU: 1 UID: 0 PID: 120 Comm: kworker/u32:6 Not tainted 7.0.0-rc1+ #12425 
PREEMPT
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : clk_core_disable+0x1ac/0x1bc
lr : clk_core_disable+0x1ac/0x1bc
sp : ffff800081a2b990
...
Call trace:
  clk_core_disable+0x1ac/0x1bc (P)
  __clk_set_parent_after+0x9c/0xf0
  clk_core_set_parent_nolock+0x1f8/0x230
  clk_set_parent+0x40/0x84
  of_clk_set_defaults+0x130/0x4b8
  platform_probe+0x38/0xac
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x40/0x164
  __device_attach_driver+0xa4/0x148
  bus_for_each_drv+0x80/0xdc
  __device_attach+0xa8/0x1b0
  device_initial_probe+0x50/0x54
  bus_probe_device+0x38/0xa8
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x20c/0x78c
  worker_thread+0x244/0x388
  kthread+0x140/0x14c
  ret_from_fork+0x10/0x20
irq event stamp: 336832
hardirqs last  enabled at (336831): [<ffffad391268b854>] 
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (336832): [<ffffad3911b6d8b4>] 
clk_enable_lock+0xcc/0x110
softirqs last  enabled at (336804): [<ffffad391134b884>] 
handle_softirqs+0x624/0x63c
softirqs last disabled at (336793): [<ffffad3911290674>] 
__do_softirq+0x14/0x20
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
dsi0_phy_pll_out_dsiclk already unprepared
WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0x1f0/0x210, 
CPU#6: kworker/u32:6/120

It looks like a bug in the code performing the default clocks 
configuration though.

> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index cdfdb2cfb02b..e59cdadd5647 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>   		.name = "disp_cc_mdss_pclk0_clk_src",
>   		.parent_data = disp_cc_parent_data_6,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>   		.ops = &clk_pixel_ops,
>   	},
>   };
> @@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>   		.name = "disp_cc_mdss_pclk1_clk_src",
>   		.parent_data = disp_cc_parent_data_6,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>   		.ops = &clk_pixel_ops,
>   	},
>   };

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


