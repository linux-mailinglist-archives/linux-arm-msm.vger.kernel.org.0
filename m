Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1B45F66D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiJFMuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiJFMtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:49:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9885CA484C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b2so2529580lfp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cKMxoMSocSsO5VsZPFdHg2+mLP+XhcRFB9IKCKyblKI=;
        b=udKGXSMNCILdZsLC/F6BntSUgRFtqbHMlOe953QCkb/JLcAGDdYK1YS4kmq2AiVFdb
         5COU9yc/EvpzaevV6oAnCycR+INq6ZISFcxZvB3NhZpw5m9lJxcAir4GR1mTYEGwZr0H
         Zpwo4qN1Z8IAiJlb4D1FXBTSLqAkVFd2bGeAL7wvtVN2TZpUa1w+1kZrDaEYRxsK/GzQ
         OC3gi1u5BbvLbmOBVIwaM6CMAwXCFnmU9S8P3iJcIDMi5/DkQPTbRPOBVUxV9h+WSoes
         5lfAFho+BiZLI7Ocom3MBqywq0jBOIfy+egDtzW3D/8lhUTkU6yQlfZdpuXF9i8Z1hZ7
         P3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cKMxoMSocSsO5VsZPFdHg2+mLP+XhcRFB9IKCKyblKI=;
        b=k5zhjpsk/a1bQ10P9sxc5AZaqovEVR7xKg9LNBgoqAjvxZPPWxPj5iW2I++TGVPz8X
         OcRhJ/kKbYaGf/jUozXYOatrl8NieCKndUxZjGJNbK49UAweWR+9fZw3XuBYtNlIj3Ll
         gUFZiJM7ptZDL12/pZw3Y8gQu9hXKO3taCTnHwu1mz9jviJuzM0WJkIkBaD3U0jOLvk+
         7r5iKZknCHDiXQJxRnmetaoN2oqRGmgfARvcnfqvf5cFIR7uCHKi7DU3P2NdnYxM4zW5
         w+DkOrxd+b3dAGArBs5EiaIxo9DjITvQVwAZ9ljbzas4+bB/WLL76xQvHGyceImR0sRh
         Uawg==
X-Gm-Message-State: ACrzQf14hw/uL5TEzxAtOTINje062qA5oAIZ9mK1Oy9ILA1gjW6u7oaY
        fblBwPzxB41zej0X7xKhoXhe+w==
X-Google-Smtp-Source: AMsMyM6Jx6AgIqzDgCQx6Wf9jbP5Ky52KZuyn5QoRnizbXI78+nvIUwxPXEXksx+Ucg8TPkRlBpi3Q==
X-Received: by 2002:ac2:4db2:0:b0:4a2:260e:6404 with SMTP id h18-20020ac24db2000000b004a2260e6404mr1878065lfe.484.1665060449543;
        Thu, 06 Oct 2022 05:47:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:29 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 24/34] dt-bindings: pinctrl: qcom,mdm9607: do not require function on non-GPIOs
Date:   Thu,  6 Oct 2022 14:46:49 +0200
Message-Id: <20221006124659.217540-25-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

