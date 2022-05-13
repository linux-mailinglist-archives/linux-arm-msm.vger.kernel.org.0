Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9924E525CDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 10:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378013AbiEMIFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 04:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354665AbiEMIFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 04:05:39 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3D419C761
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 01:05:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id g16so9356191lja.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 01:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqtdi0vYTub2c9PlxZf3VXHkASe52dgKtm78U2DVzbo=;
        b=G+84TNlpkMYRVR5dpiv+fU8K95swN3jl/U7q1l13cBXi9RNHIfkkaUG4d/eexWX3Zr
         P1m6+8k/58ZQj7tRlDsWYg25kYD9f+MN9aUWKIgZumtZDEXr9XnKXxDV2cmoN3TuXPnH
         UnvfiKBEYW+e5Bg3KDkU0sXu5/SGFERMp3ZxfHlack4ppN3N627hOTM4BdCKejF2JcMk
         QE3fVC4lMk3f0yS/JtZsIOm1+7ZlhbLYiy88nyOH2GWjH6a7rbWVJ4xMXhDWsl6HJsM6
         4C0o2mCdErcAj7dXekwEpfxQk3YpHaSulCg18j9T2FMyNhb6lvUDwzQu4h35/E1840SS
         hHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pqtdi0vYTub2c9PlxZf3VXHkASe52dgKtm78U2DVzbo=;
        b=mjxnY2Rzx3OSfAU7mMolmiz5rm1ze2RmYBUUVY9GOoW1YdYysA+s4j2y2x7+QGqFL3
         1e0L2CvUc94aKaxtcEvzhKXC4g/fy3pXCBacbqx3kcsLjrPtvbXmx0lHXferH8k7JTMJ
         FVbDtH/zN4DJ7unaaQr/4+Lcacy1iLAaJLKJRXmsTnqiYq/IkKveidbUFOvsDNx8G4Sj
         AZdlgBS0Zkkz2qwbuceu9anNSnScqrELaQHhVW5fRq1T3Q6gbQ85iic0gcND1F7JE+S5
         +qhSUt3PSIAwOpU9VBtzNa40+gAl+AkBv35MMI6dQdcspflrfb/7nHpBhvMaqBHD7JxF
         kslA==
X-Gm-Message-State: AOAM531IcrXaoTk6HOMVj3AvoasSvd7jHYPfbcvSWJv8/gENqmPQo4Ww
        2n7gf1S5XSaJvaAFPk1s04TKCA==
X-Google-Smtp-Source: ABdhPJzW0QvfkpqAo1wZErNwh2FaJfkF+CggVbCrcwWWO0pntF5sg54kCPfbgLSHs6rHBnSSnx7l0w==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id n5-20020a2e82c5000000b00247e81f8b02mr2387187ljh.90.1652429136491;
        Fri, 13 May 2022 01:05:36 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id q11-20020ac25fcb000000b00473edee678fsm276269lfg.287.2022.05.13.01.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 01:05:36 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: camss: Allocate camss struct as a managed device resource
Date:   Fri, 13 May 2022 11:05:29 +0300
Message-Id: <20220513080529.416245-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

The change simplifies driver's probe and remove functions, no functional
change is intended.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
The change is supposed to be applied on top of this one:

  https://lore.kernel.org/linux-media/20220512082318.189398-1-vladimir.zapolskiy@linaro.org/

drivers/media/platform/qcom/camss/camss.c | 33 +++++++----------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e90fea28ac88..0f4908fa21e2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1751,7 +1751,7 @@ static int camss_probe(struct platform_device *pdev)
 	struct camss *camss;
 	int num_subdevs, ret;
 
-	camss = kzalloc(sizeof(*camss), GFP_KERNEL);
+	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
 	if (!camss)
 		return -ENOMEM;
 
@@ -1795,39 +1795,30 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csid_num = 5;
 		camss->vfe_num = 5;
 	} else {
-		ret = -EINVAL;
-		goto err_free;
+		return -EINVAL;
 	}
 
 	camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
 				     sizeof(*camss->csiphy), GFP_KERNEL);
-	if (!camss->csiphy) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
+	if (!camss->csiphy)
+		return -ENOMEM;
 
 	camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
-	if (!camss->csid) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
+	if (!camss->csid)
+		return -ENOMEM;
 
 	if (camss->version == CAMSS_8x16 ||
 	    camss->version == CAMSS_8x96) {
 		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
-		if (!camss->ispif) {
-			ret = -ENOMEM;
-			goto err_free;
-		}
+		if (!camss->ispif)
+			return -ENOMEM;
 	}
 
 	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
 				  GFP_KERNEL);
-	if (!camss->vfe) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
+	if (!camss->vfe)
+		return -ENOMEM;
 
 	v4l2_async_nf_init(&camss->notifier);
 
@@ -1909,8 +1900,6 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
 	v4l2_async_nf_cleanup(&camss->notifier);
-err_free:
-	kfree(camss);
 
 	return ret;
 }
@@ -1929,8 +1918,6 @@ void camss_delete(struct camss *camss)
 		device_link_del(camss->genpd_link[i]);
 		dev_pm_domain_detach(camss->genpd[i], true);
 	}
-
-	kfree(camss);
 }
 
 /*
-- 
2.33.0

