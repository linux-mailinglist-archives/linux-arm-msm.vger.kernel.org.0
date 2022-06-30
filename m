Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D68562128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236125AbiF3RV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235586AbiF3RVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:21:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3E83585F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:21:24 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e12so10616378lfr.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=BohL4XV8r1xt0c24TIuYDlP8R/meGuCrMEtn1MhTCXI=;
        b=wuWu6XFubEpJUzf4oKOWPwR/Ni5MgstHBQVZSoGrPo5OQ2j/JJzHSOIpseOT4tlYiz
         EKu+RQ7K4KvLKZ7znlUg+z+9D1VlMaxHwjHzk6YXNYIaylEOwy6Ab3O6RHruoLzS7BKo
         WUDfTBxkJxsbSj8c9OOzEAIG13agptse6eg9/eemuFzwt7nb+xD3hj7Z7WccXc+LtOHI
         9M6BjnFxAiHGYtYzu8ZZDsbcKJjLfu3jswLr8kDqoDJtCct2HASjWexULB+p2qxuC7lZ
         q21XvRA3OCKGJK7KJuvyer3VWn6T6iT84/pRyhlMMu3Vz1Fecu8iIPPKa7hcC/T+Tk63
         lwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=BohL4XV8r1xt0c24TIuYDlP8R/meGuCrMEtn1MhTCXI=;
        b=X+t4MQ13NPfpLGGCI6CG1PtgYTDnsyuMd5PdrVgSULn7mtwYI5jhUlDPWqGjaVd+ZY
         bg/BiCdMXfIMwVFvXnlU6shycBZN1WK16szXWcUXEwlIaun3KGBovQCfyiMf+ifNQFQk
         39fnRt7UHl3yDq11iF6o6nf47NyT2bhKIyFLQVANuXWiujX2Qe/162P1HPwz1mtHUlWr
         cpxL11qTXoboxGBgEB9w5VwMznyJmKI4W7+6xy2ZFf6F74hw/04doErrqub5ffTRE57z
         wHvEjlfYOMAVZL7h5gaVSZOSvkb5blFReGeIyI5XinBgFqdSsmgDpf/IfAjOCyUlrICK
         qA0w==
X-Gm-Message-State: AJIora8AP/vQ2rvUp2/RUsgEExE6T1cxzCllo7DHd2U40vjatvAfeAAe
        1tgSzfO5vEvN75dn6Q/29E5/TQ==
X-Google-Smtp-Source: AGRyM1sR1CtTf9+8L+GphpYCYpwDNnxyY1KqkI8/i9uzVJT0bmWYlpGK15LRaDnHmM45M+BszRz83w==
X-Received: by 2002:a05:6512:139f:b0:47d:c633:2fa7 with SMTP id p31-20020a056512139f00b0047dc6332fa7mr6704763lfa.513.1656609682669;
        Thu, 30 Jun 2022 10:21:22 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id bi16-20020a05651c231000b0025a66b3fc45sm2765061ljb.97.2022.06.30.10.21.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:21:22 -0700 (PDT)
Date:   Thu, 30 Jun 2022 20:21:18 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
CC:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH 5/7] dt-bindings: msm: dsi: Fix clock declarations
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org> <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
Message-ID: <CD1AA865-0891-4160-A920-FDB65BFC4087@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30 June 2022 15:08:43 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>When converting from =2Etxt to =2Eyaml dt-binding descriptions we appear =
to
>have missed some of the previous detail on the number and names of
>permissible clocks=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>
>---
> =2E=2E=2E/display/msm/dsi-controller-main=2Eyaml      | 23 +++++++++++++=
------
> 1 file changed, 16 insertions(+), 7 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index fd9d472437853=2E=2Eb24ba6c346a77 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -28,22 +28,31 @@ properties:
>     maxItems: 1
>=20
>   clocks:
>-    items:
>-      - description: Display byte clock
>-      - description: Display byte interface clock
>-      - description: Display pixel clock
>-      - description: Display escape clock
>-      - description: Display AHB clock
>-      - description: Display AXI clock
>+    minItems: 6
>+    maxItems: 9

Please leave descriptions here=2E They are better suited for the clocks ra=
ther than clock-names=2E

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>=20
>   clock-names:
>     items:
>       - const: byte
>+        description: Display byte clock
>       - const: byte_intf
>+        description: Display byte interface clock
>       - const: pixel
>+        description: Display pixel clock
>       - const: core
>+        description: Display escape clock
>       - const: iface
>+        description: Display AHB clock
>       - const: bus
>+        description: Display AXI clock
>+      - const: core_mmss
>+        description: Core MultiMedia SubSystem clock
>+      - const: mdp_core
>+        description: MDP Core clock
>+      - const: mnoc
>+        description: MNOC clock
>+    minItems: 6
>+    maxItems: 9
>=20
>   phys:
>     maxItems: 1

--=20
With best wishes
Dmitry
