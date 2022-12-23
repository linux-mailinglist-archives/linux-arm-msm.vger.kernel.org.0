Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC49654AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 03:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLWCKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 21:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235769AbiLWCKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 21:10:33 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6891920F75
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:31 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m14so3382315wrh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 18:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
        b=yGfe4DQ3KTq24nSAmHQc46jlKLMrFw+CZHP76fuhN/IebnDh20dINzhgLujYqKVX+Y
         dXgJ2eP1ZKXLeOM6QoxMhqcpwOgoEejsvHf9d2BghPVYx62uqO2xtM2ky4/bLGMMHWXt
         rI9xvCXv3MSDG5h0FyJl5qV4R6BUPJB63A7kN86CDGbvDqJB7sP5y9Bz8s3zHfDTx4Wh
         1rmntAJPoc2qG9vCfGqtnQ75Srt6XE8pzFV9AbvBfcJd2ReH0qUsjsoYvGUOe4nPAWcl
         8YFRd04buMiGVmi+MF7lA0m064vhPo+nshLgB18tEfW9vYMl/lO5oUnGdPE1Ti3BXwM3
         nvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Hu/pgFNNxfeH2Gjp98s64ccughmNvrwi5MiArHpcHo=;
        b=6JzVFyKt8rdUzh7r5oqn0tZ1I1iYhnHvQcOnKVsc956qBDJ1wp8X2E5ey5ZgWKAlPt
         /zyelJUPHQzFokyMdbsF8T3XOuhXzrxIMhZmz3DLu0ZQ2oEjN2kWMIpasZia9WzPMMgd
         zF31clXOC6mC1WTD9tUIomFqcUQouHCwFndphwizadyEq/a3wMZEUFV347Dc4X/lPaWo
         FNu0uDbAzDnDiBIjHjkHZ7cPUn1JM2ECH0XZeGouZKvN+mZj9Fsq0IEpCTy+Oha6xrZL
         iB5H2/erNN8zKxvTy+EYIYBHHp2A6sMxb++lq/y/9ZXPKE8ESu+Jbhn2LyOfrQ65ato5
         301w==
X-Gm-Message-State: AFqh2kpCCwN7jUNoe8xXSV/Dw6cSy9VSn4KOgVyjf9VDxNLaFOlOrHF7
        YmCKGN2sn28JTkxSEWeWYokJ1ZWd+cfOH5RUQfo=
X-Google-Smtp-Source: AMrXdXsqclnk5dTKs8dX2sprcRns0P/6Ejt8NwsXpgOv6nEraTPK8YW8miSgwRDhRTOx+hRIEHHMcQ==
X-Received: by 2002:a05:6000:1373:b0:242:30b3:3ca7 with SMTP id q19-20020a056000137300b0024230b33ca7mr4544772wrz.11.1671761429741;
        Thu, 22 Dec 2022 18:10:29 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 18:10:29 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/18] dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
Date:   Fri, 23 Dec 2022 02:10:08 +0000
Message-Id: <20221223021025.1646636-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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

The existing msm8916.dtsi does not depend on nor require operating points.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index f2c143730a551..55bfe1101d6f4 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -138,7 +138,6 @@ required:
   - assigned-clocks
   - assigned-clock-parents
   - power-domains
-  - operating-points-v2
   - ports
 
 additionalProperties: false
-- 
2.38.1

