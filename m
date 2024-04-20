Return-Path: <linux-arm-msm+bounces-18054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C78ABC6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 18:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E981C1F21867
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 16:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D44339AC3;
	Sat, 20 Apr 2024 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbcHncY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AFF1CAA9;
	Sat, 20 Apr 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713630483; cv=none; b=JhL5V2+4vcO2GyNkNTgrc6esOdsWzavMOuO0NmKsDVsezMkHZmuoPylhR5BextskCCNnTr7da8Mg+p+Y1bQJfgrZH1Oq/XaMiQNLBoq1/OAiPFyXgod7l/bUdu7DGdKIvUDGvH2uv5VzCQ6NsfSECAsqHyqHWZ7RWKYdAqJaXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713630483; c=relaxed/simple;
	bh=788OCsH/6UqwQ4ixNOMF1QrFuh90hMLdU5+GRsml9HI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCja5PXst4ZUv6RbZsYkx6aeSEZ5gjdNuoX/9qaJivVPnd8YVYxP29uMINUQNoX+BPUdRWLCox0o5wn9XbZvcE/uu+5MHoWnwH9Pba1piQYCFXyBdbKFQ4obw7jxO9/ImzsPWDwt/kwRZqkPx13YJ5aiVSDOw2djmWukgxxn1fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbcHncY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2121C072AA;
	Sat, 20 Apr 2024 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713630482;
	bh=788OCsH/6UqwQ4ixNOMF1QrFuh90hMLdU5+GRsml9HI=;
	h=From:To:Cc:Subject:Date:From;
	b=WbcHncY6xZchR0Qt5byuZvQTio5UQF4DIpJ+9cESe9Z3VGy+T1ikFwBXrgCwXyyf8
	 c9U3T3/ieBjKYjQL3YmwIYVlsbb96cZmZ3IUk7Mkc8Qkv5T/tlkhzabmLR5VIHzt60
	 1qosf7bwLq5jjx9GcCguguhzNuoY/3/kGw7Eo4IYaYAYhRLLoauGn6jbDTgNGlssHC
	 LjtXeV6D5c4Xf0QcCyAYurEgT8gZg7O01/M2MpZnR4GhNWOUIFWvW6XVa1/TJiSnVD
	 cZqaAXETNE5vI5O9w1zuXuY1fGvq1j2dN2DPbFL1J6p5V4ZK95uEDrIDfqVqDmhB6C
	 SLEnNdryRBSww==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Adam Skladowski <a39.skl@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] Qualcomm clock fixes for v6.9
Date: Sat, 20 Apr 2024 11:28:00 -0500
Message-ID: <20240420162801.1132878-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.9

for you to fetch changes up to 0d4ce2458cd7d1d66a5ee2f3c036592fb663d5bc:

  clk: qcom: smd-rpm: Restore msm8976 num_clk (2024-04-02 22:49:07 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v6.9

The introduction of support for the external VDD_GFX supply in SA8295P
ADP unearthed a lockdep problem in the GDSC code w.r.t regulator
supplies. Make the regulator optional, to avoid creating a dummy
regulator, on those boards that doesn't use this. While not solving the
root cause of the problem, it reduces the impact of the lockdep warning
- and it avoids wasting resources.

Refactoring of the RPM clock driver accidentally removed num_clks from
msm8976. Reintroduce this to get the clocks back.

----------------------------------------------------------------
Adam Skladowski (1):
      clk: qcom: smd-rpm: Restore msm8976 num_clk

Johan Hovold (1):
      clk: qcom: gdsc: treat optional supplies as optional

 drivers/clk/qcom/clk-smd-rpm.c |  1 +
 drivers/clk/qcom/gdsc.c        | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

