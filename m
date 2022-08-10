Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2362858EACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 12:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiHJK5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 06:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiHJK51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 06:57:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2470457256
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 03:57:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r1-20020a05600c35c100b003a326685e7cso1440387wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rBBoEWxQ8eHN9ua82Tfrxn/AgHbyHcDlLzzI2457Jb4=;
        b=ZARppJxhemgKTwWIC/Sw52Je79gLogwCfZa3xsMX4+pztJvzjMpsyWPMnGGxwwsKJc
         t24pI4av8ARbG5YI/59HvPdOarxMarbbV7nzttBqqgrjqW5Jt6NEEpZUAlJY+QEu3wVO
         wKNdv0Q8tCoO1be3Hm4Yv881lUQsZ97TwwlqpkpK+r77wkkhErw9YvizUlXLSNo57keR
         SgkqPLxnMJ2fwaRmpwMbBrD4ofYL2+R7MqY16Gyv9IMaNQ80mPSY0B8lkNGrFI8CbooJ
         uSoEVlv0S1k9VjXck3pkrcFrkRpx8zXkI7p35/4XWKLv17PWdmeOiSkmAqrsaBJNGxXY
         FcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rBBoEWxQ8eHN9ua82Tfrxn/AgHbyHcDlLzzI2457Jb4=;
        b=Ugrjr9L/cEx/Ooc4fQo2D2eu/U8pgOHmRlVnuf7kHf6ni9jOiJVGNTI9MAnMe4NPKh
         hcIvkKgvQppF93C2K5wnYFirKy/KLlhnarWFHbjpD33hivTvlSYMEHa/C7Klyo2Qns/u
         riLXX51NJ5+c4d4rRCYWektt2nebfiW/slOca5oGDhnW7iyewSXg7ADLhwvXm+hcu3le
         ZrwilaSYujxfx8oLaF9FsVJ9zTW/IRpMmANmMbIw/ghXzxBDByDUG8ipgjfrZYMvDCqH
         Bs7ZwIPIumhbbmGKKJ0BML/3iGzLUw16ZVnY0ARbOUspAhdqRiu1e+xnhyNK0ohxSJBJ
         mKcw==
X-Gm-Message-State: ACgBeo3VIxK6XuqRGPMD+U792fpq8EuLs9zOt0F+Y94gc3aJe1GTGPP7
        bX0W+NuEbIOc/OGPuaYIJQdwPw==
X-Google-Smtp-Source: AA6agR6X/DasRxKJOFo0GKArt+c9XMHzAE5Yl9iE5NGz1PN0RYA/FvsiBFrhiIOHfp3DA2/rnbZIrg==
X-Received: by 2002:a05:600c:1e05:b0:3a5:b441:e9c with SMTP id ay5-20020a05600c1e0500b003a5b4410e9cmr1309439wmb.24.1660129044621;
        Wed, 10 Aug 2022 03:57:24 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05600c1f0600b003a53731f273sm2101446wmb.31.2022.08.10.03.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 03:57:24 -0700 (PDT)
From:   abel.vesa@linaro.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 4/4] dt-bindings: soc: qcom: stats: Document SDM845 compatible
Date:   Wed, 10 Aug 2022 13:57:18 +0300
Message-Id: <20220810105718.2137015-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810105718.2137015-1-abel.vesa@linaro.org>
References: <20220810105718.2137015-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abel Vesa <abel.vesa@linaro.org>

SDM845 is a special case compared to the other platforms that use RPMh
stats, since it only has 2 stats (aosd and cxsd), while the others have
a 3rd one (ddr).

So in order for the driver to use the dedicated stats config, we added
the SDM845 dedicated compatible, which we document here.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 473adca4e973..ad6ac0af16bf 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,rpmh-stats
+      - qcom,rpmh-stats-sdm845
       - qcom,rpm-stats
       # For older RPM firmware versions with fixed offset for the sleep stats
       - qcom,apq8084-rpm-stats
-- 
2.34.1

