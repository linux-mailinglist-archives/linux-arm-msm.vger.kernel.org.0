Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03DC9654AC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiLWCKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235853AbiLWCKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:10:40 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E6526AF0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:38 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h7so3387806wrs.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
        b=VGuUkPeHEBkRteyOmLDHHF7IEGlB1z1swr0H8+0cxyaaJHUlr0HsuZanj0wplW7iIC
         MZNZaPazzp9HBnKIPVIhPKglbOf8pYBCFHrbxonYl26nMusknZI8WNb2Ep3MoWXWDy8a
         xVZDD/hOYz1QA848CARmdLljMjdrc1hQnn6ns9Qz6gib2OmQqQ5bDlCHMWwmsY2NqJ8G
         j+kyGMea1HeBwnxh18O2PPBJhp8uaHHVDIQ+7m+lvko7Z6lWVswpSjb/TPalGJjRnW3s
         a9ab1DoWbvrKpgbnnzjGefyt3D9AEURIDCtYQIDi82iwbazgRFgyE814JwoMbBdpNDpC
         DM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqJ/2ht7lbI+cE9vNUibll19HYg9bvHab40pOiTr8QE=;
        b=wnYGWZqBXUcM6MRZ47gSAaVJhFYNYU77zqficvESQUIq2jLOfSNvPW/PGmtvCZJxaK
         5RLWIbrrnkdUbssk8shl45bVFGvFCuQJVFi1WBGJlE3AOBU3oZySkbntXDCAva+O991V
         R7yUf44Ir08pEcjRGm0xN7jNITewt5f0wf7n+E5En+pZyra5ropE6esvPqgXNBwv8lzp
         DjfhMQqTGFRA/F/C/SbllfOlkQG3+GwBxEnA6nNQ/ABtCnN85VwJLVD5JajaYDSTMe4J
         Wtdi0CowRTUBdylStnDFrlA6HfPfzDZMOi1gwQzCKZbRB2AhrxmsmF79JW4JwKHt4+X/
         zOSA==
X-Gm-Message-State: AFqh2kocIIZj8Y8KlbN6yw8GMplpVuO3dzT4axM9KghH98PwYusRI8LA
        fJetMKuQV7OE0hhE5Un06t2UIAZIIzy58elvmjE=
X-Google-Smtp-Source: AMrXdXuJf38NMjATjxH1GWiammOC66orXHWZbba1E+Cz2zFWGhC7y+RzKSe7O8mRDZePq+Hw0/ACtQ==
X-Received: by 2002:a5d:42c1:0:b0:242:2844:8489 with SMTP id t1-20020a5d42c1000000b0024228448489mr4642207wrr.8.1671761437253;
        Thu, 22 Dec 2022 18:10:37 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:36 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v6 08/18] ARM: dts: qcom: apq8064: add compat qcom,apq8064-dsi-ctrl
Date:   Fri, 23 Dec 2022 02:10:15 +0000
Message-Id: <20221223021025.1646636-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

Append silicon specific compatible qcom,apq8064-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for apq8064 against the yaml documentation.

Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 0da9623ea0849..1f3e0aa9ab0c8 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1277,7 +1277,8 @@ mmss_sfpb: syscon@5700000 {
 		};
 
 		dsi0: dsi@4700000 {
-			compatible = "qcom,mdss-dsi-ctrl";
+			compatible = "qcom,apq8064-dsi-ctrl",
+				     "qcom,mdss-dsi-ctrl";
 			label = "MDSS DSI CTRL->0";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.38.1

