Return-Path: <linux-arm-msm+bounces-6153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA97820940
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC03E283BE0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFC2ECE;
	Sun, 31 Dec 2023 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ubvpI7zE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08C818
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ccc6e509c8so43451011fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983439; x=1704588239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
        b=ubvpI7zEMuQfvu3o33+luQbFTgvy/c7o8XkD+UFtEXM4jqP90vhJu5Pxp56i8SMAnE
         rD2mNx2hLLf4Pg1X9oEPsSV1iJUcAQxTR7HfW0c1qSei1IZQHO4hPOFHGgJRgnASIMVG
         llTZtbxOaI1wCezymVhmtnTP1ktZ9/A1EyPyWPObOvaNiJKmXPHx7O+mun77KD6lIxoT
         DVjPcks9PzjuKt8IGwDU4C/CUtmnG9A8qCMRW/RrRwnIim4trPr9iTT2hb/wDtCe1jMK
         eZB9unzxwzEFZTuNfZj/tDSy2aew+RaNAqttix0htEHp/H0bN5qcq+LsaoJcibR/3RRB
         Q//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983439; x=1704588239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
        b=pV7M608j5jAJKHuejx0NHDZKD1Ld+B/IiKFZtEXYla10NeyaJWn5qCCQZ5XQXmmRIw
         aCu+QEUQeazI0LH4VLzVQyrnH1JWTzdDxzHvj/G6toVsqDbrtM0yFOHX0BRgdleW6DzQ
         lX2u6J1GPlDRqEOoos+6GcBvUan3h4YKdAY2tBskzVcGHbAs+Gmhq9FPECAVSgOlMO07
         e5ZcS2rOegqQNFu6Nso7+jpFwLTG1DMdNZ9YX/ZAAqYS/6/ApQ2gm4P4KLT8rHODjQjv
         gOEHiqc+oGzo1NO8UcTdO3X7PCy00UzkkoF5ZWfcWLvjrUd4ut3K0K6SSsn7Av6krFxw
         nJrQ==
X-Gm-Message-State: AOJu0YyJ6b9Y/8jIvQJTBTtxc9dH+AehMYVy4OGy2jo3Ku8k5VHYd6QK
	7eTBsAEn9FstgziWfVf87OziCFMVs6gxOg==
X-Google-Smtp-Source: AGHT+IFj+ETuYeyccWGVEOUFdVJpyDVzBfxtMFjrfs+4rnbGgjA7Pql4p2q+zrzbJLFbmClJO/Lx9w==
X-Received: by 2002:a05:6512:12d2:b0:50e:9a16:103 with SMTP id p18-20020a05651212d200b0050e9a160103mr89205lfg.31.1703983438874;
        Sat, 30 Dec 2023 16:43:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:43:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:50 +0200
Subject: [PATCH v2 03/15] drm/msm/dp: parse DT from dp_parser_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-3-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nbI6O2jVJmJKDcIwmvwKvAtsadxXm7JZt5ZEib+SKuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJot5ruSYBM2dWO8mK76xKYFScuAQwatTME
 7msN1ztCbWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1dYyCACxhk++LQcxDQ33qtIafnZZqojTBqhcEN2pKX+xCPd8oJKgD3bGBJJQ5a1M4SMe1M4DrIt
 dcQ0IkcShE23vffDIpoSXXDrtFrpGbvdr754m/ww+7sQMfED1+rTwJYGRnytelca4chMBl6tqDk
 tgaqxO2tv0F2K3u1QLwVX7LTJm1lxVrC8iLnOzDECksGyBiO9M+bC8FDb1KgOdXx1SPUh8oJbQA
 gizgtfGN7nobo+ExnWNlp0Phq1I34yTyXgn1L5SZ9ndk5/M/tZdPzSJIxApqxfM8r5U1gW+Id/4
 vCOmsAY4+Qdf/fS+5FdcV5po+maMzR6scUT74maLvy6myLka
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It makes little sense to split the submodule get and actual DT parsing.
Call dp_parser_parse() directly from dp_parser_get(), so that the parser
data is fully initialised once it is returned to the caller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 8 +++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h  | 3 ---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec27..67b48f0a6c83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1266,12 +1266,6 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto err;
-	}
-
 	rc = dp_power_client_init(dp->power);
 	if (rc) {
 		DRM_ERROR("Power client create failed\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 7032dcc8842b..2d9d126c119b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -315,13 +315,19 @@ static int dp_parser_parse(struct dp_parser *parser)
 struct dp_parser *dp_parser_get(struct platform_device *pdev)
 {
 	struct dp_parser *parser;
+	int ret;
 
 	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
 	if (!parser)
 		return ERR_PTR(-ENOMEM);
 
-	parser->parse = dp_parser_parse;
 	parser->pdev = pdev;
 
+	ret = dp_parser_parse(parser);
+	if (ret) {
+		dev_err(&pdev->dev, "device tree parsing failed\n");
+		return ERR_PTR(ret);
+	}
+
 	return parser;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 90a2cdbbe344..4ccc432b4142 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -67,7 +67,6 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
@@ -76,8 +75,6 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
-
-	int (*parse)(struct dp_parser *parser);
 };
 
 /**

-- 
2.39.2


