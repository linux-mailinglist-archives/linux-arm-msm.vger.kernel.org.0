Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A77C4C3C79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 04:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237062AbiBYDjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 22:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237051AbiBYDjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:39:24 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A52A17B0C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:38:53 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id j24so6025952oii.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oJp8hP+U6of0fVJudV+JnYfYQm2OqbcYZL17Ud0j5hM=;
        b=K14qvOADAvKamyct36KBBctciQ880Q/jd9swL7Wwln6RN3gLFMm+v2gtAuf9BGVPB4
         WhCU6t9gKeInxiNFTAEkp5Lk37mjZEQ20ZNl+e6/BRMk5NN2119tSvlkrfL47iSHOQp2
         g7KtWVz6LGOzmxM6Y9CYQtR6ef1D/l/Ni/YpDWLFZtPMMCd+TjIGy9Z51f+JWDURBXh3
         lI8mokaP3KDuA+Dbv/2forWLn/1If7RLE7tl8EAuVP8qk+aNUgdwIC+MhN54BL0FisAg
         a91LVNQC0DyaFqtIwZth1CHP0dHqX7DMnfzmIIDP7ZNXeQGKsDXtJOrl084h2gqaZ+U4
         6cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJp8hP+U6of0fVJudV+JnYfYQm2OqbcYZL17Ud0j5hM=;
        b=6GncM3YlvPLVjD3ehZdRdnET5P6ahNitpkkauQHq0imLRkc48MEO4dm+SAFPnKDi/M
         JnNQhnbTPZMOamrtHEvieWKOlT9XOV5RJvWAjcWeuB7ckLnXJwLDYwLoou+hvILfpCne
         Re9cmZlsyZd05YqKNNAYWtlzrIC+qC1c4F1SqvCRyXD2Am0QQHQnF2A3kANpxpFPYK7m
         2tGkeZWxDUuCN4b5WHAdNNgv0c4syOWEtS6hliO1Qvq8Vtz0B1LBbxKqj+8H0KTVWm+L
         UZu5mMVFL2HACekd02qZC37vf6oKC/8rO5wpaV0c0UBGdedGc/sKkcecnGCjZNC7qfrI
         LgIw==
X-Gm-Message-State: AOAM5312vPkJmZufjC2iUTtBZieJyJQtxbdGChOw1YZkY/JqUpsCA9vd
        ZQaqBCk91k6ZFVmxrCMhUhhXXQ==
X-Google-Smtp-Source: ABdhPJwBbQIj1/fURhNGdW7Jo1P6bxaKV4zdISwcXu6DRZDIkci/8FSsBPgQM6lvVcb0kVeEa+T/mw==
X-Received: by 2002:aca:3e56:0:b0:2d4:c902:b851 with SMTP id l83-20020aca3e56000000b002d4c902b851mr627205oia.114.1645760332736;
        Thu, 24 Feb 2022 19:38:52 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id fq14-20020a0568710b0e00b000d4492531a2sm809359oab.17.2022.02.24.19.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:38:52 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: qcom-snps: Add sc8280xp support
Date:   Thu, 24 Feb 2022 19:40:49 -0800
Message-Id: <20220225034049.2294207-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220225034049.2294207-1-bjorn.andersson@linaro.org>
References: <20220225034049.2294207-1-bjorn.andersson@linaro.org>
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

The Qualcomm sc8280xp platform comes with a 5nm femto USB PHY which, in
contrast to previously seen platforms, has the SIDDQ bit in the COMMON0
register default to high.

So make the driver match on the 5nm compatible and make sure to clear
the SIDDQ bit on phy_init.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 7e61202aa234..5d203784f75d 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -32,6 +32,7 @@
 #define POR					BIT(1)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
+#define SIDDQ					BIT(2)
 #define RETENABLEN				BIT(3)
 #define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
@@ -233,6 +234,9 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
 					SLEEPM, SLEEPM);
 
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
+				   SIDDQ, 0);
+
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
 					POR, 0);
 
@@ -275,6 +279,7 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
+	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
 	{ .compatible	= "qcom,usb-snps-hs-7nm-phy", },
 	{ .compatible	= "qcom,usb-snps-femto-v2-phy",	},
 	{ }
-- 
2.33.1

