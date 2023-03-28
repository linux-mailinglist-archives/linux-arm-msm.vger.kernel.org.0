Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F896CCAB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 21:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjC1Tgt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 15:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjC1Tgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 15:36:47 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5046BE9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 12:36:45 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so4809889wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680032204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDi0sPSTLB7eAuIgWAobS9FE/uMoxKTeXL5+WCsqXmk=;
        b=pAE/Anb4jFNCU0zI5aj4Mfm2iU/Z7FnB4DYmMXvDmdmyiMf9Qn4ZBBTpWyncIA3SfS
         43Ispb70wyVjSu7L+eA7Iuza0GXA03kZGHWuLNfIBuX8kMhsqwUbwaFq82mUStZIIY4O
         fecJSxQ34AVdEQgF67ZzlhAHtKpRfc5fBsGXAlzA6+x19K6jDqS7ya+GxWzdEEpbNhDz
         fkSzSJKq6jAevPF5ffIm8A8nxp0X+5n+A3GLid8wJh9H7Dz1gYaHfS1CAtep4SWWq93K
         vr1sz2HjPeU84WZjR/Quzo6TKbwhHTbqKXh1zz3kjKJUMUhMqtdnNq8aJnHBql77QHE4
         x74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680032204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDi0sPSTLB7eAuIgWAobS9FE/uMoxKTeXL5+WCsqXmk=;
        b=uYu/xmbo1OPHQJ8j6CxUrsOdupTsKbTYpThc2hCNOk6K8ZRtD+gqno2Yl0JYOWM6Wa
         3mwGsQ2LfL1MR8SEHzldhHGcist7RTG21yofe5Em85VrvwsFhUqzEwc4DJor2K74fhLW
         Q86xl+KpQ2opj4Islzan7sbbmEYnClC9AyaORDs9EK1/in5V7dmQVNR75gI9FgujoI+8
         eO/cZVUu0HBZGt6L+7tmBDFwMsINHoj7hBcDXX1m28er4M3vtoluIkDBPOdUynEvbe3K
         HnUECbUpoeJUQ9KZ9QD4ZpQ+pLO3HadwGiX+2bBCDFny4rJog+TnlPXhCBHedLg49EbS
         b/sg==
X-Gm-Message-State: AO0yUKXHfy++zyPXVHz3JC3m3yT7X5U7Gf8QzA2M3n4qGZ25Zlizmczm
        fZs4G56bfyffcIf/27Rkh/HPGA==
X-Google-Smtp-Source: AK7set8Wd12xTw8Uw2pNxpWv2ZIHiOMK3NQRpNv6gyaRe3GY5utq1XGMTUhwO7Kg9/gsp87NhnJlRw==
X-Received: by 2002:a1c:f013:0:b0:3ed:ac66:9445 with SMTP id a19-20020a1cf013000000b003edac669445mr13661092wmb.8.1680032203957;
        Tue, 28 Mar 2023 12:36:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7b39:552d:b2f1:d7e8])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003eb5ce1b734sm18060544wmk.7.2023.03.28.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:36:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 3/7] arm64: defconfig: enable the SA8775P GPUCC driver
Date:   Tue, 28 Mar 2023 21:36:28 +0200
Message-Id: <20230328193632.226095-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230328193632.226095-1-brgl@bgdev.pl>
References: <20230328193632.226095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the GPUCC module for SA8775P platforms in the arm64 defconfig.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d206a9120ee4..fa0a145defe2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1161,6 +1161,7 @@ CONFIG_MSM_MMCC_8998=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
+CONFIG_SA_GPUCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
 CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
-- 
2.37.2

