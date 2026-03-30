Return-Path: <linux-arm-msm+bounces-100855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADGNNwSjymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8835EABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7B9F30FF4C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0943E3D8904;
	Mon, 30 Mar 2026 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/ca/jBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E83D813E;
	Mon, 30 Mar 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886537; cv=none; b=NxIBlgi/F4CqX6WmB8AzyFJirW1g2magmD/V3sKJj/ZN9wKV6YhI2F7oMtfI8HSgp3/PXa+J32D3BW5jIacIz78huxTjuP8mCo6wUOHrblpkMH3YbE9LwuOEQk3iPiGwiXnmxwCctnf1GG9Yw7WaUyuDi5JGvT/xtFPls+ZOjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886537; c=relaxed/simple;
	bh=Pl696Uxs03SGxKpgXUMdYRlHfLrEmodLS+XEGz1OIbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KykagEisPX2NwoGnN2hm+0Sf//bAZjiu3jpH7383OlMHiwkvOkyNnHXhTDdblz2f7ZaTnOPL0qmMek6+I9s09Ag+qAWcqmGSr1HQcDOP+9JEF/oSbUTNHWX9Hv74Y4LoPsgw9gifzk3VVyP0P+NsyHEzJJXSVetANe6hMW2t76c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/ca/jBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460CAC2BCB2;
	Mon, 30 Mar 2026 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886537;
	bh=Pl696Uxs03SGxKpgXUMdYRlHfLrEmodLS+XEGz1OIbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/ca/jBKS2Dzailwifl4o4sJInTnWxr76T5Gt+LMKLTBWprj1bur0weDtUuRlqhcc
	 WwK+cRQnlF4IpF9Dg3xq1sfG4x+bnZtHrY3e9u1CLYi2IbUhaVzUGhdNbx5LLnwOkc
	 0lKdn4h3tBTU4wGBpmO1YKaaak58n7gvTiUGKdZW1VMhbsmojtOra81vVNPCHhm8q9
	 H4AQb/DiiZsdhNafgqViZ+dvPHxiI2zBXB9v7m2U/jOVg7ZzxQaahXarCNl2oRztYs
	 1K1emrDun+27mHe2CWur3YA0u3XZTlRwlQ+QHJodYYZkLZXH5AQckhI5iI1OSnkC7U
	 UE8SP2b5oS0Xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains
Date: Mon, 30 Mar 2026 11:01:36 -0500
Message-ID: <177488647761.633011.4035949916094644329.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
References: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-100855-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EC8835EABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 28 Mar 2026 03:26:19 +0200, Vladimir Zapolskiy wrote:
> Some pm subdomains may be left in added to a parent domain state, if
> gdsc_add_subdomain_list() function fails in the middle and bails from
> a GDSC power domain controller registration out.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains
      commit: 16ba98dace9e7cfe25ad8a314e34befacd91f86f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

