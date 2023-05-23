Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C85570E3CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237841AbjEWQy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 12:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjEWQy0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 12:54:26 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AA811A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b035e94072so137531fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860863; x=1687452863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiMHVhOA3gXdeyzBMfPoztwVdX9XzYvV+8xNN+txWHs=;
        b=iffZIwm0jFVV2fTqOfdSWIcsHblM3kvWZ6xE1FVE4Tzu6avHR+4nlV9gDritbhtHeW
         K2Bt9y3daVIc2jzb2ZxBCKJ/iIHULVlXS303Mq5xJ3O6iWpyDvqm/UBMI18++hzvE/28
         UcXWDt2zscIF7d1SFyM85sBguwm4I3EEVAc2j/u3WHQnltXUh/zSl9xz6zrGF5feUO7i
         YhMvMidR8ZBRGYaKgXmMhJlyM8PVGhJo6daql3hOSgU9uz0Oa99GtjmNjVRlh4I1M57L
         nNFTUGGC1W4WQB87Qd/dLHYzfO4wTIDnZx/Tqy9NqA7PRloW3AxQrVaxYycQajyx8W1i
         bOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860863; x=1687452863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiMHVhOA3gXdeyzBMfPoztwVdX9XzYvV+8xNN+txWHs=;
        b=EWN8KUXvwVk3QJjetFsQ3mNAiNCgZdlamM2RnLPvBq9L6fj0d/4BsDMC3iY+4rEjVI
         FyxOHN95dCw9Bk/raMrmceRQKEmxnLqtrlY96OQJ3evN86JqdeRYgUdZsGJp59UPQqSk
         OCB3I+uR3UGmT+zkNx76AyB8y3R93DnqApbKDAaNH4czErhiX1tKNJwByiusp9aSxxgs
         aLTRRVzxytGL+2XQ48fD9hrHlAAhBKa0m4k0rVSTxZdPnXK6dXE+QHydV5GKQUllrWyE
         h/PAzw0x6LKXJJZKBFVDBfVOzLXSla0reinv3k0nPF7xh1K550cM4qor2v23e1OcPpky
         ebWA==
X-Gm-Message-State: AC+VfDzmKqZeqFHW31IosKI359QkSyZqUzwVJS8lH1aIF3GmyVn3cx6m
        8aLao0+yzjacwrjypMqn8uRJ5w==
X-Google-Smtp-Source: ACHHUZ6EHoofibIbuh7rP2CQsBnM9PTYj7k8szAmxT1sgWdI5PDEBzotfQ4fn15IEHXSSCtbSdqrKA==
X-Received: by 2002:a2e:b62c:0:b0:2af:1ce9:41ac with SMTP id s12-20020a2eb62c000000b002af1ce941acmr5586565ljn.4.1684860863205;
        Tue, 23 May 2023 09:54:23 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e84c2000000b002adbf24212esm1695245ljh.49.2023.05.23.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:22 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] arm64: defconfig: Build Global Clock Controller driver for QCM2290
Date:   Tue, 23 May 2023 19:54:08 +0300
Message-Id: <20230523165411.1136102-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
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

Build Qualcomm QCM2290 GCC driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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

