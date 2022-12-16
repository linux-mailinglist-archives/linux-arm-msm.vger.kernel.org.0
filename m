Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1279464F541
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 00:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiLPXke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 18:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiLPXkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 18:40:33 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA9B1758E
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:40:31 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bf43so5795125lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/bLk04dhGvObgv0ibnCNcEYZnqfFntTEvodjggi70o=;
        b=J072llu5NfA6FPCI0kSB6d9eWuWAoO5i4aFxwLXXZq/JJMYLPfmWT6NWEIOlK70wUD
         ZuhE0Bg1O7B6SARBI8G2FGjIeIMsm0oVgXUjW2KcL0pi3zQ/cGucyEfBDKHrOTHheRSN
         B/SR2Olo68a3ZDOekdmIMiDyIumvA6A5hRgjQ6AVV6cXxUtauGg2U+isTW9mcFrr79ff
         KhQHHRF3Ty63pyfTiUCQsDzG2+jTTcLWKxJOtvcG6Ro2/9rumyH89sSaHU4mzHhjrSxs
         fzc6ccZ9W5jOB+3Ftdhn5J6JlpPPjxkCEKtL9wb5fuGBwMZ/iqmwUGTWOSuLOe0WG4We
         geHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/bLk04dhGvObgv0ibnCNcEYZnqfFntTEvodjggi70o=;
        b=JQg1f40Cigc2pW15M++2epvtLqM2ovgjZzktRV4+pziq2bCYP4MZi6eqwtag4su44c
         rqfB97AU9WBwtcQEHxcATswGOjzj0iRqEM9JJ34UKPH1Bqe+NNhqYJchYoLWmMj5iOlV
         Kt+n0NeR6gy2NI0F4Ml6P/OFYLMcC4cU6x2R0lUnCqgf0bEZCneRRZ37m5EXLvT/Ttsa
         6/c9am6UPVKE4mIj6To3Pm4KCFIiZ6BhujRdeNSH5F6NdNcasBzV0Nv9p1ttSR4x0StV
         1xDV1DM3WymwVZ7Z6tZrSTRX1UE5pvQYxB+zI+9seS8irTCJNYspYs0p6jTH8mXif1Bu
         wBlg==
X-Gm-Message-State: AFqh2kqIq9FymlL5eSSXblai/M0QWNTA7YLxEAAVdtJgKMdb+UvqMVOZ
        xci1Cm2UOylhRrzpLS/ZBMQ2gw==
X-Google-Smtp-Source: AMrXdXu5EMtQvFkCcKMVgrjQBjg12/f7JLtr0e3sjyWv4wljAUzxoT+/cbrxL9uucWk+Con97pufQQ==
X-Received: by 2002:a05:6512:12c1:b0:4b6:ff4a:885a with SMTP id p1-20020a05651212c100b004b6ff4a885amr10191927lfg.37.1671234030228;
        Fri, 16 Dec 2022 15:40:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25055000000b004b40c2fccfdsm336950lfm.59.2022.12.16.15.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 15:40:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: qcs404: register PCIe PHY as a clock provider
Date:   Sat, 17 Dec 2022 01:40:27 +0200
Message-Id: <20221216234027.539917-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221216234027.539917-1-dmitry.baryshkov@linaro.org>
References: <20221216234027.539917-1-dmitry.baryshkov@linaro.org>
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

Add #clock-cells to the pcie_phy node. It provides a PCIe PIPE clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a5324eecb50a..ffffaa7507cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -810,6 +810,7 @@ pcie_phy: phy@7786000 {
 			reset-names = "phy", "pipe";
 
 			clock-output-names = "pcie_0_pipe_clk";
+			#clock-cells = <0>;
 			#phy-cells = <0>;
 
 			status = "disabled";
-- 
2.35.1

