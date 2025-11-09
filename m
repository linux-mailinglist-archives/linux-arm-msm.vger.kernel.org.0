Return-Path: <linux-arm-msm+bounces-80860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D0C43B10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF343B317F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B144E2D7DCF;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZDBrK7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA12D63FF;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681205; cv=none; b=KfZ0bRVZDshoLqxhxBCCwHCGAXOVv6P9Fhdkl5LZdHcRemBb184Dw74Sd1G4ZLW6CeNdTTh1yvVtawGXP9kUWm3VgfSPFS5yfXl7MLa8DWmZw9jMDBOF6g6yYHMX0R0GLAHgUWPwE3kXiNFYsNeEFFLAQk3BMuDr5vyApQi00Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681205; c=relaxed/simple;
	bh=LRg0aHew+4RwOCBBRDWw4ekxDqagsrEB1nKb2dgHPt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmyLpx+zgbZLOb2lhU3LKdxXzMh2zV2Xmtfs+ngmxvherr+PEgbXn4c7cHCE3wlY9pCd1dtyKQ206dUdTge9OERY7+ti4C30vVPSjfI9jDhidwnT77JZ9hiHrD4tyYlqKKBOPHqn8uFtFFa2kEK1IIE0KGKGNm/GgohKNE7FviU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZDBrK7O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D67B8C2BCAF;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681204;
	bh=LRg0aHew+4RwOCBBRDWw4ekxDqagsrEB1nKb2dgHPt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IZDBrK7OyeqoyE7jZ07CNWciDV1rigfrlRS3LbVYnuq1PSNSzB8nXCwm8jGNouuO5
	 BFguP1H1+CrvqL21j/+38dXucLpC36JQXd0PhSold+QiMPJLCL+diNQDnKYWbAnPzZ
	 A4wr1UFFHPc9hYy3A0VobwcAvipEl98NxfiGavYzeS66BXU1mlRz4XpVOl7djIPh+i
	 jSWV8XlFimLAd+1HKtNnBxQzFrZgc+LaqG2i5QGdCf7NCfSOeSUGt8AQkjw/GNLJX5
	 pP00jNL3u0PEZ3OwgIDY8yEzNfh1R2VcgAdOv/TXhL4v8Od7jpFEXfD2ILv6Xcr082
	 Q5Q4xrRCi20xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F61CCF9F8;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:45 +0100
Subject: [PATCH RFC 2/8] media: qcom: camss: csiphy: Introduce C-PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DQNIoS5WDVbc+Rdtl7ERIUO61m5Taapf/tMUESkjBiI=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGkQYXLIQEqxyicaFn15He6QmuX0Uic72wA5dR89dda5iOJO6
 YkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJpEGFyAAoJEGACP8TTSSByjpEQAIrZ
 5rQV5VatFQt+7Mhw14RYr9tDIaB5rP7Eq9GBwsA6r8ERp7zXk0IQpoYrkeLgtAbvIw18/6xbSp3
 uU7kTiriPGQ/hRVTh3nRXI75keiHkIiO7ewXIVwZjSu2gjtfqAZ71bEDZlQ+uNI4NkOVRmplAjw
 t/6CRNqmbqtSZKHFQQZsv+PAC7wTOQD9Qxft196BVhJayc83ON6RlfDT4eAkXjONUKMU7DtYX0P
 WrRXZC+2sZo3GgUpXCPI5mvooJltajt1bPQkM5vO3aZv7f38bA/RE37WE4ZyjtDV7PREGwqe5iD
 D/mgPce0JE4XoEiqhWeju1AuinhAKnTRyObF5l9DGhiXt+tQpR1CUgGBFmwKssgybgjE5wIbO2s
 pMzYqiBC6VBLlGRJz7CUcX/fCvR7IeIhHRasiIz1G858XxWoWXhsQ84RY4rhB0eymlG+RU3zqMo
 ko2BwzC1O/phb1r8xcd0HTwsG7oZ44+PdRQOYb6pAUFRKnjeLWnpbsuN7kANPVV3Uwtk1pqoaTz
 uFCznw79+0CbAbLkspEIgsALVJCPTX25vu3jTGQU6RrE5XJ6apkPT96t2KCP4f49Qy31DQb1vkO
 S27ldwzHOOCVfOq/SNYUN62NLV6IG1K1ZZfQ3ZqeM+1sSv2q9JVi9UojAtIFVlziCxaHYAM3Flc
 PXQgE
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Read C-PHY from the device-tree bus-type and save it into the csiphy
structure for later use.

For C-PHY, skip clock line configuration, as there is none.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c441..8f7d0e4c73075 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -28,11 +28,13 @@ struct csiphy_lane {
 
 /**
  * struct csiphy_lanes_cfg - CSIPHY lanes configuration
+ * @cphy:     true if C-PHY is used, false if D-PHY is used
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
  */
 struct csiphy_lanes_cfg {
+	bool cphy;
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba07..549780f3f948b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4055,9 +4055,13 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
-	lncfg->clk.pos = mipi_csi2->clock_lane;
-	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
+	lncfg->cphy = vep.bus_type == V4L2_MBUS_CSI2_CPHY;
+
+	if (!lncfg->cphy) {
+		lncfg->clk.pos = mipi_csi2->clock_lane;
+		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
+	}
 
 	lncfg->data = devm_kcalloc(dev,
 				   lncfg->num_data, sizeof(*lncfg->data),

-- 
2.51.0



