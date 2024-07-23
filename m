Return-Path: <linux-arm-msm+bounces-26915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F275893A31B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 16:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3A0282AE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 14:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77C1156962;
	Tue, 23 Jul 2024 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvHnG7iD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870915382C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721745974; cv=none; b=SH5Migq6M5Md3uw3fg8J9N8N9ho37m5s69q2q2gat0YueJQO3WW7RLC+oOh1vqdWn3R0ngQjOkz9iTCaUI5ivh9IllAOIIuLaqkcuFpTtnKHdgbOsi4ZRZNoYNZYZeuHj+8LAPML7zU47Iq47RfgMtOg3NE7B6ZTJCvigsoyC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721745974; c=relaxed/simple;
	bh=f4nFfrVFsoZlAw2TqgkIjPVPxb5PG9oafUyuaGzF2hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sflr0zEvBo9EZVEZTM5YaU5frLA/J1ELogsbFDk8XP4YBYMOoMv33csku3nH22AJ2SD9TDMc+wQek1jDGnCkm2UeSM4YtnGqe8IzSKNxQdlqdT1HXQaogpIGEG62eCeDE+K0LrnoXkNPWVDOfCVk9DxNRM2RyfzHld/AQM0XADM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvHnG7iD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a10835480bso4955982a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721745971; x=1722350771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGhe5Ex1bPFfV1vlOFlhgJUy/23nt8E3XkBUwt2fp5w=;
        b=dvHnG7iDG0W79pgxSUvSrwTmGOtdbod+NXVXJ27rz1cMklfqe9tTvFOl3jZJ86g0ym
         GwQFmJL7s09OO1xc+qlaEwVFvWZaKkvnvT/W4Kmbl9lnqWW+q0KBqXdMTevvwxGpFBHL
         N56SDcYAC4a3WwSoEVGt7Y21QE6AelrfgRO6PE3RaOh7wTA7NaresmHAFC1zmzkKfN9L
         PA34EeWE28N//UtzTvsrVSLn16GxlZtmwthGLKAgD05iSoJUxqCq92iacjEj9tR0aQoc
         T2XJti/S/n+ryjzMHXCQ0rf0bqI6lPv1XlbQYPaMi8xcHrdEyCqAgg46Cp/eigfyY5Gr
         Sq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721745971; x=1722350771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGhe5Ex1bPFfV1vlOFlhgJUy/23nt8E3XkBUwt2fp5w=;
        b=xObBD29GGNngWWddvorHOoDOYN659/cPIS7TuPVy4u9Je4qG3HrLobyPdDd/xBtiFI
         GJTxor2X9qQKsOgm4I8aZihwlfzBNCjnkcTk3vl/BHOg32vHjwK4Uz9phWUZNjxtnXFG
         PMGK3nNjL9DNY394VlGuXWf5rRocO82YZbtKmILjNke4t9JXZV/d7zCEHPO+UolOnX7S
         NvB8Nu2O0TrwoQMfzg30Je6H1pct+X3WpADIFhBLPhPtSJGCBDC7on7ghz7SH6Lwtezq
         u8bnjX6J8NHCP5t4dkoczvQYm3OWSCxcTSWBQ2InWnonwwC+mMXj/evSF9jpIRhOoAt9
         Bgew==
X-Forwarded-Encrypted: i=1; AJvYcCWsES82akKa1Gz7ykxh1huqRQVh8CVjicExgthtBCiDviNryZ55F4IEFlCtOH4C1sY1cJThgk+wJ67VPES9e17cISEiMzJjbFWDfXhe0w==
X-Gm-Message-State: AOJu0YzJ57VgJB47/WR43bbpiFdTT3Ir7Ne533VNyJ8Z3D5Yh9XtxVzp
	/7HqgZBnYnzweHqWGz/tjlOf6STp6D0wx7yr596eGICC1WbBuUy+PpPt7jlMHVw=
X-Google-Smtp-Source: AGHT+IE6FPRxaRZAelP7XYoRe2kh2fF3fU2NbulOmAczM715i/eTYrmwCoGSdVXZHnXFZX+KM1NhGg==
X-Received: by 2002:a50:a6ce:0:b0:57d:2659:9141 with SMTP id 4fb4d7f45d1cf-5a47b0e7da1mr5752175a12.24.1721745971395;
        Tue, 23 Jul 2024 07:46:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f88a5sm7592422a12.77.2024.07.23.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 07:46:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in VI mixer
Date: Tue, 23 Jul 2024 16:46:07 +0200
Message-ID: <20240723144607.123240-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wsa_macro_vi_feed_mixer_put() callback for setting VI feedback mixer
value could be used for different DAIs (planned in the future CPS DAI),
so make the code a bit more generic by using DAI ID from widget->shift,
instead of hard-coding it.  The get() callback already follows such
convention.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 8351f0974e6a..4158657914fb 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2296,36 +2296,37 @@ static int wsa_macro_vi_feed_mixer_put(struct snd_kcontrol *kcontrol,
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	u32 enable = ucontrol->value.integer.value[0];
 	u32 spk_tx_id = mixer->shift;
+	u32 dai_id = widget->shift;
 
 	if (enable) {
 		if (spk_tx_id == WSA_MACRO_TX0 &&
 			!test_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			set_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]++;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]++;
 		}
 		if (spk_tx_id == WSA_MACRO_TX1 &&
 			!test_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			set_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]++;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]++;
 		}
 	} else {
 		if (spk_tx_id == WSA_MACRO_TX0 &&
 			test_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			clear_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]--;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]--;
 		}
 		if (spk_tx_id == WSA_MACRO_TX1 &&
 			test_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			clear_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]--;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]--;
 		}
 	}
 	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, NULL);
-- 
2.43.0


