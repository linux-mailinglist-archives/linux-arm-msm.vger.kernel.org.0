Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18006657703
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbiL1Nc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiL1Ncv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:51 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD283FCCB
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:50 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id j17so14130239lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9geNYllAFv/EDrrrYZhMPV0udfvXOAUMaZPXHOy8Y8=;
        b=d2NtHDjcKltV4Etqm3awnf8GCdJCroJbHpudoeaHKTQoi5vIBKNxzB4ZgmxmOeI19Q
         RzZ1LyGFiiIbLFTT6sEYaza4+vx+VAPCGQKvZ98xQIKj6cV3BKAb9UHs5f6lqW3JwURD
         mnNhCuD3FancjpJofSPHJIv95G15r23V2jk5lZYNGkw+mi2ZONW3n3EF8U0g/wv8PQFS
         ngEN5jwl1fI5rj5OzSFB+Q7RoyRm6cOqv+lU94M+hFfRIRr9XwXN+JU7GU3cM+VtQsOt
         pogLyrSZtd/FmkTG2nlLzFuIc0dpeo0SkZ1KPk42wK6o7IQMOgZjt3NbCiI8IaDDqFDn
         O4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9geNYllAFv/EDrrrYZhMPV0udfvXOAUMaZPXHOy8Y8=;
        b=wYeTqpUrEwsdSDRDHEcD5N17zTBDYlSG8E3k+CMiuEVQCNILiYslLopiDyMBtq0rSv
         LVUhFcgKW0Xoi0gqAGADNDyXluEfUtvALO2gmhk7He3nmgPjpupkyiLIrO671HfFS5Jz
         FraWe0Mh+QB8xOO06rFyWX6xzJpU9JSi8wuAYRsp4i6AlI8+YkZZqd866K6QtWQCauvA
         v77ZIkCXuWntj54eooqKGqsqD2st1TfnWDOG6N9QK/ETXYITwXXEm5Ew425gNa4Nc9Zr
         DWHBNXX+8FC27AYQFySVQtuzQnvxcSxIPVPZWtAMNtZf65gFgm1cuMbYGSKGGG8DD5BE
         eJVA==
X-Gm-Message-State: AFqh2kr6IhOhGXCw6yM7Byuok4ks+cUW2U909F9Tk9OCE3oQoyrB82mG
        Jqz/UKJsXN4mSrnae29+yC+fk5ZG6LqouSr4fIo=
X-Google-Smtp-Source: AMrXdXvBn9fle1O57vI9H4eLfrUil8jj8nnXZImnHUpW9eQnaR9IbC2kzCdUuVPHcYA2Zj+1QgHBtg==
X-Received: by 2002:a05:6512:2506:b0:4a7:7d62:2808 with SMTP id be6-20020a056512250600b004a77d622808mr7327571lfb.27.1672234370278;
        Wed, 28 Dec 2022 05:32:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 06/16] dt-bindings: clock: qcom: gcc-sm8350: drop test clock
Date:   Wed, 28 Dec 2022 15:32:33 +0200
Message-Id: <20221228133243.3052132-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sm8350.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
index f6be3da5f781..529c1b8b0417 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8350.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PIPE_CLK						2
 #define UFS_CARD_RX_SYMBOL_0_CLK				3
-- 
2.35.1

