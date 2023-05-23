Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D2C70E31A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237368AbjEWQy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 12:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237842AbjEWQyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 12:54:25 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6A3FA
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af2fc4c4f3so200651fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860862; x=1687452862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THJ5ztg2jFio1DRAfxS6/8yUrlKpsUdUC0rnYiJCbSw=;
        b=cTqMRV+BAjzRYKc3iDM6EYBFODFZRDxrxBaf+x9Xd4HKeR4MVZtlh0jNv18V5lle0H
         78Nfte5LxoAcp7kb5Fk0to2p0OvbSbViegbd3SqBMNrAhTpz9KGv/k9GVvK9CZD9Ih3i
         ZHLrXkjxc2pUEIttkFxtGb/wPMdrLpYl9lP2Pr3vAXzRjzZWFQPUQ6fZQLZpf1nIBusz
         OM4dk5n/rouyzB8Y5kXtBSGL/t4I0BjRH0MT+/pZ1/k+GPL6U+AlOL7gZfCDR4dt8bJ9
         aFF40MIAh1WUa6IoaIz9xxUekzSxqJ88lgPWNYKhsoXpeFKqXi1GStY9VU3xXNQX8Ky9
         0Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860862; x=1687452862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THJ5ztg2jFio1DRAfxS6/8yUrlKpsUdUC0rnYiJCbSw=;
        b=IiTCpQ0Rqn6xfULpDupn3yqUPX/Dbb/5eYqhHDvoQqG9yuC9Zn+rmtEN+y9SY6jXGi
         gPyDnLA+0mPcEQ3pQGb8wy+ye2BbpFiLLL8TOrL5iWxJtwps3p9eQOFvYOGDWcJuGoTY
         iYan7fyOxQKF2LGd0jlSCKRfDMsb/ZFyBvrU3UYapHM1MwtoJMfpf00ZC5WO9HU5tS59
         +AjeJWoxQ3qARY184bZmEPm5Ri6FTp9HJ03plMM7b9RUEmSwE9uDIwss/PoOWsgKbSvF
         2+V3RYFTAC4xebYBIANu97hN050J4+vF43UCX5ky0V4Iw1Ekx3WcgOlzyW101re2eoZB
         GWJg==
X-Gm-Message-State: AC+VfDyETu3Q4lg+If41oE6OwxQWHjj5HiNyUAoR4TjlGWCQebN6V1Y4
        eEarD6kg+g2UhDSY4I3u1qU3cg==
X-Google-Smtp-Source: ACHHUZ7Q0AXwsV10lR/za1SW1Jm++MR6lAkErYKOI6innq/AVysbYHqpxIY10DNZy2nrHlkVLDbnyw==
X-Received: by 2002:a2e:b5ae:0:b0:2b0:2214:f806 with SMTP id f14-20020a2eb5ae000000b002b02214f806mr2438325ljn.5.1684860862082;
        Tue, 23 May 2023 09:54:22 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e84c2000000b002adbf24212esm1695245ljh.49.2023.05.23.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:21 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/5] arm64: defconfig: Build MSM power manager driver
Date:   Tue, 23 May 2023 19:54:07 +0300
Message-Id: <20230523165411.1136102-2-vladimir.zapolskiy@linaro.org>
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

Build Qualcomm MSM Power Manager driver, which is needed for QCM2290
platform, otherwise the TLMM pin controller driver probe fails on boot.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 72136a45c634..40100b9dd6e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1323,6 +1323,7 @@ CONFIG_PWM_TEGRA=m
 CONFIG_PWM_VISCONTI=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_QCOM_PDC=y
+CONFIG_QCOM_MPM=y
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
-- 
2.33.0

