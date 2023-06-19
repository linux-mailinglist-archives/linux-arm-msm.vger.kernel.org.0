Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A31C8734FC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbjFSJY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjFSJYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:24:23 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C47127
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:24:21 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f90a7325f6so18490095e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166660; x=1689758660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMgaAHe76eIn3F9IB6JgFSErZkAha9wqjAecsB/W5Vk=;
        b=k6hUzsBdbW852NGN1tgRKfvV8+nCAhx6DYEPsgRjsWlZ0BTtUlFExnS/x1vqW5n848
         D4J1nktobWGcUq4l0hluW577VVrCeg+Py9HYgt4695ySSnSmkrlNnPc9RmtNwK1stwQY
         Jsx7XXRnhk6C5mQ9jTw5RboNB4higsW7c0F1HuaeZPTCaTdjtY3R4V+K7+KysIzkdj27
         0XuGEv7CgJ21CbJ9AhNl9A49Los6afD9v2IgckI0lgFJ5E1+v0rzd1bwrf/aPs16VOrY
         475v0VPp49d8KiURbla6ANCC2JIWJ7/gVEUG2XUk3sOD9fLBi9Si5IQtVkkJbLAR1T0L
         l8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166660; x=1689758660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMgaAHe76eIn3F9IB6JgFSErZkAha9wqjAecsB/W5Vk=;
        b=BXxbV+qZYgR32YEKyxwYN56Ohq5iw1Y1dzZNhF9c+LSQrHV02O0KEtOh28W4cwQLOD
         9h83OP45Bwop6IeufJM7uEToH4FyaU9JXn9XJ7jNArtVB+K1h10PUEO8z/OSiVnJ4o8R
         vDSIkJhOk8kguU55RQIYit0CxEabLh9A/mpKdEDVjNW0Q+B7MV3Me+D/FxIBENsXwmHS
         Hx73UvdJI6rhH4/WQuVFdokw6oAoHT6kWL+mikZzn83IVaa7KeRdrDxQcJNFy1tC3ucf
         K6mlpPPed7xkpMuw+Vyu96lgMEO8T3U9C3f9B0kc3TdqC3vU7hh6ObMSQFu2bt8unVTP
         ScGg==
X-Gm-Message-State: AC+VfDy9yNCJowkOIS8kN7D/TKkk6555YGP07b7qRXLF9kQlWkucLwPH
        Ky9HBogmhjimgCLVRJy7kv8XYw==
X-Google-Smtp-Source: ACHHUZ6Nn/68uiujSBlIeSENzRMSR5Q+y8Y7jbVXv2vkfmhUq7+1i9cbhugLNdmWErDKVc9aUsPEZw==
X-Received: by 2002:a7b:cb56:0:b0:3f7:e48b:974d with SMTP id v22-20020a7bcb56000000b003f7e48b974dmr10384783wmj.27.1687166660443;
        Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
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
Subject: [RESEND PATCH v2 07/14] net: stmmac: dwmac-qcom-ethqos: remove stray space
Date:   Mon, 19 Jun 2023 11:23:55 +0200
Message-Id: <20230619092402.195578-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
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

There's an unnecessary space in the rgmii_updatel() function, remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e3a9b785334d..ec3bbd199501 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -117,7 +117,7 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos,
 {
 	unsigned int temp;
 
-	temp =  rgmii_readl(ethqos, offset);
+	temp = rgmii_readl(ethqos, offset);
 	temp = (temp & ~(mask)) | val;
 	rgmii_writel(ethqos, temp, offset);
 }
-- 
2.39.2

