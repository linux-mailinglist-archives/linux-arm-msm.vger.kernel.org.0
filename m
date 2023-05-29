Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECEE9714F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 20:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjE2S7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 14:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjE2S7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 14:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AB4C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685386715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wBYm+hGGLRIhF5wIdv9fJibDGsy7JSq4UPGzeqrhYq4=;
        b=IaLGAPtY/dj3qVUIlfhpaYDD9ZUDbATG+1Fcihkt9fBf6JsD1UdvAe895p3S9QKfjmpefp
        NB8ejSKbub/CBUWwK3JQmWrcT8MBy3MsvBxpIRgscLWi2VYNUziQrUnvvw3NyK4FYAgMXB
        UE3v35PKDGZQkjaZnxlaDZVNVKKlFOU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-fneNZG41MHaWBRG5AHPbbQ-1; Mon, 29 May 2023 14:58:33 -0400
X-MC-Unique: fneNZG41MHaWBRG5AHPbbQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-62621cdb1f0so7243216d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 11:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685386713; x=1687978713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBYm+hGGLRIhF5wIdv9fJibDGsy7JSq4UPGzeqrhYq4=;
        b=Vf4Wu1fo+QEnYUd1VVHL5J7BLA0AlJ2OnFDaQ4B9xDe/7uk/p0VhHki9q0nmHGf9Nk
         OMqAUNFj5EkTQXZXpFDqyQ0PLET1PE7n+iP06vKiqqtgUQTmBys//bkr/d5PQQgFBBwI
         NS+lbPPzOYR0Qe0qJzrAmA5pemW4BuDsU3qYYpp4tvpvbW7w4OYmG9TTHmYgtHrLH1O4
         zMXAcJLToV+Z0WSxwqsS3+SMIpWZzjzCst2Mirsm4Fy9u7qAe6zFkx09pEAK44uC4N6L
         qITctP3O2WRBFIqbcGvktS2I2+V8ds0MTrHTqnNHHVEaPM3pa2BXzrdRayvuBfRj9AZx
         IZFg==
X-Gm-Message-State: AC+VfDxKY4PB6Z4oKj18JsSMnzHkxH7WLiOzt5FcuT39bYV0/jGcGwww
        +I3BPw9/OsLSF1NW/nPOHpq3OC7pJ7I1wLwD24/2t5sVsK5/6Oj7NhnW5yl5CV3mudBZbGP+6M+
        VLrxb+/qyDZxqJe3p4UfbXkUkhw==
X-Received: by 2002:ad4:5be4:0:b0:623:66ee:79b2 with SMTP id k4-20020ad45be4000000b0062366ee79b2mr12079378qvc.36.1685386713431;
        Mon, 29 May 2023 11:58:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zMMRC+sAg8/Xx+RaG88s1qHywf9AqVsg2V+HJ5BgLpCWqfUhPru2gfhOxS1xeVpIxW7ezDw==
X-Received: by 2002:ad4:5be4:0:b0:623:66ee:79b2 with SMTP id k4-20020ad45be4000000b0062366ee79b2mr12079366qvc.36.1685386713210;
        Mon, 29 May 2023 11:58:33 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id ez3-20020ad45903000000b0061a0f7fb340sm3957382qvb.6.2023.05.29.11.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 11:58:32 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH RFC 1/2] phy: qcom-snps-femto-v2: properly enable ref clock
Date:   Mon, 29 May 2023 14:56:36 -0400
Message-Id: <20230529185638.32376-2-athierry@redhat.com>
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

The driver is not enabling the ref clock, which thus gets disabled by
the clk_disable_unused initcall. This leads to the dwc3 controller
failing to initialize if probed after clk_disable_unused is called, for
instance when the driver is built as a module.

To fix this, add calls to clk_prepare_enable/clk_disable_unprepare at
the proper places.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 6c237f3cc66d..8abf482e81a8 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -166,6 +166,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 	}
 
 	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+	clk_disable_unprepare(hsphy->ref_clk);
 	return 0;
 }
 
@@ -181,6 +182,12 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(hsphy->ref_clk);
+	if (ret) {
+		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -380,10 +387,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 		goto poweroff_phy;
 	}
 
+	ret = clk_prepare_enable(hsphy->ref_clk);
+	if (ret) {
+		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
+		goto disable_ahb_clk;
+	}
+
 	ret = reset_control_assert(hsphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		goto disable_ref_clk;
 	}
 
 	usleep_range(100, 150);
@@ -391,7 +404,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	ret = reset_control_deassert(hsphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		goto disable_ref_clk;
 	}
 
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
@@ -448,6 +461,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 
 	return 0;
 
+disable_ref_clk:
+	clk_disable_unprepare(hsphy->ref_clk);
 disable_ahb_clk:
 	clk_disable_unprepare(hsphy->cfg_ahb_clk);
 poweroff_phy:
@@ -462,6 +477,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 
 	reset_control_assert(hsphy->phy_reset);
 	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+	clk_disable_unprepare(hsphy->ref_clk);
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	hsphy->phy_initialized = false;
 
-- 
2.40.1

