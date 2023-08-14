Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15EAF77BCA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 17:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbjHNPNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 11:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232775AbjHNPMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 11:12:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3F5E6E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 08:12:49 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe8a158fcbso26693985e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692025968; x=1692630768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLS0B+SArRid/e9AB/VEkQGWQx14zSatlMTcSargJZU=;
        b=Hy4eJNHbs7lN8Svv9td7HPvAuE4TuSc3ANo+bLeTvvb7h9F24hWhh0KLOurS8lM+st
         ls7xCrA/G1BjEHgFbdavcMpCbQvW+XFwMjFUBEiQWTf7iicnGcyj5rK4oi+P3L89rS8Q
         9phJdAMu6qtx9TpQiSwpjHQr9GgOl+qCmG0gMSIUCaROz4m2R1vybUqum14o+2wsZ8ai
         Gj1yYaxYc+CX8VihOn6658WAVxLgvNQvROk33j7ocPuKnU5L2/D1QfNukuqhdY4ajsHa
         AZx4dFl72rVM3KVsiJNN2Y2N46mmzuQcBpsYkjnUAqWh4p9FToeZxE7NJokwwSS6rNEP
         xcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025968; x=1692630768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLS0B+SArRid/e9AB/VEkQGWQx14zSatlMTcSargJZU=;
        b=DxjGsKwyV+mHFJfRjaTJoatbRn6yZFTt0mbHKJczkjuNbe/gqzXr5ICg62JEGQvDED
         ngCUAiEpGa/OGHNLmubwmY3trMvfi0TXtIJhwMeiIb0xe9JnpwEHROWmDpV2kK3yrgdx
         NRyaiOD3PeSnMzfIqTECsXytYMlzJLryjsaliJ3cKfFczoHbTO/ZaS+yDhYH0lXuNXoZ
         teYCrGeLzLpJfk1TWe10fL+/jNqjjO4YQnOsgh3Irh5jnG7Kqwnx9iGHssV5snUYeejQ
         j0fj30Jdrk9d3dcy82z65WKxuyL76xCNDScDIpxCMk5Wyedg/knZ/kmjFw57kR9Hy/20
         JNwA==
X-Gm-Message-State: AOJu0Yy+l3onAZiw7HppT8TYTGfNd4LUhLxlKN4Nw+bhx5FCT9COno5L
        6z6zJZ0aqDHZ1M+qDsZaX7t3Ow==
X-Google-Smtp-Source: AGHT+IEQMdoWrRPiCXAdefiZRUGiuHZonSPrmrT9fDgliosmhz1FgcdnjRKHR2WKT5Y/8FbSca+NfA==
X-Received: by 2002:a7b:cd02:0:b0:3fe:21b9:806 with SMTP id f2-20020a7bcd02000000b003fe21b90806mr7361061wmj.0.1692025967720;
        Mon, 14 Aug 2023 08:12:47 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003fe1c332810sm17644572wmi.33.2023.08.14.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:12:47 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v0 01/13] media: qcom: camss: Amalgamate struct resource with struct resource_ispif
Date:   Mon, 14 Aug 2023 16:12:31 +0100
Message-ID: <20230814151243.3801456-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
References: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
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

There is no good reason to differentiate the two resource structures
here. As part of a general tidyup of the declaration and passing of
resources within in the CAMSS driver it will be advantageous to have
one unified resource structure.

The two structures are very similar anyway thus leading more credence
still to the argument there should be only one.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-ispif.c |  4 ++--
 drivers/media/platform/qcom/camss/camss-ispif.h |  4 ++--
 drivers/media/platform/qcom/camss/camss.c       | 14 +++++++-------
 drivers/media/platform/qcom/camss/camss.h       |  8 +-------
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 1c7e4b1b49401..61765b874b9a2 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1095,7 +1095,7 @@ static int ispif_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
  * Return 0 on success or a negative error code otherwise
  */
 int msm_ispif_subdev_init(struct camss *camss,
-			  const struct resources_ispif *res)
+			  const struct resources *res)
 {
 	struct device *dev = camss->dev;
 	struct ispif_device *ispif = camss->ispif;
@@ -1152,7 +1152,7 @@ int msm_ispif_subdev_init(struct camss *camss,
 
 	/* Interrupt */
 
-	ret = platform_get_irq_byname(pdev, res->interrupt);
+	ret = platform_get_irq_byname(pdev, res->interrupt[0]);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.h b/drivers/media/platform/qcom/camss/camss-ispif.h
index fdf28e68cc7d8..c7c41f7afcaad 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.h
+++ b/drivers/media/platform/qcom/camss/camss-ispif.h
@@ -66,10 +66,10 @@ struct ispif_device {
 	struct camss *camss;
 };
 
-struct resources_ispif;
+struct resources;
 
 int msm_ispif_subdev_init(struct camss *camss,
-			  const struct resources_ispif *res);
+			  const struct resources *res);
 
 int msm_ispif_register_entities(struct ispif_device *ispif,
 				struct v4l2_device *v4l2_dev);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f4948bdf3f8f9..de39dc987444f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -93,14 +93,14 @@ static const struct resources csid_res_8x16[] = {
 	},
 };
 
-static const struct resources_ispif ispif_res_8x16 = {
+static const struct resources ispif_res_8x16 = {
 	/* ISPIF */
 	.clock = { "top_ahb", "ahb", "ispif_ahb",
 		   "csi0", "csi0_pix", "csi0_rdi",
 		   "csi1", "csi1_pix", "csi1_rdi" },
 	.clock_for_reset = { "vfe0", "csi_vfe0" },
 	.reg = { "ispif", "csi_clk_mux" },
-	.interrupt = "ispif"
+	.interrupt = { "ispif" }
 
 };
 
@@ -234,7 +234,7 @@ static const struct resources csid_res_8x96[] = {
 	}
 };
 
-static const struct resources_ispif ispif_res_8x96 = {
+static const struct resources ispif_res_8x96 = {
 	/* ISPIF */
 	.clock = { "top_ahb", "ahb", "ispif_ahb",
 		   "csi0", "csi0_pix", "csi0_rdi",
@@ -243,7 +243,7 @@ static const struct resources_ispif ispif_res_8x96 = {
 		   "csi3", "csi3_pix", "csi3_rdi" },
 	.clock_for_reset = { "vfe0", "csi_vfe0", "vfe1", "csi_vfe1" },
 	.reg = { "ispif", "csi_clk_mux" },
-	.interrupt = "ispif"
+	.interrupt = { "ispif" }
 };
 
 static const struct resources vfe_res_8x96[] = {
@@ -410,7 +410,7 @@ static const struct resources csid_res_660[] = {
 	}
 };
 
-static const struct resources_ispif ispif_res_660 = {
+static const struct resources ispif_res_660 = {
 	/* ISPIF */
 	.clock = { "top_ahb", "ahb", "ispif_ahb",
 		   "csi0", "csi0_pix", "csi0_rdi",
@@ -419,7 +419,7 @@ static const struct resources_ispif ispif_res_660 = {
 		   "csi3", "csi3_pix", "csi3_rdi" },
 	.clock_for_reset = { "vfe0", "csi_vfe0", "vfe1", "csi_vfe1" },
 	.reg = { "ispif", "csi_clk_mux" },
-	.interrupt = "ispif"
+	.interrupt = { "ispif" }
 };
 
 static const struct resources vfe_res_660[] = {
@@ -1122,7 +1122,7 @@ static int camss_init_subdevices(struct camss *camss)
 {
 	const struct resources *csiphy_res;
 	const struct resources *csid_res;
-	const struct resources_ispif *ispif_res;
+	const struct resources *ispif_res;
 	const struct resources *vfe_res;
 	unsigned int i;
 	int ret;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index f6c326cb853b8..e95211cdb1fd6 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -44,18 +44,12 @@
 struct resources {
 	char *regulators[CAMSS_RES_MAX];
 	char *clock[CAMSS_RES_MAX];
+	char *clock_for_reset[CAMSS_RES_MAX];
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
 };
 
-struct resources_ispif {
-	char *clock[CAMSS_RES_MAX];
-	char *clock_for_reset[CAMSS_RES_MAX];
-	char *reg[CAMSS_RES_MAX];
-	char *interrupt;
-};
-
 struct icc_bw_tbl {
 	u32 avg;
 	u32 peak;
-- 
2.41.0

