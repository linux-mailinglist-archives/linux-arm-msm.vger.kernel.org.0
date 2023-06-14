Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316BE7306A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbjFNSEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 14:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbjFNSEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 14:04:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A2F212A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 11:04:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f642a24568so9161892e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 11:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686765877; x=1689357877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak6pJEE70i86/FySUfYrSS2au3HzGmo13oLp85+Of0E=;
        b=wl4qwGXx1Oi6vBD6BiP1Gypn5UfNRwBI2XIwrLHO2SXIb9cW+AkGBMknkor1Kc+itR
         2Pvx6mu5gaXcUo+wLGYjKdvzU9bGiGUpUFLvkYD+LC3LYZnd+/2K5iPJnKgx8osidXq5
         PA3kqFsSSvDhAwzRN5QIj4KRuHGgkkK2wxjyQMyt2u1KTaXSttM3k9H0TyclKuHFZaaL
         n2Xpoisl/P9uQsfWRPBobdA+UKBmcf/zj2moZ9yfWvEEY5h+akj1fCeWcH5AlVl4KF9r
         0ToLRkQiLCsj86/LNaN5vr6hwfsi01avX846BwhXHvVjgjXZcR0l5KlHnZ0aO2bVrpCD
         Xb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765877; x=1689357877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak6pJEE70i86/FySUfYrSS2au3HzGmo13oLp85+Of0E=;
        b=lmzhXqmYfp+TZnDGv4HTKRNKQNLmdTBX66chGgaBoCJlQYE8jUM4pDEIPH37c/2l8T
         /HmuIFJVFJPR4AugzT+nwUw5bIxC2pk8ctBGa6S9a6+wcbksRVwDdq8y6p9w5cazmTzp
         oJB/vEPSRYZ/sy7zt4m/GLeukyxXRmExhTknoOERPw7wlF7OsajsXrmECmArme8rLnjJ
         rZeBvMxdoYYbMT5+ITXlep27Fm6JE/ojauXUvfTax+C/3yClSV5T4Qp+ARBdYrcOlrMb
         CCZU2I6+C8iayfPPP3ZTeZ4tBb459zrCR292su3YqTcKS4Vz8W6jIphHKAdHWk/OlhLe
         ENFw==
X-Gm-Message-State: AC+VfDzMAlKrMsmS3QgG3x2td+XQQIMl+gtlU3Rf1uDGpXuutc4VYw12
        Zf1mkouM92ZQ37sAHFrlZPm1Jw==
X-Google-Smtp-Source: ACHHUZ45zOdQBOYBbLzRGiTr0l734QVHoknkoLXOp6wOuv+zoNhH61my1PkaWOZDuWUoA0aZh+Kz7Q==
X-Received: by 2002:ac2:5f8e:0:b0:4f7:689d:1dc3 with SMTP id r14-20020ac25f8e000000b004f7689d1dc3mr1271154lfe.59.1686765877231;
        Wed, 14 Jun 2023 11:04:37 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id l18-20020a19c212000000b004eff1f7f206sm2224053lfc.9.2023.06.14.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 11:04:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 20:04:21 +0200
Subject: [PATCH v6 02/22] soc: qcom: smd-rpm: Add QCOM_SMD_RPM_STATE_NUM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v6-2-263283111e66@linaro.org>
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686765872; l=664;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XHE1WQYZzaLo+c3xD4ALM/GRb1VwY7GuxNqpdL0mBnk=;
 b=Z+uUtD+ZHrOfEeHTesqQcIB8eGqM+tb8sAWlyAxnOsptGaC2MR12+NkO+y9dOerYzqKo4C/Im
 Ym5t1YvHW4EC/pa6R7JTh1ckjC8VBnQkMO7/SprZm+1LyFjwpA2G57Z
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a preprocessor define to indicate the number of RPM contexts/states.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/linux/soc/qcom/smd-rpm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 2990f425fdef..e468f94fa323 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -6,6 +6,7 @@ struct qcom_smd_rpm;
 
 #define QCOM_SMD_RPM_ACTIVE_STATE        0
 #define QCOM_SMD_RPM_SLEEP_STATE         1
+#define QCOM_SMD_RPM_STATE_NUM		2
 
 /*
  * Constants used for addressing resources in the RPM.

-- 
2.41.0

