Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C1A6E492B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 15:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjDQND1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 09:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjDQNDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 09:03:12 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3165533A43
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:00:02 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so20989551wmb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681736329; x=1684328329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuITCu8i/li8kE8CEtM/U6x5Upz1m7yYpvjZ7zwPQTw=;
        b=0J4OzIPsxxt8RPoqfiLc+/5X6L4vMstEaQae+8XGjR8f59YSGqJZgSVnEL/3ASF4X8
         xmeYZjdTVKXCzDj4OWOT/EeHCyjOp3SjaJhmEQT5hb7dmp7ztxyc2Vp4/klikgi9oyzW
         zci0oD4zEJd/TApreVAeNpIYoWEf9PMaY8fo/RzFWT+LpRUXQo5cwF1eU0eIrPKkcJsm
         3ixChpu0OabJbZcbl8SVNJtHEwoUJ/zoJ0a1b2IX8z2xqNud0x3yaPKgf7o7qlnwQn4U
         mrTjIX0dgG+rDFD126c9Wvqw/OAXwbo6GwQYGgS5RF5qlgbHePV1UAEa5xKs7adHYazB
         Ab2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681736329; x=1684328329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuITCu8i/li8kE8CEtM/U6x5Upz1m7yYpvjZ7zwPQTw=;
        b=UxMCXGQtUBQFOX3dLQnVk6+Zl1hggh9K2zA5MFWyhl6ft8UThRaYz5HeHQ5bNJOPTH
         1UimnMITVIviQALsn1o0bJVV1RJ+dOr6Ix7J4p/cub0Q2mBli59YX4BNjuDdS3AkH1/8
         1a+SIYWBkNWuxat1hMAV7Mys71gT7OxP1O2QqQBmJGO0mu+q83y5UNeDtmozwWXJ/hKP
         kX2RsFuk0fhCuPxqNJrGjY2kGzFRaHBJUUSK1A9IKH1//UAzvg6YFiF+OuxvOFrSYK8K
         cf8saMz8tzJ3AnD1r4SSn1H/hWWOeqfutJvp5OJPhOUBZ7Gj6E9u9N+gTjRVyDXRjmLM
         UxSg==
X-Gm-Message-State: AAQBX9dQMB8f6GyHecQXWIbpR+QWVry7mf2ikLttVb8/wDhIy7NCtIeA
        KaCNI4E9gJ4OBFQMDKjtGJD4mw==
X-Google-Smtp-Source: AKy350YYJSLvINl73EmHpD86PAlOoFXuPnqV6KCbJ2kTnUUZ4i6TgTz/EYFSBIxG56b50i2GrzcLLQ==
X-Received: by 2002:a05:600c:247:b0:3e2:589:2512 with SMTP id 7-20020a05600c024700b003e205892512mr11213289wmj.21.1681736329304;
        Mon, 17 Apr 2023 05:58:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:374a:ffae:fd26:4893])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c471500b003ef5bb63f13sm15557546wmo.10.2023.04.17.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:58:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 1/5] arm64: defconfig: enable the SA8775P GPUCC driver
Date:   Mon, 17 Apr 2023 14:58:40 +0200
Message-Id: <20230417125844.400782-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417125844.400782-1-brgl@bgdev.pl>
References: <20230417125844.400782-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the GPUCC module for SA8775P platforms in the arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b6342b40c600..e1063ab32658 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1164,6 +1164,7 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
+CONFIG_SA_GPUCC_8775P=m
 CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
 CONFIG_SC_GCC_8180X=y
-- 
2.37.2

