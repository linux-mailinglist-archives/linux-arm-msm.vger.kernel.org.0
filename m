Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB92562124
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236119AbiF3RUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbiF3RUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:20:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390331C13C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:20:08 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q9so23985735ljp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=damohPfMdpLkq66NtoK5mlqa9rA96R50kIkGHbj3Spc=;
        b=gmjrbUpiJM7zv5Def7+C0oPeRN6HLsd0lqOL/zTp5emkqBsBJSSchUWI8g1iUiSdHa
         CNqWEC5k0ZHEV1Vxpw0dp3ibfnwEH0+buty8lhvIG6PYRxN3mgmAgOOIWxnezK1HJfD4
         DXWNfUQOrNgXyA8twNaiIhIYB9isSOTkxSG0BaPmVrf0Z8JpkqjxG7NUQhQimabywtQt
         gk76F9HxbrVrGA6QYuYIH18axeu/2W5qmMbSogk//RLOYgujOaG8+paWtW+/p81HrApX
         DQMzHTMJE0KfKjTNvCHGmgYk3PcXkEl1j9DroviDiwrYZE3/xcOc5feyq4CllI6mg72O
         p5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=damohPfMdpLkq66NtoK5mlqa9rA96R50kIkGHbj3Spc=;
        b=euJFBe4iUS/Y0/KtsR4qfP2BBSRJAOwgsG/gOzu5j2tpQUapHFQIQHAVy8znQXViZC
         w6La6L+zAtkg4gcLv1Jh2oUWoNqVV8fHDrXDWZwg8em5JsUTAlkierKCygysFME91V6Y
         iL2hrtyvr7MQz7PJ8eQF9JE56MMz5JJZom2XB2YXTSBmsSGTOTUK7mcKpvs0OeGqt4iZ
         YRSu5uL1BsvMPBeHS5xEea+95YM+96zR2ZwPh6pmyZSGRh0UeQFglsdfKHZ1j65kwSQB
         3CGEk9LHhSFYmssakE14wp8i+gICzv9F36MzT+1fLaCQ0QBTgiK313fE+7MIpmgm1r84
         98og==
X-Gm-Message-State: AJIora+DNeVuHts7LxjngWN5CAgIEXg+EC9En8KTpOWMovKDuIKxiuxn
        JwrY5gG8NPe158aSkX5I78y3iQ==
X-Google-Smtp-Source: AGRyM1uvlzgvoIauk6FepAZQ9ApDovAivrQMxolpgVL3q7pogIma25pTH0Wsl/qZ/jhThMGXMy3Efw==
X-Received: by 2002:a2e:6e0c:0:b0:255:98fb:cb45 with SMTP id j12-20020a2e6e0c000000b0025598fbcb45mr5692263ljc.55.1656609606623;
        Thu, 30 Jun 2022 10:20:06 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id bx38-20020a05651c19a600b0025a6d563c57sm2733279ljb.134.2022.06.30.10.20.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:20:06 -0700 (PDT)
Date:   Thu, 30 Jun 2022 20:20:02 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
CC:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_6/7=5D_dt-bindings=3A_msm=3A_dsi=3A_?= =?US-ASCII?Q?Add_missing_clocks_to_28nm_DSI_PHY_YAML?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org> <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
Message-ID: <0F822D11-788F-4527-B50E-0C79F05D69FA@linaro.org>
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



On 30 June 2022 15:08:44 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>Add in missing clock and clock-names declarations to the 28nm DSI PHY=2E
>When converting from =2Etxt to =2Eyaml we missed these=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>
>---
> =2E=2E=2E/bindings/display/msm/dsi-phy-28nm=2Eyaml      | 17 +++++++++++=
++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=
=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>index 3d8540a06fe22=2E=2E9ecd513d93661 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm=2Eyaml
>@@ -19,6 +19,21 @@ properties:
>       - qcom,dsi-phy-28nm-lp
>       - qcom,dsi-phy-28nm-8960
>=20
>+  clocks:
>+    minItems: 1
>+    maxItems: 2
>+
>+  clock-names:
>+    items:
>+      - const: iface
>+        description: AHB clock
>+      - const: iface_clk
>+        description: AHB clock
>+      - const: ref
>+        description: Block reference clock
>+    minItems: 1
>+    maxItems: 2

This looks incorrect=2E You have 3 items, but maxItems in 2

Also I'd put description to the clocks node=2E Clock-names are self-descri=
ptive enough=2E

>+
>   reg:
>     items:
>       - description: dsi pll register set
>@@ -36,6 +51,8 @@ properties:
>=20
> required:
>   - compatible
>+  - clocks
>+  - clock-names
>   - reg
>   - reg-names
>   - vddio-supply

--=20
With best wishes
Dmitry
