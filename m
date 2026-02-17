Return-Path: <linux-arm-msm+bounces-93079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ERRFyMjlGmqAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:13:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E5149C75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D606303A4BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734652EBB8F;
	Tue, 17 Feb 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYiqSEee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7062E040E;
	Tue, 17 Feb 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315940; cv=none; b=CqjjzE1sDYStOBXQ7b203VC953xa/IXyL3mb9/1z0+/kcSCw9mrWLa7p3y0Z0bvVRhTQWq2rGHytWh6AKHVBqKvIRyyu+An18OM+yOvvoRCLgPBODH8BhWKcsgQWC+nv4Z4q0fIty4CgLKc9tjq5Tv3jBypZqnHlAROIgfHllRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315940; c=relaxed/simple;
	bh=UH5HtdI+InW7CTtuYQT+VZBcOCaRIXE3JrvyGnMImaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT1GXDF9oRK9gHibhOsm3jN2izzZDM1fbNDctpX6loMWHEuwzC3RnOTIMCm7tLj19QKfAB+Q/ZQPZ+l51CsF1TvLL6mLmei/bkZRvvmNTd9nKDoM2UyTw36FwcNLVhQyXc3LXMwZSh/FEE856FtbG+ua68l50NZrWhp7rvJUsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYiqSEee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06D3C19421;
	Tue, 17 Feb 2026 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771315940;
	bh=UH5HtdI+InW7CTtuYQT+VZBcOCaRIXE3JrvyGnMImaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYiqSEeeuWO260yIg8CzeFvi3RG2e8a9s0tKzjiccpfw5lNY4TJs4ZFc+LWZbgttk
	 LaAC5ZP+Q80ZDpP2GsL0DG5X2CxaY54t3aY/mxZikL4tOrAvWQXyM8SYMp6qMUiOHE
	 spiqdpY759pVe2PNNXaKeEaGT/2kY1qcunQHu6DqMfT+2EwD97lqo/RnjgtDHZ5wuY
	 cXThh/YizhVoDYh49qgJD/odYxktYlG3hmEVMCDiILNnyPMJ+bfYAoFqJpXmzYm028
	 dDa+a4M7gJ1cBpXPtIWs/DX94Euu1XtSNTDtEl8CMsBpMiuOzrJAEhwBAtVYDNHkeY
	 S6lSJjdnp3Mfg==
Date: Tue, 17 Feb 2026 09:12:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Message-ID: <20260217-purring-ubiquitous-starfish-dfcabb@quoll>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93079-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: CE0E5149C75
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:25:22PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.

Fix what? It is perfectly fine to have things "undescribed". Explain
what is the problem of these being missing.

> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6125.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Best regards,
Krzysztof


