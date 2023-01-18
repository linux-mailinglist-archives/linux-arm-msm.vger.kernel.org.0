Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F166711DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjARDYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjARDYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:24:39 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527CB51415
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s3so9702060edd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gfBgFMCglJwiGtp0Su/fVc++xtqk3QZfhniXX5gUFE=;
        b=OdTpnb3J63Ut9HB0AGI5ycBVBTpKNSIqYi3xKa04tWIpj22ol6hTPj/kXEY+MxM95A
         SXp8ewlzRqKXO6XDYEstLqNPZnh+ISACHqGK284MEex24omx1HVsd/oXGs0FHm92Hqx0
         8VIBwRvpmdd6Ws1LOLkSaOibqn5oXYbFnKcfEHn8Wj5uBpN2C/8rZvgZ+LHPwyR0URBs
         LuttA0yFxGOx/Ub11VOszVgRvcMPJrx5KlzAUHAWvb350weh3Bs9FwlG+aho58Ljoc8W
         UM0vlW2vCu8HjfQ8RxWAVyER4jdB6xPqHExWv3LjZAvSFX1VJyhRd3gilZkmE39z1fTF
         Z3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gfBgFMCglJwiGtp0Su/fVc++xtqk3QZfhniXX5gUFE=;
        b=oQ6CNRo+sJ2mz5YYuyy3G80nXqS4t/llDiUJuksMGJgenu6cdHAYou+eC44jrPNEMU
         auQQ46AypRcKZTNsmAQplgzi3KiFb3AIFP5EXI81W1hDVOxFA/pGN6WQ0txLmfNMzYI9
         1UjoyrXu/tzKPWC4sTpbC6WUfYX+ImUBNtU5ie+5jepWrxFZPzDvqsTJUMJTpLp4ahS+
         elFaGIuWyguYEo1MpNYnDEQqUr0+Lvu64sueOgfcKzikAmi+aNEUi3U3wmahQVsGUMdR
         un/znbQC28Z5QZBqFb+uv2ZhFQiEYTUXrwbDx5TJ2rNdnyJZHcG5kRUoD5Vgk1w5qT6/
         bQxQ==
X-Gm-Message-State: AFqh2kpwZkbbR1BemdRx8qDbNrUk4U1mHLiYJThPL2zLw6/gNRI8p3KQ
        YjnKiw6IIHcT37dQoDRbsdmcKg==
X-Google-Smtp-Source: AMrXdXt8oddItr2P36DuY7+xZsptoMdQIh0DJJedzDOGjW814zXo1noWgpEsw6tkZ59eMYnQ0Yvgqw==
X-Received: by 2002:aa7:d887:0:b0:499:1ed2:6461 with SMTP id u7-20020aa7d887000000b004991ed26461mr5387548edq.17.1674012277888;
        Tue, 17 Jan 2023 19:24:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:24:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
Date:   Wed, 18 Jan 2023 05:24:31 +0200
Message-Id: <20230118032432.1716616-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
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

Some platforms might use less than full 4 lanes DSI interface. Allow
using any amount of lanes starting from 1 up to 4.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 357036470b1f..dc318762ef7a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -123,7 +123,7 @@ properties:
             properties:
               data-lanes:
                 maxItems: 4
-                minItems: 4
+                minItems: 1
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
@@ -139,7 +139,7 @@ properties:
             properties:
               data-lanes:
                 maxItems: 4
-                minItems: 4
+                minItems: 1
                 items:
                   enum: [ 0, 1, 2, 3 ]
 
-- 
2.39.0

