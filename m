Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1A96F9903
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 16:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjEGOsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 10:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjEGOsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 10:48:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA73918143
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 07:48:21 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so5421053a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683470900; x=1686062900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNL3G/zxSdZ+IvZ1XOfmqIgPpnWosZByJqwjHAEj6R4=;
        b=kP5r1EYAU+Scv98scofN1apJWRF5MqDhL5gWvbtaCxQdQeXv2g0RbB/tDd3IgrjHBS
         A7DtU7kEPnIw9gSV0X/oCzGGxq2Y85xjBka/zC5nthJ54wq9/IdE5dlCUswDoyoKebln
         ypTwJ13SnJlbAHZZTkf6+1VJTa/8beRpZd2P9dR+1Rbbr6jQLyxiciiGOJMjUCJze6i0
         ruNEKncCHZDzGsy2rDT9r1wygasmtBozUEHBVjJR2DdZGHcQBTvqsc5CdfR/uZRvVZ2A
         WzsADWwRBKvK0gzEQqYnxpd6LOUETYVfrK4Hwr24d4fZqkS85LEv2jqkpkxTdTuGkKOX
         TSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683470900; x=1686062900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNL3G/zxSdZ+IvZ1XOfmqIgPpnWosZByJqwjHAEj6R4=;
        b=Bfl7iBJNBn7bsZ1VAlRhQT1Wtn07X8psmhY9O3gMqGDUGV9+E+CuhJNEp+r3qyHFH7
         ef5e05Fk6+haaWmj09lacKMTffE1tmncSDjRrK46FPO1l/pUKVrqJDLDio2a/S62Q/G9
         5m4XDOuTGDGSODCXs2vzTWV9ys8qn8NLQBBMWqO1+ZbrpM0kuhxrydJCwpOJW3IYTXrf
         yrgqryfqYz7PqLzJKH3RWg7fnw2vFMiAGmZCoVbP96cMiJEZwIj4i9n1ayI4+R1iwIGS
         f9sch0ZJ8e0YzMuyGoxdCoDASD8h3/UQ1tvoZ6bn9r4EpyWHhddf42ycW42B175N2trM
         zOnw==
X-Gm-Message-State: AC+VfDx/xr9RgdtjklB4Xd2amCtXlsLnyy5HgvfoaPMdJ6CoeAxeYOg+
        GLlJz0i953TFF54UdOAdBVcsYA==
X-Google-Smtp-Source: ACHHUZ412dZZ69NMaMdAVVC/Kr8y7ymxj5N27OqooAVSH+e0ZyzqbU3bA+hcjnoiYD9ORaKf7TaPLQ==
X-Received: by 2002:aa7:d901:0:b0:50b:d1a6:116a with SMTP id a1-20020aa7d901000000b0050bd1a6116amr6338818edr.32.1683470900249;
        Sun, 07 May 2023 07:48:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id y21-20020aa7ccd5000000b00506a09795e6sm5026724edt.26.2023.05.07.07.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 07:48:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] phy: qcom-snps: correct struct qcom_snps_hsphy kerneldoc
Date:   Sun,  7 May 2023 16:48:18 +0200
Message-Id: <20230507144818.193039-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update kerneldoc of struct qcom_snps_hsphy to fix:

  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:135: warning: Function parameter or member 'update_seq_cfg' not described in 'qcom_snps_hsphy'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index a59063596214..6c237f3cc66d 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -115,11 +115,11 @@ struct phy_override_seq {
  *
  * @cfg_ahb_clk: AHB2PHY interface clock
  * @ref_clk: phy reference clock
- * @iface_clk: phy interface clock
  * @phy_reset: phy reset control
  * @vregs: regulator supplies bulk data
  * @phy_initialized: if PHY has been initialized correctly
  * @mode: contains the current mode the PHY is in
+ * @update_seq_cfg: tuning parameters for phy init
  */
 struct qcom_snps_hsphy {
 	struct phy *phy;
-- 
2.34.1

