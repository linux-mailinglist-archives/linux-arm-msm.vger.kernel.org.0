Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB28573188A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344760AbjFOMPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344754AbjFOMOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:14:54 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED152726
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:47 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f8c74af64fso17305665e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831285; x=1689423285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s2NJclKWNK/7cl/j+crrrKprFB1owa3fhzvvYgN/iA=;
        b=lGAO4cZ33L5Jbp2mlY4NQJspQLvhSXiQm08SD4SEX4OLoRpVmGWA61a79P1eOvagch
         inxFGMFi3C+JKEntWs2sfLwP591k2BS7aFfwjhimGYlEoOtJKA8InvVW1H3f0CY56q05
         q3HqoJWweDF05uYfrT1VW3K2S9shFYBKCpZgwES6T5GVZAtl8+DLIoRLcvfBGhbghnud
         xk626rmFw4jjIkz72ospjVlFAAcmvaC6zrHz2tIyC6nDl9A1LLJmQKhqxN3yO13Nfso0
         Eui02VQbKZtH6ko2/q9n5QAdIg7FqPdah3dcTdYIBUFWDXT+PBMUx01J7xEOIVqnnrsm
         jg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831285; x=1689423285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2s2NJclKWNK/7cl/j+crrrKprFB1owa3fhzvvYgN/iA=;
        b=V5e8wUQWzQBpnSE1E6uOwEtwCq7m0wdMj9sLxLA14wS5fAG6aE3GnYQrlA5hGljYOc
         4yxX1Zkj/YMH//eNA6GzwS8U2FC9SW+tFDhZEiUiTT3OXsMxCyfBw5SYNxHi3ol8dYi6
         pcozdwOA3p/gaT6afdRRScIshxQ2RGQehTw57Jq1+adJROgbvnCEPFH40Afr5ARDYJQm
         l3vLjE8vCXQihOY3CCfqJTPVoQLS3XyZpzlGnuukyQsBAYpcUYmcl3Qi2+VgDIRH5lQq
         +3xrKezgtxFxOA/pEHigq7W6rBuerEUQzBSmaRNG7X2NfKvooDYuNwv49H8ldHxu7sOr
         s9gQ==
X-Gm-Message-State: AC+VfDxRDKoDQYxD2r6g+K+i+zHj4IfcvdZOAIxyEa4MXtdnYhslgo48
        9DNQ0ZcelFKk2YAGVSE7wj61Gw==
X-Google-Smtp-Source: ACHHUZ4WICs2fqca+psah+Z2d7TrVZS4kdor2VF0fgiRWgR85G93s3CfhbpBS4eHOOL3RnM3K9lIAw==
X-Received: by 2002:adf:dc42:0:b0:306:28f4:963c with SMTP id m2-20020adfdc42000000b0030628f4963cmr11134252wrj.23.1686831285209;
        Thu, 15 Jun 2023 05:14:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:44 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v2 09/23] net: stmmac: dwmac-qcom-ethqos: add missing include
Date:   Thu, 15 Jun 2023 14:14:05 +0200
Message-Id: <20230615121419.175862-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
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

device_get_phy_mode() is declared in linux/property.h but this header
is not included.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f0776ddea3ab..b66d64d138cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -6,6 +6,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-- 
2.39.2

