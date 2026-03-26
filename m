Return-Path: <linux-arm-msm+bounces-100118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGvCNfA6xWn/8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:56:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F623365FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90BFC3121B9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0747E2DA755;
	Thu, 26 Mar 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pT23BNEf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB62D5412;
	Thu, 26 Mar 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532718; cv=none; b=fZHoe6mbVOPsYLT1urqGjZ9xYp0atfbOKYFgYBOgr7O5VKdhQ0uwhtFWLgxUdAzSFMzB55otG1sOiClBwRQld7Db5296h0npopav/50UNXYNXVwJfKTeK565NHpaSFTHCEhC9AGjQCkAV+Lm388bHnd1stknBntKNBmanWWku1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532718; c=relaxed/simple;
	bh=1RUDs/9GC+fFfkZ7Xw9OHg2v+oefEPRSauOQRqYim1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urttzf53oTI09dSOc/0OqFRY6bll7mE7LIFtzwmSbN9+wf8TZCJtXhSGqjBHr2Fs3ioEMr6DwUDW4Ji4NoGy0MTDoGVLN9hlKMPxTIs+8yYqa08OPHb+Vy6ei3ZmmALfh9kjNOYhMwT79aJfK0fi65SYb3WXXRcAdPsCSkZSEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pT23BNEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8933C116C6;
	Thu, 26 Mar 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532718;
	bh=1RUDs/9GC+fFfkZ7Xw9OHg2v+oefEPRSauOQRqYim1g=;
	h=From:To:Cc:Subject:Date:From;
	b=pT23BNEfK2FUxlSWXAMp4SOiPypuCj5X7I7l1FTyiUwCAQSVMi5SqVpGidmm1/VaM
	 3BI+uKWuye9nq3XUyhU/Fdw9iK+34qj20Wt0eSNaE1BosFowO1KGC5xnLa74OrdOwA
	 GX/+v/8TE19IEe4tmLpySIf7XyTv6qIqacOmMs8+bOqBa7BOlrY8zEnadlTpJqkl2w
	 8qqjBMcCdugplAqykfnqzXNs/bcduAFwWkEdLrBHv1eyOGVABYs3qLliSeLp0JM4Lq
	 74IqmSfogtr/aziWHgQD7J15PFl0RWf5hQETT9HYKT3UU3pb86nNnjfs13K6LyKqdN
	 6XG9C6TqBjArQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fix for v7.0
Date: Thu, 26 Mar 2026 08:45:15 -0500
Message-ID: <20260326134515.67326-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100118-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69F623365FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.0

for you to fetch changes up to 141af1be817c42c7f1e1605348d4b1983d319bea:

  clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source (2026-02-23 10:45:35 -0600)

----------------------------------------------------------------
Qualcomm clock fix for v7.0

Fix the clock ops for SM8450 DPTX1 aux clock src to ensure DisplayPort
works.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source

 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

