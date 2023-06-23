Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4A073B4C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 12:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbjFWKKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 06:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbjFWKKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 06:10:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C01C2D65
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 03:08:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f875b267d9so538570e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514930; x=1690106930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnVUt9Dh0UjANbDqrVAk/dG3mwlxSAljXxYJAiOkMWs=;
        b=LLP1s9L824mf/hPGjZfQH7SiopJXYfdyiDTM59jz/jNc3AiZxxW/BgOlJBkA3DlLwk
         qTAs4+1dw61llSqfMyZDkYAM6HQqE4aDeJvBSpjvYMWlHs5qZKSVeLivKVXaXH4u9MCt
         O0SxZe2JVIg6f6DN8tMUOoiGbaE8XkOCbpvrzbU3c8d0iG30sMtWN/BnUsYvB8rM2s1N
         MFClusI3KoRjf8dnmIgxF/FoE5Xwy3/ZPq4saYQ4K4pPwI5sutaqwDS1PJ7SMkYs3gst
         XRUZC+Ml/kyLvZchqlOeqh7fxxSj0uyrdIePhQ2ICoh+sLUMCvqEIWsQezMzBJfaGH4I
         4jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514930; x=1690106930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnVUt9Dh0UjANbDqrVAk/dG3mwlxSAljXxYJAiOkMWs=;
        b=AIrGefCWhZmgEmwD1qV83OnNKb9I6RrKIYxlv/wz1PRcGUt03m6qePxsUC0aYP12AJ
         AmsfWXFmtHh6JayoDvzzA8nonacUUR3mW6yp+KJQnHB0btYcJKz1zAIltpvsQUVvbHhJ
         suSOwR86lp71d4CAfz4fxEl5cXtvuhmAm15x/QnjQq87YK8J56TiGiGVt105K0v53w8R
         7qZaanLFVH99eY7P1p865iVcggKAIEjY093lBHDwIyiZkfnXu0HBzTmDcNuxZElmZ2CP
         0NMYqc+q6WH37kHF0ZLSbGjCrznkdKcEkioQpIh3d1aVHTd/8SUy43WLqYINLE/HAXg7
         AXUQ==
X-Gm-Message-State: AC+VfDyYE1jXaSKxpKLT8YLs4oE8flrOFoubNVk8Iit//5cvFL30XazB
        um7SSceTGUdiX5sz6Hef/OmAeg==
X-Google-Smtp-Source: ACHHUZ6IA8Zg8OXRj8vhs8LeO+6FIoiYOXpR5iRHhD/a3TcG7xFMdgvQ9ERwAuF0T6TYv+OnGQaKfw==
X-Received: by 2002:a05:6512:32a1:b0:4f8:589d:647b with SMTP id q1-20020a05651232a100b004f8589d647bmr11737753lfe.34.1687514930651;
        Fri, 23 Jun 2023 03:08:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 03:08:50 -0700 (PDT)
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
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next v2 01/12] net: stmmac: replace the has_integrated_pcs field with a flag
Date:   Fri, 23 Jun 2023 12:08:34 +0200
Message-Id: <20230623100845.114085-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct plat_stmmacenet_data contains several boolean fields that could be
easily replaced with a common integer 'flags' bitfield and bit defines.

Start the process with the has_integrated_pcs field.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 3 ++-
 include/linux/stmmac.h                                  | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fa0fc53c56a3..44151e69f9ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -790,7 +790,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
 		plat_dat->rx_clk_runs_in_lpi = 1;
-	plat_dat->has_integrated_pcs = data->has_integrated_pcs;
+	if (data->has_integrated_pcs)
+		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4727f7be4f86..38b6cbd8a133 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5798,7 +5798,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		}
 
 		/* PCS link status */
-		if (priv->hw->pcs && !priv->plat->has_integrated_pcs) {
+		if (priv->hw->pcs &&
+		    !(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)) {
 			if (priv->xstats.pcs_link)
 				netif_carrier_on(priv->dev);
 			else
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 06090538fe2d..8e7511071ef1 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -204,6 +204,8 @@ struct dwmac4_addrs {
 	u32 mtl_low_cred_offset;
 };
 
+#define STMMAC_FLAG_HAS_INTEGRATED_PCS		BIT(0)
+
 struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
@@ -293,6 +295,6 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
-	bool has_integrated_pcs;
+	unsigned int flags;
 };
 #endif
-- 
2.39.2

