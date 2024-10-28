Return-Path: <linux-arm-msm+bounces-36146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47D9B2D91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96487280EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82E21DDC1D;
	Mon, 28 Oct 2024 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1urPzAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0721DDC15;
	Mon, 28 Oct 2024 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112700; cv=none; b=hUwr9jqLKn4L77hglUsuaEwCgRiojMogkpYguej/92/isTh6NGvMv4VuzqhBbYsReYwP2rbHVGzp7i4Gm2T0llNJZWNX10sLMa9VVl/HkYDCckOQa4NinYr9iKD/9hf5GNNGaHwDP8ee7A0AMULVkFyI4s335FgOZ70TwDIPD98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112700; c=relaxed/simple;
	bh=bM+QI0csOazbnWg7hovcu4YTxqNdw7aAGIDhttFynQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxheqxzmcUMpalVxqbhXCMRfBsyeK8691WCWpwg49Evoroo4AgVMtnAxJIIYLNb7wh+IwxDGcqua3rZkfsq9R+3ZghFFHc4dHKQU7FWd1klRjZpAnEI3fUvlG/9mSAfytC5FfAZwE0N6kYs2ypzyPw8McyyuYFlF5anuTrHfWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1urPzAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F635C4CEE7;
	Mon, 28 Oct 2024 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112700;
	bh=bM+QI0csOazbnWg7hovcu4YTxqNdw7aAGIDhttFynQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1urPzAiA2tJzQGOm1xlbw/hFm8lDRgxazq4NOS0hFsgdNf5XcZ97cmzq2hWK0rTC
	 2OtL/X1BDPvfbR+08HpL/lo/dcJ3z0O1yl7sHZY1SoduWOJ1U/VCaml83oT52kWbzQ
	 N7G4j9cMltOP1ASK7lbdYkBLu7HM1raSrDqLVJLDiKHhAps03TiYCdt1GG7C2hdPLC
	 RRo3AmQAPvy3fbi0VlixGLDabjFqeJ1ucU+80NWqHGGgAhjHVouLh6Bze0CbSDRMmV
	 9tDqxexoOdPcQ5D/IzbO+1OvGH9eJ1oLY1YXNLCAxOifo7w/AHJnriUHx+K9CLQakS
	 H21CKXvWBLLKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 18/32] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for DSM_CTL and SEC7 regs
Date: Mon, 28 Oct 2024 06:50:00 -0400
Message-ID: <20241028105050.3559169-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit 9fc9ef05727ccb45fd881770f2aa5c3774b2e8e2 ]

Turns out some registers of pre-2.5 version of rxmacro codecs are not
located at the expected offsets but 0xc further away in memory. So far
the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
CDC_RX_RX2_RX_PATH_DSM_CTL.

CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
0x540 for RX2 but it should be 0x54C and it also overwrites
CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).

Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
and above this offset will be equal to 0.
With such change the corresponding RXn() macros will generate the same
values for 2.5 codec version for all RX paths and the same old values
for pre-2.5 version for RX0 and RX1. However for the latter case with
RX2 path it will also add rxn_reg_stride2 on top.

While at this, also remove specific if-check for INTERP_AUX from
rx_macro_digital_mute() and rx_macro_enable_interp_clk(). These if-check
was used to handle such special offset for AUX interpolator but since
CDC_RX_RXn_RX_PATH_SEC7(rx, n) and CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)
macros will generate the correst addresses of dsm register, they are no
longer needed.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://patch.msgid.link/20241016221049.1145101-1-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ce42749660c87..541febab9451a 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -202,12 +202,14 @@
 #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
 #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
-#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
+	(0x0434 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
 #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
 #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
 #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
 #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
-#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
+	(0x0440 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
 #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
 #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
@@ -645,6 +647,7 @@ struct rx_macro {
 	int rx_mclk_cnt;
 	enum lpass_codec_version codec_version;
 	int rxn_reg_stride;
+	int rxn_reg_stride2;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
@@ -1929,9 +1932,6 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
 			}
 
-			if (j == INTERP_AUX)
-				dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
-
 			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
 			int_mux_cfg1 = int_mux_cfg0 + 4;
 			int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
@@ -2702,9 +2702,6 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
 
 	main_reg = CDC_RX_RXn_RX_PATH_CTL(rx, interp_idx);
 	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, interp_idx);
-	if (interp_idx == INTERP_AUX)
-		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
-
 	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(rx, interp_idx);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
@@ -3821,6 +3818,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_0:
 	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
+		rx->rxn_reg_stride2 = 0xc;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
@@ -3834,6 +3832,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
 		rx->rxn_reg_stride = 0xc0;
+		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
-- 
2.43.0


