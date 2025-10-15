Return-Path: <linux-arm-msm+bounces-77328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6271BDD40B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11E504F464E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B2C31618C;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEdSF/Xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCCE315D39;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515038; cv=none; b=ShwXZlmPko/FnpwqunxwH+5wUzrliKC9u/h2r1b8GAtvOjH54f0LEYwMP1ole4ZeCIaV+PdrfF/6g8sVVw9byOoitUYvl1zZ2oZ/u8v90T6ToNlWsZQYjJ+ZsspjmUP5SzV/tTUAbfXvUGNWijc3bk1zyHIHTnxF5HXcecKHgMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515038; c=relaxed/simple;
	bh=37cxsCQqwULggoaO8BwYnpuLWSVuorgT0lKPtHEYh7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Byue2ZjutkuyRUFZ0P7nXWRXmwbIGYD4UGWygYlyo6D2fKia0b3Lo6P+nrqGsK/f/31pVbpSgb/xc++EnvA8IboAmzms49HFLKe+uXPl7msfB39NzlgD1TgRbQ1Wp0LxH+IK9ymIdC5yxiTpCaUaiN8umtlhhcJy+XJBhmceLBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEdSF/Xi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30585C4CEF9;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760515038;
	bh=37cxsCQqwULggoaO8BwYnpuLWSVuorgT0lKPtHEYh7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MEdSF/XiBstLchnEY99x3NxWfwVEv2+WNHUz9kSm+UJOm7eN70K3o1z9h7p9vgHh1
	 HbSXXUtJ6o9pPN8VESR3yeZ7QimFAFC+/IeMi3lHeHlbrE3iB8JGP+TFYuJefL6yRV
	 GXzLNH8vxV2cxR7/QKsmX7D/JTZcdDehAxj19mjhfSDBk10bisz9/QFkKKgBd80AXK
	 MvZGe+E40azxVJIse9LavCM3cvNZvpuiD7ys0fAJl2hZfjr8RfFHGKOpIJn4gWPAU1
	 t5G8nmNshpZDZHwi8UWWOZSJ+Od9n0EHREkk+Log5xUbnxx8NZGd00YxMYHU5OSh7E
	 yWkI3LYFAv7/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2452FCCD193;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
From: Prasad Kumpatla via B4 Relay <devnull+prasad.kumpatla.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Oct 2025 13:27:15 +0530
Subject: [PATCH v3 1/5] ASoC: codecs: va-macro: Rework version checking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-knp-audio-v2-v3-1-e0e3e4167d87@oss.qualcomm.com>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
In-Reply-To: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760515036; l=5671;
 i=prasad.kumpatla@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=rb6cUcHiuCOCKrm83QUxLYsb3sI1J8V5hRwiIZIiRaI=;
 b=D4xrWYYbLO+HMk8Ftrc8hR9GLncjgJ0RHXv+RNpRk9QZnbM2Jua8gHgL1erJLcWB6+Lkj8lTu
 xdOiKLL2qHNAo4ENKm+j4s0np7gE19lkWQmkNZABS3CnHIBEKkU4Mpc
X-Developer-Key: i=prasad.kumpatla@oss.qualcomm.com; a=ed25519;
 pk=I3mn8JNlYnnm7frqMGXms1Rm2H+0gpAfknMlnBYqCzw=
X-Endpoint-Received: by B4 Relay for
 prasad.kumpatla@oss.qualcomm.com/20251014 with auth_id=541
X-Original-From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reply-To: prasad.kumpatla@oss.qualcomm.com

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Open-code some of the registers to make the checks anywhere near human-
readable. Error out if the version is unsupported or if the VA macro
isn't supposed to be present within this LPASS instance (since we can
check for that now).

Note that previously v2.0 and v2.1 assignments were swapped, but v2.1
does not even seem to exist (as opposed to v2.0.1) and there is no
difference in SW handling anyway.

[Prasad Kumpatla: fixed a spelling error and resolved a checkpatch
warning related to return value handling]

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 90 +++++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 2e1b77973a3e..eb4981255f2b 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
@@ -64,8 +65,15 @@
 #define CDC_VA_TOP_CSR_I2S_CLK			(0x00A8)
 #define CDC_VA_TOP_CSR_I2S_RESET		(0x00AC)
 #define CDC_VA_TOP_CSR_CORE_ID_0		(0x00C0)
+ #define CORE_ID_0_REV_MAJ			GENMASK(7, 0)
 #define CDC_VA_TOP_CSR_CORE_ID_1		(0x00C4)
+#define CORE_ID_1_HAS_WSAMACRO			BIT(3)
+#define CORE_ID_1_HAS_RXMACRO			BIT(2)
+#define CORE_ID_1_HAS_TXMACRO			BIT(1)
+#define CORE_ID_1_HAS_VAMACRO			BIT(0)
 #define CDC_VA_TOP_CSR_CORE_ID_2		(0x00C8)
+ #define CORE_ID_2_REV_MIN			GENMASK(7, 4)
+ #define CORE_ID_2_REV_STEP			GENMASK(3, 0)
 #define CDC_VA_TOP_CSR_CORE_ID_3		(0x00CC)
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL0		(0x00D0)
 #define CDC_VA_TOP_CSR_SWR_MIC_CTL1		(0x00D4)
@@ -1462,39 +1470,63 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 	return dmic_sample_rate;
 }
 
-static void va_macro_set_lpass_codec_version(struct va_macro *va)
+static int va_macro_set_lpass_codec_version(struct va_macro *va)
 {
-	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0;
 	int version = LPASS_CODEC_VERSION_UNKNOWN;
+	u32 maj, min, step;
+	u32 val;
 
-	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
-	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
-	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &val);
+	maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
 
-	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
-		version = LPASS_CODEC_VERSION_2_0;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && core_id_2 == 0x01)
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &val);
+	if (!FIELD_GET(CORE_ID_1_HAS_VAMACRO, val)) {
+		dev_err(va->dev, "This is not a VA macro instance\n");
+		return -ENODEV;
+	}
+
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &val);
+	min = FIELD_GET(CORE_ID_2_REV_MIN, val);
+	step = FIELD_GET(CORE_ID_2_REV_STEP, val);
+
+	if (maj == 1) {
 		version = LPASS_CODEC_VERSION_2_0;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
-		version = LPASS_CODEC_VERSION_2_1;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
-		version = LPASS_CODEC_VERSION_2_5;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
-		version = LPASS_CODEC_VERSION_2_6;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
-		version = LPASS_CODEC_VERSION_2_7;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
-		version = LPASS_CODEC_VERSION_2_8;
-	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x90 || core_id_2 == 0x91))
-		version = LPASS_CODEC_VERSION_2_9;
-
-	if (version == LPASS_CODEC_VERSION_UNKNOWN)
-		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
-			 core_id_0, core_id_1, core_id_2);
+	} else if (maj == 2) {
+		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_2_0;
+			break;
+		case 5:
+			version = LPASS_CODEC_VERSION_2_5;
+			break;
+		case 6:
+			version = LPASS_CODEC_VERSION_2_6;
+			break;
+		case 7:
+			version = LPASS_CODEC_VERSION_2_7;
+			break;
+		case 8:
+			version = LPASS_CODEC_VERSION_2_8;
+			break;
+		case 9:
+			version = LPASS_CODEC_VERSION_2_9;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (version == LPASS_CODEC_VERSION_UNKNOWN) {
+		dev_err(va->dev, "VA Macro v%u.%u.%u is not supported\n",
+			maj, min, step);
+		return -EOPNOTSUPP;
+	}
 
 	lpass_macro_set_codec_version(version);
 
 	dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));
+
+	return 0;
 }
 
 static int va_macro_probe(struct platform_device *pdev)
@@ -1594,10 +1626,14 @@ static int va_macro_probe(struct platform_device *pdev)
 	 * old version of codecs do not have a reliable way to determine the
 	 * version from registers, get them from soc specific data
 	 */
-	if (data->version)
+	if (data->version) {
 		lpass_macro_set_codec_version(data->version);
-	else /* read version from register */
-		va_macro_set_lpass_codec_version(va);
+	} else {
+		/* read version from register */
+		ret = va_macro_set_lpass_codec_version(va);
+		if (ret)
+			return ret;
+	}
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */

-- 
2.34.1



