Return-Path: <linux-arm-msm+bounces-237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11A7E66D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32BAA281250
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3470913AC0;
	Thu,  9 Nov 2023 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GisZhfwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18830134DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 09:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDABC433C8;
	Thu,  9 Nov 2023 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699522257;
	bh=PZQMPnYlGnEWT673t/5m3TU6f1iHCeG8oTv/I5ehW6E=;
	h=From:To:Cc:Subject:Date:From;
	b=GisZhfwZ84diDIDf2mIw/gX/FvfZ8/audX+9nlBrRhzVfNzmDtcOqvnUBTEuRM+j1
	 WOREsxZdXozH9LmIYVGU9PekDEJgyKuD+e1HgAA+HiOxxBcbRC0k1OleQeBVe+Q4Bw
	 7nqzTA1P6Lw17xkWMGbgPG8HIBq2vsdGBDIKjPv6KGrZ8cFRfvHdKFmrVyAgXOG6Pc
	 skpnCj4ersGD6W7EDfezauoeHQeK4v24oUKayIjJMLOTbpJ4dcJLELRNiVJY0P3nE+
	 jbM0tjOJ+e4zEoIUrg9pLqhjiZnWnCJ3hjiq8D3h4TU3Ngj9pDV/7sgmC9QT1Vnvx8
	 34v1C4stiuB5Q==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r11OB-0005CW-1Q;
	Thu, 09 Nov 2023 10:31:51 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: qcom: pmic_glink_altmode: fix port sanity check
Date: Thu,  9 Nov 2023 10:31:00 +0100
Message-ID: <20231109093100.19971-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMIC GLINK altmode driver currently supports at most two ports.

Fix the incomplete port sanity check on notifications to avoid
accessing and corrupting memory beyond the port array if we ever get a
notification for an unsupported port.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: stable@vger.kernel.org	# 6.3
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 974c14d1e0bf..561d6ba005f4 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -285,7 +285,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
 
 	svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
 
-	if (!altmode->ports[port].altmode) {
+	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
 		dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
 		return;
 	}
@@ -328,7 +328,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 	hpd_state = FIELD_GET(SC8280XP_HPD_STATE_MASK, notify->payload[8]);
 	hpd_irq = FIELD_GET(SC8280XP_HPD_IRQ_MASK, notify->payload[8]);
 
-	if (!altmode->ports[port].altmode) {
+	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
 		dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
 		return;
 	}
-- 
2.41.0


