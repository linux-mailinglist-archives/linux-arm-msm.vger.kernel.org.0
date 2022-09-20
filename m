Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF24C5BF067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiITWnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiITWnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:43:35 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF106CF4E;
        Tue, 20 Sep 2022 15:43:34 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id y141so3634043iof.5;
        Tue, 20 Sep 2022 15:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9a2wQGNji3boWcvaNVrwZhkiyGjSoKvaRS3Zd386lDg=;
        b=g6ERxAhf777weg4HEcFO40b1tz+J4XhJtUghq+25u9skBlMQ3/MHI+uQtBlNUCZqRl
         jsIfdDiysRbXghXVyHc9NDzy73aBb1NeUurfeHlP/m8AHPr6JtY/bLXSSgdUl6pTd8n2
         8r+E6+FuJ/VwTaA5r4m5rrDQCIlEchJtvNtn03E9nYVc6xKOCp+BsW5bA95YoV4zjo6s
         FGWGZRr+2VQS4aWXx7H8VCUiWDzoNihyHMiXx7LHzTB1y/Xllu14Moc+rAWrq3NCtrl3
         mny2ijsDkVmGh+t09web9vBPf7h0z7fTqOavIBwxhilQ3H7Fsj3vGUGCmyZebW1jYRUO
         H7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9a2wQGNji3boWcvaNVrwZhkiyGjSoKvaRS3Zd386lDg=;
        b=bmGr8YyVTs1JfedV2VKCeuosROFaWmscLHJmYV//GaTWxFM6Z4VTPVUn4JS2HWEWhQ
         UKE6xrt4lABnf/PeuTM28lNMleh3vrCPpuoyrdn0zlbSNXmJvLsv9YVv1yc2sQKcZK4o
         Ve7rt77n5OskKNiLcn0eeKqCrkHawC7C9qfv6FWbHCf91h3Q06bdhaOHlunt4Jcgk7QP
         bC5/8lgqW2L2FxIKlKTx1l8JVdlnVRuiBOemxYQHqi4dQvQMvUIu2OAfApIOzfGYQEzE
         KOrxyDyLx1i1lYIUnlYVRDzPRTd14gsz9otyhuE/qMpwaas+53YbPq243Wn6hKLkZw/6
         3oaA==
X-Gm-Message-State: ACrzQf2mIr7CHtVabS7eqPJtStpG3TKOMz0wrBbspF4phoKPJzI6u5lp
        dcXe34klb+VFDa05QaHq4QxOLtwV1pU=
X-Google-Smtp-Source: AMsMyM7beyr+muSO5TPlz7inBaw8v8504lIvag6iEzHC99XHPuDOQfWPanu/0+ozVGnJSr267jkepA==
X-Received: by 2002:a05:6602:2b06:b0:67f:fdf6:ffc2 with SMTP id p6-20020a0566022b0600b0067ffdf6ffc2mr10543707iov.111.1663713813879;
        Tue, 20 Sep 2022 15:43:33 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id o13-20020a0566022e0d00b006a28964dc6fsm449473iow.7.2022.09.20.15.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:43:33 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: usb: dwc3: add sdm670 compatible
Date:   Tue, 20 Sep 2022 18:43:19 -0400
Message-Id: <20220920224320.152127-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920224320.152127-1-mailingradian@gmail.com>
References: <20220920224320.152127-1-mailingradian@gmail.com>
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

The Snapdragon 670 has DWC3 USB support. Add a compatible to reflect
that.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index cd2f7cb6745a..021bd9ba4261 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sc7280-dwc3
           - qcom,sc8280xp-dwc3
           - qcom,sdm660-dwc3
+          - qcom,sdm670-dwc3
           - qcom,sdm845-dwc3
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
-- 
2.37.3

