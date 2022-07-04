Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D5F565F5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 00:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiGDWIT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 18:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiGDWIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 18:08:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6491181F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 15:08:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so65231lfr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a34faQtwagl20LrpWELh2gVhWLFPcXFobQBVS2MYvUM=;
        b=BmPaZMzmINyiXzdBJ1CkiXt6rp0AucG7wVHWs+yErIAGPvQUd3BdoYl4xY4WdXk2Nh
         APvlTMuijWgZ95wQFa7uJbliJKvVFYQO1o7KOImx+UbLUsv9uvM9eT5G7xYv3iciFs6r
         /FSS2CL81qYZPcAdv/ufvIjP3iHZdQ+y/zCsT4fVsVOq6pJZrHft/oh/+C+6t8gAz2do
         9t61lwF6Kq+gHRM0yRUcDq+NW7E+Xyb3ukbkXmXYL/5ZthQxld7nWO20vaAU8FMLhSw7
         4xvoH59qpT/l8sd9oCUDwkAFCDRspNEJpKap/JZj0h2Zg9TA5oYI5aZBt7K6kEXXFpyB
         zQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a34faQtwagl20LrpWELh2gVhWLFPcXFobQBVS2MYvUM=;
        b=XQq90muODO9BCO0rhyTSb2Kn27WY5Es8xP2LyHAx2u/yl8MLfcJtsD9wkxf3uJVSM+
         BFUh9ky5eZnt6BX4onmXv3wJzyRThUli4cTGeWqGep/8ZaNe/D3+fEnbSAT5u3Swvw9/
         BvWc6lMFhO/nBiPgLPVmUM1bTb5eqFLhAxYinOB310t855bsq7f9bkVLhYyNDTKPkssf
         Bq8j1cEQO4KBV3nWPaSppFm0tru16M4jtRP/V1VHOzxDmQawVJsbEVDPagLjG5BimxRQ
         99qyReGnHjzwBhR0L8ZivKVjBCJ17h5T+cSHXwWcK2KYUSwWBU3Xsv2o/b184wqlxI9o
         h7eQ==
X-Gm-Message-State: AJIora90Bfm6XhPE/Lv+MRQHtJ3Stcig0FcoudnjznCto7ZsgRM2oiq7
        9TnKRFr9Uk4ykY3Ze1euNR/8l9Xr984NxA==
X-Google-Smtp-Source: AGRyM1s5qdCw9sHSYyY+4oX9sJnPEq2SyUJJKeGHJC5ARAOe5WA/3fb8iJX/Wjcmf+Z6SKXVb1Bc2A==
X-Received: by 2002:a05:6512:2508:b0:480:f1cb:64a5 with SMTP id be8-20020a056512250800b00480f1cb64a5mr21167875lfb.0.1656972496056;
        Mon, 04 Jul 2022 15:08:16 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id h18-20020a05651c125200b0025a91928236sm5230329ljh.90.2022.07.04.15.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 15:08:15 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: camss: Do not attach an already attached power domain on MSM8916 platform
Date:   Tue,  5 Jul 2022 01:08:14 +0300
Message-Id: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The change to dynamically allocated power domains neglected a case of
CAMSS on MSM8916 platform, where a single VFE power domain is neither
attached, linked or managed in runtime in any way explicitly.

This is a special case and it shall be kept as is, because the power
domain management is done outside of the driver, and it's very different
in comparison to all other platforms supported by CAMSS.

Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* corrected the fixed commit id, which is found on media/master

 drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 932968e5f1e5..7a929f19e79b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1465,6 +1465,14 @@ static int camss_configure_pd(struct camss *camss)
 		return camss->genpd_num;
 	}
 
+	/*
+	 * If a platform device has just one power domain, then it is attached
+	 * at platform_probe() level, thus there shall be no need and even no
+	 * option to attach it again, this is the case for CAMSS on MSM8916.
+	 */
+	if (camss->genpd_num == 1)
+		return 0;
+
 	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
 					  sizeof(*camss->genpd), GFP_KERNEL);
 	if (!camss->genpd)
@@ -1698,6 +1706,9 @@ void camss_delete(struct camss *camss)
 
 	pm_runtime_disable(camss->dev);
 
+	if (camss->genpd_num == 1)
+		return;
+
 	for (i = 0; i < camss->genpd_num; i++) {
 		device_link_del(camss->genpd_link[i]);
 		dev_pm_domain_detach(camss->genpd[i], true);
-- 
2.33.0

