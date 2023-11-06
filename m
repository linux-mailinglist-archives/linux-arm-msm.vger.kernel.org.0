Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C617E1B3D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 08:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjKFHa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 02:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjKFHa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 02:30:57 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4095013E
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 23:30:54 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso628315666b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Nov 2023 23:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699255853; x=1699860653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhWQlj7dMxOxmAgKuFEWOImMyBvdbMIiMhZ2hJo5A1E=;
        b=Nw7aPyHatHDblLBkHofm0UJ/dyfMx2c5x93HT2NWEGVNwrRa/uS5aWnsB48nYySmiO
         vU1lQCKJ3BfOj3V/8o/gEKe5ewoYibcoqd1ypz2D6uJoALIf1MKAsJjZXBg1I8VKeG24
         qIDNZ5B5sBJHjkJ3q2Ee9uDt7Adao+MTW5RKgwEYaWT4QbE+n2DYHg2YJE2+OlLUSE4w
         Rozm6MStjh6DpL4rZP07W7vR8OcL9cj0VLkJDIORi6kr08BrJVLiN9RrpMG7b/Um6Tp9
         w/q7FJCQKW354NdE8WOEu4+ZCa4F6mmRTEg0ulahlvETIsvlih24MH9Gn42t8nbUhKGe
         B/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699255853; x=1699860653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhWQlj7dMxOxmAgKuFEWOImMyBvdbMIiMhZ2hJo5A1E=;
        b=kGxWEb6bkW863vmCeTodcCoBEwITlBbGw6ag0sanV0gOZa7DCxBukP7vGDszRLdiAV
         W4HcHAq3Fc68D9jntP/EgLzRcOxP333HTuTq3mGL2Toy1vVbXAqTf8xyxa8ZLco7UrTp
         gVHH4/Zzb8GwHrhBqrI0TGQJRe83ta1wTLSUQZGgDtFMmoTMyLHsQyFJPGVOei7tAphJ
         jEk8HWSZN1P214sMKz9iNKj/oxCj6nQWMm3v9R/cC78t4KFjKsiJKY80AI5FFacMv3qW
         IcbO7vxPLUkohWnQAjvaeoG1qM4K23yPDKTNlXoK91CzhpWDKXv0dzrEMFrdfZd1K0Le
         0JEA==
X-Gm-Message-State: AOJu0YxjTin0DHBS6Zx/LfOtLi9TnlNICHQaLr2gjn/kKLzhS6Du+i1S
        lDUF1NykVuHmaEOhYbJIy0NdiQ==
X-Google-Smtp-Source: AGHT+IFYl6VmuUwNkL8mBs4g2aCixpt4c9UP10t1sF7BbMUAC206+MrziB2hTweBEhNmqtAvZDYC9w==
X-Received: by 2002:a17:907:6d24:b0:9c3:d356:ad0c with SMTP id sa36-20020a1709076d2400b009c3d356ad0cmr11909444ejc.24.1699255852762;
        Sun, 05 Nov 2023 23:30:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090655cf00b0099bc2d1429csm3845993ejp.72.2023.11.05.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 23:30:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND] arm64: defconfig: enable newer Qualcomm sound drivers
Date:   Mon,  6 Nov 2023 08:30:48 +0100
Message-Id: <20231106073048.24553-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the sound machine driver for Qualcomm SC8280xp soundcard (used on
Lenovo Thinkpad X13s laptop), Qualcomm WSA883x (speakers on X13s) and
Qualcomm WSA884x (speakers on boards with Qualcomm SM8550 like QRD8550).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Resending with corrected recipients.

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b60aa1f89343..a8f8c9cecf74 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -920,6 +920,7 @@ CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_MSM8996=m
 CONFIG_SND_SOC_SDM845=m
 CONFIG_SND_SOC_SM8250=m
+CONFIG_SND_SOC_SC8280XP=m
 CONFIG_SND_SOC_SC7180=m
 CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_ROCKCHIP=m
@@ -977,6 +978,8 @@ CONFIG_SND_SOC_WM8960=m
 CONFIG_SND_SOC_WM8962=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
+CONFIG_SND_SOC_WSA883X=m
+CONFIG_SND_SOC_WSA884X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
-- 
2.34.1

