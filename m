Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC8B7B4C22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 09:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjJBHDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 03:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjJBHDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 03:03:43 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D019BA
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 00:03:40 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40572aeb673so132497985e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230219; x=1696835019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kl92UGXdQCpCYtjLhOWwwVhgGbl7MyqnIkOytX1vHZo=;
        b=m+o65SG2K/Y3aUKYCDBSa6137HQKFqKF21mZe8jLmDfIfbm2E311fGvMMLwSYa2TQ3
         5chtrqAMnBO4ilORiJzTPWdjeMkjURna88e+CPqOFNUAncmxry2frMSsO+H6XC+3vDtV
         YcTUEtxhQcungQPrN9KDXqlmCBn34PTbj3eXx+MXZ5Bxj/W7T5y9sji3NBa6S/he0LjF
         VdYKLmAzT5dRy8KhIU26pJqwIAjYJVxLidIWYVPkb4X7HpaxalKRGa1lljsgzlC8WFhs
         FepNFlj8eYN8A0lyJHwtAU1uKTB0vkqjZhJdLf9rB2QKSzDmuqG28hSNiQkcsnerElR4
         s62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230219; x=1696835019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl92UGXdQCpCYtjLhOWwwVhgGbl7MyqnIkOytX1vHZo=;
        b=dBv1Osit9SGAzH52qLXFCo3AqANIBPBlXYv8l5ZXIDR1+PWNckw4yvLn1lB2ey1FYk
         DJ1OzJJ+G4s4Wd9Tjy/ULpNXGE2jls8trWznoktRgv1Z3SAHMjcVbOxIsVEWqVxg8nR3
         hD9eDHeQWhcUgCdcuGlEzBsxOYwGJqD/9rqZECqd2CqGZKFVjb86gGqKLMJYxhCIilqr
         RP3eHyOoSBJHqCFmIk4AQugohAkoxsjkZ+bP29gqQb+iOjOJQKxnV49G/x+dNbjcx1vn
         H8g65PctStrC2+0aubk+alAB72rKoUgL21sRU5IFa6gmlsrRwPUJiJQ+hkASZXJif8pZ
         GuCA==
X-Gm-Message-State: AOJu0YxZOnd3KzKYVnEETjmaOo+li3NaxU5KwpoDYvSViGX5otL5571L
        q/qP5QWnyulxQJutwCTwV3nDKA==
X-Google-Smtp-Source: AGHT+IEA8f8jbepvOECPPXUexkCLgyHOHQjzDCqVK7qMNT8c1bDfn1tTaebe+DDNrd13ra1QOlwa9w==
X-Received: by 2002:a7b:c3c1:0:b0:404:7670:90b8 with SMTP id t1-20020a7bc3c1000000b00404767090b8mr9325417wmj.27.1696230218972;
        Mon, 02 Oct 2023 00:03:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c020300b004063cced50bsm6614798wmi.23.2023.10.02.00.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:03:38 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:03:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: ufs: qcom: remove unnecessary check
Message-ID: <fe3b8fcd-64a7-4887-bddd-32239a88a6a3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "attr" pointer points to an offset into the "host" struct so it
can't be NULL.  Delete the if statement and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 2128db0293b5..96cb8b5b4e66 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1447,15 +1447,11 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
 	if (!ufs_qcom_cap_qunipro(host))
 		return 0;
 
-	if (attr) {
-		ret = ufs_qcom_cfg_timers(hba, attr->gear_rx,
-					attr->pwr_rx, attr->hs_rate,
-					false, true);
-		if (ret) {
-			dev_err(hba->dev, "%s ufs cfg timer failed\n",
-						__func__);
-			return ret;
-		}
+	ret = ufs_qcom_cfg_timers(hba, attr->gear_rx, attr->pwr_rx,
+				  attr->hs_rate, false, true);
+	if (ret) {
+		dev_err(hba->dev, "%s ufs cfg timer failed\n", __func__);
+		return ret;
 	}
 	/* set unipro core clock attributes and clear clock divider */
 	return ufs_qcom_set_core_clk_ctrl(hba, true);
-- 
2.39.2

