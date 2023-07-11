Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8654274F97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 22:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjGKU7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 16:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjGKU7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 16:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAA5170B
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 13:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689109097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jiBOM1KuLZEvS0bvIGnIKQCXCP0aV2NwdEa0u2AGH3g=;
        b=AWCIC7iZgMM4gxSEo5JVuLBoF8kebLFYBbML5+nUKK5KWCAtbSMMPO2a5EDFZBtCuNU2b6
        Y5JTe9DdEHg9RGM08GmFYY8d32yciMsYaNZNk9fThrzeJJq6Hdzf+8rIJ9zlqOVpZq0+Hv
        8lTIsCgv0MtrZA7cAAbd/M9ABTpWrYI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-uKkk069zMfmSSqRk0P8hdw-1; Tue, 11 Jul 2023 16:58:16 -0400
X-MC-Unique: uKkk069zMfmSSqRk0P8hdw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-56cf9a86277so68892757b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 13:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689109095; x=1691701095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiBOM1KuLZEvS0bvIGnIKQCXCP0aV2NwdEa0u2AGH3g=;
        b=Xb3JlzOGjW1arAdpD7KQg0jT+Op7q1qCRUwSG9mwne7889KVV2rJOiyr1OtMN4EZKz
         Pbowyg7nlOv22Jw1O+Xmcz3XaNNLNC5vKTnS2hd8699ipXq0ITHs1q8bJ7UIcvHBRFOE
         /laEr6Fv82cAV77SRnxtLkVxlIlCLeXhvHreunN/EgE1MzF6k8pyFkxt38DJ0Oton01m
         ZlL414pI04Tk1RdjxO9yJxQ/U19vrWcOWg6KE4EfQ2GHXpGbbwc60WhwXPtS3PWwfndu
         lyREplqonR8L0ZEwUO2fgsx0Dcg0kC8WqqrQDz1tyMR2Wh+bdNNfXbOR+kOstuvkUXFz
         mCWA==
X-Gm-Message-State: ABy/qLblVNOq4u/7mhibxJhb10LBLeZH4HW1yVibz2h+/oBX/t7tQorL
        2Kd0c+ufVN79d2/9l48lfN9GWDZw9gQL20RTkdm0r2ZX+p3H/k401u8mQn/OVAdBR8asC0InFD9
        LCnBxOlbVYqsP2cqzKWBhhaiSKg==
X-Received: by 2002:a0d:dd0f:0:b0:55a:3ce9:dc3d with SMTP id g15-20020a0ddd0f000000b0055a3ce9dc3dmr16784175ywe.13.1689109095603;
        Tue, 11 Jul 2023 13:58:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMM6rSAUBx2gHMgpN1hCMMVYXQ4ts3fvOEU1AYs0oR+Y47D9PvRxELDW1bK1hOX+hNQmSRfQ==
X-Received: by 2002:a0d:dd0f:0:b0:55a:3ce9:dc3d with SMTP id g15-20020a0ddd0f000000b0055a3ce9dc3dmr16784156ywe.13.1689109095299;
        Tue, 11 Jul 2023 13:58:15 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id j136-20020a81928e000000b00545a08184cesm785353ywg.94.2023.07.11.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:58:14 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        mcoquelin.stm32@gmail.com, pabeni@redhat.com, kuba@kernel.org,
        edumazet@google.com, davem@davemloft.net, joabreu@synopsys.com,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        bhupesh.sharma@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH RFC/RFT net-next 2/3] net: stmmac: dwmac-qcom-ethqos: Use max frequency for clk_ptp_ref
Date:   Tue, 11 Jul 2023 15:35:31 -0500
Message-ID: <20230711205732.364954-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711205732.364954-1-ahalaney@redhat.com>
References: <20230711205732.364954-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm clocks can set their frequency to a variety of levels
generally. Let's use the max for clk_ptp_ref to ensure the best
timestamping resolution possible.

Without this, the default value of the clock is used. For sa8775p-ride
this is 19.2 MHz, far less than the 230.4 MHz possible.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 757504ebb676..f9e7440520fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -694,6 +694,23 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	int err;
+
+	if (!plat_dat->clk_ptp_ref)
+		return;
+
+	/* Max the PTP ref clock out to get the best resolution possible */
+	err = clk_set_rate(plat_dat->clk_ptp_ref, ULONG_MAX);
+	if (err)
+		netdev_err(priv->dev, "Failed to max out clk_ptp_ref: %d\n", err);
+	plat_dat->clk_ptp_rate = clk_get_rate(plat_dat->clk_ptp_ref);
+
+	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -779,6 +796,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
+	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->has_gmac4 = 1;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
-- 
2.41.0

