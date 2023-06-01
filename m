Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFBD07194E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjFAH7a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbjFAH7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:59:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4588A194
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:57:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3af42459bso24236e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685606218; x=1688198218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4lzoSZYE07OlI6jEG0vKa4CKqLIEPtD8fTUDXKDumE=;
        b=h/KI+IYIEfG8VFlKtkXwWlDAXtO/d331itH76VCm+NhhjwsWOV3Y4VP6Rttqf3zDg5
         lg3N9V3+64GXYvG97LT2TagDeptgIIOu7e8KKI6Z9fGyinp38ZXk8qsllrjSwwj8Oqr7
         4cgYt0QseyQjwraF0yq5YUe/p9rXQjD4whhf1i7yVdgYw6T2bn9/Rbo354HapxuGlK9o
         P28uYakP8705/7XLSvXh/6Ezfmka/y/BCMmsG43djr1c6uwieunBochXdsdDyoiLKIUw
         FdIWQbuAiC66YrInzFSyyZpObKkJh7mt49Nm81sC+NkPT+QnWmopiKCSGA7rcbpn8iAi
         9e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606218; x=1688198218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4lzoSZYE07OlI6jEG0vKa4CKqLIEPtD8fTUDXKDumE=;
        b=kV/AguweaRsxPoFSZ300xux3smEdzMwd5AyAlIVpQK2Ot1VY4gj4GNQq0q6W5KG/I9
         Y/VTE7W+JNWiuL4FEUfZfTnJ7GW/anbrhbawG2S8jd/JbRIlHfmEdqmhG4HENRY8gAgl
         xvRy28nwhFNjNqwRVetR3H1nz6ZpRrPdzAdC0UYOzj33OHwrdIcsehDBSUecCIEfhhY3
         bWcVTezGZ1CvFjqltUKCRLg7KdJsQjjsxuzMFC9CHbwEU9WsG/zeRU0wnEbp4/v4F+Fx
         2GIHSg+yJHU6LnspsKeoknRJXDM5na8r8XfblQr6DR3myYcvOwslq3MJiLX6KGLCXH3L
         sN8g==
X-Gm-Message-State: AC+VfDzMxoRugE6vsfEVTSp8qY7rzL01BklBpb1dUNpT3CEj+8ZXLe/B
        Qz1GnuATS5OYfRGKojjmDw1RLQ==
X-Google-Smtp-Source: ACHHUZ6qEyzCz8iBg9Zt+3waktKwqpgAdd+23YqKdTOgkgKxtbmPPkFGaKlkMnrdXXExm8WYwI46BQ==
X-Received: by 2002:ac2:53b5:0:b0:4f3:a4fc:6283 with SMTP id j21-20020ac253b5000000b004f3a4fc6283mr1951335lfh.3.1685606218617;
        Thu, 01 Jun 2023 00:56:58 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004f60a2429d4sm27160lfo.78.2023.06.01.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:56:58 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: defconfig: Build SM6115 display and GPU clock controller drivers
Date:   Thu,  1 Jun 2023 10:56:50 +0300
Message-Id: <20230601075650.1437184-6-vladimir.zapolskiy@linaro.org>
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
index 6b44187bcc7c..1e134c8a2f7c 100644
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

