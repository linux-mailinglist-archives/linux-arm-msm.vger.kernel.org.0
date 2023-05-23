Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C311E70E3EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237601AbjEWQyb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 12:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237843AbjEWQya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 12:54:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D57F12B
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:28 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f3ba67864fso23913e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684860866; x=1687452866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Mp2PGSADJA3l2hmdB5CmSMXpf2sjt1FFtpKWE2fdw=;
        b=rFpyPZQonkYaEloY8NO7sEV7T11zG0SlowZyyNQlezcz6T81z/wHdDzfCOC/DpyrF6
         wBagIyzsqJdsotXxhel91F7IlmCBYH4uk88E2B27let/E2cHzcfiDRJZ2LbG3T1CQPDQ
         fBsPqNaYjlc3LW8h4gTJlWt17WKiIyCQiPk8jP4y4L47LDoMtkuszGI9v4IhJHjfAACI
         llOp0foGsoJvfe525pNPh2V91JEcwHdqUsYx+RdZ1CqLuuqFbQ9j8CmTiOJidxvetb3Z
         pjK1vn9agXhx8ccVFXWFOy42XKu+lGZ2kq0H1v0XbqQ/7IOu0vmvOW8XcHdRxxSKH6WY
         keUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860866; x=1687452866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Mp2PGSADJA3l2hmdB5CmSMXpf2sjt1FFtpKWE2fdw=;
        b=BbGOm9QFfvug+L5GlmbkOiMwD7mb6pByz5IbUCK/ke4nmcMdIqcojk7FSD77LM9G0n
         wH8TE1UG1C4Uhs3PIY5RzC9bI8fl5DRu7J7HBKEra4uCzK9Rd3csibGt8HTsuXH92OG0
         9lz99rVXBCK9yr95b7Z6e8YhYMY3sz5XtX8tZ0w2ENgneoGYyU9ssLwPrNqabqh/yzSw
         i+Vz8mjzA0Tzk6adIu9NVG3qxsAqXvyDRAhZ5VxfhtQFanclg0FoLqdMA8eYhzimTVtu
         IIg2vb2yjFPWNTRomrB95XkmlpHyq7QnfmM/i4OCG8vrowYYNqmPwFMbjXjz1zRBf9/n
         0kvQ==
X-Gm-Message-State: AC+VfDyfmvzW15UNQqe9wlzcMIA7MfCD1NwZdzCBCndC95iaRDtWb2ZN
        sI+6UVJypg6m3y5Cwsq9mIexHw==
X-Google-Smtp-Source: ACHHUZ6d4g3U/6Sl5sVHNycxTrsUDb7CtzZXlCR8Him8afEsuO/C1aZtL0XJEIpTyKQeFYEOIcE6eQ==
X-Received: by 2002:a05:651c:130d:b0:2af:18a9:7830 with SMTP id u13-20020a05651c130d00b002af18a97830mr5101987lja.4.1684860866325;
        Tue, 23 May 2023 09:54:26 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e84c2000000b002adbf24212esm1695245ljh.49.2023.05.23.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:54:25 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] arm64: defconfig: Build SM6115 display and GPU clock controller drivers
Date:   Tue, 23 May 2023 19:54:11 +0300
Message-Id: <20230523165411.1136102-6-vladimir.zapolskiy@linaro.org>
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Enable the clock controllers required for a good visual experience
on Qualcomm SM6115 platform boards.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[vzapolskiy: minimal changes to a commit message]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3ec556cdfac3..82aead857cb2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1179,6 +1179,7 @@ CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
@@ -1187,6 +1188,7 @@ CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
 CONFIG_SM_TCSRCC_8550=y
+CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_VIDEOCC_8250=y
-- 
2.33.0

