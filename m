Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170E0525864
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359574AbiELXgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359573AbiELXgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:51 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9679A5674A
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:50 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a23so262718ljd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=rb+K2Ft9N1JMCRJv/Fe8ZdGM+bFqgG4CoCqfPaOTV86HoSoCSD0HtIOdOL29ZeN7AX
         1toIgFoxbaykz8mICP5X07ZX0feYwCYm27XGrnYMwkqiqGXq98IscbcoaOmJGYFMWkoI
         tLmQfwhDIfPvRTAoL7pj8v/xPvqnpCwCtRzwrwZGkPddRe/c7yJOzkQSXs1HngiWMrPX
         GWSuX1DKs6q75MfOR/8tp+NuMGm94J6TS0y6VbVVN2g5bpqAgTu93+CQxAZfenE7PIqA
         gt6cxRh7s5jkSs9jdBtpcldP8Ba0vTn9F7SUDAhEzCzoWXeLU5glJSe626dbIv4HQY2t
         BBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypxafSXytWa1pPBeHJ41K2y3Cfr7QvnghKr6SvtMtAA=;
        b=WgSEA9+mOukgExxZd/B7f1xgi2c1IoxEgI33jPQu8hA/SNZaLDHVJrkN7OW1NpqJku
         XO3nFvpXgFVCtR220PeEzE2UWQRfauC72xV70LUrDVoyPMTi49kNDkG+Q8tIKmVsxZRC
         o/JyyfxYg+wE295qsmWL5r4t7YQp+N6Sri81UFzwuC+oGvFNH/J2rkPk+QPdPbBPIu/V
         nxXChrZmuWWqUsRO04Pa9fUFBAi4KWu0mfDCBtlWi0NDpigpDAaaaOjRg2QuGfDtOM6c
         pWg1FxKobgOw31h3YglcKkXQMYsGD0yEpGd1Rql3P0vZZ0q924KrnThbXlo17+n/qln9
         3ExQ==
X-Gm-Message-State: AOAM532DjNF1OY3jPB690iw6WGYVqByL/cNWdqdXoZrjyqlcDCA2xU5J
        kflEFUmX7DYWRQTCxMrzlH+17w==
X-Google-Smtp-Source: ABdhPJzs/lejBHVwZdlUtDVUyDCa3zyhz75J16AnGDl0WzUv/Phv/2qVG0LJKizWp9yKpxQ78CQQpw==
X-Received: by 2002:a2e:b8c4:0:b0:250:61c6:8363 with SMTP id s4-20020a2eb8c4000000b0025061c68363mr1468072ljp.334.1652398608989;
        Thu, 12 May 2022 16:36:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 1/8] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Fri, 13 May 2022 02:36:40 +0300
Message-Id: <20220512233647.2672813-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..023b0ac4118c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

