Return-Path: <linux-arm-msm+bounces-108307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKDoA1bWC2omPAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:17:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EDC576C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47856300B04D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161FD2877E8;
	Tue, 19 May 2026 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhTzK7M1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3B223DD4;
	Tue, 19 May 2026 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160613; cv=none; b=J2yX0d/WbfEkZlW/vlH05jm/UmGQbsIi0FfRoaJ5qva3qpMPZ3zPQw1esX/sbDOIJwWHdwizwPpr3AEQGTFFB6zQ47jrCQEaL65BTBOiJ1eO/r+RT7Ee0GeFRj315TSC8VKcWvJYHMpeDbb3ohH14gHd7EKcqHk0zwEIHZfSYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160613; c=relaxed/simple;
	bh=I8S7fTPXno2o9zMuIanIak3w/ho1+ReaQ0dETOdy3Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gCdAh93G+6rxPiE2eJWkHXnwe2yjjsjFhm3QPiIScg4k4uL8VgFtxrZUYIlXYSO5HFsZqwpEdT1WNgtPRguH6gWHXs8NjejtsHuVqlRVMUOSCPkI58tanp38+AjLk0bfLu6y0pZbqy5VAG5CWptYQhEvNNc6FRLQwGKo4E58kis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhTzK7M1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2146C2BCB8;
	Tue, 19 May 2026 03:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160612;
	bh=I8S7fTPXno2o9zMuIanIak3w/ho1+ReaQ0dETOdy3Ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KhTzK7M1+J18MDTJeh8w6SaWsPBXeLJaL5CTEUDPF2KVPNN6ZpaGM6931JHITkscZ
	 BvUAH66CLO2yNOvsq2h2V8PMBfafsjkqMTHCdyyZLSPifOPsZN8zYnyFT3nTcQPfvq
	 OncO6Cz+PfjKUMngXRSkW6WJjYz4mPn4ILLn/tV4psPIBguoIXENHBBNEFKt6C6CR8
	 fTfPqFsWSUbBVxVhhQEbvJyR2KaJfH0l1/unTuPjV2n2IV3zz08E8AUvgJXKwyNEyo
	 lCCCi5502a4ScksGLGYkFSqUWlEykIWrokPkI7LhRImVwdMDe7U1uZ/xDpJ27meK3r
	 oOgnEtY/B2T6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
Date: Mon, 18 May 2026 22:16:43 -0500
Message-ID: <177916060472.2063946.16440539208263857944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
References: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108307-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 77EDC576C3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 14 Apr 2026 17:34:28 +0000, Alexander Koskovich wrote:
> Some VRMs aren't present on all boards, so mark them as optional. This
> prevents probe failures on boards where not all VRMs are present.
> 
> This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
> probe fails due to RPMH_RF_CLK5 not being present on the board, this is
> due to this device having a slightly different PMIC configuration from
> the Eliza MTP.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: clk-rpmh: Make all VRMs optional
      commit: 25b8f50b0622689cd1f7233e452407ce777a479e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

