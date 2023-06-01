Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B12D7194DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjFAH70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjFAH7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:59:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBF4C0
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:56:56 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f14e14dc00so72742e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685606214; x=1688198214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qC3J75w2ZTzDXSdgHfhWOpwc3xjdszVXeko4YRyhUg=;
        b=Gd+8W6zWq567D7cWel10q99OE8oV+rCC+p/gpUo4xqe3zNK4rPz2+NyjyzYMJ8o8n2
         05FMLDSZAVq/3qTeSBVNiysXnLpbJif1huUb1vXNeihJbh3qBER2BOuz0UIAPhcwo6DQ
         iMevDMvBvnRVKZXp3V8gIY/xdqS/M/LD7etFhnf6h2KSB3l/ffQ8xggQBKrtSa/e2j0h
         UxGMG8avatWQmKbvOA8TnFzu2YD4yKBrN9V3NF+eShGBlxGSE1zPqcXuh5dkbvHFfsJN
         zr94SD/g/hRxlyqQazLPoG/x4KmeES3qGxStHOPBKL89i6M553kBqDF4DYcUl9Xatmwu
         NUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606214; x=1688198214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qC3J75w2ZTzDXSdgHfhWOpwc3xjdszVXeko4YRyhUg=;
        b=ek8oIfy2fcY3mIhmoKeH1M08TD52FLQM7Aj7c4MCuBUsK9MQlZmgtnSivlOFSLCajt
         Zj4dAvds4AmKAXqYHmfqEQu8Nfvgpiexl8ZPWfwDeA/FquDCJJzCa5pEwDJb2popElt0
         +3U5pTa3EuLE3eOBgn9ASMyagj/53irP1ujGJyACWQguHxaMCzAYXxbDpjRLov3cFNWw
         2sGf16Ga3vUyyMKWRiSEuB1AfxWRJqfxrtm8LsNqlSS6BoBbEq/ZDvl6yhTVWqhza3q6
         bD5rgIzpTBUgR/xftzVv6dQ4vwzcECzNKdCKQu/T2fwEd34w3iHYnd2FZ8bJPWyulfhV
         64PQ==
X-Gm-Message-State: AC+VfDzwg6ovW9yEiV0MUwqWxG5ntCJ6Nniwjg2BOfK2jd2fFW/DMWN3
        HsHPWi6tyjpgXGW5Z+Jhz9qAVA==
X-Google-Smtp-Source: ACHHUZ7msy8EoYjEC3r4bay3iCGbT6ljq3voF9j6tAyB8m55o9nytSzDQwnC6h7aFKZiKzlyWvZSbw==
X-Received: by 2002:ac2:55b0:0:b0:4f6:949:8434 with SMTP id y16-20020ac255b0000000b004f609498434mr223257lfg.0.1685606214509;
        Thu, 01 Jun 2023 00:56:54 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004f60a2429d4sm27160lfo.78.2023.06.01.00.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:56:53 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: defconfig: Build MSM power manager driver
Date:   Thu,  1 Jun 2023 10:56:46 +0300
Message-Id: <20230601075650.1437184-2-vladimir.zapolskiy@linaro.org>
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

Build Qualcomm MSM Power Manager driver, which is needed for QCM2290
platform, otherwise the TLMM pin controller driver probe fails on boot.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

