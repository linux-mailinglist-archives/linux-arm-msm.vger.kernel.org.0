Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7829573B4DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 12:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjFWKK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 06:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbjFWKKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 06:10:16 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866903A81
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 03:09:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa7eb35a13so1491975e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514944; x=1690106944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXLmQoTjoeXO9UdxG4BxiuLilLfncmL1ryydj7qwo7o=;
        b=iuwXz7mi6f6iU0NcWp3IDb41yk29667vEnsshk9+azB14/0XRb4tvgzz6w39k3UTHI
         j2vrD+bdyXkKEaao49viU132lD8XiB25y1YMMpENHRdDdLKEcum9oFqEvdbKjP9y8da5
         X52/sVYz4RUXsng3XhH2hPu2lKWOiqKCGdDn3pRVnL98PbYqq/rf9NPcW/5o2btPrvg+
         Sk8hWAQFTveGNcA6uCue2YXhwwf96LNTNp+YupxiQO05jM9DUMnk2sR6heUMz7ev+uyV
         /ynJkqHrj/9s+iRGxHi8vNNiaP50BFq9jrS8Dd1LpWOdRl60B/CABBpBNcsavWpemlVF
         h5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514944; x=1690106944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXLmQoTjoeXO9UdxG4BxiuLilLfncmL1ryydj7qwo7o=;
        b=DpOQlm7PnDtw4XpDpj/B6iqw9uEz5t1u2gahUm389cXJEgSiiZ33l7D+1UnXg6bNQO
         E2t4hzJuGoln7rnAMO0cAVePFk+4jdkv4QSQbYnpO0l/HFB1EpDrjKKKIIZVvGsyJvO7
         C8PuneMfi/2PoRYdyx6Bl+2XWvEeJPq8eZLJvFnhkN9k13yIaE4l8HXSCHDQ1mYFjB4h
         9/GdAyp0FqiGYBRbemlXcMmA1av3HFe82YfCDm3eMaQmchvlFKn7opE10xsZK4GYtJYr
         RCYJ0rL2Kpl8+lVTnbIRfI6fR1vcVNGtv56JMzxXSH1iq0A39VUDinEAoL9ooV7OFayT
         hinQ==
X-Gm-Message-State: AC+VfDy67/7mssR+PRcAj5cEGGNQXLDVlDyN2IaGwUP1kezikomwuhui
        cbGtWVHwq8LSdP51Sh91toNgbg==
X-Google-Smtp-Source: ACHHUZ5/NdwcI1og4z221h8R95D/JxwEhxGIovnZLwKRI0b3FDhihpgtidabzJtIHqcrQZ259Ayzyg==
X-Received: by 2002:a05:6000:8d:b0:311:db0:8aff with SMTP id m13-20020a056000008d00b003110db08affmr3377766wrx.70.1687514943901;
        Fri, 23 Jun 2023 03:09:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 03:09:03 -0700 (PDT)
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
Subject: [PATCH net-next v2 10/12] net: stmmac: replace the int_snapshot_en field with a flag
Date:   Fri, 23 Jun 2023 12:08:43 +0200
Message-Id: <20230623100845.114085-11-brgl@bgdev.pl>
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

Drop the boolean field of the plat_stmmacenet_data structure in favor of a
simple bitfield flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 10 +++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  2 +-
 include/linux/stmmac.h                                |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index a3d0da4e9e91..0ffae785d8bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -329,7 +329,7 @@ static int intel_crosststamp(ktime_t *device,
 	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
-	priv->plat->int_snapshot_en = 1;
+	priv->plat->flags |= STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	mutex_lock(&priv->aux_ts_lock);
 	/* Enable Internal snapshot trigger */
@@ -350,7 +350,7 @@ static int intel_crosststamp(ktime_t *device,
 		break;
 	default:
 		mutex_unlock(&priv->aux_ts_lock);
-		priv->plat->int_snapshot_en = 0;
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		return -EINVAL;
 	}
 	writel(acr_value, ptpaddr + PTP_ACR);
@@ -376,7 +376,7 @@ static int intel_crosststamp(ktime_t *device,
 	if (!wait_event_interruptible_timeout(priv->tstamp_busy_wait,
 					      stmmac_cross_ts_isr(priv),
 					      HZ / 100)) {
-		priv->plat->int_snapshot_en = 0;
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		return -ETIMEDOUT;
 	}
 
@@ -395,7 +395,7 @@ static int intel_crosststamp(ktime_t *device,
 	}
 
 	system->cycles *= intel_priv->crossts_adj;
-	priv->plat->int_snapshot_en = 0;
+	priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	return 0;
 }
@@ -609,7 +609,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->ext_snapshot_num = AUX_SNAPSHOT0;
 
 	plat->crosststamp = intel_crosststamp;
-	plat->int_snapshot_en = 0;
+	plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	/* Setup MSI vector offset specific to Intel mGbE controller */
 	plat->msi_mac_vec = 29;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index afd81aac6644..fa2c3ba7e9fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -180,7 +180,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 	u64 ptp_time;
 	int i;
 
-	if (priv->plat->int_snapshot_en) {
+	if (priv->plat->flags & STMMAC_FLAG_INT_SNAPSHOT_EN) {
 		wake_up(&priv->tstamp_busy_wait);
 		return;
 	}
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 0a77e8b05d3a..47708ddd57fd 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -213,6 +213,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
+#define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	struct pci_dev *pdev;
 	int int_snapshot_num;
 	int ext_snapshot_num;
-	bool int_snapshot_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2

