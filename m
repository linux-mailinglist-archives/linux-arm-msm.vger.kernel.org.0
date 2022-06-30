Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58B85620D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbiF3RGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbiF3RGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:06:20 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5617C3D492
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:06:19 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b23so23920215ljh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=QpBTHQZXDMGexfOADK6O2iL7qtMi2Zus61qTujBKI+Q=;
        b=gW3ZM5/Zbr7t1EN5jVp7IXn4a2EfUbajov77NvtpSYYgyB1a+f/lVglfFaS+6iBlT/
         QEFWkHCx0q5P/7YMuZgyIJwzT3GGHSabYru+E21iSCbeW8RGD9lqCZZ2LQ6I1VL5LMzM
         EHZ5ygq5uzXa34hbg/NwB0ZSJhgYFpPpHyoJkYWNbHrLshhmWabVMC1odmr2wE4CL2xp
         XYDnejcpvbO04w/0hp7u/JskbAe7140Egc+CgSadhCaLiR/BsTR07N6DdH5OmX5ZhoL+
         fh44XYjOcQh4g6+5dOnjkB0723dqCqcqDhB3sNKHyrmm6C2PNKTk8SIQQghyddybme36
         f2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=QpBTHQZXDMGexfOADK6O2iL7qtMi2Zus61qTujBKI+Q=;
        b=YvmYqWGGABWHFnbdvr02jsNxgqV03bZ14+ZKcBmV0bY+FKZ87j0r2861kblqw1YhYs
         EvzWO2pszMX/CG9A4mPuIcb8N0CTbYQ2Lw6xepog8LAq7CStSal/7J4tMHda2wPNsTHn
         F8FWzt4w4lijQGso0AalFw3okBrOKnSCitpXtTIMdpoKEHzjsiaE/ZiJWYJR+pjMfxlX
         BohrsrcjnndMeGBmMaJ2JEctVYOFRJiPje5OTJEFdyVfEoaf9A6YcbWOA5hoCDS4cWpU
         WKe/ib2hKUsPn5AZGM5E06TTbAUAkZL6DH3P5JM3/cUcxhlnYvli3uG8fwBk6GMS2e/G
         EEeA==
X-Gm-Message-State: AJIora/NrLnVqgyERzO0gFrgU3q7LxAnEcD/JOQb0WsJV+DGjZ5oqP+2
        giRVqnzADDwBxBCclkzLW+z7LQ==
X-Google-Smtp-Source: AGRyM1uqgiNZ9lYcgZKkrgzls2b+nBJ7gGSEa6iALdiCqtLIWin6GL5efYhueySaeVhZWRRjUBtMzg==
X-Received: by 2002:a2e:83c7:0:b0:25b:c007:29e0 with SMTP id s7-20020a2e83c7000000b0025bc00729e0mr5731262ljh.378.1656608777692;
        Thu, 30 Jun 2022 10:06:17 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id d7-20020a05651221c700b0047255d2111csm3192989lft.75.2022.06.30.10.06.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:06:16 -0700 (PDT)
Date:   Thu, 30 Jun 2022 20:06:07 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
CC:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org> <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
Message-ID: <E0628E74-F03F-42ED-B21A-5024A704DCC8@linaro.org>
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



On 30 June 2022 15:08:39 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>The driver doesn't care about the name of the phy in DTS=2E msm8916 has s=
ince
>2016 named the phy "dsi-phy" with later SoCs taking the name "dsi"=2E
>
>There's no reason to have a constraint on the name here, simply to have a
>name=2E Remove the redundant const in favour of maxItems: 1=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-controller-main=2Eyaml    =
| 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 880bfe930830c=2E=2E717a5d255ffe4 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -49,7 +49,7 @@ properties:
>     maxItems: 1
>=20
>   phy-names:
>-    const: dsi
>+    maxItems: 1
>=20
>   "#address-cells": true
>=20

--=20
With best wishes
Dmitry
