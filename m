Return-Path: <linux-arm-msm+bounces-65759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C1B0B343
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 05:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 329CF17A295
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 03:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A7317BED0;
	Sun, 20 Jul 2025 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQzFEnEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0988433A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 03:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752981097; cv=none; b=b0z1/wY6CobKdbCCIHzxc6dZW58hnvrl4NnAiVXZmxbyfzpID+etrq/zByVNBOtl7IVIVt5MBU8Pk5T1uLCp2LO10U5Z4c12PAXvmam51Pk+GtY94QdsOB0vXHhIpr50EMaQa/MUl0Jt8qlRQmrXiJzxYgAKKiBF376e7kbj2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752981097; c=relaxed/simple;
	bh=hy6TO0tqYA/iD0UESxM5WRK3VTok12PaLVtblUPe6HI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0DBIn/CBgqYXn09tnqhxcBz7yq4HP+a/UoOAs0YGvMj6PqgmB3x97z9Uwj/V/8Oc3oPuRA3k9EFja0wcKXymbJeEh0RtT6CBlk+V+SmbtB708NCg8p3XruazOk8YqT28gB3hjiXGpt4S2e5FMfgwxS+4hRuAoezrmjQ/Yu3G4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQzFEnEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C38C4CEF4;
	Sun, 20 Jul 2025 03:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752981096;
	bh=hy6TO0tqYA/iD0UESxM5WRK3VTok12PaLVtblUPe6HI=;
	h=From:To:Cc:Subject:Date:From;
	b=kQzFEnELpngKG8C++Y7Zk0MLDE4QHNF9lw3+74sPSXsdz+6W7Cq2IFOv0js7bl5B/
	 q6XWklc30P5gcz+5PlRc5lEWYyGPBK3+fERq2VW5McAgIEjlcpqhJwcztKapKMiWy9
	 iIlqp6niZGHAmHWT65QmFw2rvdkX5AhKHC+c5YgRtIy2IrUDJAb/nNOFQgLsiATbuR
	 ydU3rfVoc+gbEX/Uhxv5o8Mv0sEduDwIP54u3rOkP/MmW1SzzoBjrVFNlIl1vn8D+K
	 7BzS7zf/3oRuG+iQmFRKNwAfB8H0DRMTstsOw0GbwUj/uvnye1p68IpYs+CdiXx9AI
	 TnLDYtuAFvhZA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.17
Date: Sat, 19 Jul 2025 22:11:34 -0500
Message-ID: <20250720031134.286063-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.17

for you to fetch changes up to c5d02bbaa217b2454ba1ce7528113aa2ecf14f3c:

  arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+ (2025-06-11 10:46:23 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.17

Enable camera and video clock controllers for SM8450, SM8550, and SM8650
platforms.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: defconfig: Enable camcc and videocc on Qualcomm SM8450+

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

