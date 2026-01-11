Return-Path: <linux-arm-msm+bounces-88380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD443D0E639
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 09:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B05F30031AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 08:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E15D1F7580;
	Sun, 11 Jan 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="qoGoe48T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7791D1E2606
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768120422; cv=none; b=t/sSHzu7poYsepP01m+Q7J5PyJoWWeq4JeteAHA08MmtFlC9nwz5tOespUA4n7DIG5wXDK3xCVIHCGfxxXXAISWbF8UIzxPJv0bLfm4nN1FQ1V6SQYalukIP++W2MgqB4Etod8gtvrvmMGlWzxjiPya5g9vdd8IOqCna17osK0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768120422; c=relaxed/simple;
	bh=6wvpO0lYKIGisoGjhW0e60XMj9sd2cj2UORY3Q9xLcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFuu6ojS9nV1pjvDCKp+qGOPFH+yI2esV9Jm5eXI0YHLBfkpWtFgyZ3/oVDpDauwztUmCr9MfrMWqzoe3YyLUmynDG5W9eswxVz3gaUAVBzVUJjSu/yiFTWL4A0hldy1pBNYvGdvv8z7Tyf6kVTC3qguEDEDbxrgXc6GwBch9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=qoGoe48T; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768120418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ux7+L8GdWa+BGmZjE13E9fDY0FV4tnAQh5DK+4QXmOI=;
	b=qoGoe48TTGICHppYaaIy9R8DzUEq+cadvlhdJQ3Fna6nOBAsyouOTIHTPIz4nAEupqOe8A
	ZxCyefoGq1D/gA089uX21uJcL2qkWGSRiT1+4iYD9w9yw7Zi2udPJ/8bCSe8FPtjzWOeGG
	Jb5pZO1DkMcufNkbvEu4g2NfAo9GcAsmRKL94ob/gkwOZzRbW0E4sLETldWvIjviYiiEe4
	f0qBjzgiOeGMEHDaXyNsC403+n0ocwxupUQun6gzX9Q6aOIVdT3y26LluRI3JSF/QMQ0Xl
	xfK8HQ/FSC+NfHZy6d19JFawgZL3UdiDzM75kFvwyMEGzNHcZxJlIamlQ+8+wA==
From: Val Packett <val@packett.cool>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: qcom: edp: Fix NULL pointer dereference for phy v6 (x1e80100)
Date: Sun, 11 Jan 2026 05:25:59 -0300
Message-ID: <20260111083317.604754-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
stub implementation was added for the v4 of the hardware. However it
was omitted for the v6, causing a NULL pointer dereference oops on
Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.

Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v2: pull R-b, reuse v4 function as suggested by Konrad
v1: https://lore.kernel.org/all/20260109045214.5983-1-val@packett.cool/

 drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 13feab99feec..7372de05a0b8 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -758,6 +758,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_power_on		= qcom_edp_phy_power_on_v6,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
 	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
 };
-- 
2.51.2


