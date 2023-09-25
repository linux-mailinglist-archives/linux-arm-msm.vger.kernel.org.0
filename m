Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980C27ADBE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 17:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbjIYPly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 11:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbjIYPl3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 11:41:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BD31B7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 08:41:18 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-405e48d8cfdso2679255e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656477; x=1696261277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ULa3MlvTg8hdkVamNSIOKh6gGISQMp+o/MnpLuMkMw=;
        b=Jvgf32aOulSysep/r2PHBiTBZdzYWRtf4K6wg4FZgROpmxdftdMCKf94lamDtcClzp
         2Ir/1RJ+EGwrzudCUpJ31V2eI9zwkhYH8htAOU/fluIvRAUJ8ZjzEKdLl1zmyCG0o6RS
         Tpuk0OofYBaKTJXBNYIe1C2VcDTP7iUDR8UqHIAsxMnovc6Zpak82sd5jPu8EWS0/6e0
         q52W9eVrT/uxRJURvueaDUuLt3m9I/0NzBhBv1tp0zirBvNMZtFrXj6TVFujwb7i8SDa
         m2dAwXf9DgAXOwpAfGAHu7FTJowSPQKVneG/bDGwpVkAjRf/YXbKFfO7LxNW4YNGpndF
         LTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656477; x=1696261277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ULa3MlvTg8hdkVamNSIOKh6gGISQMp+o/MnpLuMkMw=;
        b=Pm71yhSaUFA6dfJKERq5M7KqC5HGHv1ubR6VyljBM8RA2kFyOsrBH9vWWC8UOFMQ9u
         LGd5JXVF74LjZYjIt9osbQsHAQv8JCZlzU1FW2Koax2jpuDNZhfDJfAG1qi86OxyRUVJ
         eZNEm0adAq/vWNEByUNgoYoxg7xcnDAxaEuILD0JL8Nvn00XdFCpjsc6vY5SGygDqYti
         ZazmLWcO7/B47uzrZCsNs1BEIrFYNZvwP4wtChtQjLwrzzvThL0Sd6VcxqGt93+BUdmo
         bwpIxUhXrVBxuj8KxE4zvk6l/zzGK9IqfLQwo+XPivxK93DL7A6OF3O7uHX5bq/5TZ/r
         8Qfg==
X-Gm-Message-State: AOJu0Ywh9Pu+vf8SdkieO26tQdRhz/42SAOtGNU8puEShSOKHT40JVap
        X4cBm0BX7zOG8vrejaoxysCPBL+qklihu9HYnPg=
X-Google-Smtp-Source: AGHT+IHb0jMKHPIrHUVmhHGE2t1zsKfSVm5s11XMuXywDJehqNKi1IBjv6fCXsmLPchBNH+joVm2yg==
X-Received: by 2002:a7b:ca56:0:b0:3fb:df34:176e with SMTP id m22-20020a7bca56000000b003fbdf34176emr5970660wml.31.1695656477042;
        Mon, 25 Sep 2023 08:41:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m15-20020a7bca4f000000b003fe4548188bsm15206155wml.48.2023.09.25.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:41:16 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 11/17] media: qcom: camss: Allow clocks vfeN vfe_liteN or vfe_lite
Date:   Mon, 25 Sep 2023 16:40:53 +0100
Message-ID: <20230925154059.837152-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154059.837152-1-bryan.odonoghue@linaro.org>
References: <20230925154059.837152-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of Video Front End - VFE or Image Front End - IFE supported
with new SoCs can vary both for the full and lite cases.

For example sdm845 has one vfe_lite and two vfe interfaces with the vfe
clock called simply "vfe_lite" with no integer postfix. sc8280xp has four
vfe and four vfe lite blocks.

At the moment we declare vfe_lite0 and vfe_lite1 for sm8250 but never set
those clocks because we don't match the strings.

We need to support the following clock name formats

- vfeN
- vfe_liteN
- vfe_lite

with N being any reasonably sized integer.

There are two sites in this code which need to do the same thing,
constructing and matching strings with the pattern above, so encapsulate
the logic in one function.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index db8f68819ded9..4db0d0a1c6a51 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -431,6 +431,20 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
 	complete(&vfe->reset_complete);
 }
 
+static int vfe_match_clock_names(struct vfe_device *vfe,
+				 struct camss_clock *clock)
+{
+	char vfe_name[7]; /* vfeXXX\0 */
+	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+
+	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
+	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+
+	return (!strcmp(clock->name, vfe_name) ||
+		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, "vfe_lite"));
+}
+
 /*
  * vfe_set_clock_rates - Calculate and set clock rates on VFE module
  * @vfe: VFE device
@@ -454,9 +468,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
-		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1") ||
-		    !strcmp(clock->name, "vfe_lite")) {
+		if (vfe_match_clock_names(vfe, clock)) {
 			u64 min_rate = 0;
 			long rate;
 
@@ -537,9 +549,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
-		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1") ||
-		    !strcmp(clock->name, "vfe_lite")) {
+		if (vfe_match_clock_names(vfe, clock)) {
 			u64 min_rate = 0;
 			unsigned long rate;
 
-- 
2.42.0

