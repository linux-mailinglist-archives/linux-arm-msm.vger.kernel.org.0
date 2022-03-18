Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC33F4DE139
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 19:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240225AbiCRSlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 14:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235415AbiCRSlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 14:41:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71631C9B4B
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 11:40:20 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r21so5186225ljp.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxcaI5PPLcGqvRUtBX2rA37vADL045EnXxAdViDUp7s=;
        b=g7+BklOg6UNgkaO/bdUqX0jYsNzP27+FAasuZEgPJW3QJDk40vorEenEEKDhjKtfny
         UjJVD5LEkSyhU3ZxaPYz5UVYFIE5seVV4wkii0XOOtauOBv4F3FVG61Vj/XM4hyB7ol5
         htp4dEhDw+a5pLzI9CSWsuzrounXfpMiA5vuXCZgXafIUY1xw5GY/aaTPKoM/UHrxfB6
         lZE8GXqP6mTkBovnPexaEe8XAoUVmq+Qdz+LL9jzigJWpx7pz/q9LW8Bxuvaz8cTYXkR
         CHVJO4QIla3DhOKX3P+7+atzyF4N2yv7+JNsuhELKE99Q88vRCIAquqlq1tqFohOctpN
         NGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxcaI5PPLcGqvRUtBX2rA37vADL045EnXxAdViDUp7s=;
        b=GMi1O6jfGMbKSiFSRcJj6a3vtZ5s+OyddCmWeBqeHbKB7k2rC3BVEVocT/8GLX2RXm
         AyvTFK0+zVlAN0jjui2LvJFQV2lYtzFUH4PLlqshbnly5LT8Yn0hv9zY530a/VQkyDzk
         4H5WZlT9DOW2LK2YZ4MUkLl9tiS4s0px65Nbqi4PZ9rvghjQ4JXEONZ4KxST9oC5EFh9
         YIiAl0D5bYNENXOY36N6KHSnMnr2uuTRuBnWuBnIpnPkOB/RURDdmIXXcDrOelCuTEQO
         k6U4L2TKiSAo6Qn6yewkRJRXiIqyJCRU8TN6G+bScdvs/FajE70uIjUG8LrPbuO+BjiX
         qXpg==
X-Gm-Message-State: AOAM532vdjE1Mdl50nFkDimkuKpnfCo1mFB1DGaUc7ct5vMp+hcjz7la
        Lg9nRulrv4DZGBi/ZUOq94K2suFm1t010Q==
X-Google-Smtp-Source: ABdhPJyt/aqgd/G4xClL3pIIdid5DVsjFmvlts76WqZtBshuebteGpuiNLrrMsW0WKMaCy4sAj1cfg==
X-Received: by 2002:a05:6402:4311:b0:416:6a08:a9 with SMTP id m17-20020a056402431100b004166a0800a9mr10954842edc.346.1647628228837;
        Fri, 18 Mar 2022 11:30:28 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:28 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] phy: qcom-qmp: Add SM6350 UFS PHY support
Date:   Fri, 18 Mar 2022 19:30:01 +0100
Message-Id: <20220318183004.858707-4-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318183004.858707-1-luca.weiss@fairphone.com>
References: <20220318183004.858707-1-luca.weiss@fairphone.com>
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

The SM6350 UFS PHY is compatible with the one from SDM845. Add a
compatible for that.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index b144ae1f729a..1628275265b5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -6007,6 +6007,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm6115-qmp-ufs-phy",
 		.data = &sm6115_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm6350-qmp-ufs-phy",
+		.data = &sdm845_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
-- 
2.35.1

