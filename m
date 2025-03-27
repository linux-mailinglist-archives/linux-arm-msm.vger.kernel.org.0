Return-Path: <linux-arm-msm+bounces-52620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18003A72D56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D8918903BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD39320F09C;
	Thu, 27 Mar 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ceu7Q+36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE85D20E6FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070008; cv=none; b=rUhhhdFixm1J1PdNwmdHhrU14JpoGVl6DGmnV60PJOylHGsZF7b0jj8srowNNVhcfjCeFiraIVOPpRghogbLqfsUI7/ljlFf7p3wMZzT6NYtvRqsvXm48xL3yyWzzc57s8Nma/z1tdfOQJaabgWesGl0igz4B8vydh/5IfbiLvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070008; c=relaxed/simple;
	bh=hJEhHBHgmcwkLGn7ADU+TBJtnvqkH4aaspjSeICJrEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hkftyu8mFkFJbT201My2AXDNHO/LXB08HeTOv/g1gp0mn8L6J/wxQ3ebvUdmwP5Szn8szDbERF7Wsb9TiFiEq1wC5APebJy+4K2dlMG2peYdlFa8Gd226ZMr45D/SpfEeENtCoKJhKY+cDGh+A2PwiYD6f6I2HBrMChcAE1lBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ceu7Q+36; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913fdd0120so435590f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 03:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070005; x=1743674805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=Ceu7Q+36KGy6V5utgRpQHgV9yxlDboAqbtPgoGDeffikMAs64n8xQgbzUnigbp+9pn
         KDQYZHAkpn7BS4eLaNlOPyiG+Jsif6Wt7564ujuKZDYM8SalpSGqKsUxJRAzTim9z6w0
         +b4uYMxt8qjwalm3ZDsojEOndxbMIxmiprbPxnRTAzn21KASsM1zIo5IGxnO3oa0OmMw
         Shz3YS0SK9H81MetouV+VLoFMwfTnMu4oUUDt+psSM8Z60y2L+MIcl+kJ9mPUM7VgM+F
         16Ez7IlqT2YOQw4/Kp1gIIZGgfTbF7R4gDlufgvLFHQ4z1MiGp+IGnNjf6V+Eo+Ej8Uf
         7Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070005; x=1743674805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=cXdIm+9oMdpprS4TDFgvEwO8RYXUy0EvoDZld6mc5thbE4cKKnf1jK8niHagoDIix9
         6XNFTOP+3Ll1zHsd2uEdyRB33x6nmhkSaq3nH6N2C3zC4i9xYk9yMjJ1EoMS1yTgRYng
         ggSIZr5l17NQwu6x49eroFWn6jWe4GlelxueS37OdTGyxY8iyvsayhXZu741FLArXGH8
         aHEFt8FaYzQMr14mSR640H/d3E5Rzz844grViI3vIyhyxSBf+dmNO9MsOC97sm5UkZ2/
         y+cy7KbszsIpFLVwTJd3yXqzXu4w8ie++KcO8bjPVYk/YI/g2lmD55342xpkZhNBhTef
         JsLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNdCPxfZ7LjTsX8CcFP8vzouvB6VUVOgWyH39J2aESUPooZHHDhSpJppLB19XciCy8lqp3xrHh0YL3XhF4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3O5GKEEMv1oczGp5qTF8R98rBJBeWvBqsJsrrhbjWj2LXzaYu
	Tgf/w59H3Uq1nDJIoO83rBankN1+CpyNa8+hcoOICCE9MSckRqpMDnKb2qvzZ0o=
X-Gm-Gg: ASbGnctuhbOPldU1RrjdMvXSdVWbdrKFLI+SNOQQN1ex7lZltDrpc/XxQ3QGV7fWw39
	sHS7OIGMeh2m8rJTOtUpDtENa/7xPb081lro9lC7wtDTPerYyKB3crFLPIEXv15J4nXZ+hyXZNh
	835CinE8iaOma1aMzPCZm+4gXO/3T78aAo/CPzmaKIUOxX557g5aC/dknU7JXhVH0TjNA9q/utN
	X0/mQ+zfttDbcahf7lf07x7SrRyIQNwcZppkZh09u+xJ8FyGpNGXPUJV8eeGn7s5x3JnhJOycoa
	GIV64KBw0tBUgeeo6FDazuNO9SRw2pCCnnr56WyDHLZPBX4Ui/AvAhXNccA7VW7Vb5ra2Q==
X-Google-Smtp-Source: AGHT+IHKTr77rgy7z6tUorkVmyaYsLpGj6E/y8viXassXOAOlt53NZQ+U4mnCJz68CeYjAZ0eVwnWQ==
X-Received: by 2002:a5d:6daa:0:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-39ad17466a4mr3085783f8f.16.1743070005118;
        Thu, 27 Mar 2025 03:06:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:44 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
Date: Thu, 27 Mar 2025 10:06:30 +0000
Message-Id: <20250327100633.11530-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Remove confusing and unused argument in swap_gnd_mic api, the second
argument active is not really used, and always set to true in the mbhc
drivers.

The callback itself is used to toggle the gnd_mic lines when a cross
connection is detected by mbhc circuits, so there is no need of this
argument.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 sound/soc/codecs/wcd-mbhc-v2.h | 2 +-
 sound/soc/codecs/wcd937x.c     | 2 +-
 sound/soc/codecs/wcd938x.c     | 2 +-
 sound/soc/codecs/wcd939x.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index d589a212b768..4b7c3d6080a1 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1260,7 +1260,7 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 			if (pt_gnd_mic_swap_cnt == mbhc->swap_thr) {
 				/* US_EU gpio present, flip switch */
 				if (mbhc->cfg->swap_gnd_mic) {
-					if (mbhc->cfg->swap_gnd_mic(component, true))
+					if (mbhc->cfg->swap_gnd_mic(component))
 						continue;
 				}
 			}
diff --git a/sound/soc/codecs/wcd-mbhc-v2.h b/sound/soc/codecs/wcd-mbhc-v2.h
index b977e8f87d7c..a5d52b9643f5 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.h
+++ b/sound/soc/codecs/wcd-mbhc-v2.h
@@ -194,7 +194,7 @@ struct wcd_mbhc_config {
 	int num_btn;
 	bool mono_stero_detection;
 	bool typec_analog_mux;
-	bool (*swap_gnd_mic)(struct snd_soc_component *component, bool active);
+	bool (*swap_gnd_mic)(struct snd_soc_component *component);
 	bool hs_ext_micbias;
 	bool gnd_det_en;
 	uint32_t linein_th;
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index c9d5e67bf66e..b2fb8520c823 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2646,7 +2646,7 @@ static void wcd937x_dt_parse_micbias_info(struct device *dev, struct wcd937x_pri
 		dev_warn(dev, "Micbias3 DT property not found\n");
 }
 
-static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	int value;
 	struct wcd937x_priv *wcd937x;
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f2a4f3262bdb..dfaa3de31164 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3235,7 +3235,7 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
 		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
 }
 
-static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	int value;
 
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 4a417a92514d..546aa88a398c 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3215,7 +3215,7 @@ static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd939x_pri
 }
 
 #if IS_ENABLED(CONFIG_TYPEC)
-static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component)
 {
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 
-- 
2.39.5


