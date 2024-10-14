Return-Path: <linux-arm-msm+bounces-34294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580299C64C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D68E1C2235F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B4115687D;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZSxd7q6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0E1547DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899262; cv=none; b=AIS/PEYrWacwxSfinLA6CB/DzCfAO1gsstNoBzrqboE1xZfqyeKO7APdbB+jKAlTHCzS7aLH/I3F7ESYc5Mi5nfIiFExDIEdE9emrqB5e2X2SgffudOXINMCKRzNNV/GXRqtiS6ShplN8+qkRXQZUbjYDZ6ts1LH9SI6rAS7KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899262; c=relaxed/simple;
	bh=l+6tyAR8Y+45VN9YkwbD6ypi05FC9WhaBUBRAu7wGkc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4Zddipte4ntRylGwWlM2ftU7PWu84F2hVnYJ9ohS62WTv/mruI2BDHkhseavGrJVbPfnQc5v9OlWV08tKb4zXoD7TKSDeJSbRtqPHBg8MLEbE5Quasg/4wyQJ+STPnREF2/drfbvhND/YFU+/dkiV7Mjstspi90O+f0sZPWrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZSxd7q6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F9BFC4CEC3;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728899262;
	bh=l+6tyAR8Y+45VN9YkwbD6ypi05FC9WhaBUBRAu7wGkc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QZSxd7q6ep/GIAH++0DPw0lnaHPoicUnnPqVDAwBqQFdfGq62se/j5nMre0yTCNQ2
	 Yy9Dpc96ENIhevlh5no4uWuRBsEgjGaiiYSOiIa0oXBLNugC27ZDV/FKfXbLYk+MNa
	 iK4sPT3PpFPmH2HQPb532gAGk4673wynalUvXFshKfPJmfyCoYb4msqYMb4GgstlyU
	 nIzJgeJkfbhhqT1fnWj3fr2vrx2wzTuC/rDwb9sQPDP3DH+RGiOL0IPQNYU8GDgWE4
	 Pkcz0rV/x4DETk28djt3U/Ol0d3sbnGQklzIWCr4oYm8fcpIuRRLO+T2ARp+hENZD+
	 oNh0faXEk4pCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C41BCFC523;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
From: fangez via B4 Relay <devnull+quic_fangez.quicinc.com@kernel.org>
Subject: [PATCH 0/6] add_display_support_for_QCS615
Date: Mon, 14 Oct 2024 17:47:26 +0800
Message-Id: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/oDGcC/x3N0QrCMAxA0V8ZebbQjE7FXxEpXZNpQNaaTFHG/
 n3Fx/Ny7wrGKmxw6VZQ/ohJmRvw0EF+pPnOTqgZet8H9BhcIookVp/pF+1da9ElTkXjK9sRBzf
 iacyeAuKZoUWq8iTf/+B627Ydkk2RfXAAAAA=
X-Change-ID: 20241014-add_display_support_for_qcs615-b17bc0d4118e
To: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
 quic_xiangxuy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728899259; l=1722;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=l+6tyAR8Y+45VN9YkwbD6ypi05FC9WhaBUBRAu7wGkc=;
 b=4J4gR/9hofkze78VJ7NJiiM+QLqxTNOFiPZMum42KqswlmRSehlEjlSCBGxflJgtFLmNnwmzE
 QaWgIf7mxvHC6LJyqdJDR6frAeDG7FTPFjjQ+eKJG0Q5gmS2jEXpg/R
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Endpoint-Received: by B4 Relay for quic_fangez@quicinc.com/20241014 with
 auth_id=245
X-Original-From: fangez <quic_fangez@quicinc.com>
Reply-To: quic_fangez@quicinc.com

Signed-off-by: fangez <quic_fangez@quicinc.com>
---
lliu6 (6):
      arm64: defconfig: Enable SX150X
      arm64: dts: qcom: qcs615: Add display mdss and dsi configuration
      drm/msm/dpu: Add QCS615 support
      dt-bindings: display/msm: Add QCS615 DSI phy
      dt-bindings: display/msm: Add QCS615 MDSS & DPU
      dt-bindings: display/msm: dsi-controller-main: Document QCS615

 .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 117 +++++++++
 .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 278 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 101 ++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 195 +++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
 17 files changed, 1014 insertions(+)
---
base-commit: 77dca4e0530173cb10896cc113f14e6403f0a31a
change-id: 20241014-add_display_support_for_qcs615-b17bc0d4118e

Best regards,
-- 
fangez <quic_fangez@quicinc.com>



