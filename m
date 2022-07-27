Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBFC582096
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 08:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiG0G6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 02:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiG0G6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 02:58:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C562528A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 23:58:40 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so25865860lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 23:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wW0IWmjou8/dbPXah1VWrs6p56bqB8L10WNLYq+BYMk=;
        b=cQBSRfKjclDHCmQjTvJm/R4tGlbYSfkTP8d43BYI8YdDjtuznQEf2QhnXLzPnlpb6J
         DehzQwhkS2LCQYjBBTLwfd2gXy2NKoNu1d5mWoMIIbQiA3Uo2VjixjcnXETg51tiuIpB
         YYLbwJs5JE+lobZ9amLFx/Lu8qs/T2tx8i4tZEWf6sjSLEXjZR08zEHercqZqhO6NTvr
         Anbyg6RGMbjQvUJIMBjqcjWAPlf8daSCvucloWR6J9LzEdBW6tIxyFG9iUuPqe4s3MVq
         rR4LDv/9kZJJDjjMs/caZXzvKDpmhPdiKQCwLZilKIgzU0N/pwvhSRm4IGWzUkfS6Pnu
         i0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wW0IWmjou8/dbPXah1VWrs6p56bqB8L10WNLYq+BYMk=;
        b=39usJFKfQNZ4wrA/J7YZB4npfYbmm01k1ty8JsZsN3kbdv/1I0/yS5l76WXdlClU/e
         IYP+iKEKeZnF+RqUZ2dlKxCWsRy8sF3Tbtx15+jDKfuMyBQohQVXvSON6maVyzLyLxBk
         fjr7Gchm/ciD6lAIiPXrNxQPyvxSjUuiznepHvvmVzK2Z8TlUmUYBOk7iawUzMMIp5yA
         Geo39pbaWDGUOKwid79L85mtQVNBBEJHVPUCkJx6fkOlO0pPEb9nzjk8a/2nm0g6cxMN
         b2YSjb14faj6hi2evou+kb4HYn2T48lRVwVpoOLuCctpuUBz4qr2vXwCn8v4TheQggkz
         A1hw==
X-Gm-Message-State: AJIora9mXJoKqoSOXb0ru7usHS4UG29Ti8hV1KnVl0UhJSnDhsPSOfWA
        etBM9+xx0HTHpxsPzeZRSWdfpg==
X-Google-Smtp-Source: AGRyM1trGgT5DJykshwDt/CND/d8EyjobYvsJ1DVroEh5gPDBdVPubvKZDnPLwI4lDRhuoplUU5sBQ==
X-Received: by 2002:a05:6512:3e0c:b0:48a:88a5:3a1b with SMTP id i12-20020a0565123e0c00b0048a88a53a1bmr5160706lfv.150.1658905118468;
        Tue, 26 Jul 2022 23:58:38 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id w29-20020a197b1d000000b0047f647414efsm3623827lfc.190.2022.07.26.23.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:58:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/5] ARM: qcom: include defconfig in MAINTAINERS
Date:   Wed, 27 Jul 2022 08:58:29 +0200
Message-Id: <20220727065830.10681-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727065830.10681-1-krzysztof.kozlowski@linaro.org>
References: <20220727065830.10681-1-krzysztof.kozlowski@linaro.org>
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

The ARM Qualcomm entry should cover also its defconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ca4dfecc047..5623fc9667af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2582,6 +2582,7 @@ F:	Documentation/devicetree/bindings/*/qcom*
 F:	Documentation/devicetree/bindings/soc/qcom/
 F:	arch/arm/boot/dts/qcom-*.dts
 F:	arch/arm/boot/dts/qcom-*.dtsi
+F:	arch/arm/configs/qcom_defconfig
 F:	arch/arm/mach-qcom/
 F:	arch/arm64/boot/dts/qcom/
 F:	drivers/*/*/qcom*
-- 
2.34.1

