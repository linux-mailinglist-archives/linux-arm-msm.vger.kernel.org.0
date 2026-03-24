Return-Path: <linux-arm-msm+bounces-99535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFZxMJ0AwmkjYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:10:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A73018DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EF77311D0F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACB638D01D;
	Tue, 24 Mar 2026 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDVoeMVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D338D003;
	Tue, 24 Mar 2026 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321574; cv=none; b=YJFCz7R+WrXSlfpcWpprAVKvIbnA//JoclEJSVe5VK+PlGzmfLk1DNwRBnNdAZ7QkrLPBj6ylggXdofA4yLsLHWO7OeexBI+YbM7ieTojCP06jV8edJ1J6ODJnNVPR9rMaUQgO/30vJD3ujfCxgvoz4+GdwJDUJnghevS3a76Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321574; c=relaxed/simple;
	bh=Otm54ASjK0RBr3RF1WMY+rTCVZWTsGG5X2KkiI/YJWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrleA79xCerMr8K0NcIbctt1n10kZcttuBHd+okxS1nCzuPW87BdE8ikF65KlawCuZkxBaKiMt06NLdZykMcmtCyjRNBPpWPTEhl32MaQpZ11jyG8808ZkQFAUr86GgjgWxEOxRKWYCVWZHuflXk45RCFIBTpj7pn8I/xvIT42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDVoeMVy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185F3C4CEF7;
	Tue, 24 Mar 2026 03:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321573;
	bh=Otm54ASjK0RBr3RF1WMY+rTCVZWTsGG5X2KkiI/YJWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kDVoeMVyHlzDjb1MG2i3Sk2cqpg9URr2b9Qo2PPBUHplp3XWfoZKuG33MiAgY2APB
	 X9nyHYVV0GcMmp3BN88KnZFqToMQTL4jHqvtSOMG67lYgYqSphdU3sbSBKTmucjurv
	 Ced//Q5oSZxorPGPrgOottyrSX/wBhkZm9rsiSBaaHKL8iu6bD95lSkvGQxAXPkFwz
	 HrIrjYPCwR8OT/j4w2yQOrYKFRRD/4EZat2wtObm7EsKY4RyQ6I14t0cdzXuzcuaAD
	 NX3LgjWap56ct2klzwLnH6qBnPKBJ/O2WiITuimK1ITc41Rc0yPdpOEt7P1mRQW0MO
	 zGuP7rCQ7mHsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Date: Mon, 23 Mar 2026 22:05:56 -0500
Message-ID: <177432155620.28714.11572958087082246865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99535-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 504A73018DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 21 Mar 2026 17:50:28 +0800, Pengyu Luo wrote:
> Recently, when testing 10-bit dsi C-PHY panel, clks are different
> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
> 
> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
> 
> byteclk was set first to 108120000, so the vco rate was set to
> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
> 172992000 on mdss_pixel_clk_src later.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
      commit: 0f5c8f03d990f9be9908a08a701c324e113554d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

