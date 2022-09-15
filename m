Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24ECA5B9EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 17:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiIOP0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 11:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIOP0g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 11:26:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C82046DA3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:35 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id p5so22623842ljc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ShH33aamXq9yto+qDd3gy7jLR1LtKFm+0b8TRMJLzK4=;
        b=YFWFr5daZj2g9Vp43zR/JwG7FmRQ/yZekyQZpQMhC7/uQ2St1Qvg1h9/43Fk7ZcGE1
         zMnlVKYc9zrnjve2hZSLvJdFSOYSxWDu+8YgoeMV0cKjnWxpUEm3jZz2+iKAJXwdA720
         xi+54LwC56EbA1lT30jpO4uxtnYgonpzHMCslqCjo7kmkfoV9jIBH8m2wIETz7oxmniD
         wXdB+YpZgdjSVw2PCah1nMF9flSsT4jVOgmiCG4adeVWyR3p5XpmycgIrVVlHkfUWud9
         ei4umdv3rjAIZbsZ/6aHYmsq/qfYHQqdt1eVP6M0NXMVnVlwQ54TvyxghouEYhlLKniQ
         B5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ShH33aamXq9yto+qDd3gy7jLR1LtKFm+0b8TRMJLzK4=;
        b=50KRAf65TWYRIMvArv4sYdbZmBOheNWPWBCjI1RLvxLVrqoWAyod5BmsrzwMbuKSw4
         Og1ANWqw0vj5RPIthjRvleFE890qtlnZc0/scEXYEt8a/p69TwYCREJqGScu4x1sTqp0
         nfyKzayoPxoj0GwVWnqYeY2ijkPvBQaNMlNju/GMdNfeG3b6Qr7pSsT96CQfr1Fy3qcR
         /qlpP4pNg9qWmnb/nQ8rlCwX5leeGHE73JNqLssAjJdGZm48vxqW//sDMJ3Qg37gNzi7
         c56o2WuRkYHPx9whMhwhJvxYOCh1Q+YYEdOkawA/jJBtTUyYhD0D9NJPctqrc0GIJpJA
         X+bg==
X-Gm-Message-State: ACrzQf0t0UZPsG2sz+nuQ6AN5Swi4JZMbujcgGLNo3Jkz8Yh3wcbDuGd
        rSlkehlvlmCEdfTHx8x01AoKCg==
X-Google-Smtp-Source: AMsMyM41G40bb9FluFMy68AvJjR8J3oSxdOVFoeHyOW0der1L5+mtmVxBp/Ifw7BwMmfMohMf1VOgg==
X-Received: by 2002:a2e:921a:0:b0:26c:1166:6666 with SMTP id k26-20020a2e921a000000b0026c11666666mr97063ljg.128.1663255593403;
        Thu, 15 Sep 2022 08:26:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b00494813c689dsm3012653lfb.219.2022.09.15.08.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:26:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] arm64: qcom: dts: miix-630: correct firmware paths
Date:   Thu, 15 Sep 2022 18:26:26 +0300
Message-Id: <20220915152630.133528-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
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

Correct firmware paths for the Lenovo Miix 630 to include the SoC name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index cf81c33a9d7e..a105143bee4a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -28,8 +28,8 @@ keyboard@3a {
 };
 
 &remoteproc_mss {
-	firmware-name = "qcom/LENOVO/81F1/qcdsp1v28998.mbn",
-			"qcom/LENOVO/81F1/qcdsp28998.mbn";
+	firmware-name = "qcom/msm8998/LENOVO/81F1/qcdsp1v28998.mbn",
+			"qcom/msm8998/LENOVO/81F1/qcdsp28998.mbn";
 };
 
 &sdhc2 {
-- 
2.35.1

