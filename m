Return-Path: <linux-arm-msm+bounces-80865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4FC43B3A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 228613AE273
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAAD2DCF4D;
	Sun,  9 Nov 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfCPH/OF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7D2DC783;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762681206; cv=none; b=d2QUJJ+KcEwGORaISCRMewZr5PiyOw6gkGqPTY6qPrnOtPohHA0BPjlJFqkOIGshmHrm8DaS5lUFRQLmSTpLjcmBawd3eX2zS3LOitA/yaoZJx3/burRW9cWv6BPhLVOTEAkujyZIgPti1B46UgwqHwahzvM8UD2QncV16BGmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762681206; c=relaxed/simple;
	bh=RZlBEAJOrXSu39VwxTx84OVlwMIvmfTRQ/plArGhkYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DqFFfywKKrzJqvxI/GjP92tjWhQ/N6Ffk0Fhq6GFWvsb1tsithvTXE3bmL3ON8/TvDMCv6XGVNwIcOCVSvKy9UII+n8hl3OL/+rXbe5v2JGXnz69cFmx2ATpC9PyNOT5wGoW8lpjoR7W0Ox2FhQJlVNOq6pTPm96x49MghjfH/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfCPH/OF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F41EC19423;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762681205;
	bh=RZlBEAJOrXSu39VwxTx84OVlwMIvmfTRQ/plArGhkYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CfCPH/OFa4yLhWObwpmzTVsHT2vPpxiCgKK3yoCSWEwjF9kJNMVwSgsgbKbmEukbS
	 /hAvt8eIft2xwclWkuvRDByNgFpwaGbxrtUPW81/dIYrwE5dXeFVWT/8CmMh1fle7D
	 S4HhaZ/lY323maxSl5CBEeV5rWb/3PJiRVajjtphz1/JbyZsc1s2TRWWGdACpX93Iy
	 EjmPmBmzbgTregf/VED8h/v9F1za5siEqmB05QPFy2FYNvQ+WnJz/WV6osloJEACNw
	 KpfXRoTNDukwlR0y73p0Xua1+fnpibQurIfzk+iUQDiXbX0z4nf4RBXQ2YVRQMStlm
	 UwHLxTtqmyQfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DF4CCF9F8;
	Sun,  9 Nov 2025 09:40:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Nov 2025 10:39:48 +0100
Subject: [PATCH RFC 5/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-qcom-cphy-v1-5-165f7e79b0e1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3497; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=wdtdhXUgjML5HyV1zbulZC0Uuqj+CHFjLctnxCE8hW4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEGFyxqoCOIhTFI+UNGoVoFwPZtJ0IM5RkZElM
 1EMsNK3SZmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRBhcgAKCRBgAj/E00kg
 chyjD/4mX0dWFKEq4rpOFQ0utphrSV08we2r8jzmN6ZGMCBKO4S80K1XYGvD+Y4w7MBpdhMrNNV
 +u4Lank20TdQvvWR/KPaYl5xeZxFGsPPCacFodP1hYJlnx8fG9f0F854c884SafbYZtw84puwlZ
 QKGnlq7twr8p+pcwJpOrcz62LuiU1HhCx11SWkXglzx35xx7dRPPyk5Wzol2Y/jQm5rMVjJN06d
 dkY70DVbDVFyH/U8JtciuVYuhFc2iZYmo3MYQ983MMJDFxHYi16JLPFv0+gE4jkAts47cKQerkW
 lWXH+k2VL6nbTDpXm84o254PbVWn3bJ1PNU2hduKY13zjj+4eAQw8kAGlVDGDz8y0HH3f5T3SxY
 V2ViUxYjWVtKPatvfrU85dGcjpL1EvJ2ugAHAVpVqPO8pqSqi92+NlUMXO9CW4jibml8r0OmwIC
 fWzMYf4msbYV9X9wFANa20t8DVMJ9hOBJaBZFOC2UrSA7JXQ5/OVvzimOwVRnTwero3VF2T/I2j
 /imzhx7oR1NMMZ6y2SSxLgajo+TtWL1U2/mpMZD8VDwO4JisbGjCD56fQOOk3K+JMGnpYn56B7+
 UcHM54J1YUjgVYOgonqUnnt/S7siEtlvr4Zx3E/KCX62BjQiRumfdraP1yJ4KSrDgGkmz+AlN5j
 T84vRB28i6dHn/A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <phodina@protonmail.com>

The lanes must not be initialized before the driver has access to
the lane configuration, as it depends on whether D-PHY or C-PHY mode
is in use. Move the lane initialization to a later stage where the
configuration structures are available.

Signed-off-by: Petr Hodina <phodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 70 ++++++++++++----------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 348b8cd18327e..c2adbde6b4e0d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1101,6 +1101,42 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	u8 val;
 	int i;
 
+	switch (csiphy->camss->res->version) {
+	case CAMSS_845:
+		regs->lane_regs = &lane_regs_sdm845[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		break;
+	case CAMSS_2290:
+		regs->lane_regs = &lane_regs_qcm2290[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		break;
+	case CAMSS_7280:
+	case CAMSS_8250:
+		regs->lane_regs = &lane_regs_sm8250[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
+		break;
+	case CAMSS_8280XP:
+		regs->lane_regs = &lane_regs_sc8280xp[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		break;
+	case CAMSS_X1E80100:
+	case CAMSS_8550:
+		regs->offset = 0x1000;
+		break;
+	case CAMSS_8650:
+		regs->lane_regs = &lane_regs_sm8650[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		regs->offset = 0x1000;
+		break;
+	case CAMSS_8300:
+	case CAMSS_8775P:
+		regs->lane_regs = &lane_regs_sa8775p[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		break;
+	default:
+		break;
+	}
+
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	if (c->cphy) {
@@ -1160,47 +1196,15 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		return -ENOMEM;
 
 	csiphy->regs = regs;
-	regs->offset = 0x800;
 
 	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		regs->lane_regs = &lane_regs_sdm845[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
-		break;
-	case CAMSS_2290:
-		regs->lane_regs = &lane_regs_qcm2290[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
-		break;
-	case CAMSS_7280:
-	case CAMSS_8250:
-		regs->lane_regs = &lane_regs_sm8250[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8280XP:
-		regs->lane_regs = &lane_regs_sc8280xp[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
-		break;
 	case CAMSS_X1E80100:
-		regs->lane_regs = &lane_regs_x1e80100[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8550:
-		regs->lane_regs = &lane_regs_sm8550[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8650:
-		regs->lane_regs = &lane_regs_sm8650[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
 		regs->offset = 0x1000;
 		break;
-	case CAMSS_8300:
-	case CAMSS_8775P:
-		regs->lane_regs = &lane_regs_sa8775p[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
-		break;
 	default:
+		regs->offset = 0x800;
 		break;
 	}
 

-- 
2.51.0



