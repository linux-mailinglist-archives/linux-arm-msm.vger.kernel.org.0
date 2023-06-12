Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A637772BC89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbjFLJbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjFLJ3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:29:52 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DD7210C
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:41 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f7378a74faso29363125e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561880; x=1689153880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Qql4lmrRc6orjCzbHdO+X/jI0p6UbXCT7w4xaPn70=;
        b=r3C+LN0I7FtVIMevczG2G4gXnrbL8tV0VWh6EO722HqR8GSaE0sIdbfNRfxVxFLZ5B
         KBIgDCk8KbY3A1fU3rbQm5hg/qG9fiu/Qh5osa9r5C1dsQA0Xew8j5mZNyLKuBNimXuJ
         6e0x0WmGekpMepRjwxkoNwMoSWLpFysA/e7TXwQ9HxvqKKEmDAkTMxo6WGY5DU3VlT33
         NHaWsB9EL8reOpnI+0F5kohXV0fYBfz9i83cHE6asArFI1iLJgt+h16f1Yd5ENreccvG
         guXlbNPG/FuHocWDWvE5pg2eRqhyFAu+oxb9QULwsW/TV/ONDHrPilSk3mWzsETb+yPC
         RCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561880; x=1689153880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6Qql4lmrRc6orjCzbHdO+X/jI0p6UbXCT7w4xaPn70=;
        b=A5Sgiq8sGtSei+b4ieeuS+4mbZkPPirGuIP3kJIYD9xABghoW7X6R5M1XA7tke6/09
         gJ+jjcgX9gjkgNwbfFJGT5nsGk2SCQ9lnAc2uHsmpBzvIgwjPeQq7qAsTDGjNZmO+CFu
         pQKRiUHWhPGKn0oIK2oPdySowoOMBuJqKn0DT85z+7irrnuFWLbKAnxgkLX8zM4NWsa0
         32dft2mz1U31TBUFIMiC4qqVfcfJwNYNDk4K/T6AZfKLhFx7yNGkObXom/+q4mVupj7o
         6dhknMtMLvGjlc3v6YkQ1mHKvyjdoQIVIRGDATsINYYXaFyZUaOCRbOdL54XqbdB3Ov1
         JWDA==
X-Gm-Message-State: AC+VfDxLOnatWSfIUT6JAZA1/MQFrUtyBKSy9owG4KdT0MvHWNox+d3z
        ALhtlTYPyX+TOMe3TcGrR6HO6w==
X-Google-Smtp-Source: ACHHUZ4pVmMwHGX7bNbtVfB97Jl65MLcpOZps2ubdvFDgRPuGgLyhLlZQF10mQYnesEmUQW2Dqf8YA==
X-Received: by 2002:a1c:7c19:0:b0:3f5:ff24:27de with SMTP id x25-20020a1c7c19000000b003f5ff2427demr5380405wmc.32.1686561880266;
        Mon, 12 Jun 2023 02:24:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:39 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 10/26] net: stmmac: dwmac-qcom-ethqos: add a newline between headers
Date:   Mon, 12 Jun 2023 11:23:39 +0200
Message-Id: <20230612092355.87937-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
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
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ecb94e5388c7..5b56abacbf6b 100644
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

