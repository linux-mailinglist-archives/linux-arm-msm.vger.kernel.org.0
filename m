Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30D94AE17B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 19:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343821AbiBHSvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 13:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239828AbiBHSvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 13:51:17 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B02EC0612C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 10:51:16 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v12so61212wrv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 10:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Ea7FJAwj20JTEOZOtkT9qnZbvbISkrOzMmRItGjSAeI=;
        b=wbRwe85oAtMOL7cL96DbEkUOulzafBW/KTyqS7gNUFevsb9BMP2qg5a1Lp7Y4rFgl5
         4j4jyjnAM8k8U1SnbEg5nvzcOgcPYn1m0Y4DBuTKaOJqo77qdJgPoAaeRSXWBk8U8gSt
         Ac12ZQyFbQ1Qt30f6te1osdfqBrxm6zETzcyF9v4CbtBWFfm2KCNAbsK3e3SNh9F2Z27
         977b4fxgmWP+oDYQDM24pgzvYM0H8eB/edIUqmVPkOhoWnQ+8qgawGk+v+74+KHtFSJp
         S1B9BzIe85mchTJ2mTv2mGHimpFRclZyYe3A9IUX5sMNO+K0pbt/J3P7CHjWKZkintCh
         cI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ea7FJAwj20JTEOZOtkT9qnZbvbISkrOzMmRItGjSAeI=;
        b=xynDFTCjdi/F7l+MbaY/NpYJ7uQXdvHaOYAGeGHkVrBkg63OFjhgofvz3ZfLbuDCEr
         lAZOxbK/xdJo65A5qQg7jJUVDcn1oqOHMbsQQhfl8duXBWddVTNHwj6kmvhZ2sGFHu4/
         51uij2hw9CS2MWYa5A2VUjLd6cSQTAnUznx8rWI/0b2PsqL2rKvZvV6B9xgJMVlsdDhZ
         IEXuWOYaIblSX+7QiGpAMuZbEH51ERTQsenZVHywuS2pvCcwg5DwuvYjHIgeZmholyMS
         ZkGoOtzqNYa0WTwklaOHPjFOzgyXJVUE7Q9FFDFZkJXuiXRki9szP2TZbZvbtPg3z1J+
         MO1A==
X-Gm-Message-State: AOAM532imNXEf3896SqB7Bl45uZLci9S2ObZI9B4Y50ZEIuXYX+iQo+O
        vNHhuRllGS3fJUzJc6q49M8+AA==
X-Google-Smtp-Source: ABdhPJxqvibPy3hhJZAzjdv558CWf5H+Qon6jv0A+osra3Q6OH8xosDsaQLwBCfn1WVgDF3dmHKi2A==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr4585506wrj.175.1644346274798;
        Tue, 08 Feb 2022 10:51:14 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:682b:4712:4b40:6814])
        by smtp.gmail.com with ESMTPSA id z17sm2762725wmf.11.2022.02.08.10.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Feb 2022 10:51:14 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/3] drm/msm/dsi: Allow to specify dsi config as pdata
Date:   Tue,  8 Feb 2022 19:51:10 +0100
Message-Id: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Config autodetect based on DSI controller version is quite limited
since several qcom SoCs can integrate a DSI controller with the same
version, but with different config (io_offset, supplies, etc).

This change allows to specify dsi config via device data pointer.
config autodetect is still used in case data pointer is NULL.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 0525488..06a9008 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -170,7 +170,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl" },
+	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6b3ced4..c540acc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -212,6 +212,10 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
+	cfg_hnd = device_get_match_data(dev);
+	if (cfg_hnd)
+		return cfg_hnd;
+
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);
-- 
2.7.4

