Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8505D62F4A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241829AbiKRM1S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241857AbiKRM0c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:26:32 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053D59AC8F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:16 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id y16so8983642wrt.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WB27jhF4DCx/Ah98HAn4Zt+8vZMKTVFmQpCWXcHg7GM=;
        b=Hv4j2/dPaM9EBDU7n724L6eQsr4DNXdBQjGvzrtzZDn429adWSeIfWvr+e7+Mjbgfp
         3NqMO0rr+HQIQsWTe0RTQiVILKK9vcb549WGRP+cGKonal19zGGv1Alpm8bIh/5R+0Qx
         cmEgAbVp47aUAPBQ9KyV+jYDb8GBGDTlHuhjGoG2bCMdjDAQPThWMPAsyiNiQKPsXH1e
         ViA7Y5Os/+LZ5VG6GxXLwsooznyMtBZ6aUVhvCJkYCiN+ehm1J0ehhTMxdBOyeIUV+yE
         uTUeMjURKolrFZr6a24URF5pNbnymttJUzfMWu0gmdhKQndYGm2GqegJmBr9Nb+ks9/J
         +cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WB27jhF4DCx/Ah98HAn4Zt+8vZMKTVFmQpCWXcHg7GM=;
        b=eNSoBiLScFZVwcpv23EIcShvruPVxMrsoV11oBIEjge1HGtiaXB6hzbWTVxCpFLAWp
         e+sRFQrlKToz/FpwK+mqEimXupBiGN/Qn0Be2RwO4JX+TyDhNQcaxoDNud2U/5nj2/GP
         pgipbX3/fJWd/aew9rpgn982j+Op63Cm5J2MRf8SXcMUBHNUZEZ0/8Jc0LpiWkPWfvxZ
         bvMNfwBgATjON0Gb2sZDrMZHjH3Jo0lUDXMnQRrbEoWqR3F2Mrj2uEA/JoLomRGKBcjh
         lcHbM4jYIywnokbrhfOdsJ42aIdF9+0itxl4GCp876/2zrGy5Gn3HJAEO/8+1nVzBonl
         EEPw==
X-Gm-Message-State: ANoB5pleGkjgh+nAOAmd4CbCkVWLJ715X0xtFsgHhqfi5w3O19Iw8ve0
        2bzEuYB3/F5PSB/HivAj+7DFZw==
X-Google-Smtp-Source: AA0mqf5RPSNmKNYUH2/qrCXqX9bGdjEIkUCG//ScGngr0QgwxAVFX2JzCF6xdpSKvgMJWLHkf5jG+A==
X-Received: by 2002:a5d:6a46:0:b0:241:c2d5:7407 with SMTP id t6-20020a5d6a46000000b00241c2d57407mr1285401wrw.623.1668774375543;
        Fri, 18 Nov 2022 04:26:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b10c:1279:a704:75d4])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9873958wmg.46.2022.11.18.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:26:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 14/15] soc: qcom-geni-se: add more symbol definitions
Date:   Fri, 18 Nov 2022 13:25:38 +0100
Message-Id: <20221118122539.384993-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118122539.384993-1-brgl@bgdev.pl>
References: <20221118122539.384993-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The following symbols will be used when adding support for SE DMA in
the qcom geni serial driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/qcom-geni-se.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index f5672785c0c4..400213daa461 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -103,6 +103,7 @@ struct geni_se {
 #define SE_DMA_TX_FSM_RST		0xc58
 #define SE_DMA_RX_IRQ_STAT		0xd40
 #define SE_DMA_RX_IRQ_CLR		0xd44
+#define SE_DMA_RX_LEN_IN		0xd54
 #define SE_DMA_RX_FSM_RST		0xd58
 #define SE_HW_PARAM_0			0xe24
 #define SE_HW_PARAM_1			0xe28
@@ -235,6 +236,8 @@ struct geni_se {
 #define RX_SBE				BIT(2)
 #define RX_RESET_DONE			BIT(3)
 #define RX_FLUSH_DONE			BIT(4)
+#define RX_DMA_PARITY_ERR		BIT(5)
+#define RX_DMA_BREAK			GENMASK(8, 7)
 #define RX_GENI_GP_IRQ			GENMASK(10, 5)
 #define RX_GENI_CANCEL_IRQ		BIT(11)
 #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
-- 
2.37.2

