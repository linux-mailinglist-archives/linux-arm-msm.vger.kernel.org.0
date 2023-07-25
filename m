Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6283762481
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 23:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjGYVbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 17:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjGYVbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 17:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234981FEC
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690320624;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M6R5PqHz89a5dYS6wq5jIGBjMTrYBr/afZbcaHTTyIA=;
        b=BammLYoDblRMEhIessf1ogwK0egFBi8MdptZnOrnAkwAtaiBpKNBS+pM8uNDntY8/KItGV
        7eFDa1fdDmtnAknrV+hz1kJPlch9yxC/h44AWqBdii+rhqr+lm0NcIS9V2d/T9OPvq0o6L
        SqlhzM2SJ6f53OONeUiv6t/GaYIEyN8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-lKdk_wNIMJGTy04LVcMX2Q-1; Tue, 25 Jul 2023 17:30:21 -0400
X-MC-Unique: lKdk_wNIMJGTy04LVcMX2Q-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7656c94fc4eso809011785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690320621; x=1690925421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6R5PqHz89a5dYS6wq5jIGBjMTrYBr/afZbcaHTTyIA=;
        b=SfjvXtYs6K0t2P1zplEslgaGnFgemiECy+xuxViHf2C6lwKQWv/Xr42u+C/KDQVtTp
         FRcjxp3z6KuAqvdiA42ChJojS1iaHRqz3i0r1Fef4w2aRlgrKcSIeeGqzYtrHZZhlAL7
         ludmBTqYgbzdUEPSp4UMRbQfhsPrn37t1bLyZ5Nxr+mS9kU32+Jrts3N8LageaDQUL37
         HM2CU4xqSEcd/pkE+kDN2/Wznzyh/Ilzw2XR8WjTcnUejV4nyHOZNuMSQU6ITN0XOg6N
         vYREbFZ0b6xD1anXQoqMGLGkaTpnva0vAUFibG9+JHuHglnO9miX6Gus0MLQPxgfXPbL
         fkfQ==
X-Gm-Message-State: ABy/qLZV1OJtFpWnInevhtt2wPinTpe4dPuj1YyNc5iflOlZ7oczlEpq
        wVTmRmrUKZQkabS6RzZEAnC//TRRjT3MUDywijKN436uzZl9GSKXis5rLKr8yTxDj4EJAg1bCYI
        EZRRl/q5kHonQ6C+XSOykgS9UMQ==
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id s5-20020a05620a254500b00768156e41b8mr171814qko.56.1690320621303;
        Tue, 25 Jul 2023 14:30:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEXEDMipNpnjboiVX9tymuPzO29w0eF8hLR09Ab5g7ZDyLrlEARGaZBlmf5qh4U8wb5xzUttQ==
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id s5-20020a05620a254500b00768156e41b8mr171797qko.56.1690320620999;
        Tue, 25 Jul 2023 14:30:20 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id j3-20020a37c243000000b00767d7307490sm3943067qkm.34.2023.07.25.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 14:30:20 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     ahalaney@redhat.com, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        mcoquelin.stm32@gmail.com, pabeni@redhat.com, kuba@kernel.org,
        edumazet@google.com, davem@davemloft.net, joabreu@synopsys.com,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        bhupesh.sharma@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, jsuraj@qti.qualcomm.com,
        Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-qcom-ethqos: Use max frequency for clk_ptp_ref
Date:   Tue, 25 Jul 2023 16:04:26 -0500
Message-ID: <20230725211853.895832-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725211853.895832-2-ahalaney@redhat.com>
References: <20230725211853.895832-2-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 735525ba8b93..a85501874801 100644
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

