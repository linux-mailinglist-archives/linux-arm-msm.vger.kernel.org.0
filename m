Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E289672BCA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbjFLJcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbjFLJac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:30:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFEC30F4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:54 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so4767819e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561892; x=1689153892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRB5rCUQICPP4KdYl/nzNPsexRgByDiqLi2dGSM6LQs=;
        b=wki9pfOT5Rxd5I9FVQ1tRg38zuoF06hGoB1Obw/n5Dat40yAA3EhR9Z0NsWmcyoRqW
         vQyNN2w2lHRcUgiG1L332CkRuWKahCVsNNsrZv5eNwW8gCsYqzw1Thzr5uyHZFzdU2L4
         R7UVTsB1Dp1LYr35Igwj8+TEs389mw3klOojuK2W5JThLmNPLnC3tMYuuLyJ3Gp6zCG/
         qEcP61vcWik5dCgYIOPqXuug1GJFZUuqfw8tCK6B4Pkjc+BH8zPcoLzziPa8F0Qnz+ca
         ViB763l7KUgMeerwWnhj0R3xgWRs8nSt3qCvm/3rh1uZ+miXI5BfQi7gRLCTXh6Ux3Ff
         c3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561892; x=1689153892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRB5rCUQICPP4KdYl/nzNPsexRgByDiqLi2dGSM6LQs=;
        b=EKsZNaKAM/NBoeW2hf4qBdrj5G8pC/KoJgnnRz0HDZ5baIC+Uu52q7kK5D0mWtLmUt
         8NBkSQsYZsR/GgYvZxVx17j7gTRFYpkGD3BGmXeDyiiYoI3Em2Kfd1S+xzsaTC60vSlY
         jr0l5/g26S3Do7cnOqMXM8jkzN9IynvUTdvDrSgYRwUoc2ddU3MoB/6+t/jKp0BOgbRP
         L7JbTpgZ9gtwEuY0tPeophwcMtb/EwMMOhThBrpVWDVtj9UAvaN3U9eNBMAIj7Ar2Jn4
         SHP6Ixem790dcF9Zne6oit/DlEy03vxQ7aamwjUHXcmeMokChcQLsaeehDC3E+k7ZX8C
         4ucw==
X-Gm-Message-State: AC+VfDzt19IBN6Pu8GF9Vmi2oHtttwKxGqHCkb9C8H651fIbic9LjMbT
        0+d8TDgDAOp9fcX8lc870+/X3A==
X-Google-Smtp-Source: ACHHUZ6MsoAALe/nXViObuQKYmMum7GoTveImC1ZSm+c8DJ1aav0op6ATtx6I9EHAENx6igoyGBseA==
X-Received: by 2002:a05:6512:2e2:b0:4f6:2233:6d27 with SMTP id m2-20020a05651202e200b004f622336d27mr3519648lfq.31.1686561892365;
        Mon, 12 Jun 2023 02:24:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 18/26] net: stmmac: add new switch to struct plat_stmmacenet_data
Date:   Mon, 12 Jun 2023 11:23:47 +0200
Message-Id: <20230612092355.87937-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

On some platforms, the PCS can be integrated in the MAC so the driver
will not see any PCS link activity. Add a switch that allows the platform
drivers to let the core code know.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 include/linux/stmmac.h                            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa07b0d50b46..fdcf1684487c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5793,7 +5793,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		}
 
 		/* PCS link status */
-		if (priv->hw->pcs) {
+		if (priv->hw->pcs && !priv->plat->has_integrated_pcs) {
 			if (priv->xstats.pcs_link)
 				netif_carrier_on(priv->dev);
 			else
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 225751a8fd8e..06090538fe2d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -293,5 +293,6 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
+	bool has_integrated_pcs;
 };
 #endif
-- 
2.39.2

