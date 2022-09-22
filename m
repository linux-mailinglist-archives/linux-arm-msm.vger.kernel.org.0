Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208CF5E58C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 04:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiIVCrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 22:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiIVCrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 22:47:07 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E122D74CF8;
        Wed, 21 Sep 2022 19:47:06 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id g6so4216715ild.6;
        Wed, 21 Sep 2022 19:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WoZ4RDOZgigudKSYtBcln06ePKoB/qb90ltGorNHgrA=;
        b=C0mWmEF7enhCNnu0b6IXzGfZld2kFsyA9FpxZ8Nt4QMVxRvW7O/0zFJDyupmNegGF6
         fIv+gHcY8ETuRfSirR/OeWLgRUXmMVBizLCZLjhocuN+fgXZwpTge+T/sG63BF+p/ukF
         fvJPqiOwOfyBIouISgAxOJYroLCkX20SYtSZocslxiDjshy4Mm6rNNiLaRj40xmsS22B
         L4k4vR+cbWzjtubky7SftsjZbkXzUHiFrrv/Sox5lThElbJvdzYwm2HqXDbd5DqERyXz
         pgBuqgThN5XeHaBmE+MW8LPUWejovp2eLVGqUtcRNfdSrLB47fwycO74BgDVggoWhbRT
         bb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WoZ4RDOZgigudKSYtBcln06ePKoB/qb90ltGorNHgrA=;
        b=hejL02ARSFFpaBC9mSDtY5a8bWSehdRmsaJRcz0mnp+TIaG8kkYTfWtqRrxowm51Ld
         lhRJz1idq2nYNb/OQZycL+50dSyxPAwKxs3YHHUnRCQbkKdbOudEXITbZHkMhRIjfOza
         /FJdEe8TSdF4XpEy3wiAgG/DzJkpRfhne87LJOiIJ6IyBeE9l2+EtCvYp+vkXB1/E5Kl
         NMXOJt2h8eYF2elbZYHHcjz/+CtFpaYeTMnVJUS0WAx2kBQaJjzZhenJdF5Y6M89qCi+
         uFFVDOcar2fn7pjBwItuoiLbiqMUffrOtqSCYZxjbfqz2DcTA2f4S88fL01d1o9qpZvB
         zHXQ==
X-Gm-Message-State: ACrzQf0k3rizRXt4aAbiCFDDr+u+mP91xjSx5PLo9zmSjelhIBoZVkBJ
        pebcN3w1Rdm9riAEGtNoXUkN3H5OnpY=
X-Google-Smtp-Source: AMsMyM7tmXGbLK9y74NKX0eUYNRuAs11QWEVR9TseHgKDUbjdoCvt5Z1UZt0hXpFuLtK3fQhU2M0jw==
X-Received: by 2002:a05:6e02:1a41:b0:2f1:cc2a:69d3 with SMTP id u1-20020a056e021a4100b002f1cc2a69d3mr612756ilv.46.1663814824862;
        Wed, 21 Sep 2022 19:47:04 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::61a4])
        by smtp.gmail.com with UTF8SMTPSA id l2-20020a056e020dc200b002f1a7929d67sm1575139ilj.72.2022.09.21.19.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 19:47:04 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qusb2: document sdm670 compatible
Date:   Wed, 21 Sep 2022 22:46:55 -0400
Message-Id: <20220922024656.178529-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922024656.178529-1-mailingradian@gmail.com>
References: <20220922024656.178529-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 uses the QUSB driver for USB 2.0. Document the
compatible used in the device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index d68ab49345b8..636ea430fbff 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
+              - qcom,sdm670-qusb2-phy
               - qcom,sdm845-qusb2-phy
               - qcom,sm6350-qusb2-phy
           - const: qcom,qusb2-v2-phy
-- 
2.37.3

