Return-Path: <linux-arm-msm+bounces-110817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9FMgJuXlHmp+YwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 16:17:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84562F37D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 16:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=hLKT2g9V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9053030A6FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 14:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE1C3E9C2B;
	Tue,  2 Jun 2026 14:09:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988232222C5;
	Tue,  2 Jun 2026 14:09:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409384; cv=none; b=buRDxUDX+uq89RruCa6yCJio4OfXxd2HGusElnZCIbQ4wo64t88IOEFsj66TukbTsW4MyusOPyc88avlNom9qQbtcCz1qoEZZcbYzhnYzBHqoQnKBqca7XmDzvfvNnX7noMpzu+lPtQOAaUDMoKj7++uEg/Qln808n4MUCuIF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409384; c=relaxed/simple;
	bh=5KWqCFMcUxryMxItr1z/O7TedGEJQx4UDIsOUebuyp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzlLJhtBm7DvNxzXhP7aprEeMkvAdwN27EXfo7ivFT7dbU+hL2RF+rFtbIrLYTXKPr5YrpxrUi8NrjancgHu+qBTpCFK8WrV32ElV+GFVOkEPK97e6icJGsj4wSu6wc7x//Lxn4pEPnTJAoiXwRp7dsxQgpZUtN2ajPNf9jn+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=hLKT2g9V; arc=none smtp.client-ip=136.144.136.7
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gVCPq3wt2zQvvLC;
	Tue,  2 Jun 2026 16:09:35 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVCPp6nmlzJjhXw;
	Tue,  2 Jun 2026 16:09:34 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/3] clk: qcom: gdsc: three pre-existing correctness fixes
Date: Tue,  2 Jun 2026 16:09:31 +0200
Message-ID: <20260602140934.796697-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780409375; h=from:subject:to:cc:date:
 mime-version; bh=NxLXJtPfFfqWQ1Ke4/5Lq5bjEY56fWonFGkWetDXPqA=;
 b=hLKT2g9VMsYWsj13WOgZnLN3ChEe2h8/85hbDbi4SjITge5L4zoLp9oUUMeGJfX+PN3oj3
 UFMkg4Yrj0XysRQzJroxWjU3sA+ZRB7ZIpwkfMcWRlfgUTpGhXXzqJJlDMHvobEXxWzsjo
 h8E/T7xTcEYws3GwhqzFCsrEckUtAt4lWEymnJjoDXmZ/OWuslm7LWrHf+gYaD7MvPsRDI
 44IuspC1bCyXo0Jokf0o6rfPeRDvXF/06Hz2+TVbb38qpsKrTrKVlmjEVk968tbbs+nRHV
 AoSByaZgq3jhX7UFYPPvBsWHAytZxw+NfezSHC2IZhRtGTGsTV13fzgZVf9GCw==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-110817-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[herrie.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,herrie.org:mid,herrie.org:from_mime,herrie.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A84562F37D

While preparing MSM8x60 support for the GDSC core (a separate series,
adding LEGACY_FOOTSWITCH and RPM_ALWAYS_ON), code review surfaced
three pre-existing correctness issues in drivers/clk/qcom/gdsc.c that
are independent of any new SoC enabling work. This series collects
those three fixes so each can be reviewed and queued on its own
schedule without blocking the MSM8x60 series.

  1/3 - gdsc_poll_status: propagate gdsc_check_status() errno

      The polling helper treats any non-zero gdsc_check_status() return
      as "reached the target state". gdsc_check_status() returns < 0
      on regmap_read() failure (e.g. parent regmap unbinding, bus
      protection, debug-tool CSR removal). The boolean test promotes
      that negative errno to "true" and the poll returns success with
      the hardware state unknown -- silently misleading
      gdsc_toggle_logic() and the gdsc_init() sync path.

  2/3 - gdsc_init: propagate gdsc_enable() failure for ALWAYS_ON

      GENPD_FLAG_ALWAYS_ON requires the domain to be ON at
      pm_genpd_init() time. When the cold readback finds an ALWAYS_ON
      GDSC powered down, gdsc_init() tries to bring it back up but
      discards the gdsc_enable() return value. If the enable fails the
      code still sets on=true and registers the domain as ALWAYS_ON,
      so genpd reports "on" while the silicon is actually off and
      consumer probes hang on dead registers.

  3/3 - gdsc_unregister: tear down per-domain genpds + reorder

      gdsc_unregister() removes the OF provider entry and tears down
      the parent/subdomain wiring, but never calls pm_genpd_remove()
      on the individual generic_pm_domain structures registered by
      gdsc_init(). The dangling entries on gpd_list cause the next
      gdsc_init() to fail with -EEXIST on deferred-probe replay,
      module reload, or OF-overlay teardown. While here, of_genpd_-
      del_provider() is moved ahead of gdsc_pm_subdomain_remove() so
      that a racing of_genpd_get_from_provider() cannot attach to a
      domain that is mid-removal.

The three changes are independent and could in principle be sent as
separate one-off patches, but they share a single file and the cover
letter makes it easier to reason about them together. Apply order is
not significant: each patch stands on its own.

Built and boot-tested on an HP TouchPad (APQ8060) in conjunction with
the MSM8x60 GDSC enabling series.

Herman van Hazendonk (3):
  clk: qcom: gdsc: propagate gdsc_check_status() errors from
    gdsc_poll_status
  clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
  clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()

 drivers/clk/qcom/gdsc.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)


base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
--
2.43.0


