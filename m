Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3BD36C966F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbjCZP6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjCZP6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:07 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4992C2684
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:05 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id cn12so26268911edb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyLCht8TNRnUX7p2EYn/oBPcd6Y0aZ5KmJDvg9ZX57o=;
        b=e8IvbxH1Rdw49bNrp4shsk/uu+3e4Ey46C/v9DnLgkj6smd/dzTkn+i+s1GeUXW/7S
         /IAgKRbriiGrkBtwb9ZCBBQCkZ++oyNHEszxLlhkMsIXCLvG7aDMWV117BvDgOTXK/4B
         ZoLCBQZSWjswV4a7HnuW+s9q5syfWyev3eTzDp4JeWNGhtWlMj/bXmHv3wxQcl/toTgB
         QK/+dLVUj6aNkqOgSk35RJfH7YtTB5muJ54Fpvf3Vn3gCts21aBjiqraln6nlBA01wja
         gl0Te2jg+hK/+jxI23/tFkapJtrQOIJorLyau4KjKvMDIX80dgc4SYqOhDUWzcaIThYL
         m0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyLCht8TNRnUX7p2EYn/oBPcd6Y0aZ5KmJDvg9ZX57o=;
        b=ySIB16Thop/tSLhO/0Sj/zrm4mTBsyucjLut2DTU6q+jldHo2OpqE3HqYFNSK5PUbl
         +lJRPOQZCmIyALlkuxoJDNZSWUbzLUg4Y+PnzFX1dXl3CqVF0sVzNFlviSj2qHBnidGp
         Wl1odKAuiqNk2K6OvbAcPdN1OcL3h6uK4xDVqTxxSJ185s/xeowc8RLBb5hBCcZJkpoJ
         QGawtTRUewFul6jg4Z3tSQLS6P/ysIZFoHNMe6frt9ajTWs3gNrO+bRj0kMR6uamjk4s
         lyKnrWFYo0FsPPqbiRmk4VozViRPSiA0k0HUPiI6gfEAaek0Fr0U7kxN6ex/drDLzs9q
         Vgug==
X-Gm-Message-State: AAQBX9eZ3HgDkLE4kwuGJ08ll9+NbjueHGSOgIPPNz/m6qQzP2EDQWpi
        uheqH0gl9xyS4PWz9aMWwKtIRg==
X-Google-Smtp-Source: AKy350aHEEyABkXTDWn2NnrApgHJuDjGRPb4mtfN9cFn1b82zdfPUHvY32QJ1b1oobWqW2Q1DKW3dg==
X-Received: by 2002:a17:906:eb8e:b0:885:fee4:69ee with SMTP id mh14-20020a170906eb8e00b00885fee469eemr10498992ejb.59.1679846283813;
        Sun, 26 Mar 2023 08:58:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:58:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/11] arm64: dts: qcom: sc7180-trogdor-lazor: correct panel compatible
Date:   Sun, 26 Mar 2023 17:57:50 +0200
Message-Id: <20230326155753.92007-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

innolux,n116bca-ea1 is not exactly compatible witg innolux,n116bge, as
they have their own driver data.  Bindings do not allow fallback:

  sc7180-trogdor-lazor-limozeen-nots-r4.dtb: panel: compatible: ['innolux,n116bca-ea1', 'innolux,n116bge'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
index 235cda2bba5e..7f01573b5543 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
@@ -23,7 +23,7 @@ / {
 /delete-node/&ap_ts;
 
 &panel {
-	compatible = "innolux,n116bca-ea1", "innolux,n116bge";
+	compatible = "innolux,n116bca-ea1";
 };
 
 &sdhc_2 {
-- 
2.34.1

