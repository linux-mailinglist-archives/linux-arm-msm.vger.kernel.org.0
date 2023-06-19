Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E284E734FCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjFSJYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbjFSJYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:24:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC3F137
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30fbf253dc7so2307226f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166659; x=1689758659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
        b=kyHT8TL+2GSjjQREnvB3sDGmITerXPnmzkNogrnyC+QjJOC6XyLg2cdclezHjWaXPH
         zfGTSZePqXBZcCL5FKoRCWQsiHOxWONCURN9XFcfwFtqHLxK0VGUv47VJ/iKqP8ivnUT
         +0qyHmkDi8Ja6fQ+JssQeGdFGfISfMn2BCpDgdTrg6ogiAmIqnVsSn4odIrAeGc7XsIE
         UXGFFyF43iaDeIM/9rgTPFr5eN9CQwYmiTll65ySroOyumfs++eBFi/EYb5rTIQ+Napk
         IvKkDERUvy0JAY9sWgZUu3b1zF/YjGTGMOb6738nk6iU0q6Tj49q7Wz5E89jPFwxkD/Y
         5RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166659; x=1689758659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
        b=BKlhqFJK5TdlXUH0I4T96dxloooYhqTtGX7htxmv+/6hRt+a6EDu9j2qp06oq42NmB
         WV0R4mA2DqQuYyA0w4khN2RfstX+28WblSOQsD2X2RNrnN7wLMpdwsi0C35XPJnBOILW
         bYmJo2ocohlpH2eUpkEfWy/beV1X2yAtFz1BhTSFXsYqMySUbylZsrzqN41ZWvfDwIVK
         fYyZhncPQarDWkSfL0oD4Sl/5b59t3ooITuafzUvZLNbp//gHHhr8cpe643p2N5lpeoi
         TeRlxUnXIWhJ8cYnXd/B0/MxkzklUgIpokbCn1LIIss5Wd56xQU0hhlbMqvQGkD65zuj
         eQIA==
X-Gm-Message-State: AC+VfDxVh9KIudTeNowmdZN12dAmqR+aIBI+vxTxpo5KwycjnOulJD1v
        fyZ43FIfHb41irWpMGfLWOOw5Q==
X-Google-Smtp-Source: ACHHUZ4CVUlTIzAxN+LAPNfnxBCniWd6XVG9x7Oys2PrG/4EHzRom2BdwYzcTsWwhaF6q/GoKdWTkA==
X-Received: by 2002:adf:ce84:0:b0:30e:5bf2:ef1b with SMTP id r4-20020adfce84000000b0030e5bf2ef1bmr12363169wrn.25.1687166659271;
        Mon, 19 Jun 2023 02:24:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:24:18 -0700 (PDT)
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
Subject: [RESEND PATCH v2 06/14] net: stmmac: dwmac-qcom-ethqos: add a newline between headers
Date:   Mon, 19 Jun 2023 11:23:54 +0200
Message-Id: <20230619092402.195578-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
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

Typically we use a newline between global and local headers so add it
here as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b66d64d138cb..e3a9b785334d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/property.h>
+
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-- 
2.39.2

