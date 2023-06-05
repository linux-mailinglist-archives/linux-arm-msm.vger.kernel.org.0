Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43A5722EE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 20:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjFESqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 14:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFESqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 14:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467EBED
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685990725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IvlL4u9x0nM8y/6XiWfoJMQ/1cupgKWd5JyS3D3qy1Q=;
        b=Y9UHdXC4AIMjoHHh2USdijum+6yP/sMK2z7G0iCxU+nKbvxYKcZWskoi6edA/PEedGW6Co
        iLd+rO2Ih78a4mJrKw/0Xe/SRwkByCNFrQHZCGdKLcks7jG2h88TaJpfcv6wCQNCuW91jn
        YSzM2J9FUiKLXt3PO2Ixu6r7CdO+MY8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-X-GzU_WgPXC0i0K0XIIkCg-1; Mon, 05 Jun 2023 14:45:24 -0400
X-MC-Unique: X-GzU_WgPXC0i0K0XIIkCg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3f994c591bdso12219131cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 11:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685990724; x=1688582724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvlL4u9x0nM8y/6XiWfoJMQ/1cupgKWd5JyS3D3qy1Q=;
        b=fLhUYq6K8J5Jc5qlaGc1LApx2g8s7izRl1u1o5HL0pwjK1NQ99Ia8+9kgoVQgFZVQk
         k7N47uFup3RHaFi6k2EpCzi2hs4Hkra20XYB4P8QSFbWli8D+hfxaLlfa0quDswBNZIW
         7c6cUUV47dnI/4DBOYultHCsMl8kDDa6td9HKHS+vZzH8bAZZXBRbL/1GpCKaZX/bhnT
         cVWW/X9OjcwrpY/YjMtE3FuNF0tKfs5LkXAa6H6l7qUyWv+dHT7RrmRlxOOkFzjnbdZO
         x3dkHjckCQ1x3wigiVZHLq8qu0vQJLE8iRZvixPmTzy3HlwjUgZUscZaHj+FxH9ow9bK
         7n+w==
X-Gm-Message-State: AC+VfDysTO5FBdIOn5yEhVEgKpGiRUDbFoiU1JKW53t9vQ/jzjyYTQRU
        lDef2jviQWZBCJZdhUrlUy9DYxhWjP4SOt6wkmfb66ZVNBGfqZp9wq4roI+vlSy35f6X82r5uDv
        Ti06tKAjrG4/5wzN7KL4IPPl30g==
X-Received: by 2002:ad4:5b81:0:b0:623:8387:3d0f with SMTP id 1-20020ad45b81000000b0062383873d0fmr9484802qvp.28.1685990723858;
        Mon, 05 Jun 2023 11:45:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6uGsAN6Rgou4IAJFUeHThaNt3mtxhiTfnqxO+Phzr4/amHBJd57R7UDnsl9/VbGKolkXItIA==
X-Received: by 2002:ad4:5b81:0:b0:623:8387:3d0f with SMTP id 1-20020ad45b81000000b0062383873d0fmr9484784qvp.28.1685990723598;
        Mon, 05 Jun 2023 11:45:23 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id d10-20020a0cc68a000000b00625da789003sm4785771qvj.110.2023.06.05.11.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 11:45:23 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 2/2] phy: qcom-snps-femto-v2: add system sleep PM ops
Date:   Mon,  5 Jun 2023 14:44:54 -0400
Message-Id: <20230605184455.34832-3-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605184455.34832-1-athierry@redhat.com>
References: <20230605184455.34832-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the system sleep suspend and resume callbacks, reusing the same code
as the runtime suspend and resume callbacks.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
I'm still a bit confused as to what the difference is between
suspend/resume PM ops and the struct usb_phy set_suspend() callback.
Please tell me if I should be populating the latter instead.

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

