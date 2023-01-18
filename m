Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45CE671265
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjARENB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjARENA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:13:00 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201695420A
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id mg12so7933502ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtgeP4k9eFblzUy5A6cy5yXNyt7qM3146bzTga5tf9g=;
        b=xEc9iv6USW+GwYishRYCnYHaT95I76S8r+qCg4l+SQRdIcF4YzVTljA2BXCaHHr5w7
         RjanFD+HruPrulNzHGm6jxD3wb/KQ6RQWDE9gP+jD1VDYi3L9H22keCSTWQL8SrdxbPx
         7OuKfw9nU/lbnfGOcE7hOLkWeUaVyJhoNit59NWUPqpOpcUtCYyM9/m8txtj/MGRyWgN
         I+ZGy/nz2rKwJFcHPgbi7WXBY7Bbh7QpSnznvHQM2zXCkwqXkPkxaFLFVyCaECTEVguQ
         TQ6wFe+bQzYsjyt0LagbtrXRXmV3sKuWGe302tJQBAYumoRqwubYRl8CCuuSDsKeQE03
         whxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtgeP4k9eFblzUy5A6cy5yXNyt7qM3146bzTga5tf9g=;
        b=5hp8WMxxkIr8+lrusKG6EVOeW5kC5bm7vM6r3MJx3iAJtcl7h2hC+nHy/BqOgsiL+0
         g4N4eL3ipiR5yI+lhrY5zNeD3k1TgZplB77CwRVOCvumBWVNIA3lwl0w+rkwAXBYum2B
         Us1AewWU/MInjG7kdkbApxu51bw6W6+K1U/wjWZCHLhFhKPJIGFSCtd9f9iX7U8Y6nNd
         ovkMS0Lpb+iAhBVZmTHmS/gTnfwINEq5XbxC7fZ/fS7e2W+7+N8bkXgHXLWQ2Y/I0NMe
         0WsoOwO4PPGudPa4dE4V5o59UP10AWu7f7e2dmnk8MEC7lrws0GJyy3pjozFay9az6rB
         B5Kg==
X-Gm-Message-State: AFqh2kpv534qjg6t7OzpImqx5ahFORmnaQuETESUXaYRKxBYrJlujfKy
        G7hj34HxU/Rym4VOoXn7+USsrQ==
X-Google-Smtp-Source: AMrXdXs2/KeT90CimT7QlYkAJfxMC1Ld/1+/BywbxaUMdnZRcYRQawlXyISysPQrfDFkWJVKZdEdGA==
X-Received: by 2002:a17:906:eb13:b0:869:236c:ac43 with SMTP id mb19-20020a170906eb1300b00869236cac43mr5678450ejb.32.1674015176664;
        Tue, 17 Jan 2023 20:12:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:12:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 09/11] ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
Date:   Wed, 18 Jan 2023 06:12:41 +0200
Message-Id: <20230118041243.1720520-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index ced62937165a..ec0c526d0483 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1556,7 +1556,7 @@ mmcc: clock-controller@fd8c0000 {
 				      "edp_vco_div";
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

