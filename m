Return-Path: <linux-arm-msm+bounces-50871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BFA5A3AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 20:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344873A67E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039881CAA60;
	Mon, 10 Mar 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iK5eOERf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A4199FBA;
	Mon, 10 Mar 2025 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741633904; cv=none; b=LfVp9dDZYFM1CfMr4rwJl80dlTz5XdekODF72nUVhsiq5p/vN0lJRDfU/Ty7B1UX6cSUm4E3x9rWD7jvPgNGg35OGLEq6nfaTF70NW/84yIW9T6JZbugVlwIugScjX+vyu/x4COZgjB9WwSWaSROjAtVRq8DM6g5+MSem5YI+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741633904; c=relaxed/simple;
	bh=8Sff0TsgnZs3fX2n+0u/8tlu0wY9c+QMZDFeIB+Uf38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZMdGDIDXPRwWl0FUiQhkOwJCJBuYBus8dtif/6GEEXq4/0qGjCNmGgoLi0Dc8CxR184QUyH3e65QWiyJ3Zp1HxGMpLET9SuwnBjws+38srJBfE24i659CVmZuFEledAkrghJA7+OOVPWw0BSpbxI6PkPjmBp4z/mUvIJMwgZPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iK5eOERf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD10C4CEE5;
	Mon, 10 Mar 2025 19:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741633904;
	bh=8Sff0TsgnZs3fX2n+0u/8tlu0wY9c+QMZDFeIB+Uf38=;
	h=From:To:Cc:Subject:Date:From;
	b=iK5eOERfs/lSapoXXibjJftUFpOXadzcXPs20ERHR3WtC3K8Q2vHYstozGZjhfEKt
	 mVlQHV5X1zhpUHhhsWyvBukjEHVJlkw8nxMh0b8hcwGF3BYns4BwL1rJYmhm2Ky1nV
	 JkCfLzv7SrFdpVXBNO49gDRBPA0lp9Uij3PHEzMf9SkIDbYnUdGaorRpzwOpTByQxa
	 v/KS0tiMGyX9az053CwQj0yrum0S8V3hN5KpjfMofo2cIjhtsljlyyU2uSffKhufNS
	 0HfmFANSYEqGBWhCGY7gl5uJh/POUEaNiW93F7orx1ORZmvtSoK8nlB/PeJxoLVKAA
	 xpf8ACzboC+FQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm clock fix for v6.14
Date: Mon, 10 Mar 2025 14:11:41 -0500
Message-ID: <20250310191142.1208155-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.14

for you to fetch changes up to 787289a1d13d50ff4ce0f496947f8817ef3fdea9:

  clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent (2025-02-26 08:57:46 -0600)

----------------------------------------------------------------
Qualcomm clock fix for v6.14

Avoid propagating rate changes for the MDSS byte intf clocks on SM8750,
to avoid changing the already configured clocks.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent

 drivers/clk/qcom/dispcc-sm8750.c | 2 --
 1 file changed, 2 deletions(-)

