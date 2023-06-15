Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71EBE73187F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344680AbjFOMPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344761AbjFOMOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:14:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346462736
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:48 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f739ec88b2so15928005e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831286; x=1689423286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
        b=H2PTh4hD9hzbycE5igomrrO0DCv84czKWu9BdxtjyDf6LSzC48IU4LSjyvYlAgB8nt
         jNpjXeMumj8pFyWnMh0IldN/tcmk/RBW7X/oAbEjT5pHbowgacjdTyikRxoqYb/fN4C0
         arIdhnzIjcn+mByXIb+/knuZZ5BRjT6+YbTRmovjHKlg1gmvOmEkzkBTGV7CsOjZbMoi
         IkbAMBaShTFb6BN0Mgu9ccN6nDsZFfr4ZUeDKfws4BZZJbGyf/GrbDS41qv7hZIp9caW
         GGj+yG4g8SfHbqd9po7aVCM6vChyNGXDXkNcvDjxKScxrOgS7Vpim+2KqOL1bfg5tDPJ
         1Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831286; x=1689423286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1Ok1IYka1vb/vM8tvKH2bExKZHEfvi4JId7lcZB7pk=;
        b=ee0151hmCKSNR+mQmMqbi0cQsS01CeM3CH+96ZzV1qmoMA8olHUlKMGwXav0YCw4Ud
         jckBZjQZvIH0UmzeszzXy9u1mFjXUCPKI7JrV3JemHWDmBfUWozEGAieESdEowfIHWi8
         NxZkCtSmRNWISgXhvW3I62Fnvyyh+OSGmI0YE0idIIgg9P91eII5utjKlN9FmpMDosWy
         OZ6Wz1AXw6RBoytD1g5S2vvDmRUxr36dHN5i3zOHEJrfeKeRPbd+3Bt+dczF0Criu159
         /oBKFe5AO74YvMEpkrB/rP1GxffsgvJM+4QDXPpAlSvMSnt/yLo3AscHhXw5OmmlVzGt
         AOBQ==
X-Gm-Message-State: AC+VfDxBiGjebhBC1HbFXTILY3WZNyde7fHEEzGzcxpY+aZLAZJ3XSx/
        J2S/pZtcBpsmpI/rAcfgWG+zTg==
X-Google-Smtp-Source: ACHHUZ4r1A3qaTK5WSf+N6NhTfrUIoixv+YgCS9FosZwGOvt8xYnavFbEe9tPLw5/qL92M2SWSYV4Q==
X-Received: by 2002:adf:ec0f:0:b0:30f:cc8f:e48c with SMTP id x15-20020adfec0f000000b0030fcc8fe48cmr4937374wrn.25.1686831286752;
        Thu, 15 Jun 2023 05:14:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:46 -0700 (PDT)
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
Subject: [PATCH v2 10/23] net: stmmac: dwmac-qcom-ethqos: add a newline between headers
Date:   Thu, 15 Jun 2023 14:14:06 +0200
Message-Id: <20230615121419.175862-11-brgl@bgdev.pl>
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

