Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5830152CD2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 09:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbiESHeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 03:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbiESHd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 03:33:59 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E80A939C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:55 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id i23so5210793ljb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU/w/Q+8HFEU9nsRj7Rx9N0J4brWWkqsyE1Gu2AJj3w=;
        b=F61xlt5TjihAyu5QezHnjzzBVLi27Sg6yo3OYzXJR6NmCriDt+/K33lENxq5dZ5zX6
         XlboER9fL3KUJO4FhoztD4Cq85q95zYqqnlhMiMmyHHZ3rN6zgnjV/ZwRp1jPcCtIOyW
         5UTIUARebr2OHj5b7tRl5tNpRGlxHpU5zR0nZEOp/WfyFLuVwmzo7uZbCjRcaDLQajph
         OwTv+XOUliqSc8Plu0uwQwTrlIdf+81a4fXU5u+K/UvQ3ezlAaogeqqcEIHhVgEY4CZL
         3ykbvDKZtn5SoyutQGTjfSf/ncIe7eRcQ55AyEF/glEZsHqXSEWNKtetn7DYoK7cZdxm
         RFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU/w/Q+8HFEU9nsRj7Rx9N0J4brWWkqsyE1Gu2AJj3w=;
        b=F6O81qwF3F460iswO+Y3MYLhbhltC+2ceTbGpVKYaNUHqC5g/5SjnUGdClnKMELnD2
         xadG+MBINZqhTheTismTjnKop9/lQxJDsMEYAULCwSTgWY/AQw6TXtUwUlWqLvuK2mZ9
         QIY8Gv2Gou2PZrlMVTKDnblLQmBkdmD/TUV+EMhYF0Nb2Y95TIVb/qJQP3K2L6lpCVJL
         GsX7u1LAb6rKyssXUZ81T2R/EitbXRJ/Y5MCHVQmhbLSNc5u5mGH10JXjmmzWqXGcWpU
         YQARW0kxhtoZMU5zeExUlj7If9jiKELuFS1Lt1nqSdc+xxV2evE/DbjWA2TMe+4MWErX
         GKjA==
X-Gm-Message-State: AOAM531SXWgcQWBf+arr7lMApyBnprrFgwV3Mx/JYJjg1l61Ue6Yhg3R
        7cvBMh+VFMDLZyR4pQpptQIqTg==
X-Google-Smtp-Source: ABdhPJw1znumvhdnkSXXyMHaCPMqeGr3LWBnCSF+oYZTeGkm0OEe7bQmAlbxjkmRjgaVfz1vVyBGQg==
X-Received: by 2002:a05:651c:4d2:b0:250:69a8:5850 with SMTP id e18-20020a05651c04d200b0025069a85850mr1886689lji.5.1652945633607;
        Thu, 19 May 2022 00:33:53 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c12-20020ac2530c000000b004778d417c49sm183401lfh.290.2022.05.19.00.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] remoteproc: qcom: correct kerneldoc
Date:   Thu, 19 May 2022 09:33:49 +0200
Message-Id: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct kerneldoc warnings like:

  drivers/remoteproc/qcom_common.c:68:
    warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
---
 drivers/remoteproc/qcom_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c9eafa..020349f8979d 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -50,7 +50,7 @@ struct minidump_region {
 };
 
 /**
- * struct minidump_subsystem_toc: Subsystem's SMEM Table of content
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
  * @status : Subsystem toc init status
  * @enabled : if set to 1, this region would be copied during coredump
  * @encryption_status: Encryption status for this subsystem
@@ -68,7 +68,7 @@ struct minidump_subsystem {
 };
 
 /**
- * struct minidump_global_toc: Global Table of Content
+ * struct minidump_global_toc - Global Table of Content
  * @status : Global Minidump init status
  * @md_revision : Minidump revision
  * @enabled : Minidump enable status
-- 
2.32.0

