Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D7E542726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238016AbiFHDGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 23:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240953AbiFHDDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 23:03:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24225194746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 17:31:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u26so30052423lfd.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 17:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tllnWBs+UGxhhWXIcjfZ+e5qmbWUYZGw6yCtZxBST84=;
        b=YZipEr4h49uVw66wFY6bPD+55x6UrZUAzf77eBcu4p4FhYUWwWPX5Jxg23ZhM1oz4f
         SGNda4wOY5ew3nFu84EGE9dvoo2tDVkSMKy2aoIXwI+BtkjVuPuoOFUZzUte/yGzEvyH
         tlovAvyEKuAtbqrfw/i5FSgHt/DmLAE8h5OvVukczknrtwVFIX1+2HV3gdOJDdmj8Ug6
         vZfyv0Yb+9Zth4o5KwxaoOnqzzpbq0GRJRJB26S/6XsoCi5tmq8ZXeA62NUGN7dt7Xkl
         ho5FMNGjKc5U6aaTVvGENCu6SiTmPi9Z0ncPCABYgnk8qdkQ/LOV2TnvFULN98mxcSPS
         rrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tllnWBs+UGxhhWXIcjfZ+e5qmbWUYZGw6yCtZxBST84=;
        b=FNlxaaEEUBzAdx7panFs4ohbWJ9ndoF/wCRfthRBdCQ4Vrj9IFCYNs0/kYL5oHfQ2v
         /eOyMzZx6S4J23giCQJBHzfT1mHnB/xd0YF4RkPhR7d/6lGho00Z/rxVleyQoiJBdhw7
         AF8G/vNl68Hp5gH/22KtRVBlWFisMuaRvZpr6zyUPd/LcNYKNTxewr62zPBQJs7ZOMH1
         hsUS5uSQFh+6thj7R5GBB6hABlIlwPVga2x43qHjUEQxOEkUDIhujRdE7bjZo/hipBNa
         0K9qHx2xBBzMVJdsFOaX/LXEg4dBQ6ju16JDOcLBIymfeBAVCroEj9/uFy92mELtmMjF
         Wzsw==
X-Gm-Message-State: AOAM533Sry4oIG7mDQvLG+4Nqe1x6ox7RgjudUgZaa+jO2djU8dDDb1M
        rzA73XV80eDYdeumE97vs3uV9w==
X-Google-Smtp-Source: ABdhPJyo5f5njABBdN4Co2swLGpTaz3v7QZAy+orZgzo+cwe/JRf5HKYeRo5bFVyQle3DdTjfdNdAA==
X-Received: by 2002:a05:6512:239f:b0:479:2ef0:3004 with SMTP id c31-20020a056512239f00b004792ef03004mr10837331lfv.208.1654648266436;
        Tue, 07 Jun 2022 17:31:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b00478635ebdccsm3464569lfp.251.2022.06.07.17.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:31:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 2/2] phy: qcom-qmp: properly sort QSERDES_V5_COM_foo
Date:   Wed,  8 Jun 2022 03:30:59 +0300
Message-Id: <20220608003059.2910252-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608003059.2910252-1-dmitry.baryshkov@linaro.org>
References: <20220608003059.2910252-1-dmitry.baryshkov@linaro.org>
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

Sort the defines in the QSERDES_V5_COM_foo namespace according to the
register addresses.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index b9a91520439c..01f9b4cc08f8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1093,8 +1093,8 @@
 #define QSERDES_V5_COM_LOCK_CMP1_MODE0			0x0ac
 #define QSERDES_V5_COM_LOCK_CMP2_MODE0			0x0b0
 #define QSERDES_V5_COM_LOCK_CMP1_MODE1			0x0b4
-#define QSERDES_V5_COM_DEC_START_MODE0			0x0bc
 #define QSERDES_V5_COM_LOCK_CMP2_MODE1			0x0b8
+#define QSERDES_V5_COM_DEC_START_MODE0			0x0bc
 #define QSERDES_V5_COM_DEC_START_MODE1			0x0c4
 #define QSERDES_V5_COM_DIV_FRAC_START1_MODE0		0x0cc
 #define QSERDES_V5_COM_DIV_FRAC_START2_MODE0		0x0d0
@@ -1122,8 +1122,8 @@
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
-#define QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
+#define QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
 
 /* Only for QMP V5 PHY - TX registers */
 #define QSERDES_V5_TX_RES_CODE_LANE_TX			0x34
-- 
2.35.1

