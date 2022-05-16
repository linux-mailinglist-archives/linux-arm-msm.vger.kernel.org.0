Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48062527DA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 08:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240336AbiEPGcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 02:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240326AbiEPGcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 02:32:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFC128E1E
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso985732pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZnGJlvnGMiDx5UJTsjZY8cbmPSUgi63UDEbXgnLRWFI=;
        b=QHdA8yNWeLoobNesmZ6p7lpMmSdLzZ0FYpXrljyxYz590HfGgy54FuWQPNoSu8RkfT
         fxcQBt+3rypT1bV1OTvaUtgh9TBfuN8GzZso8WLwiwsFHwCykBIfbzs/eM2IJNlC+gwV
         oPDbjluvXHurap4X5jOjeT9T+V2CXgUrXB51jGMwVxH/nUZCgt85s64/MPJmtB3jwDd/
         huCSA9lh6XfLV3o12yh80LEW3vFmHJPPRQEemtQsOA46GojLIqxuQdqtnnRwT7P+O0PX
         WiTxF8nze18d/7RwM7YPNzYPS1U8HwrA3MWT+3ceJRvv3NNDNxTxcj2JuZuLAEijW1rM
         6H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZnGJlvnGMiDx5UJTsjZY8cbmPSUgi63UDEbXgnLRWFI=;
        b=I1+5JGpmF6dW3m4u3CO5noXn2OnvRr80jKindQJowRIiNY0dYWQo1ibAW6OfjvCQ1W
         2alzSE3b42U2MJshO8pYW756nRqB1Aa+8MserBycOSxLhVZr1LGLYhqHYDZQp4OMRZGm
         ZI/nJ1HrZlrwsmUsKI5Jalhb+V3Puy/1w0xOxWVGc2/Ks3uKh0sHXbWyOBDBfOcRd7UZ
         WrYw7AuXeEg0X/Z+8EUM9bpfjRcyeheqdUBLM2LaD631+NGiJ1PFvjNj7a2L1oTdgnLD
         tDGsyab0MPMRhzx2VpStD6m2Tc4IKj6AtEfprtylEjfrrzCSqxaCz2wpxl9sPp5Z6mPF
         PUEg==
X-Gm-Message-State: AOAM533MFqNjWscIg4SmTjSS/ZmjDa+YIJnQahuvG+ULoNEOwXQJGRYI
        6ESkX69DVll/o6TwHklkaa20S63agk4+Cw==
X-Google-Smtp-Source: ABdhPJwRDeYx9cR3OoMIgCswNSH0r6L5bJFZWM/OpX2bEdoyy3HWvdyW19fUKUK2a5nOI2m/jrfbaw==
X-Received: by 2002:a17:902:a585:b0:14d:58ef:65 with SMTP id az5-20020a170902a58500b0014d58ef0065mr16394014plb.139.1652682740697;
        Sun, 15 May 2022 23:32:20 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0015e8d4eb1e2sm6053647plb.44.2022.05.15.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 23:32:20 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org,
        konrad.dybcio@somainline.org
Subject: [PATCH v4 3/4] dt-bindings: phy: qcom,qmp: Add 'power-domains' property
Date:   Mon, 16 May 2022 12:01:54 +0530
Message-Id: <20220516063155.1332683-4-bhupesh.sharma@linaro.org>
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

Fix the following 'make dtbs_check' error with the 'qcom,qmp-phy'
bindings:
 arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: phy@1d87000:
  'power-domains' does not match any of the regexes:
   '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 60ab494df975..c5d4c8152699 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -102,6 +102,10 @@ properties:
     description:
       Phandle to a regulator supply to any specific refclk pll block.
 
+  power-domains:
+    description: Phandle to the power domain node.
+    maxItems: 1
+
 #Required nodes:
 patternProperties:
   "^phy@[0-9a-f]+$":
-- 
2.35.3

