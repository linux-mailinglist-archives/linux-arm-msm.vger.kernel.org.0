Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833E1634AE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbiKVXMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbiKVXMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:12:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5420E1C927
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:12:40 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g12so25770894lfh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JSEDSNjhfy5FuCupdNXYQlqb25p5cAnBD74WVJKHUw=;
        b=V9uQCkEOAjtkAZB1nCpLEfL8Q9fgBw2TbbpxhM+R//6bRh8dhATSrLZZtNZmvsL3im
         52R3agbDluW1JxxpjRNHwrA2JNPojKddt5Ta/xZJG+/mi99ro9frZ6cIF+L/rxZTycb/
         1V5styK59o07/rBR+JQfXz/ZwxYePQ4yAzhNUCZNiLFuU5J3vkfMU7aUdWN/8y3eBTCp
         tE7bUpzOlkLBwVu/UwP2tpu44fPZbABH4EC72oCndaupBHrxCxZsYkuRgSKghXEsUgB4
         UUGNCK17yWtt22kljVJrzEMrlMR5mDgfELTEEAcACRWcEq5xF8AFV38+LlnNN5GvW3tJ
         ekPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JSEDSNjhfy5FuCupdNXYQlqb25p5cAnBD74WVJKHUw=;
        b=w5wMXMEjlxK9KlHRyzD9igbzFX/Lvl2JhD1n/7RWNIcj8sX9Hg73GQnBpfY/LkyIOp
         oXcTiNRjIxw0k+HgGQy3a7R5NiONc9Npr9daag1pYBwfqe8i1N4r+lQdKGAGRnUFNBuS
         nR2sv8mMtJZ/37l6hnR26bUGywB2MQyAcTzJUbWmKNxbh/lRhXy6WvhT32x+0x+76vL4
         xu5qb51c/y0VyRNm5Ug2L1WrkmQ9EreL7wrMeAUiNQW4Mwixby9Z6/iTnMkW5gBt14jk
         asAbHfDF0HLjDo2JYXrn0ZpTcDj1++LnQkO8xBkufUEcZmZq3TgoT0npElwa60eeCx+O
         iVxQ==
X-Gm-Message-State: ANoB5plnTsDdLVR8rrzxcxotBBYzYMXzODd7MnElkEIvLvhRCzMZiDPD
        bAgAPok+voYN8qku/w+61gURmQ==
X-Google-Smtp-Source: AA0mqf7CnRMp0y+0/C4SqT+f1mtAM9zTOjUVgcvxymVj38EPNVSmfgfp4yvJW6Vm4qaADOKhQp75Ig==
X-Received: by 2002:a05:6512:3b23:b0:4b3:abaf:b7c1 with SMTP id f35-20020a0565123b2300b004b3abafb7c1mr2431193lfv.39.1669158758772;
        Tue, 22 Nov 2022 15:12:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:12:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 03/11] dt-bindings: display/msm: mdss-common: make clock-names required
Date:   Wed, 23 Nov 2022 01:12:26 +0200
Message-Id: <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mark clock-names property as required to be used on all MDSS devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..e2980aebf178 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -74,6 +74,7 @@ required:
   - reg-names
   - power-domains
   - clocks
+  - clock-names
   - interrupts
   - interrupt-controller
   - iommus
-- 
2.35.1

