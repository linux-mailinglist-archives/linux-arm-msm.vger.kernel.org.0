Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE52F7194E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjFAH7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjFAH7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:59:10 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5C2185
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:56:59 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3b03358e9so22932e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685606217; x=1688198217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up7UfD7gLV38gQDMiwT+8gZ385bvQa/dhpJvslv7J6s=;
        b=CklO1O3cIjvCC6uCGwPlv4UCKCjlb4aR9D0uOfrtHuIQP7eTj943TvSt9pCEZUOduB
         oPazvjd+UX3zhMrnfz2+ZjKmKIZQsz9B/VlmU7JtXbh6LU7OwID3wkzKNbs/obXPnOSD
         H0pzyBRggg9fIVpiJS4cEIsDp0HkvPPPZOV9O43nZfFh7gVcGFla5G/1qTrHLD3Ceh5n
         GavpHbhKSYaQdvhxpKWKaU8+oBpKUNxIaoa5T90gTXKz7vKqwVEm6OFfSrE/xYD2Yk8z
         Sp1megKePqElTGoetqvf5ovsE8zvcCzbJaXPhQgvBUxP0cIg2BKwKoOn8cQEMbs9dRe2
         QZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606217; x=1688198217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up7UfD7gLV38gQDMiwT+8gZ385bvQa/dhpJvslv7J6s=;
        b=UIvRBhfMc0WkavbQs8HujaZeuT/m8jo/TbwsyRYuzB75OE5UmRiHR1fmghhDI4O1XS
         CWPtIN3pbV2P3764aV+A4G0USClxF5GidJKSz4gtrIndFKRz5KQ1KAxtsU6tRUGJskKP
         EGuuSItLXAGeyjvgaR7k5u4ITVOkZHCkay6G9QVOhr+wClu4a+UIH1hAwCfHVrL68DZ8
         gL/wF6Qgbt/VtT51vYSTvDIi6PJg/Z06Fb3xa4ZpEGPYE4FK/cPeFFVLj6Z2/P9DZttN
         KjVJ5W7rNhOHC9mGdGjgbTZpO1Efrv+Yxua9pQL5VC8My3GlT2daFS+IKdHfkYS4zJpA
         8naA==
X-Gm-Message-State: AC+VfDxmKY5LzoYmGdvsE9FgM2FDgo/eQOKt9a/FfkjfOqjf8I1zK58F
        gXbaSG9RjDYygckRn11XHIqqhA==
X-Google-Smtp-Source: ACHHUZ6SYRM/Bpzz9V8YWbbaKguq23gZrBIP1OfW32NyCgt1IhMLjAaVIXjXzGXwq4N3PkUUKqoxLg==
X-Received: by 2002:ac2:53b5:0:b0:4f3:a4fc:6283 with SMTP id j21-20020ac253b5000000b004f3a4fc6283mr1951313lfh.3.1685606217632;
        Thu, 01 Jun 2023 00:56:57 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004f60a2429d4sm27160lfo.78.2023.06.01.00.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 00:56:57 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: defconfig: Build display clock controller driver for QCM2290
Date:   Thu,  1 Jun 2023 10:56:49 +0300
Message-Id: <20230601075650.1437184-5-vladimir.zapolskiy@linaro.org>
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

Build display clock controller driver for Qualcomm QCM2290 platform.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e28794a768d4..6b44187bcc7c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1164,6 +1164,7 @@ CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_MMCC_8998=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCM_GCC_2290=y
+CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
-- 
2.33.0

