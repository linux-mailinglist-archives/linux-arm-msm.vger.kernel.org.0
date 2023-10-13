Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE5D7C84FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 13:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbjJMLuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 07:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbjJMLti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 07:49:38 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE26127
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:49:09 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405524e6769so12850425e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697197748; x=1697802548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE/p2CAXymaVYCSJyW/v/kTP5stsCvV8KjJ1np5Cumk=;
        b=Be4Ywpk2wBnM9Llf72gBNK9yeikzw3ibCxGTVUaNkJefkYLZOect5uTT8HlhvzL18C
         MQZ1YT+pDkhVD4Je0e66cN2f2L+dZHfW+ArNcK0IKGLlqd4mZW0v4fL+LyPCdVYlI4cN
         gMjVvVbItaSDLThKd9Ly69ZeE8O2AfEC7Mgy4/JF5nB/z8DA71WAdoAl/BH+DI1t4BXz
         JgdTwyC11gvRFuWq3AchwQjICN8Ozp0SeZl4gTFaXw7d4xFhAD6QENLtPbWUpg923QEK
         ixKyoAaCcHbq7VNLztyo5cYHkGGi5JVJQbgZGDhmCtd2cf4f3+65+pIW9JBedYxW16y8
         fhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197748; x=1697802548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE/p2CAXymaVYCSJyW/v/kTP5stsCvV8KjJ1np5Cumk=;
        b=VMZWW6svkL7skhZMXngVExlocd6SQGb7XULMu4QctZoXcME4S2uPS4PYxAcvZUWSAN
         oT91szmGmv8kEzkHjkXb20uD04+4RiMIWI6CUPzVjvo/a/LzE8XuRrDKrkGmNlgbLRV/
         AgRx2EnZ8F6DNQe1/VsXNqIZzdpCRxBUC+siejAgfXcvD9mN5Yuz+MnLQsHGwJ9D7/Yu
         t6LYnOh2CpUcY7GNxRnSMvEkSKiAI7ZDeF2QSBZTXMInctm11N4LGWOFAhn8XG3WJrsc
         /2p/+IIsT2c7SDfGuiAiHnn7t9V3bbZ0ubEAcciJQU0eBTJHFvPuqY/YUw2R4bMm10aR
         raUw==
X-Gm-Message-State: AOJu0YzGLC7LxBOjy9tqi/e1yYoAMUA3mC/aLfpTomRQukf2lIzoiQRA
        tgDZ/ORammgJsyugMXqRyfQk5g==
X-Google-Smtp-Source: AGHT+IE3EPZwdcV6+9c0MT7noLRZ3EscIaBUOrxg76lWbF2gmzuNksXZSHu188cOIVvgnjobPtdBNg==
X-Received: by 2002:a05:600c:3659:b0:401:b425:2414 with SMTP id y25-20020a05600c365900b00401b4252414mr21070016wmq.18.1697197748446;
        Fri, 13 Oct 2023 04:49:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4209:13a:988d:80be])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b00407754b998dsm974509wms.27.2023.10.13.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:49:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 15/15] arm64: defconfig: enable SHM Bridge support for the TZ memory allocator
Date:   Fri, 13 Oct 2023 13:48:43 +0200
Message-Id: <20231013114843.63205-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013114843.63205-1-brgl@bgdev.pl>
References: <20231013114843.63205-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable SHM Bridge support in the Qualcomm TrustZone allocator by default
as even on architectures that don't support it, we automatically fall
back to the default behavior.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b4220fff2b44..8cca74242cf6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -255,6 +255,7 @@ CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_IMX_SCU_PD=y
+CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
-- 
2.39.2

