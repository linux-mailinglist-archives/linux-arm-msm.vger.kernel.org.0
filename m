Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A705B7194DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbjFAH71 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjFAH7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:59:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0C9184
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:56:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f3ba67864fso39217e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685606215; x=1688198215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNenXmrEWpSyU7L/Qf5VFczOIRmwyNrUBg/6pwSiU8c=;
        b=n8OuVtlt2mpio/QtPfpn1La3c1ofLcjBBe9rAPIgJR2RVRK37KfPxjgJwF9+LldrXC
         t7NgRb7c+nAMU4gCxxWUU7OvyNe3K3EIpEluALCczhohFyz82KxYLE6MNOHyYYpHT07g
         7YsIslbJaa/LFXJroVJbsIBcvSJSE/fKYAyiWDvDN11zhI2idB8EdS2UhEtxgwazAEhA
         gtL2HHoLPJXAJu9jkFe5dGGKUSNIoR/hAoXEXKH95NYhYWzz3upKFRIVfHmyjvTZC+au
         wy9yG4o7rhWdsWOuP8ccPw6XOPIcLGscu4U79x+kifIePW4LGxTMjrUuKSv07qWgcBFG
         Qnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606215; x=1688198215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNenXmrEWpSyU7L/Qf5VFczOIRmwyNrUBg/6pwSiU8c=;
        b=J0iCeXL/WO6OjVVEKiCN/TGNIs1xnF3vQOxedtfAcPm76SE1dP1+qkXrCW4Cpw7pTA
         KiKrlQz/ORNMb+kp6SkVzmNiYHtlg4HKLaagGgcT1g1YeCE5/UIIY9shZRvdnBcRPN3m
         jHvPrr8e2YzO1OF8hjAGNvt8w5Ywj7PGeafqYj+myceCQL3DeEMSP8nzL3vO1Are5iPl
         vx93psnCxwD2HuLBiyQR7ZeZfwsGIPfbEDzf/7J3j6i+Y8cmEZuMfomdAdSkE/ltbFBe
         nZoZ54OehlQolhNR06ueRrbiK4768/9VHl9FcYAT4Y9XbIFO2Vdu9JrWlNwyHfT0gBU3
         l3bA==
X-Gm-Message-State: AC+VfDwoDz6JAY70O67OTxC3lOsA94J9ySdZCfpJEw9Y+4IEiql7N3tp
        RtkfSrNBuTwtZ4tSaOFxkCB1Rw==
X-Google-Smtp-Source: ACHHUZ4NlPShJyBrb3Y3k8T3VcseAEIkH3iKRAKfgvhVRm4JwYeG8INxjLy9GnO3enW/jK6RRtIWIA==
X-Received: by 2002:ac2:5983:0:b0:4f1:45b7:2e5b with SMTP id w3-20020ac25983000000b004f145b72e5bmr1485798lfn.3.1685606215555;
        Thu, 01 Jun 2023 00:56:55 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004f60a2429d4sm27160lfo.78.2023.06.01.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:56:55 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: defconfig: Build Global Clock Controller driver for QCM2290
Date:   Thu,  1 Jun 2023 10:56:47 +0300
Message-Id: <20230601075650.1437184-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
References: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build Qualcomm QCM2290 GCC driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 40100b9dd6e0..e2f6a352a0ad 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1163,6 +1163,7 @@ CONFIG_MSM_MMCC_8994=m
 CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_MMCC_8998=m
 CONFIG_MSM_GCC_8998=y
+CONFIG_QCM_GCC_2290=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
-- 
2.33.0

