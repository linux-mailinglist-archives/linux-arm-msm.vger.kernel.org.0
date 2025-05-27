Return-Path: <linux-arm-msm+bounces-59614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC35AC5B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38B01BC1AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AC320C01B;
	Tue, 27 May 2025 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKH0eO/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674720C005;
	Tue, 27 May 2025 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378435; cv=none; b=F49H0jDUxcn/S0QE/BbGGPWsueUIWT8Zedtzo/vPGCb2dByTay4zSztOXRmEZQZzoN1RoUFhOrzOiV1vWT1Bag/Q/5MSiqNDhPRbMuM2OxKBwVG/ftzU50ZMyGfY2ik0HCkWWzNyVOFBBkeeQK2ngRWo1VyrZzgE81PzjUV1494=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378435; c=relaxed/simple;
	bh=+kMfvsj3qW5GkjvnoS0rVhOW7WWz5446Zayh8ytLTzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwgbaxrOsM4NGLb2M10C8VEjDEt7kO01aR7t/5D2sJgFh9frwASBKay03xEKNsz+TmhcY3XGi2E7EOpsUUmvhyg9z2h/j7g1+3M95xxdqT6CpzUGZhVLUK47gwRKvIvQZN+JKjePG3VNUadSiv78cIB6WkbwGyZw7vgpaF4fzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKH0eO/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506F8C4CEED;
	Tue, 27 May 2025 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748378435;
	bh=+kMfvsj3qW5GkjvnoS0rVhOW7WWz5446Zayh8ytLTzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RKH0eO/y4HrwIxyEiXf8eQhkeWcCs+ieIb95F8xts5B+UpCqwTHK3kL6yn+5UkHVN
	 WPF5eeUq2mYEYj5veoD2vCxajJ+Eu+HxeaaWEjWSKwMiiwWkTQfJFfEJe/gTQuxGDD
	 SmBlqWbI+J/9vlCN+TR7SWgTUoEO/BzWTaXOWa2DXShv3K4n5UwxHYtg7lwZuLfEcK
	 UN8RJ3OHZkx0AtAm41mhFAKlInyNcv4pT8l0gGf+vDi+Los2iIjuf1zQbFZyf3p2Vq
	 uST5dQOrA/puHKb1FO3mJ2VQT20tsjhXfCv2C/Cpn4YpwDUmuE+PBiIm1DU41yFNJI
	 3UiUPuivJcp2Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 22:40:05 +0200
Subject: [PATCH v3 3/6] phy: qcom: qmp-combo: store DP phy power state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-4ln_dp_respin-v3-3-f9a0763ec289@oss.qualcomm.com>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748378414; l=1388;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NQKO8n4zzlkDvZmTHNCLJMlvFM/BrHDE0uxXDvRG8kM=;
 b=wjVee6C4Ago1ttdhY6xOAPs8jrJKNfslmSBZ6p1gRGU3WO3OyMhyP/Amrkx5Texh8TS/5cdug
 HjXLt8cbem9D9b52FLBjXYXs8BbysFE/kkAqby6irVdFAk2Trbgqptp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

Switching the PHY Mode requires the DisplayPort PHY to be powered off,
keep track of the DisplayPort phy power state.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index d0396817f3a05c7e4baeef0de1332c3a83942a51..26480d63322b22eca9637392f888bfbe440c2a13 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1694,6 +1694,7 @@ struct qmp_combo {
 	unsigned int dp_aux_cfg;
 	struct phy_configure_opts_dp dp_opts;
 	unsigned int dp_init_count;
+	bool dp_powered_on;
 
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_hw dp_link_hw;
@@ -2913,6 +2914,8 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	/* Configure link rate, swing, etc. */
 	cfg->configure_dp_phy(qmp);
 
+	qmp->dp_powered_on = true;
+
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;
@@ -2927,6 +2930,8 @@ static int qmp_combo_dp_power_off(struct phy *phy)
 	/* Assert DP PHY power down */
 	writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
+	qmp->dp_powered_on = false;
+
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;

-- 
2.49.0


