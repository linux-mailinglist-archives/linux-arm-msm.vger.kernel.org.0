Return-Path: <linux-arm-msm+bounces-101883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FTxBVu70mnGaAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:43:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EAA39F903
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78FE530379BB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BCA35C1A1;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puO389BN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5B35A39D;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418040; cv=none; b=FVFOPVBhbmViJz80wIqEwe+aZVX+2NgFo64+Y+gy6KvPVyZttcaz/Smbj/HauGAdqmNRN+WAVBO8GCTF9MfraS1rqlK1Wog9/4yI0TtN4T9/Zp8f60eIXbPLftiw52DwhpuKrPBQlgMMMvM/92qMvY0IwmG/FQ4fvaNrwVAjmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418040; c=relaxed/simple;
	bh=XqdmqAm2OIDnsNO+CBfgzIKx+eSJjPupbRcr6ZLww8Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvGTK361p9LNIm9p6VS9NgmE/eYN/c/ZL2+WM+Sq9gfVGQTkbKRsBDbmQlgau/o7m89n3A25ZcYZWl65XUI3xd1wKVPlzDDVzvEZ/AgznTmTx+ezpLn19ZHFQu5f7C/tmnWkL9tWNl0iF4UogEEckB04vlIbTmM4rq6Kr1gk9Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puO389BN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F87C2BC9E;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418040;
	bh=XqdmqAm2OIDnsNO+CBfgzIKx+eSJjPupbRcr6ZLww8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=puO389BNqKCwtXGKaku9DnoWDgntaR+CzD9JkyPe7pi7ykyeazQhLZxElf3iCsJz1
	 CWQfd5bnZJTfVVsAvHwa9YjBQHzSR5FopvY9zz9V6/R+2ZX3hAbjmlJG1Wh89xSerl
	 OUUTJC+/gyLP3MoJ6U+56fQ2yX9J5aYptBOyvHRkyiBb4KpJ7cNg2IGqEy+ycKW4i8
	 xX5qpAMLBbVEhjofEcj4fJPKtXirdA5+PQQGCcbtisAquyqUcOeAp2izOvcueD5wW+
	 5NqMeHhc+GGbRlKgzTCsAnYD4JoI3A1J0ofr1EJO8XWDXLH1EsVtjZ4D4wD+KP6+6p
	 kG3RAZuDS1mEw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
Date: Sun,  5 Apr 2026 14:40:20 -0500
Message-ID: <177541802156.2061229.7459535185039916561.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-101883-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 92EAA39F903
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 10:55:22 +0200, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> 

Applied, thanks!

[1/1] clk: qcom: videocc-glymur: Constify qcom_cc_desc
      commit: 03aa6ed7069f4872333d410303ae8dd341bb096d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

