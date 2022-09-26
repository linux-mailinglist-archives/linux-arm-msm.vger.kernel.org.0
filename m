Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09B4D5E9B04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbiIZHrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiIZHq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:46:58 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30042E18
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w8so9451552lft.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aRzCLHXMgOaE9eO10q8ceG6/cKy5enBoZeNLkXTHGWM=;
        b=y5E7CU+viSgGYDuQVfmynM93lM4s/ok4RfsRLj96f6vxU2am62vtJDUOn0TcXGR34Z
         lWUmKk0BQDNuaQsd6EFd4GLEh8sZ3LiEbaBo2zn3D89fpBZ8tIwEdCF5vjOVuoMk/MlN
         A3Fcmnwh87lUr+RonIFQ25Lr2sMCBJqnqT1t7BYcdVlJP/P4q9pUjBTn6P8m80JNazeu
         cUHj5tJRZU6wHXIl2IhIFhtDOrTORx58xvZkDZ7DDM647K/8tTW7h4UZNg49hkf7BRhy
         D/aiTVmFUcDFuyIftMeWvSnQUVAU5Gjqm2Qdmh12AjmCHTk6NEos6m0QorHxDl0V7VqY
         FdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aRzCLHXMgOaE9eO10q8ceG6/cKy5enBoZeNLkXTHGWM=;
        b=PFajJjFATkVslfBL5p64PVdU+vJ7DTA4gvmNySb2Iqh8rjkblgxJIwNc/e1te3nxOC
         xOz7TUCVwJL515cuZp62g2wiU0M67vRHlZU/S6RKUpEZCgFe4kp6Sy0MJ1Qp0IJf828e
         7OpdO0bJPh5ea3R/7KikN0otmW49nIZw6mUhZYfZ9Md67YgYyaCLDKwnpOHTDve45H2K
         GhE39W9OOrPYTP+Pxv0XspqShFJtBjF4kQCjpOWfqjXDeemz2274RkNOMHiCShwys3z+
         0Us/SMC44IPxTmYnpJ+PrF1dMoJ/QdQFrkXWPlK6RJBnqq5CkFckHlWxtMzvYi4BTqPt
         ln7Q==
X-Gm-Message-State: ACrzQf0/O5vNwOK5/HylgOQtjypCB0BTtm3rVtq4DgRQu1fF5lPRcrwN
        XXVyQLjEPurNHu03Og7giG5Nzw==
X-Google-Smtp-Source: AMsMyM4r869QKG+jb7ZDI/f4dc8N3pWhiTiKDBQa4G5FWbMOR0wCi2rOv08iw6+1hXUMvORg6tSQJg==
X-Received: by 2002:ac2:568a:0:b0:499:fc24:243e with SMTP id 10-20020ac2568a000000b00499fc24243emr7884031lfr.465.1664178309326;
        Mon, 26 Sep 2022 00:45:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 23/33] dt-bindings: pinctrl: qcom,mdm9607: do not require function on non-GPIOs
Date:   Mon, 26 Sep 2022 09:44:05 +0200
Message-Id: <20220926074415.53100-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index f7bd4be1739e..57a4fed55de7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -115,7 +115,6 @@ patternProperties:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
-- 
2.34.1

