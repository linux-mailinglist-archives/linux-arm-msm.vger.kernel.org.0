Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F17F7B1B33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjI1Lf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjI1Lf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F881A3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5048156976cso4672190e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900938; x=1696505738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAgwmDYSEumxdHOz03qqC77Wc8/BmRIQnaYQ3alh34M=;
        b=Nj/A6Sd3ywpyTGlCILvGEZzS+RoeiaI42RFOeceeNoK34YTjKwZR1unIUVJ72b0Ita
         l7wJTO2daqAeKCK+uCyDjTrpSn1uI4/S94RpLh9JVT1q4wAR8tFAFfqWJ2FNaVOpsWKe
         r8g6PnTSckMETKYa5bXLU57efjxuA0arSKvtI5pYbSTJGfYHrb22pI9Q9hKz0jYqiurf
         jI8Cn1bB+u8jhcQwcBYvhJIEX2qYGyFE/lxGtc5ZicPZ0zzbYk2EOZ7reKwuL34I79Sq
         P7HPL6mdhCZbyt2+JZfThb5ma1TUHzluZTGgwWES7WyLvPymrcAozB+ggcV5ifyctqdt
         +dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900938; x=1696505738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAgwmDYSEumxdHOz03qqC77Wc8/BmRIQnaYQ3alh34M=;
        b=Fdc08MHlszvRSZgG3XoTU56v6yhEcjMCNYvziB4TvwOpcoy/9JY8fVyN+1BzrKWaBX
         DLaum3lhZNbDbRJzAjpRw+FYyXFQIOVPPI3gkHaPRG2osPDEhpJgFf7D+iTxoL7u7Nfk
         alwpRnbkwfckXfd0CgeUk2bXeEEtvZhuhxmk4WmDA/16PS2KYRP+rkLJNe2REbDlqv/+
         Lt5ELPndDus4Prek1c0bZ+gmql0W6pPD0Z6R9vN7KjIVbvexggptDz5MQu6qe1SsYy9l
         gM+dl0pwWLxmoeGM0mt9+T7y9ZkBzwDSwmBcb8g7wG29/nWNUiAyLiXKdaEoQwa4lLmw
         /jKQ==
X-Gm-Message-State: AOJu0YywoM5sZX/Wlsi+u3ocHKWGm/ohwJyhvuaYIbrj09x4zl8eMPJQ
        2zoXMeH63yvRCjx6erL6+dbqMw==
X-Google-Smtp-Source: AGHT+IFWa4lOq/RH6ekC+d9SDuQzdJV19CgPIBvotr5aSSznaLJHkEocII3osyAz87VI01x0kZ0NDA==
X-Received: by 2002:a05:6512:2521:b0:4f8:6abe:5249 with SMTP id be33-20020a056512252100b004f86abe5249mr859962lfb.3.1695900938521;
        Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/6] dt-bindings: display/msm: Add reg bus and rotator interconnects
Date:   Thu, 28 Sep 2023 14:35:31 +0300
Message-Id: <20230928113535.1217613-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there are
other connection paths:
- a path that connects rotator block to the DDR.
- a path that needs to be handled to ensure MDSS register access
  functions properly, namely the "reg bus", a.k.a the CPU-MDSS CFG
  interconnect.

Describe these paths bindings to allow using them in device trees and in
the driver

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index f69196e4cc76..6b4ce08a60dc 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -66,12 +66,14 @@ properties:
     items:
       - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
       - description: Interconnect path from mdp1 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
     minItems: 1
     items:
       - const: mdp0-mem
       - const: mdp1-mem
+      - const: cpu-cfg
 
   resets:
     items:
-- 
2.39.2

