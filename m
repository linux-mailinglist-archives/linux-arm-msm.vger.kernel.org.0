Return-Path: <linux-arm-msm+bounces-51884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22EA68374
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 04:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81E6A19C3433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 03:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB3A20AF7C;
	Wed, 19 Mar 2025 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW+/Sk6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700A42A80;
	Wed, 19 Mar 2025 03:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742353901; cv=none; b=ZiK7+BsNJgSWBGs9UIIec3YMhIupwq5P0YV2meSN8Ip6Kg1KEGVCqwVuvgH3x6YU5YgbOA0Bmd+6PKAKEg4dDgud/Oklco11NZqXLwuEq7l7kPTfEYlw4QQADF9QryrI3eFzlZEzGCLO9N254HOBp+h/v6+WSb56yO8+FiXm4ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742353901; c=relaxed/simple;
	bh=ypMMkKsvJ/Uf1JkZqtuKEEF9Wh2K7iXsnqGck2sa5Tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M52ycLznpd+wzXTO8uZ2ZqRMcLVDbnYsijm3tC5eSeCe5IHuvdigge9vlFGOchVSA9dqZyltq7S8+LbF55WJPFgjnoecEwBybJcDi7tAWX0jbGNNZH4NjuwY2OYs79YI0iiE5Tx8DqHKV1Mt6arNT7X2m8DHFFABxLC5d+pt1uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW+/Sk6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D3AEC4CEDD;
	Wed, 19 Mar 2025 03:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742353900;
	bh=ypMMkKsvJ/Uf1JkZqtuKEEF9Wh2K7iXsnqGck2sa5Tc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QW+/Sk6TG/tyl45glLfkBo0I9mHv8we/xZ/4e7Nuza4pXnAvE1LLVgR65DO8ccfA/
	 Q9ePt3tQaM7GITBXloHMavASTgxbpiuZ6wNOquijCmWbKZ/5tAvcLSOEWBBFignAFE
	 YU9wz+/6K7R0yRujRXPbJTq55kIoKfo045+CDftZCBk2hSI/xghXfQAuvQ2L1YQgKV
	 GThcAmjPIKcVLC9oPWh/rkDH2XKa+pogs3A9/p5sGG7eF1ic6+x2mshIesYz7ne4fE
	 Mu6KB0hut4iiR27oGtpesckY9yHhQJJsEe7h804s7N2ZwET47ZWPud1BS7l8L+YOHb
	 NObrOeeePxyew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F86BC28B2F;
	Wed, 19 Mar 2025 03:11:40 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Mar 2025 22:11:37 -0500
Subject: [PATCH] arm64: defconfig: Enable USB retimer and redriver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-xelite-retimer-redriver-v1-1-b3e85a37d294@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOg12mcC/x2MSQqAQBADvyJ9dkDH3a+IB3WiNrjRIyKIf7fxl
 BRU8pCHMDzVwUOCiz3vm0IcBjTM3TbBsFMmG9ksSuLS3Fj4hBGcvEI0nfClpbB9mqvgqtySrg/
 ByPf/3LTv+wG9RjTJaQAAAA==
X-Change-ID: 20250318-xelite-retimer-redriver-72b46318d962
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, andersson@kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742353900; l=1300;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=xRKqtaffSGX6Pjvc76vk0LWObAmQZMRTKBjP4UwTEzw=;
 b=Ilmlg9Ibvz3XH1u7sHItyqo0EvVlOztOyFwXe0QY5EL4PoQ3fG04ma3H4a+kPHGcJiDdNdsXI
 mtCbAkXJSrHDMh8WKqLwGa1D7rgtQzEq8O5nIjRiu3pOy0p6HnKDzu2
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reply-To: bjorn.andersson@oss.qualcomm.com

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Several boards based on the Qualcomm X Elite platform uses the NXP
PTN3222 USB redriver and the Parade PS883x USB Type-C retimer. Without
these USB, and in some cases display, doesn't probe successfully, so
enable them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e8dfbe22db68d9aa24df5af0786a2eeb8f33bf3c..5bb8f09422a22116781169611482179b10798c14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1153,6 +1153,7 @@ CONFIG_TYPEC_HD3SS3220=m
 CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
+CONFIG_TYPEC_MUX_PS883X=m
 CONFIG_TYPEC_MUX_WCD939X_USBSS=m
 CONFIG_TYPEC_DP_ALTMODE=m
 CONFIG_MMC=y
@@ -1573,6 +1574,7 @@ CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
+CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_CADENCE_TORRENT=m
 CONFIG_PHY_CADENCE_DPHY_RX=m

---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-xelite-retimer-redriver-72b46318d962

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



