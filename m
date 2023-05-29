Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43457714F7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 20:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjE2S7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 14:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjE2S7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 14:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF7DC9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 11:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685386718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BQbwFXAVPJpUwaJsW0fx1tAIQkk2NK/3kU2J8xKWCmU=;
        b=a4cS0OUnW6g2+CQyfi6hYiO6XOO1ZmeYOx2++yfZGRHbqTSQZRBDSNX2EqmGQBuJ3/WVzq
        Z69RtL9p4W7HQ++jwgr+kxL7bnJfrCU0Q1MfqIGZSbrqwkI3EgWzgialE+toYlklfgY71p
        iGcMMo/lHhLvSisofXU+6fTP4K9nSvM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-hLuqiH12PM6E6EQ_3QkCvg-1; Mon, 29 May 2023 14:58:37 -0400
X-MC-Unique: hLuqiH12PM6E6EQ_3QkCvg-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-75aff18ebcbso235573785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 11:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685386717; x=1687978717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQbwFXAVPJpUwaJsW0fx1tAIQkk2NK/3kU2J8xKWCmU=;
        b=YsUde+kbbR+iVHE0ar/dzg17T6/qCob+jeWXYmKZm4QFRiKm+gi6w0CZKlpO9+zxU4
         2gs82ANzAQ8prE76UcT8wbsEEwVgXCdWJQXR/gm2qnqI0kiPcNmpNHkq/7mJsPWlKxKW
         7ka9m7YwhDUtWYN2y8sHwWdAsgQDzSjJUbksbarJr9YERlI8U5gIGu7Oa+lWshJnj0dU
         JRokDQOueH74bKlQWzCMFHOPAmMLxZLiyXVUfUa0UHpEXu5DGNpf6nsmKBssTSsKQ5Nv
         4udXIqfimDA+Xocdjw7SXHJ3cNouwCqYKs29jbzutz+DNUexrKbfdtuE+lOStFclKdXn
         oFIg==
X-Gm-Message-State: AC+VfDxh07t08BhwCMb5VocpYY7g2ySdCV0F78xzlIjwnkvCirbqPuqt
        q38NEYZ7dhIFmtkD/M8F0yfCApSOFD/1MrKAh0U70JHiw07gk7+EzMDiinl2d5tlgRHT8TZp8P1
        0TXUTVFeYqaIdP4Jt/k1XsLxrmQ==
X-Received: by 2002:a37:4656:0:b0:75b:23a1:d84e with SMTP id t83-20020a374656000000b0075b23a1d84emr6839520qka.16.1685386716994;
        Mon, 29 May 2023 11:58:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LvGZqNHOJIqeUUOf/C0cdN/hvdBuc96d2Im2jnpshQGMr/XcJAZ4chW0KTNXbYFMAzvFvBw==
X-Received: by 2002:a37:4656:0:b0:75b:23a1:d84e with SMTP id t83-20020a374656000000b0075b23a1d84emr6839512qka.16.1685386716757;
        Mon, 29 May 2023 11:58:36 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id ez3-20020ad45903000000b0061a0f7fb340sm3957382qvb.6.2023.05.29.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 11:58:36 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH RFC 2/2] phy: qcom-snps-femto-v2: Remove AHB2PHY interface clock
Date:   Mon, 29 May 2023 14:56:37 -0400
Message-Id: <20230529185638.32376-3-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230529185638.32376-1-athierry@redhat.com>
References: <20230529185638.32376-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AHB2PHY interface clock cfg_ahb_clk is not assigned anywhere in the
driver. Moreover, it's not used by any device tree, nor is present in
the qcom,usb-snps-femto-v2 bindings. Remove it.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
I'm not 100% sure if the clock should be removed, or if it should be added
to bindings and device trees that use this PHY. Better informed opinions
on the topic are highly welcome.

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 8abf482e81a8..2d9c1105e28c 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -113,7 +113,6 @@ struct phy_override_seq {
  * @phy: generic phy
  * @base: iomapped memory space for snps hs phy
  *
- * @cfg_ahb_clk: AHB2PHY interface clock
  * @ref_clk: phy reference clock
  * @phy_reset: phy reset control
  * @vregs: regulator supplies bulk data
@@ -125,7 +124,6 @@ struct qcom_snps_hsphy {
 	struct phy *phy;
 	void __iomem *base;
 
-	struct clk *cfg_ahb_clk;
 	struct clk *ref_clk;
 	struct reset_control *phy_reset;
 	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
@@ -165,7 +163,6 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   0, USB2_AUTO_RESUME);
 	}
 
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
 	clk_disable_unprepare(hsphy->ref_clk);
 	return 0;
 }
@@ -176,12 +173,6 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
-	if (ret) {
-		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
-		return ret;
-	}
-
 	ret = clk_prepare_enable(hsphy->ref_clk);
 	if (ret) {
 		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
@@ -381,16 +372,10 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
-	if (ret) {
-		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
-		goto poweroff_phy;
-	}
-
 	ret = clk_prepare_enable(hsphy->ref_clk);
 	if (ret) {
 		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_ahb_clk;
+		goto poweroff_phy;
 	}
 
 	ret = reset_control_assert(hsphy->phy_reset);
@@ -463,8 +448,6 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 
 disable_ref_clk:
 	clk_disable_unprepare(hsphy->ref_clk);
-disable_ahb_clk:
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
 poweroff_phy:
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 
@@ -476,7 +459,6 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
 
 	reset_control_assert(hsphy->phy_reset);
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
 	clk_disable_unprepare(hsphy->ref_clk);
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	hsphy->phy_initialized = false;
-- 
2.40.1

