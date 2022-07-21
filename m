Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D5A57D05E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 17:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiGUPyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 11:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbiGUPyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 11:54:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A97F64E3A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:54:02 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t1so3443904lft.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D3Gu/8nTWxZTQK0cjVHFrSqiW7UgZie3lj03csp3tX0=;
        b=mF+QqxkqZLGCr7T+xMb++6bMhQsDSpIq9j6JdcP9lYiHHzrlmlhxcNaxCtSZDxMztI
         Xxyju4ceukGile0plauGzFJmBgTUzTio+0icnLN+57MwtlefBlXr3RyW0mknMl9gQJ0f
         pw/hfKNNEtb5wEMBCPXhJmvaKSKnnVGq4JIakXz7FkVeSyHqm12o7XvKTFJ9bkJHNuso
         gbPl0HPOomp7UI8C5dAtwp2Q7mQGJHn4dU+zHPadCaFyFIfen8mjTGl4nqPLUHE+acxH
         5PQ7Zmvfut27V9/wSz7J3o0nlCy7E8nWJEKMEFIzPTNV/+TcVJRD3Cg9hG/O+HrF+wur
         YJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D3Gu/8nTWxZTQK0cjVHFrSqiW7UgZie3lj03csp3tX0=;
        b=AS03ltz3gd+fSl4k8WODAhkOWJoSKisL1HwslPdFRviqyJV8kRzogAxLS7JOw8XsBM
         +Cj+hh7qXRMw77935jEMvkhJ8WRmNxbizshsBDp1X0g4I0A6lwylPRqnenlgY660Dwzh
         M76kNVX6CpSwWoWmlATGaPXP3X7mWXqhtHHqBdMiSB6cj0CC61eOSQenVkHQ9ykkbqTf
         +pR4JgsQsKWAnUMxtoBa1RSDhB4/yf+8+MMpNoieUTbN/u3eqUI/qulyo2pEH7qOu1DH
         f/Gh7y0f0plu7B3tI5iymDpZD4QHMRy4DvXjS+zjoDxtTHfZ82pSwryZus4GolUvkujk
         H4Rw==
X-Gm-Message-State: AJIora9Bx/NZ9OKS5lEi98iHLT+FMVMAuXzKNyZhNPI5h7FM5YxC1E24
        ZcQm8rT+Dpi/sSvzMplxn83GKw==
X-Google-Smtp-Source: AGRyM1tOUSGEkCReki05uRPzSPQFqYt3xnhJnnwNEJ4d2eS1MYIsdJ2ptd1N/AHLmVrFt6SwuRknmA==
X-Received: by 2002:a19:f817:0:b0:48a:68d4:a8d2 with SMTP id a23-20020a19f817000000b0048a68d4a8d2mr1998741lff.445.1658418840954;
        Thu, 21 Jul 2022 08:54:00 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512214e00b0048110fd06c4sm516432lfr.53.2022.07.21.08.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:54:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] ARM: qcom_defconfig: enable socinfo driver
Date:   Thu, 21 Jul 2022 17:53:54 +0200
Message-Id: <20220721155356.248319-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721155356.248319-1-krzysztof.kozlowski@linaro.org>
References: <20220721155356.248319-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the Qualcomm socinfo driver to provide some basic information
about the SoC being used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 5cd935ee148a..563a396bfb23 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -253,6 +253,7 @@ CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_SOCINFO=y
 CONFIG_QCOM_WCNSS_CTRL=y
 CONFIG_EXTCON_QCOM_SPMI_MISC=y
 CONFIG_IIO=y
-- 
2.34.1

