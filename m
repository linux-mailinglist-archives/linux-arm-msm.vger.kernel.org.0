Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D75B54CAA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 16:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355309AbiFOOAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 10:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355295AbiFOOAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 10:00:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C11C381BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y32so19065796lfa.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hmuYPwQa1jhocO5psPDczMcPAlt9oeSQSumJCmiaYKg=;
        b=V0SMWQZDOrXALeVCBqwaWCFd8WspAVe46SWqzAh0uKYFL3AO2cwoYOo6q2NfimIbkm
         fy5YkUIoVpm8oYmkOZvm7OQ3ZEBjvcx90eP+IyjfnUfO29Xj6KSX8yILvA7s+xMCP17H
         XX7SQJyodlNgfTbVdAE99X8hWXTw3Z7mQW3xREz5H9qpPk1HgMyiIh+8eIhOTDRqbgv+
         0IliZuz1rzXjCjAgNEJZYfBxdbJue15Ch722prREzLoCHVX3f76cbmXvejgkTnuyAPo+
         F0IBJFgr/Lw8r/K29/fD6RUoSB/bB6WOsEU2zrWiNtI+VF2zEOdgahdhx/sj3wIklgqA
         yXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hmuYPwQa1jhocO5psPDczMcPAlt9oeSQSumJCmiaYKg=;
        b=5jR47llT1VJh84NS6YE39hbfdHydAmp4gwtA3UNi0X28gzNKmaxIThRuPZU5mczILl
         wOt0khh5f0GRvCeYObpNb5N1XzL7K4vlswDrWGYjyJZ6azmHh3QfSHwGoS+JeqlrREjC
         RWAclh3AWynNPk7CmLlqiBddNLSGoV5np0M/wFw98vf8l5f6I2To5Q/no1yxV7Cs62hf
         LRsF2VdX8DtvohSJXywis+EZM5LSPIphYTGvm7jiTcbHgcgZyxGzl6nC5p4WM26LTbeW
         eCEYh4Rm2FqNBw4n6MiWosUHo7H8T1af6Kjj7b6IjoOtIGItYRvvOVB0UvTlTqVxw23f
         mcRA==
X-Gm-Message-State: AJIora8+RKRDbipdoim/qYCryIp0ZSG8HH5/SBYPI5XPn3BockGyuoHH
        ZHrNIWBWnZQmEDqHaGBnHbZxrg==
X-Google-Smtp-Source: AGRyM1vkiSlaaS7HgWsdKdlvAox15z9dfhdTJCVxZj4b6ETZ4bWDKdP/yXoUuylqR7yIVkSwvpR1bA==
X-Received: by 2002:a05:6512:3992:b0:47c:48fc:3c62 with SMTP id j18-20020a056512399200b0047c48fc3c62mr6374831lfu.102.1655301580930;
        Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] arm64: dts: qcom: add mdp_clk clock to the MDSS device
Date:   Wed, 15 Jun 2022 16:59:35 +0300
Message-Id: <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MDP_CLK ("core") clock to the mdss device to allow MDSS driver to
access HW_REV/etc registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..3d8ecfe56fb3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -773,8 +773,9 @@ mdss: mdss@900000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			clocks = <&mmcc MDSS_AHB_CLK>;
-			clock-names = "iface";
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_MDP_CLK>;
+			clock-names = "iface", "core";
 
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.35.1

