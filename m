Return-Path: <linux-arm-msm+bounces-80859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB18CC43B0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24D533B32D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58092D6624;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hurjvo+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCDD2D63EF;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681205; cv=none; b=Z//2zD5kcNxlSbkb2dUiaMDVMPZ9WhvpMVSrFn5iHQCiZgukvvG+L7fc/PPgPrj660gzo3UXnYYiTTeBSPYtN3eyyEafgiqvLe2iN3X+DS53utuERHTTWM7NyjGdd7kG+qJ7oy2aAnt16Roil8W8tY8wDYZWjn1C3sHA/cYLNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681205; c=relaxed/simple;
	bh=0/bvCd//Rdh55ktZ9lHqX7RcmvEuyVlkxWAYh+Y5F34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMur4WSqPU1y4FgHREDV3DTG5A7/c0RLmm1fPJ5RzerhSU/AuFrv72+I8aqe7PDwArsoZAgQ/2lNF6UJE4B/u+vuG6jEV1XGq9mqQEwJzX31DglLilXaoJWG5eHHfu6kOaWFB6MjQK3G107eOxfBzt2vV1o1/VNJuw86KsDVi1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hurjvo+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3E67C2BCB0;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681205;
	bh=0/bvCd//Rdh55ktZ9lHqX7RcmvEuyVlkxWAYh+Y5F34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hurjvo+oHOQPLbbGqCibhJPbTwlC/6yQg8jNAWOZ+9H/wUArW38CrNSDLiDTIhRw6
	 sPesiJ3tRj4+vc7ZYVn0vw2LJkC5dDR4f7D7MTWY3zCmLhwJ4SSl9sO/WlesV2Vd85
	 FR2ORp2wNqQAlzAHcoiwaZ9S9DVXcK5+vn4q1FjFIaInH0AY6I13dcnJEb+WrbN4WI
	 0V42lJWcz68saBJw1SPpIkVYwk5P3PvSrGJI9tvV+qCbGzK6hOmR25CPrHNexWhdkt
	 C6LCrI7whqm6p9fIt9h0OtHMTZ/gtvWAeT2YqNN9cnZbVR1DMMKxr0iUwykhLQPBmA
	 AHw7eD6Jrju3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A9ECD1297;
	Sun,  9 Nov 2025 09:40:04 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:46 +0100
Subject: [PATCH RFC 3/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-3-165f7e79b0e1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rik/RHpeTR+s30xb3Tj4nu8A19TzZ21cIKR0hmDRMHM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEGFye+wbhg1bmncgyV4ERElXREXgeRp9B0QlL
 yWaPof/AxuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcgAKCRBgAj/E00kg
 cg2lD/9JCjrf/49SXbWR/92Qg7/0NQJrKd1aAnJDHGr9QSoxJcO97CPoA/X55gmUGDPKgxx4F+E
 as+xkB73hQZetG888ca6bLKxyENOb1jSOYRINzFaQzQB4qnHnMdMN5fpgSeheUAmOm4l6gwRiK7
 h/hG5ArEaS5NhlZAh6eVmW6IaZspxoYXh2fvu9KNvy08hxikEg99VhN6EmorrFz6a4rExMwLMs7
 JSscqKZtMjxF0C7J+0J/4h8upV8aAy69MnbE74x+lYGpz/f3r+dVWbe9GOidsQKEuPYsmYzTGFq
 vJCIr3acoDJwV38CXoPCAPTRNBpKYOxKHCWVXztRyCnqCL/Sh6VyE26IuoSiqMltclT2EmyXlYd
 QlqduMwIWfKa0uI95bkStDktM7SbRKJpORq25qj8QZ728STp57vvoW1WISUEzHCG4MFcKax01lL
 SPAp6PT2y8Os1kurC5rznzETEAFgdqmNcc1dbgWR7sBCV3GE99lOo7aFS4NI/BjzvDMOy+/9z6M
 XPfY171BRmBD4GFJbCRxiEmSrUj6sz0dG12kO3imcxAIPSBKqX7nFHzqvh09HKsi/j4wIyVE1J/
 60WX4JNDsgtdthFJI//vKc4iAOZMnYHNPREkFP/Tq6wC0bfW/Tiuh+paDFa8U/Lh8k6+r2VC0oc
 Qj51DBYsZLa9YXA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 25 ++++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f28c32d1a4ec5..348b8cd18327e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1054,10 +1054,17 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 	u8 lane_mask;
 	int i;
 
-	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	if (lane_cfg->cphy) {
+		lane_mask = 0;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= 1 << lane_cfg->data[i].pos;
+		for (i = 0; i < lane_cfg->num_data; i++)
+			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
+	} else {
+		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+
+		for (i = 0; i < lane_cfg->num_data; i++)
+			lane_mask |= 1 << lane_cfg->data[i].pos;
+	}
 
 	return lane_mask;
 }
@@ -1096,10 +1103,14 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
-	for (i = 0; i < c->num_data; i++)
-		val |= BIT(c->data[i].pos * 2);
-
+	if (c->cphy) {
+		for (i = 0; i < c->num_data; i++)
+			val |= BIT((c->data[i].pos * 2) + 1);
+	} else {
+		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+		for (i = 0; i < c->num_data; i++)
+			val |= BIT(c->data[i].pos * 2);
+	}
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
 

-- 
2.51.0



