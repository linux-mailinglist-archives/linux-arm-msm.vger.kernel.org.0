Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0230376247F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 23:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjGYVbL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 17:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjGYVa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 17:30:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9661FE3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690320614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uK3zP8luGfpdcnVrRakVsTeHLiN3hIMl3KOmXd3egZQ=;
        b=Gkjb/RxpS3iHEriRdpkhyhtbdHv+fc5HJpCcaqbBy0FW4sqhEQ0AmFSEPWCLGydelkh2oP
        nmk+gAwLI2BT5+9J0CtBfmVVe5AmkjYNMR884/Oh6yYMnDKwSVDtjldhb9o5odqZoPvGQ4
        Gs0OszQm1o7FpVTPZZpZcXXcdg9EBJ4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-ZZN-9qpBNbi3YCtcCJqphQ-1; Tue, 25 Jul 2023 17:30:12 -0400
X-MC-Unique: ZZN-9qpBNbi3YCtcCJqphQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7656c94fc4eso808997685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690320612; x=1690925412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uK3zP8luGfpdcnVrRakVsTeHLiN3hIMl3KOmXd3egZQ=;
        b=WpC9jNKCjHAQHtdU+PKvi2InqhMjD823Co1tQ0DEglpss4pMjWzg3/cxJ7/xbMzCVN
         3zHGcv2E3Vj7gcTdhP1FpeqZeb3PHppek0N0G0y+DfzkMlISblEk8BazlZbjAUf99Y4x
         k+xboJFcgPxQ5nLin4RprOAmZXESLpDKcrCIE7fF/1HyB9tkt8iIGBAF8xno6RAfpgDt
         KeXdm2jTQr2F7unV3ARpJjUtc0di4j7YwT7szFXsW9o++i5ykrOA/pbPiQ/xJJszBCP6
         fFbgkML4xpOrjtKgqsKnjQhioQ67pIhK2Svpf4ZOBhhiiBRJXpTeU4NBACoWb2SeSf0W
         8fgQ==
X-Gm-Message-State: ABy/qLb5uSph4M7Qmt9jAyahUYZzQU7lRMg2gOow5FkdAsO67XCuE+NS
        0jiQCXtSevUYf8l83PaNxKDWBXyeLstkxGX26wEVjUBYwSsEaP7eymUDFLadH6tHD9v7u9hq9m0
        sFgTH/hftq9oxsK+KXcy8W7BwlA==
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id s5-20020a05620a254500b00768156e41b8mr171366qko.56.1690320612182;
        Tue, 25 Jul 2023 14:30:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFed3Kq4JhRY5nCg9QF+L66gABirAe874NXCX9weK6QU/6x4lyMcM2Gcjb9IOg9DiukLElQKA==
X-Received: by 2002:a05:620a:2545:b0:768:156e:41b8 with SMTP id s5-20020a05620a254500b00768156e41b8mr171347qko.56.1690320611986;
        Tue, 25 Jul 2023 14:30:11 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id j3-20020a37c243000000b00767d7307490sm3943067qkm.34.2023.07.25.14.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 14:30:11 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/2] net: stmmac: Make ptp_clk_freq_config variable type explicit
Date:   Tue, 25 Jul 2023 16:04:25 -0500
Message-ID: <20230725211853.895832-3-ahalaney@redhat.com>
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

The priv variable is _always_ of type (struct stmmac_priv *), so let's
stop using (void *) since it isn't abstracting anything.

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 +--
 include/linux/stmmac.h                            | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 0ffae785d8bd..979c755964b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -257,9 +257,8 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 /* Program PTP Clock Frequency for different variant of
  * Intel mGBE that has slightly different GPO mapping
  */
-static void intel_mgbe_ptp_clk_freq_config(void *npriv)
+static void intel_mgbe_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
-	struct stmmac_priv *priv = (struct stmmac_priv *)npriv;
 	struct intel_priv_data *intel_priv;
 	u32 gpio_value;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index ef67dba775d0..3d0702510224 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -76,6 +76,8 @@
 			| DMA_AXI_BLEN_32 | DMA_AXI_BLEN_64 \
 			| DMA_AXI_BLEN_128 | DMA_AXI_BLEN_256)
 
+struct stmmac_priv;
+
 /* Platfrom data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
@@ -258,7 +260,7 @@ struct plat_stmmacenet_data {
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
-	void (*ptp_clk_freq_config)(void *priv);
+	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
 	struct mac_device_info *(*setup)(void *priv);
-- 
2.41.0

