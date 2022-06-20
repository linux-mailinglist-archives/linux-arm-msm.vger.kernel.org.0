Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0014F551159
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 09:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbiFTHTr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 03:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239298AbiFTHTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 03:19:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A93DE93
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:44 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t25so15789787lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6bvUEn6qypJ14chus2BifgRfhxhpHO2Z4eDROe6Tio=;
        b=cU0V4GhxLauV0I9UAYDd6ZUv6dReKOj+lm56z6EOtTAD+a2XnRUeOT3vl1QgPCWmUE
         VHyBdieUBRRYps9joSpraYJn0YED4Hqym74wcFpE7OTT7eArhaaRV60wrdG+xlp0GKeh
         DMUqMcIDMZ3iig/qkvlB5K+8MbmXu4ZRlI7GTmz3IvaYFKzV3+rcTWLK+0/Y4gEWuAwn
         NNW9PtJP+3ZPbgnzM53IaYFhwUqX+/h0pr0PhhNMXShL9rSS1/Pn3vMqOQRSSgpj/8m+
         oZko/WfwVIbrSw8v+jLhTqiEkf96ZpF/b7NbPOKox2b0u/wORrb9hMJs4ToMeDucFvRO
         0mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6bvUEn6qypJ14chus2BifgRfhxhpHO2Z4eDROe6Tio=;
        b=4FRuwcLbEk0HgDtKgjJYDEpqZnhqtgT9rKAFQETzTiUXofcfOqrPKo/W/JXmKGtK44
         JjUVrki05ARfOpuBqLY5m4ag3tekmq8g/TIHMXIqrKPwEuAGfwQCpj8MyXUJX+BfVlM5
         RADMgt38n3CMlVuF2xIR6QLDRiTuOXhXPvxSAcFECFzlZaPe5UiNo12dOT6viI2qhthm
         PSEmT0USX8vB1zASBs5Jnz7FCK6iZpX1ayUQDJ8vSYmGbOC7n4bdofyIPPBgpJ5a4Oi7
         MR5biemTQPF6FPCqe5u3Rxy1dze/XJ+Z+R6vOr9g67WXdDkiLXF+Ihqh25/5uIkfO9nQ
         z1Fw==
X-Gm-Message-State: AJIora85bMRDTXX6TnWv+VHWNpK0nrbNtyCiXQV8m6i7PF596nX3l52z
        u5OaECyObek6nE26IsYSakBN2w==
X-Google-Smtp-Source: AGRyM1vfDDWChutVQ0BrQ2EpbIXvlsf8K/734M2hL4YoT+p7oDTvO+G6Cx/OTk+GdqhLEblnGFo6Qw==
X-Received: by 2002:a05:6512:2302:b0:479:4005:3278 with SMTP id o2-20020a056512230200b0047940053278mr12787535lfu.621.1655709582862;
        Mon, 20 Jun 2022 00:19:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t16-20020a195f10000000b004795bcfe953sm1649775lfb.214.2022.06.20.00.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 00:19:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: msm8996: add xo clock source to rpmcc
Date:   Mon, 20 Jun 2022 10:19:36 +0300
Message-Id: <20220620071936.1558906-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
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

Add XO clock source to the RPM clock controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6c7380f86383..f7a69ed05968 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -463,6 +463,8 @@ rpm_requests: rpm-requests {
 			rpmcc: qcom,rpmcc {
 				compatible = "qcom,rpmcc-msm8996", "qcom,rpmcc";
 				#clock-cells = <1>;
+				clocks = <&xo_board>;
+				clock-names = "xo";
 			};
 
 			rpmpd: power-controller {
-- 
2.35.1

