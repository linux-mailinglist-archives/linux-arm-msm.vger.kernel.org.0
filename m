Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F097550AB21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 00:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442292AbiDUWDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 18:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442282AbiDUWDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 18:03:06 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466886380
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 15:00:15 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id o5so3920952ils.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 15:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIHq2HBsS+ZlB23O6YtXaEYLRUQW5zEReATcoEJZIY0=;
        b=OkILIFJawVdCBAVXAHQ5aob0jZA9/JcCTzLA5VWm0f/o9yq/CSRMAz4BXAefcn/E42
         O7UZ1mU5cVXUi5+yf3bOk3Doj7RtPzkRbDGNS0SwVIQ7rVegacd3HLx40BaawzGYEA2y
         xB3ww39TE92n9bU+gB3DppgExpQk+efjMDfVjOdtqBuLAUkZqIJlvSE7rjRWqxsvg48t
         97dywKlYM4Ujf0zlf/O3xbwuDw3QkIPXqyxrda5siJ077oOO4FWLy6J1KWEgEfDoAwTP
         UCN776iUQ+kBCHWnWkVDEMf0fd/aP+0OnGkKwsCv9Yx0POcvPD9DY2c7ihjjlEMwIKhv
         1Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIHq2HBsS+ZlB23O6YtXaEYLRUQW5zEReATcoEJZIY0=;
        b=3MMy8tT+mwUaIsTSOD8to7V9fvTJ0u5O7luf29dS8SfuD3pQHJ1szWY44ghOAYewOJ
         KYUu+ls/rpVaIlABCpTkZRkrQDSgszrW7uf7gDA1d0oLTGXzayzjTX6Qp2nw237PYX6n
         gKBrSZ67JNW5giXpExa/3zz3WVHynNNtrN4wbTl+t6NQT4/2Qq6G5AIJCy3csW3nbiiM
         Knzws3pPTtCLOU6+HHIDEG/kiLkNPYX/wbYg/IIKZ4TQkSlxXRf/pDr5MMUJHtTUmnAH
         zCNsXfRIUoSTTb2oevExeUFb8XVH0Gbm199EAimVS3SbOIbSRqCus/HmOHxuaDv+qTI7
         wUHw==
X-Gm-Message-State: AOAM532ervxTUCThlWsd+3vgBSuGLkv72EvTIGmRhMVG20KZEyHxgykf
        ck7PV41kSDfkZlkxWjaolVwzaw==
X-Google-Smtp-Source: ABdhPJxaSqfXHM91aIvANNIy473+2/lzjSbIvRVcJJul+wFSYCHe+1Wm0W1PZp1VaC7alqidY2kPuQ==
X-Received: by 2002:a05:6e02:2162:b0:2cc:2a35:f3c7 with SMTP id s2-20020a056e02216200b002cc2a35f3c7mr746447ilv.184.1650578414656;
        Thu, 21 Apr 2022 15:00:14 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id q7-20020a92d407000000b002cabbe6e295sm148806ilm.4.2022.04.21.15.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 15:00:14 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     stable@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        davem@davemloft.net, elder@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: add IPA qcom,qmp property
Date:   Thu, 21 Apr 2022 17:00:11 -0500
Message-Id: <20220421220011.1750952-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
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

commit 73419e4d2fd1b838fcb1df6a978d67b3ae1c5c01 upstream.

At least three platforms require the "qcom,qmp" property to be
specified, so the IPA driver can request register retention across
power collapse.  Update DTS files accordingly.

Cc: <stable@vger.kernel.org>    # 5.15.x
Fixes: 1aac309d3207 ("net: ipa: use autosuspend")
Signed-off-by: Alex Elder <elder@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20220201140723.467431-1-elder@linaro.org
---
Enable this feature, now that 8ff8bdb8c92d6 ("net: ipa: request IPA
register values be retained") has been accepted into linux-5.15.y.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 495c15deacb7d..de86ae3a7fd27 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1460,6 +1460,8 @@ ipa: ipa@1e40000 {
 					     "imem",
 					     "config";
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&ipa_smp2p_out 0>,
 					   <&ipa_smp2p_out 1>;
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 692973c4f4344..b795a9993cc1b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -615,6 +615,8 @@ ipa: ipa@1e40000 {
 			interconnect-names = "memory",
 					     "config";
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&ipa_smp2p_out 0>,
 					   <&ipa_smp2p_out 1>;
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 3d32d55818168..9ffb7355850c7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -736,6 +736,8 @@ ipa: ipa@1e40000 {
 			interconnect-names = "memory",
 					     "config";
 
+			qcom,qmp = <&aoss_qmp>;
+
 			qcom,smem-states = <&ipa_smp2p_out 0>,
 					   <&ipa_smp2p_out 1>;
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
-- 
2.32.0

