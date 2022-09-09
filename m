Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07915B335B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbiIIJOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbiIIJOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:14:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAFC18E33
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:14:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z25so1666723lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mVdK7E4cY7cM5XQpQxkxfa74Zdst6+MVrVvVyV2J/ME=;
        b=sZTsC4qmG3N4ZhlzVNgf2Cz+mT4hmqeYeHoq0nJoM+mtNj+UGnELed8RQwGArniXGR
         YT9Drrj/vOf/DSssfXMSE211vG/ihKDBViaRjNiEpGO9pIeUUiYub+PDfqW10dQ+C0py
         2BEL1Yb/Zo8uwUWeGfnpindD02vrpbHpLVnK357UV1+FcHf0s5kcQQ08NQQ+2o1qOV3N
         MUfeRM4760T01DkPlrMv3oKimoShLhvcFMPvRS9M+dRcDB1FMK2qAR0KMLsBtdtrmA4a
         YAMH3dXwNG8yld04wcA/oN14eueK+WkHgGD88tHHUV9Q0AgvI2wq6NPzvia/BLaVXk9J
         21dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mVdK7E4cY7cM5XQpQxkxfa74Zdst6+MVrVvVyV2J/ME=;
        b=pCaysXjegEnVzMHZO52poiOti6RkuTPBf2UDVBKYI7Y0rO/c2DZJ4hMS2frWssnZt/
         oeKwln+MCqorxRoFmLgBM8ER07+dpkl7uL85rdMutFCJEO8j3qfBwsORCKKGmZEpLdtz
         rvkzUDWozVgef3wwxe9ft8ilUyILWBdlbsBT8JR9ZvP/JaOCo63MgwfbzMUJaF2Od6pO
         68uAiIeBs5mzJeoqCTubjP4KR+5LWFzXi/S6cLY32+PybUOxp1Igj7tnJd3aq0OUBZFE
         lFTuzqAGccu3vsQR+ngFlXHRSPYIRD7QBWDCt8FXnrYP2QIj4iBmR3F3JmFyl6Cgpik9
         OQ9Q==
X-Gm-Message-State: ACgBeo22kelWmsZI8vJq6GGs5Fb/KhSfR81p3To0ziICQyMuijhxh2Z2
        QxNzqZkQVWRcI+E+YPhWnfDDjg==
X-Google-Smtp-Source: AA6agR5GLSJc2/tZgMKnpxjUZbHhfQBcV4ocohEfkZI2hZeRI0rEjw/VZNAQ/8PcktlxZLsGQWYFYg==
X-Received: by 2002:a05:6512:1115:b0:497:cd1:463 with SMTP id l21-20020a056512111500b004970cd10463mr3896511lfg.24.1662714875565;
        Fri, 09 Sep 2022 02:14:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z26-20020a2e4c1a000000b0026acbb6ed1asm201615lja.66.2022.09.09.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:14:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 1/9] phy: define submodes for PCIe PHYs
Date:   Fri,  9 Sep 2022 12:14:25 +0300
Message-Id: <20220909091433.3715981-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909091433.3715981-1-dmitry.baryshkov@linaro.org>
References: <20220909091433.3715981-1-dmitry.baryshkov@linaro.org>
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

Define two submodes to be used for the PCIe PHYs, where required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/phy/phy.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index b1413757fcc3..bd60c1a72988 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -45,6 +45,15 @@ enum phy_mode {
 	PHY_MODE_DP
 };
 
+/*
+ * Submodes for the PHY_MODE_PCIE, allowing the host to select between RC (Root
+ * Complex) and EP (End Point) PHY modes.
+ */
+enum {
+	PHY_SUBMODE_PCIE_RC,
+	PHY_SUBMODE_PCIE_EP,
+};
+
 enum phy_media {
 	PHY_MEDIA_DEFAULT,
 	PHY_MEDIA_SR,
-- 
2.35.1

