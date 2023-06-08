Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8EB072809C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 14:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbjFHMxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 08:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236640AbjFHMxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 08:53:39 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C717E2D76
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 05:53:28 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so3719585e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228807; x=1688820807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JdqNqW1EiHhGOLPPEwu6Algy+7F6uqVRE0M773aCbc=;
        b=PYb6RhBwm5Hcg01jKpzKI1eXvG8/av099rumjF3JEJ1VUzNcoBvA41IqGt73mdYj8j
         vwTz3FrqDSm+ZYXlmX8q+jKsagJNEChm3O52/pil7tC1kCukj8Eo9i4+ml208I2FqYes
         brZjgB2IaAmmHtcu6I/mfSAy+rgmGKsz0qTUmJ8oyZSx3A9CKPLtBjjtOyyyocIcICPB
         vHJsPuxO32Iso6tpwVHAO/X3p1HoakKPoc0kIjnURZxzeX8JfrgEeDtKv77K3SwWZZMc
         E79L6UClmdhL4ach6mHf4b53WlWPna5IdeCnuahaa6MG5eAMfxwHFNMojMY7iNRBPpo6
         cLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228807; x=1688820807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JdqNqW1EiHhGOLPPEwu6Algy+7F6uqVRE0M773aCbc=;
        b=Hd3W/VoNXgkfw1WNFavEFn8X2KauHafajpF8B7Ak5kFHhpKsBGd3o6KNOuphwaGQAm
         dmqrsisempN/YuoMHE5qdeWx4gZ7rTU8P0OrjOFk9ox4Mx5yXcfpPYrdwT0KGGI0Vs0J
         3h07NhhB03Ud6c3TP8oVOnifom7yEpXD4JvvIu/tH9GFG6LqB0UFds7LEvR/0xOSsetV
         //2ZuiM2OF/9UEl+aT6pBxRAaqrhv+l3OxVHAJK4sPqcPjr/jGHNvaK24KP1tyvig76q
         zQ3BWJj4zIGh43F9UWc8R8U/YdiljEIK+KiAZrc3UN+C6KcF+hN2Lkhs01BNfFDLIobe
         aldw==
X-Gm-Message-State: AC+VfDyooPg35JJNJEPKCsTnlNsovv2D3LmXJHrVbcwn4MQHl0Sm+lFY
        HQhdGoR7pSw7+LGPAbqxdXwXsA==
X-Google-Smtp-Source: ACHHUZ46jgIaoydJlPxm3zWkCHo5nMwYG+fHC3iO8XYOJcL0aRa6bUai6RZ8Nm9ye79/cy7F5Uy99Q==
X-Received: by 2002:a7b:cc08:0:b0:3f7:fa21:f66 with SMTP id f8-20020a7bcc08000000b003f7fa210f66mr1279754wmh.26.1686228807105;
        Thu, 08 Jun 2023 05:53:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003f7e4d143cfsm1894032wmc.15.2023.06.08.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:53:26 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/6] arm64: defconfig: Enable sc828x0xp lpasscc clock controller
Date:   Thu,  8 Jun 2023 13:53:15 +0100
Message-Id: <20230608125315.11454-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabled sc828x0xp lpasscc clock controller driver required for X13s laptop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e05706d3893d..bc5d75cf71de 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1185,6 +1185,7 @@ CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
 CONFIG_SC_GCC_8180X=y
 CONFIG_SC_GCC_8280XP=y
+CONFIG_SC_LPASSCC_8280XP=m
 CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
-- 
2.25.1

