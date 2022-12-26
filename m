Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B40F655FC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbiLZEWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbiLZEWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298BD2BED
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:02 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bf43so14689386lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BSMHD+c2gHpfQgRvnQWh7QBxsgW6TDMIYioeA0tiyU=;
        b=GSG/uPASW5MnAW2J6MoCurBK4kTDfD09wDZMETAMkR2BQDSJZLXgPBxuC7WpCIsXfa
         bhladb55cCu6v+AxHyDcUDrg6Vj/dYL98aez4hmlJUQfAcdc/Fww2Iu000YFNU6n6gB/
         Qfk6QMBHB+ttNsUOnEgK5cSXB+zDgyLQ6P4V8UQKsKM283wN8mX4TuL0N5obbTXUjCX2
         Od8mib1YgWK1Pu4zgR/Lfz9P7FVPLj3XsCbFmCmyvfMB5WND4V9yaWyE6DhdYvIt6fgm
         VSfMjgP+DWCNG+orVpYrp5eNViOuoOAVAQXFkrBksd6yembPg6LyNsgw0u5ZEdO0f50/
         ZXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BSMHD+c2gHpfQgRvnQWh7QBxsgW6TDMIYioeA0tiyU=;
        b=hHDhYEi2q6zb3v/3rH2MF9blGsUVykeM6+4kljckGNIVA+Xi6EJlcvUl3i2EdNmjer
         IDdx0ChQdqFs3DcfbJPQ1pmmwGbwQKjcVsMdGpVZNaOttPuckkm0IJBvq7B8ipsK+6DU
         EWF1VtRMY0Ze7d+POEyNtInZahERfRsYpTixyX4hkT5HKAr6zY9WobaxAb/MnWZZwscV
         47SNuG89g0Yz6jlSnRnqoagCLwltl8BqFgVtbSTW9oI+blnmyQKc41TVaaKljKU/00og
         zV2EJmYMBjFIHboTlJ5gaUPGLCOumkFmlOh0nSfdQrR5qhyj7htOcMlEVivVrsph4aBL
         JbTw==
X-Gm-Message-State: AFqh2kpVtbnJShIx2IVYKLid1GoHKi8OjCbBmJ863r1IHoOXD6/yZoaC
        sKKfhU1tkbnPkMdE88T514X2+h2CaqRSSgNNzjDoDg==
X-Google-Smtp-Source: AMrXdXtny0j8UKNsOeIfUn/TQ+czvRnUPd4+0U0IkWIjg7Y9RXoIwpyLFJNU1J0wXAn08wzdm7GOvg==
X-Received: by 2002:ac2:562d:0:b0:4b5:670e:b708 with SMTP id b13-20020ac2562d000000b004b5670eb708mr4155105lff.14.1672028520462;
        Sun, 25 Dec 2022 20:22:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:00 -0800 (PST)
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
Subject: [PATCH v2 07/16] clk: qcom: gcc-qcs404: fix the name of the HDMI PLL clock
Date:   Mon, 26 Dec 2022 06:21:45 +0200
Message-Id: <20221226042154.2666748-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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

The QCS404 uses 28nm HDMI PHY. The in-kernel driver doesn't provide the
PLL (yet), but the out of tree patches used the name "hdmi_pll" for it.
Other Qualcomm HDMI PHYs use either the name "hdmi_pll" (8960) or
"hdmipll" (8996). Thus change the expected HDMI PLL clock name to
"hdmi_pll".

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 67a180d688c3..241768da2263 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -152,7 +152,7 @@ static const struct parent_map gcc_parent_map_8[] = {
 
 static const char * const gcc_parent_names_8[] = {
 	"cxo",
-	"hdmi_phy_pll_clk",
+	"hdmi_pll",
 	"core_bi_pll_test_se",
 };
 
-- 
2.35.1

