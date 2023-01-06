Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1DA965FC11
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 08:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjAFHdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 02:33:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjAFHdV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 02:33:21 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E6C72D07
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 23:33:17 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g13so921954lfv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 23:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U19wkTAb+l15z9VckZMObx6RoI/ARCn2vlLUJHpkaw=;
        b=xvVpDrtS3EAWG5wdTjtao7J7g6o+xdRBSzTbCj8Xt9rWzV7655GCbuhioluua0JVGG
         Te4qLMqsGdo4Y+uMzher1MkRqz8GKhxGe+gTcui2pBxkiF3J2e0iCY57GjYv0judqEQa
         JYGbaPXIAsdmurvNnu8qsUT0SgKvDYyrW/DwIJz9pP2KzfsFYo5WMj+ejZDREX7PG0pp
         Pp9J2zDbZuc+fTuOGa4n05P4jMzCy9r1RbCDqZxIa4CiT2XVL9k51NOLIFb7KonyaFpE
         gyafx/o8TY0v2SYRkLnQ/lf2flsX4/5XMNyVat9WPJI4RcZRqTvxrnu3ehO7NgDDuGEU
         TAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9U19wkTAb+l15z9VckZMObx6RoI/ARCn2vlLUJHpkaw=;
        b=xcUgf/WAQbO40Riw1Cb9UQA9cCu2QYMdsB0MAdnJEHoc9Y1BC7z4y+H3DzOYC1XDwY
         RH92u4Lp0+3BAueYXDbnktlMyXKo2dtPq41N19hhIXdNIuTZtGOnMLxvqjaaYpT2fq/D
         OSgAG4ANeHMHzcLbNkiq/EoYjuNsK20Rf3etl/q+O1TXhOVSqcS6Tp99doWu9xAeur5N
         JnQTk8zWKtXsCvZ/pocJnGrdOt787Nhha6NDP0q1rRl0zUISwYJDf/f4LQp+T9pGJKaX
         LvGXBIm31nNJm88fZDoCILEjbTiORR5FWkn6Sfyes+eYOTBlQb6D+kXo0TitoCcrV0Z5
         RexQ==
X-Gm-Message-State: AFqh2kpt1yshvsFgp0WHNUc7LLXOJd4ghNvFD3cxbcFk7Twq7aM3aPGk
        CQ+yIcT8HqKlVxqVU2tc5pcWzw==
X-Google-Smtp-Source: AMrXdXtou8hrOxlqXeK2lKBfRxoaL00fpNbQ3N5cznEeSCGDO88Lxbfm//Y4uxN7ugofQTc6on13Xg==
X-Received: by 2002:a05:6512:3d2a:b0:4b4:b8fc:4aba with SMTP id d42-20020a0565123d2a00b004b4b8fc4abamr18172596lfv.25.1672990396396;
        Thu, 05 Jan 2023 23:33:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c28-20020ac25f7c000000b004b4bb6286d8sm61114lfc.84.2023.01.05.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:33:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/9] interconnect: qcom: sdx55: drop IP0 remnants
Date:   Fri,  6 Jan 2023 09:33:06 +0200
Message-Id: <20230106073313.1720029-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
References: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
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

Drop two defines leftover from the commit 2fb251c26560 ("interconnect:
qcom: sdx55: Drop IP0 interconnects"), which dropped handling of the IP0
resource in favour of handling it in the clk-rpmh driver.

Fixes: 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0 interconnects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/qcom/sdx55.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/interconnect/qcom/sdx55.h b/drivers/interconnect/qcom/sdx55.h
index deff8afe0631..f7394f460127 100644
--- a/drivers/interconnect/qcom/sdx55.h
+++ b/drivers/interconnect/qcom/sdx55.h
@@ -6,7 +6,6 @@
 #ifndef __DRIVERS_INTERCONNECT_QCOM_SDX55_H
 #define __DRIVERS_INTERCONNECT_QCOM_SDX55_H
 
-#define SDX55_MASTER_IPA_CORE			0
 #define SDX55_MASTER_LLCC			1
 #define SDX55_MASTER_TCU_0			2
 #define SDX55_MASTER_SNOC_GC_MEM_NOC		3
@@ -28,7 +27,6 @@
 #define SDX55_MASTER_QDSS_ETR			19
 #define SDX55_MASTER_SDCC_1			20
 #define SDX55_MASTER_USB3			21
-#define SDX55_SLAVE_IPA_CORE			22
 #define SDX55_SLAVE_EBI_CH0			23
 #define SDX55_SLAVE_LLCC			24
 #define SDX55_SLAVE_MEM_NOC_SNOC		25
-- 
2.39.0

