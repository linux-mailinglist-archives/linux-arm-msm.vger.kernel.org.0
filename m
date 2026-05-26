Return-Path: <linux-arm-msm+bounces-109879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ3SJtG6FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:22:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64B5D89B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9DD5305FC17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0660413D8C;
	Tue, 26 May 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REmtypH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894B840586A;
	Tue, 26 May 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807897; cv=none; b=lFNXXYcnzn83DGyVJyBSy5kS5m4SXrVnWxiz/Q09NG398qMSyAKsWrHu7HpAHEnMajCV1ukVpEgdVZhJoOCU+6UBh9dOsgv0YXxlri43tlWDv6X5XGU9YBJUlMjts02lH+f+JAN27eF47rjOHkBdZVnRKRHFZk9yNOEzrNlYPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807897; c=relaxed/simple;
	bh=pqrWOF0YcwG98Q16FhrqoneQdMDa3LZFDePiexWc9vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFX3hlfaINFcqaH6vaXfPWoBzmnlSa42uHVbJSVlH33DPAEFZtTLtbh+iqG8uFYsCu8N3wf9ZNDTDKLtKlRNYEl6yCGnVhjmix9gW6H11hbKu4chdcNMAI3wardbmlvVVkW+iL2ZyonUxy65v2UYh7d/u32hjPTCEjQp4NkWRlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REmtypH9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2C61F000E9;
	Tue, 26 May 2026 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807896;
	bh=iSHZzxB1V5d/KC/KiS02pRO5TZqWUvOFP3PykJDrFrU=;
	h=From:To:Cc:Subject:Date;
	b=REmtypH9FP71uzmEDVThS57AEynhrn7JF4BuwZGdv+01ujaJxTaD1YR4RpUr6bRKP
	 fHvCjP6GagzDgzjkkbr7sMvjdGQKQAVJ71pP9JOL5rXIUj2tJ1IslDmtkKIzxiyaaI
	 p976qfBHypo/3wljRmRcWI+ECL1oeFG0LQkHrzd1+apLRzVoCpQIzDA15DlLRUSgeN
	 rBAvmtEW0HmB0+jPXTzUOk9UdoKPLgZb9j2Wh95aIs1oGxvp3G+5STPmOJMQ1gKrFk
	 g5CcQ5VCf6trKKjMfjpU2T19oBujICIsjWcAoRE/KZkxnmdjbjsYafCZ1M+a2HwwC0
	 I2m2hOivuguYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.1
Date: Tue, 26 May 2026 10:04:54 -0500
Message-ID: <20260526150454.4281-1-andersson@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0A64B5D89B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.1

for you to fetch changes up to 5285b046757844435d1db96c1b5c3a6621b2979a:

  clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time (2026-05-21 22:45:49 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v7.1

The parking of shared RCGs during registration parks the MDP source
clock, disabling display until the msm display driver successfully
initializes the hardware again. Mark this clock on Makena and Hamoa as
"no_init_park" to retain a working recovery console etc.

----------------------------------------------------------------
Hans de Goede (1):
      clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked

Pengyu Luo (1):
      clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time

 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

