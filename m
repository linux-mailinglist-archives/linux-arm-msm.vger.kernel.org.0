Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31114FB04A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 22:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243965AbiDJVBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 17:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242351AbiDJVBS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 17:01:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D5FCE
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:59:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o2so1767685lfu.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6jtqewFPMsxnLjGRnErtncZ30YDC8tDjxZxlMXPLk1k=;
        b=b31gxl0p7pDzLjWYuQWUCcocGXkIuaDYEIxiXTYx8MAUFYT5GVKk03IMvs1DUtlhW8
         WnOBB0UdhVURZL8WDkXRrIakCKAil4yerDxydVUcFhQZ4IZK/kiNs5istDSQbeVMFeSt
         Q2RFwHyjzXYi5Eqkz/t98ekU0aJuLtbfes+uvIMl43pIoJhnk9zD89bsa9TSTaRn89F9
         4fb30fD6DrR0nyLSNw/Gl5SkVmCc2OqDm99QkHwzk2K0quO4fzEbsfOSn2WSq1gZxa6v
         7uwt4Eq4PU56+PjhzDuP+n/F9BcKt0JsvNVSxfqSo+/GQNyZpabgQ0IXmps5Ae+u4tkc
         BRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jtqewFPMsxnLjGRnErtncZ30YDC8tDjxZxlMXPLk1k=;
        b=Tfxzswtvef5ys+pD5xpRg5APX5/mmMbdvZVjMf4kALkt/4BO2A6r6QRNAZrAZbYe4q
         PXMJhqH4WUDmjb0H03qPXN/vwG00yIpmFTTM0kbm3M0Dk5hQNGbuavbpGoKTHwqUTYtf
         XHrVXX9Rh98sfQLk+ZaGbmFp8LnnXZfLng9OJgzxbtQFG7Rta7t9VQXTgB/8TmdxN9Bu
         CMQl3dzJ9GkmCzuBmyfq5lvcHD2flheM0ay8JxLjORFzsD5mN3iPodY767KcESE04fsO
         psYvy7GYIfnd5MbJkeNkttj3fvbGEdUAerVATwmDDXgnAe4KajsodaUXen2JSNhLY56h
         NSfg==
X-Gm-Message-State: AOAM530JakBEfE/ISIZRmAeu+N6L05ibfXFLV7KtXGyl36Xmlrbe3qB3
        vY1aWVTtmHzfZl/8ww1XTsLdLg==
X-Google-Smtp-Source: ABdhPJxWfLcQpsBABdPNsAn/Ia2SJyLFTsSMG9tMe9PdWxcG5stcJt9dz4RSBFKuhLUSd+1evy9yWQ==
X-Received: by 2002:a05:6512:3b28:b0:46b:ab15:9f2a with SMTP id f40-20020a0565123b2800b0046bab159f2amr72308lfv.588.1649624343555;
        Sun, 10 Apr 2022 13:59:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17-20020a192d51000000b0044a5a9960f9sm3114809lft.236.2022.04.10.13.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:59:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8450-hdk: Enable remoteproc instances
Date:   Sun, 10 Apr 2022 23:59:00 +0300
Message-Id: <20220410205901.1672089-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410205901.1672089-1-dmitry.baryshkov@linaro.org>
References: <20220410205901.1672089-1-dmitry.baryshkov@linaro.org>
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

Enable the audio, compute, sensor and modem remoteproc and specify
firmware path for these on the Qualcomm SM8450 HDK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index f0fcb1428449..34e37991c0c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -349,6 +349,26 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&remoteproc_adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8450/adsp.mbn";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8450/cdsp.mbn";
+};
+
+&remoteproc_mpss {
+	status = "okay";
+	firmware-name = "qcom/sm8450/modem.mbn";
+};
+
+&remoteproc_slpi {
+	status = "okay";
+	firmware-name = "qcom/sm8450/slpi.mbn";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.35.1

