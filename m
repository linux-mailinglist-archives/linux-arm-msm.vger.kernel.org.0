Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B18F6585F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbiL1Swv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbiL1Swr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:47 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA5215FF2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:46 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e13so14728209ljn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPiUl4EdKWMJANife8srJ0scEoyX5E4VGNwbBAPuzVA=;
        b=TZV+uTSHiy7YF5VzIDQcLXz6R1cYwZ4v95WqQtTAizYgOWDgsY8dhMb9a+S44UTYVB
         lEvrS04EokPBh3R67FWk66XiDYBVjigF4QbQyTKLM9Qa7KMEzwjP5qO0KGqrjmasLv0F
         ESrbzUeTjnWtpnmM673WZGNoG/kIe/hzBADr6fno8j5iutTtfZ3aR/XJsXeXYAqmdezR
         qnsDhfkUuwz9gTIAJ+0+z63edP2QV1rOt5XrgnMTtNvJySJT6pYybItO00FTAXQ0cemn
         Ocad+7uOIrc7hbDOTXCTPmaEF+9ZQuyo2c0Cp06qxvaJjw79v3Z26EWTK2uvF1m44fhh
         GjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPiUl4EdKWMJANife8srJ0scEoyX5E4VGNwbBAPuzVA=;
        b=bXsN5KfLAURy04jSfuxr9rbiscdd/zgFIyc3+Z+YfapPFtOJlsraC+61MwVuPoaN7W
         ZVDWZt99J+mDg+RYQGmG3PAaLaX6frWCve3fh6+lTcivtGimcU8Ww/JFwzAwRCNfQ/+a
         rJLXi3DFRNcZtl6V+N6EMFVLdBbP7iFuW50SEAC1w/s0NCQ3LzgfFpJFQp5ZlsLln/i9
         SymEZbdq6/nHk88DWrpIDs1YdHS5lDeGXYT6GGcrxbIHa1ppBysyroWinItvOGXsyNaJ
         KP150TgYuMrzCs2AquScoEYdBOVWl4qnlAEOVhy+MMb3daPl3QHSMiEf9dtU4YS6Oy9/
         9srw==
X-Gm-Message-State: AFqh2kq4lMOYZPe357MdAalLwIOSvqrU3kGmM7VObBiVBA0jm539WYj8
        kjCASD/GuQcaO2b4pgOFsuIYDw==
X-Google-Smtp-Source: AMrXdXtk6ND371WXwR5KhjifLVDAGPElPRICguomcgAPNkaK34kPPrgRovcAfOB3F4vpyQIl30iaSA==
X-Received: by 2002:a2e:3c08:0:b0:279:da98:df8a with SMTP id j8-20020a2e3c08000000b00279da98df8amr6972126lja.43.1672253566412;
        Wed, 28 Dec 2022 10:52:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:45 -0800 (PST)
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
Subject: [PATCH v2 07/16] dt-bindings: clock: qcom: gcc-sm8450: drop test clock
Date:   Wed, 28 Dec 2022 20:52:28 +0200
Message-Id: <20221228185237.3111988-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sm8450.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
index cf1469312c4c..9679410843a0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8450_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PHY_AUX_CLK					2
 #define PCIE_1_PIPE_CLK						3
-- 
2.39.0

