Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03761527DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 08:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240318AbiEPGcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 02:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240312AbiEPGcV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 02:32:21 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B096728E24
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:17 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso985624pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jdmbUEtqc6R+81RJjn7yVPjYknzOyR+oSn5z7Aqd9e0=;
        b=OH/1ky2VLUE2JS1lwgNAgz7VzWT3JSE38g+I2NFeWPMCH3lpuj0/n7IL7mhhoIFM+a
         LxNU01lpE0Gvd3GFM11YxCrbG8ud8lTtM739fvPEUU9upSV0QMrvAME9ApZ48FFFM80b
         PZKVE4puJ/DgiqPqkQ6cX8JXTZoqwaZ9+tBaiLhHQkciGp66v6+uANjn0asf9Ea5HaU7
         1tRSQB5uIuQsyiMyEmNrtWAxTBY0FxW8LO2IJahyrgf/CzFd0oBB2mUVn87oYb/IWzZY
         Z1Xyi3YwigWdmbO/vfrTq4wAQPN3ff3uC6ec6MBjR0M6zUYLSWECCyYJZV5aMopuvWUs
         LTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jdmbUEtqc6R+81RJjn7yVPjYknzOyR+oSn5z7Aqd9e0=;
        b=tmelKE01oRkb02+Wn5y3YcRC9hYWoKrTxrneSPaJX9EPK4s1O20OW470jWxyX/V69b
         zQKpw/g+udzxp0K0tItjOFRCuI7TI2qbVer/AsAlnXsByVR9yHTE796enjNbeSB7/yV3
         1Bg9/1A+/VmOKRZgubSALUtOzHtFU6yIa1Gqx21tRbkWoQ2KFWX4HtCfSJxJ4TXnuYgS
         Gc5iaery4bsc2zlaov48CWErT62MXyB9QHf5tkNkk5eusZldwJsoc6HjO0H2EZb/3vt3
         1+ueeBSoP2OCzIQMv6Ms98At2P65WC7Fr0PE6eZj66v7XpZN2JCx7nN+EE0bwkBB2CPv
         mRlg==
X-Gm-Message-State: AOAM531YIP/tLHQVO72T/vPAIYv8x/mIg/mRuvhAqUyxVqaqW6CkYr20
        QC9gluxbWKgyl2XiiYatVSw9bAbGa3C4eA==
X-Google-Smtp-Source: ABdhPJxCFLmPGA6bODEQcTTvzOch+nxeO70Q+PGp3WF7oG5Mzni+CVw4ui0J66Xm0GpgK8Rj3Vm/Wg==
X-Received: by 2002:a17:90b:1a88:b0:1dc:8e84:9133 with SMTP id ng8-20020a17090b1a8800b001dc8e849133mr17692222pjb.231.1652682737013;
        Sun, 15 May 2022 23:32:17 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0015e8d4eb1e2sm6053647plb.44.2022.05.15.23.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 23:32:16 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org,
        konrad.dybcio@somainline.org
Subject: [PATCH v4 2/4] dt-bindings: phy: qcom,qmp: Describe phy@ subnode properly
Date:   Mon, 16 May 2022 12:01:53 +0530
Message-Id: <20220516063155.1332683-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
References: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
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

Currently the qcom,qmp-phy dt-binding doesn't describe
the 'reg' and '#phy-cells' properties for the phy@ subnode.

Fix the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index c39ead81ecd7..60ab494df975 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -110,6 +110,18 @@ patternProperties:
       Each device node of QMP phy is required to have as many child nodes as
       the number of lanes the PHY has.
     properties:
+      reg:
+        minItems: 1
+        maxItems: 6
+        description: |
+          List of offset and length pairs of register sets for PHY blocks.
+          There are two possible cases::
+            - tx, rx, pcs and pcs_misc.
+            - tx, rx, pcs, tx2, rx2 and pcs_misc.
+
+      "#phy-cells":
+        const: 0
+
       "#clock-cells":
         enum: [ 0, 1, 2 ]
 
-- 
2.35.3

