Return-Path: <linux-arm-msm+bounces-68034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77474B1DBC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CEAF7A0141
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4881A2727E3;
	Thu,  7 Aug 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBHrxj0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A7269CF0;
	Thu,  7 Aug 2025 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584420; cv=none; b=esNl79VxhYAwsBi8jP2K8WqxBjEowNQMGJw0LG2qibebsBQZM3JUrouwzvw6SvTSJ6myyWK7Z/47XHkrEBAoRkDBsaQUDtfOiZ+e6hHNzcBb9hLm8KmWNBZ97Wmh2PFCk/zYwtTDnoooBMqs1AZBuU9zOgHWDNYyqf5G0FUNxy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584420; c=relaxed/simple;
	bh=jvWzq/jhwmzxUOYWJiEWx1AbYjz8lwwJJyycnQyUSE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/BVEwY1KQlfQRDhkgqDZaQ5gONy88/3fJhALVWmD7ognE2+0bzGU6YBtNA8/XRhgO2IT7+l0O23aaejt8nIy/ttcOzdVG0wGR3UYIu++Gk9//nZ0LDIHzaH3tCgz4ZphX66HOsIGDUv194b0KbfdP9Z7v6vAUCzNtizczZUqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBHrxj0N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED5FC4CEF7;
	Thu,  7 Aug 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584419;
	bh=jvWzq/jhwmzxUOYWJiEWx1AbYjz8lwwJJyycnQyUSE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dBHrxj0NsrkSB4c4DT9Im33s/MGvLORvJm5GYeSnSSeAJYY7HRr8T6pWdiFRJm5Kb
	 An16m++E8vMn6FIvlfJYZaYyWnWTTBieNOVAmcUOJsDjwG+SxaXjWRT8c6lt+7efZY
	 zZ26F8DSDmcEHjohE3RZT+1dIboO6a56AL8Gw2WSdVR/TBuuao9vufBaJtXJ8CswMX
	 FxfRNINjshIqR3dapAvT8lJCHMU3EXzdfc+glY0NgLS5TPFupbnm+EwjPHtvjtOdy+
	 o76EYd1VnOD7+qRRxfIve/RwRATI20ru6+wShwwghF1QGwUe193chpf0nxIKSb2BC2
	 TvyPP6KduFImQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Aug 2025 18:33:21 +0200
Subject: [PATCH v4 3/6] phy: qcom: qmp-combo: store DP phy power state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-topic-4ln_dp_respin-v4-3-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=1451;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+D+J82kl0yf0XLZMz4TAWGQQKkf7pfXxbzQ3gQGkHyA=;
 b=AU+OQLFF8A1GAcGZDKFR80JBuuir7Yo8Y7YbSR24jYhoa5Ct/EOHXPKl7tZ4tZnN7PcI4lNWe
 /2aPdOIO1LoCzcbu6SFfvnLDJcWMeL31lBdEPxhQKhKeBMZ/lEeWZO8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

Switching the PHY Mode requires the DisplayPort PHY to be powered off,
keep track of the DisplayPort phy power state.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 30749943f66280c3aa9e9673466f6f736d1adbc8..8395035754975808ee1b5b9c48d046a719e79e60 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1853,6 +1853,7 @@ struct qmp_combo {
 	unsigned int dp_aux_cfg;
 	struct phy_configure_opts_dp dp_opts;
 	unsigned int dp_init_count;
+	bool dp_powered_on;
 
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_hw dp_link_hw;
@@ -3133,6 +3134,8 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	/* Configure link rate, swing, etc. */
 	cfg->configure_dp_phy(qmp);
 
+	qmp->dp_powered_on = true;
+
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;
@@ -3147,6 +3150,8 @@ static int qmp_combo_dp_power_off(struct phy *phy)
 	/* Assert DP PHY power down */
 	writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
+	qmp->dp_powered_on = false;
+
 	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;

-- 
2.50.1


