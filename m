Return-Path: <linux-arm-msm+bounces-89938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGeRO9Y7cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:37:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB744FDD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CD15D92DDC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BF533CE87;
	Wed, 21 Jan 2026 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyiKviJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A731A049;
	Wed, 21 Jan 2026 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962961; cv=none; b=jcC0jXSSG/vEVvfN8ohfvrIZMXJBt4rbGbck/pl7s64C7t3Yzevbp+hNaCjpUyF1R1lnnR7o/vx94X37XcJ9N3mJNnTWN7sxkobRtYm0nqjApLAhXJg/7Et4oLr2M60+5DiL5aQrWF7bJJvHoYRSh4EaflBl7ubsM7YvlLdsMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962961; c=relaxed/simple;
	bh=R/uLSvQ9c5Lxqj4cxmf/ld9c/FnAvYPKLy6HqLBLUTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZYENNhZlS1OUcXtuWAuqwEHnnN1EMneDHB2XqIkoiLjBpD+dZSfYYiMhfG7qqfUPZqBUdeTTK1QScIPgoD7vPRSL0iNXhHlcgFq1n+kqDnbRNFdAtubEgzpRRHvpRtt+JzOoq6QtOXTD+123KwbT3JnI/fL6Ci8ui6jwLwaZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyiKviJm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC62CC19425;
	Wed, 21 Jan 2026 02:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962960;
	bh=R/uLSvQ9c5Lxqj4cxmf/ld9c/FnAvYPKLy6HqLBLUTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OyiKviJm9dYZ+ryNDsWUGE/L82DlhrbAAtbM7mplBBHP7Ar4ARMv7OOTPdREQKWGO
	 7Cehoa8eLSvmuqnYDqnD+GUpgz1u3pFKoliccjZydRl0rwRq7HBkYspBbKDThAN6aG
	 JnBdAQ5EDZazR4lpQHH6yNYtjm/dP/U4Y7GNrBpGIIeuk3RAU2u+MIV86owBNUtte+
	 LqZFuvfRpNA5WwqLzwZWEmioHS36GrpgAChMRdjKO3dl4SXz2Me2c7ZnNSSD34+0u3
	 OcEioVrRf4Il2TVPGEHL3VOWdtn2fEoJyKUmyu7JjVjb7JRxsROCTl2yhn4dbvYV2a
	 ddi/g7efO40Sg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jens Reidel <adrian@mainlining.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src
Date: Tue, 20 Jan 2026 20:35:50 -0600
Message-ID: <176896294114.1060469.2883797351409608923.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117-sm7150-dispcc-fix-v1-1-2f39966bcad2@ixit.cz>
References: <20260117-sm7150-dispcc-fix-v1-1-2f39966bcad2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-89938-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CCB744FDD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 17 Jan 2026 19:18:28 +0100, David Heidelberg wrote:
> Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
> when switching to it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src
      commit: fab13d738c9bd645965464b881335f580d38a54e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

