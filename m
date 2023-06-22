Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92D073A915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 21:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjFVTle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 15:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjFVTlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 15:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A461BCC
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687462846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DqhwtQo4HweKbF66I7wMIR+srfhZ3FF6k/Qs3cAOKDk=;
        b=M2WPIDDM4lXcXJOgy8DZ74L4KophhdtAS9YVgWi+1jwZl7l8TOdX7Uja2F4geMcCa8nYqz
        aJFGMl0IpHjYWDOjfwncUqyo8gm6wp9RIeRlUw5uLD4KkS0OTDWsOrXXGLYuC0mhZLtNBD
        Jodnuc+ywgrWQPr4xZOlC4+GYXrlkYA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-UPigSbFrPNW2UaS0u1sLpw-1; Thu, 22 Jun 2023 15:40:43 -0400
X-MC-Unique: UPigSbFrPNW2UaS0u1sLpw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6238c3bf768so95840306d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687462839; x=1690054839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqhwtQo4HweKbF66I7wMIR+srfhZ3FF6k/Qs3cAOKDk=;
        b=I3Sw4AvI8Oki5kqeDp6B8hOKrmUIulgooZhx2Ui/hIs8yBiuoFQHOf7ocDEPkRIzaQ
         I7IzisHIYHRXFQEo4HlSPyza7cO2g8P4kK0jkBn0hw5wxt4tfztgdsvTmJ0b0oiItrGG
         saU467hQbeWUeRHhqTTUZUDD9jva4e7y00vTzWP5JOF6J652gGqgJqWqMv+2x0atjZuY
         XCUDUan+D6WngFtwuUZHvTFdQsdWwagaRBHX7y8i6kxj7WQPa2B74FSslpsB1x/zITyt
         MbOQvqNtoe54mS+VEvtVp6Cf0fgQn8qpwSrq4zRvJRqwtcm2P789FP5EFeMCjew8yGeM
         q25Q==
X-Gm-Message-State: AC+VfDzZTJMvWoJ3iFICrov3ihS5JywaBw5m3piYMuQygsunnYOcZCEg
        6VjhGQWfmrtKYqTMluKBuxpyaaodiILATO6ZO/WfIAhXxHNYI7T6YcBpFqOuRs3pQ0JWBn4v9MZ
        jRVvSLEeJpunsT/5uiSHuYJMLMg==
X-Received: by 2002:a05:6214:5086:b0:631:f6f1:87dd with SMTP id kk6-20020a056214508600b00631f6f187ddmr9337129qvb.8.1687462839593;
        Thu, 22 Jun 2023 12:40:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69TnqqnfQxrmbJrjGYdzCVW52XHc4aK+QXoi41a2M0LmdNJH1EUhWqDLJh8yup8EdWguSn+g==
X-Received: by 2002:a05:6214:5086:b0:631:f6f1:87dd with SMTP id kk6-20020a056214508600b00631f6f187ddmr9337105qvb.8.1687462839297;
        Thu, 22 Jun 2023 12:40:39 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id jo30-20020a056214501e00b006301819be40sm4174183qvb.49.2023.06.22.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 12:40:38 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 2/3] phy: qcom-snps-femto-v2: add system sleep PM ops
Date:   Thu, 22 Jun 2023 15:40:19 -0400
Message-Id: <20230622194021.80892-3-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622194021.80892-1-athierry@redhat.com>
References: <20230622194021.80892-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The downstream driver [1] implements set_suspend(), which deals with
both runtime and system sleep/resume. The upstream driver already has
runtime PM ops, so add the system sleep PM ops as well, reusing the same
code as the runtime PM ops.

[1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index ce1d2f8b568a..378a5029f61e 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -179,7 +179,7 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
 	readl_relaxed(base + offset);
 }
 
-static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
+static int qcom_snps_hsphy_do_suspend(struct qcom_snps_hsphy *hsphy)
 {
 	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
 
@@ -199,7 +199,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 	return 0;
 }
 
-static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
+static int qcom_snps_hsphy_do_resume(struct qcom_snps_hsphy *hsphy)
 {
 	int ret;
 
@@ -214,25 +214,25 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 	return 0;
 }
 
-static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
+static int __maybe_unused qcom_snps_hsphy_suspend(struct device *dev)
 {
 	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
 
 	if (!hsphy->phy_initialized)
 		return 0;
 
-	qcom_snps_hsphy_suspend(hsphy);
+	qcom_snps_hsphy_do_suspend(hsphy);
 	return 0;
 }
 
-static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
+static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
 {
 	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
 
 	if (!hsphy->phy_initialized)
 		return 0;
 
-	qcom_snps_hsphy_resume(hsphy);
+	qcom_snps_hsphy_do_resume(hsphy);
 	return 0;
 }
 
@@ -518,8 +518,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
 
 static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
-			   qcom_snps_hsphy_runtime_resume, NULL)
+	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_suspend,
+			   qcom_snps_hsphy_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(qcom_snps_hsphy_suspend,
+				qcom_snps_hsphy_resume)
 };
 
 static void qcom_snps_hsphy_override_param_update_val(
-- 
2.40.1

