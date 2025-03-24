Return-Path: <linux-arm-msm+bounces-52341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BBA6DAA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D8677A46CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E9C25F987;
	Mon, 24 Mar 2025 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yF4H97lg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5825F963
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821274; cv=none; b=npkk9dNy8Kakzfss5vRLvN87RFgfgS0iciZlCHf0/Evp7uuTMeEIrmWW9Gu91p7wisgvGr5nsK5U75ZgB7i283o4r4iKUYZDQxcO1QdZ2w3AUrR55/cKqXlKo0u/bQE+OfdXcTjtreTXLpvveOjh0RrHE+caO8FqcC52EAez9js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821274; c=relaxed/simple;
	bh=hJEhHBHgmcwkLGn7ADU+TBJtnvqkH4aaspjSeICJrEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QgRR9k984ZISfyW348B+4duCCaPcqVsWXEofubI8w3Sq/nJwuforLZX66eIan8EFPy2vO6yXty6z8WyZYFVUYCVF7WuuHkqbd3mDVHoHaxYjRC6k4gphtGAjkeMlvhCZbPd4SrHy2XhxwkYk4NzFFVH9EmuAVWcaM+jxgFXEfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yF4H97lg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso37373835e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821270; x=1743426070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=yF4H97lgOgtwoiahjN4IJAz+CdapyCJKa+TvD3oWLnsleyRiM1SNDAXOf13AFmOooJ
         DXvu32z7f5I6B9KMyVHKwfzEL2Ja0LUHKhJdaIjO5T2TFBmFRTIYcB+QYYvZkklEcohj
         WQQKbLN3ssmGJPM/4UE3oLjSIeHPcxHQdfjU9/KzT8pHhe73RRa8pXnXAXGbuAVE2LMn
         mDYS9po+8jGYAQHE9PLh+IBFKGPej3uaxlfXgsk49jbJP5FwjUZuJWgF7/iiVsUb3oGk
         fAe04U3AvsQsO0rZMH2mOJfPPrA7vuZjEloUmYsDojA6vqCv9HsGoSxZc/eXF/gZUbzt
         qndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821270; x=1743426070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPKG26aBT6MGmMvi54w+dEW5MMoDzMUIu/y68UikHrA=;
        b=a77ryFvm7z1K9sOMWfKQ5qd/PgKtx4KLJ1WQG3rKk9Scqu/zoHnN6Lre0D/pYBcRja
         EK9nqPBXjpY0Xnd+/z22cCvCunNjiPomN0z8MSlRgG33muqJ6vWOWWl5P5gZNdNall4k
         5G+9YNIaADuXJRpg8hEMR1B/U2hOZTlxNr39BZEQKXFgh2fvsmJ3ESSqYRLf1BlCghHD
         w1jS2hzeluZALEbNYZZL52ppGUPnYto7QdS7W9sk/6K9XTQnB0lF9NE0OixjgcHlgTEc
         Nzt6ckW6VEtH5JDrQokTTzj8/B6PlelK/+tiMe9ObZ9cRTE7ZFPSj549Iea+gS275xfe
         1F8w==
X-Forwarded-Encrypted: i=1; AJvYcCVje58hmo0171QZn7fIu5fPkIBeJC/zQfCPLmb6JSMMRNeEYOGc0EkGTzMtwRGctnOrqRiUzOKHAcPV99Fi@vger.kernel.org
X-Gm-Message-State: AOJu0YyXahXNsvgTA501dyg/KddAIrKXjz2e3Gl3hVDwUuABoV1gL8W+
	pHybAjkcmafYI8aynXa9qzRIyCVYsqxm8c3aHoNF080ug9K95ux6u2Vn/YNDoNc=
X-Gm-Gg: ASbGncs1LL48op2xt6r3dZkLo6xSrQnoTDaAlEnkfAtlKieLFVFhqskVCsH9xbexmiu
	zxCnOEsnCIymJEzTiEN7eYXqbfxaYpMKjvshr4MJcyuZ5oSOYQ+SHxFk1g7kW3QtT124FStYwWA
	/jOPw8zcoc4a/HZBFu1tnAh/caFq0BAKS3m9NAZp/u1WJ9nr1lk7NUVQ2fY0Td5Bv+4+8FezLYf
	QNXDQunWRjPiaYrlNggxD6ti9v9qEkkVoEKp6YPr+y6ugewfiTPV1qu4QBGVjosySkVj6OZS/xM
	n99Yx0oTfb+MWKdZOk++lqCs7EEtBFHmVtW7NjscOn+Qq4+zKwdifqgxEloMyPlIARydLQ==
X-Google-Smtp-Source: AGHT+IEHylwx4qlkPIxjxGRM/SsWCTC+RRiS7Z7WGB581zySgV9XmANjiM7Hap33tyQHXG7s4q3FgA==
X-Received: by 2002:a05:600c:3c82:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43d50a1d1ebmr98894065e9.22.1742821268315;
        Mon, 24 Mar 2025 06:01:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:07 -0700 (PDT)
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
Subject: [PATCH v4 3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
Date: Mon, 24 Mar 2025 13:00:54 +0000
Message-Id: <20250324130057.4855-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
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


