Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E8C658CC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 13:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiL2Moz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 07:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiL2Moy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 07:44:54 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B8D1277B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 04:44:52 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b88so19283995edf.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rxg/cFQV5AJ+KK+e2LcSmN9+piXsVTnLsnVoNNfzlWY=;
        b=RN+xJDnlX/Nks9M2zzXKHBUUN3mNvGk5Rx4W+JlCaa8LqmMUm+Ls0gZLS/E+lZVuiw
         pfKgnm0PNSxb0lvFRMYLWJn23/j1VKmsrq+9dnUip/pTY3W35H+M7IGqnwi3zcOaLr27
         Fav7zW75RA37CptvTK2rIxYUHtN9SeimcTtS/47LqIWW0FflZchIPnNdaSQYXLrXuL9Q
         RykR//wzIBEnH+xmiZ/qVnYiUCWT0xeJ6rlwWOWUTO5bouV79d6lc5rgSlREFmVioU5d
         XVEKp9KJiQ/4KFY1K9Z6jBhnOSzrnnnhQwyxHd95Qa+rBY+8cPxD+Nb6bfB1xE+vtqb7
         66BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rxg/cFQV5AJ+KK+e2LcSmN9+piXsVTnLsnVoNNfzlWY=;
        b=M8F9EkwT7ZC0PKILKm8Bx01y41XGg7935rrozYlsYRvIqXkrxLmYeXhumRLP7rJaof
         BM7dfS3cRDQ4tlCGQKzfwPHSHPtUNY5oOhE0BOW2EcV4RuAtY8o4JO/Fy5x7eu1PfgCE
         i4vGWZUIODbEj9p9F1PSYwwC6gkexkmejnyQ/kaRq/aLzUACCiZ3d2HhUMjdeG0LnxS8
         3a5ONrxm8z83KaBjxUcrq59Nc/Grmy1gYuI7fP9shn5cu4VP0zo60VMo21NbWfeglib3
         /vZneL4vkzvZqkyoL+QzSN/k+UAFjbJhymX8sW4b/JpalcSDgKutVRElXIo5E9zhBKPO
         jJHA==
X-Gm-Message-State: AFqh2koIebin90z7ZupycECUcOtXG3j2d9nhbDSOkxpHk29i75OkJbR6
        ZWXWWiLK9jNrEgNowXIDRPgGyA==
X-Google-Smtp-Source: AMrXdXuUPNTQPjnr1WWBCZcOc80Er1IGpuAXTohqoM/RvMoJrvIxqy9gwwTiAwv9NbYKfn2wl+PhGg==
X-Received: by 2002:aa7:db53:0:b0:45c:835c:c6d0 with SMTP id n19-20020aa7db53000000b0045c835cc6d0mr24246529edt.1.1672317891042;
        Thu, 29 Dec 2022 04:44:51 -0800 (PST)
Received: from planet9.chello.ie (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906318f00b0078db5bddd9csm8483461ejy.22.2022.12.29.04.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 04:44:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, andersson@kernel.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/1] dt-bindings: msm: dsi-phy-28nm: Add missing qcom,dsi-phy-regulator-ldo-mode
Date:   Thu, 29 Dec 2022 12:44:38 +0000
Message-Id: <20221229124438.504770-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229124438.504770-1-bryan.odonoghue@linaro.org>
References: <20221229124438.504770-1-bryan.odonoghue@linaro.org>
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

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..2f1fd140c87df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -34,6 +34,10 @@ properties:
   vddio-supply:
     description: Phandle to vdd-io regulator device node.
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    type: boolean
+    description: Indicates if the LDO mode PHY regulator is wanted.
+
 required:
   - compatible
   - reg
-- 
2.34.1

