Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3935F6C91EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 01:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjCZA5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 20:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjCZA5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 20:57:39 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D67FBB80
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:38 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id br6so6907441lfb.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 17:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679792257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jiwlN12y/3lXv9SjJsbLHWnt36d7YrELH3I9tTCd7I=;
        b=vTGFavBy2aHVjppySsM5ApbeUeN8qjB6OsWDUtgU1FXhFSsCY5Gt1iYuHrxd+1Uoop
         3twqKocLw/GZaYUMPR43vCRgdHUdWz/AQB3Hvgr7ZsmUR8FhjBvDSFCu15gEiQAIAwM/
         mlUf6f8ve6Kda53iPy2puV3ev6Yi7OktRtGKUZfGqHsJ+6x6vI3x9Z7lWWyRMwSBCvJD
         g+LSmTyhZnt4046FNTIAKfzfFveYmSeKhUWXFTzjlppEBQKot8ulmGNHK0ixGSrvIygB
         M8jQiAxMXG5furrFaD/vZvBA9JaT+li5hDJB1rR2BQL8I9QCtvXX8icXzePz3iN4UPGO
         ahCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679792257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jiwlN12y/3lXv9SjJsbLHWnt36d7YrELH3I9tTCd7I=;
        b=XOZ13jpd1mjy15x3ZT0IyJ063+2SqgZlf9fA03pXjo7Mc7V4OTS8TnG4Bxni+3V+9T
         KNrBm9VjGY1ZQDQtUZ1K3simSUgLN62YgXuEw99VeVjhE5Mfr3Yrx31OADclkJ7JLUMP
         /FZTkUc3H6CTcGjfRolOAflUlst+OHKpLrtDe9eAYniZOmYXBRgzA8FamaPHy3U2gK4K
         9V8lE8CxkFW1K4psCFFfmZVn21hTfAqbSBOBSclfQuzeN/C+gEkBXNND54jZZS8Hvm5L
         tLyp9DqlmGMfFrf0q7g6KNcExJjmlb0E1usql6ePfCA7EgkQ9lwrveLs8UjFMWMrAMGm
         yXmA==
X-Gm-Message-State: AAQBX9d4nd02Rn1i1tw9FUjdR7skZ0U7NtkY1jDXoRno6obdAejpu6qj
        7zRrF5h7rQhmRzdbpKXfPpGu2Q==
X-Google-Smtp-Source: AKy350bxkn7X48K305kMP5x677EFfaBENdJPfVvDWXKQZ2VJfebcbY838+mJTkwrmSxZJY9r0ENwVg==
X-Received: by 2002:ac2:5476:0:b0:4eb:c30:2777 with SMTP id e22-20020ac25476000000b004eb0c302777mr528023lfn.54.1679792256988;
        Sat, 25 Mar 2023 17:57:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020ac242cd000000b004e7fa99f3f4sm3996858lfl.265.2023.03.25.17.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:57:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/9] phy: qcom-qmp-combo: add qcom,sc7280-qmp-usb3-dp-phy compat entry
Date:   Sun, 26 Mar 2023 03:57:28 +0300
Message-Id: <20230326005733.2166354-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
References: <20230326005733.2166354-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add separate device entry for Combo USB+DP QMP PHY on sc7280 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5ce68d211998..8fadf92095c5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3431,6 +3431,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		.data = &sc7180_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sc7280-qmp-usb3-dp-phy",
+		.data = &sm8250_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
 		.data = &sc8180x_usb3dpphy_cfg,
-- 
2.30.2

