Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA96562117
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbiF3RS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235341AbiF3RSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:18:25 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D371835C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:18:24 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c15so11023539ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=p+MC8dZLXIrERN6EMKEuoKgZGT7k1itKEIo1H3PViBE=;
        b=lyTVGZFiwZJPq5wuSCqTGoizXJ9avR8a6qsmAVGVEzrwqjjWzSU4LEQ6LYYRg1azR5
         Hwf3BZHNw6z+tZQNR5nACDJwEkedHXwT2ep4lYgxt4YXT26/j9GvKSrhXfT0tIeHe3P3
         PidtEbYCddr/wd9enPtBFe2FR18Kdfz1y6sqslB45EsdZrvMbt7f0T199FvYfWljetWQ
         NTDrsz/U1K6wYyIgmA11sEDKi0WpCJOaa8ph7Q+K1QI20YxW77Q/9rHb5g6AZSvOeSKO
         OmxsxyPpKJCzHukhbhrhJlVV6qwBkV2ddb7Uau7L9gaQ2YB9Fv+KT9g2hRn8CK0SxZSX
         x9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=p+MC8dZLXIrERN6EMKEuoKgZGT7k1itKEIo1H3PViBE=;
        b=PvJL7JUSarvbKkC90CuOGbIW59gqCImDs0i+NfQqeU1Y89c1BMJh7AK60yWJ3rlXop
         crRKp3ulP7waOE26YnsZRYWEp9cZ/WVtbi+pVUl5cF65tVmjKMfVMQzGr7T62UzLkXmQ
         ciN2xU/BQOp9nxXsNvK5e2ZALXzR7ILP9M5H1wtcKrCOBrozpEJS7NhfF3AkjJ/3ViqJ
         YVWcd2kp5EP7Tb3RV3HMQ3GbA2as+Hl3kJpUJrL5pjq/VPWqrMSEPn8iEhvdpXsr7LsY
         ERKw9BtCUbhj8xGO/9C2bQx6PqtQxReMrsSX5/SoxeH26uaiZmz3g2Fc2jukSQZzLC3J
         7XtQ==
X-Gm-Message-State: AJIora83GXn43O33czGlxWtrcn7vVVApvJ5IoqpxZKQMFaZQauBVZEEu
        Kp4p6YloqT2euiC3PRoIt2q3HQ==
X-Google-Smtp-Source: AGRyM1v1g8fAyFtEBbGG/KyBWA9/U06AHFGsRQFMCh3W++tYPsmXQxDhYCvVjVLts8SIzzEg6qKodw==
X-Received: by 2002:a2e:9f12:0:b0:25b:ad89:80e8 with SMTP id u18-20020a2e9f12000000b0025bad8980e8mr5371518ljk.145.1656609502443;
        Thu, 30 Jun 2022 10:18:22 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id n4-20020a05651203e400b0047a0bf9540asm3191312lfq.213.2022.06.30.10.18.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:18:21 -0700 (PDT)
Date:   Thu, 30 Jun 2022 20:16:48 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
CC:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org> <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
Message-ID: <9BCE52A8-E26D-43A0-86D2-90DFE6CB6C62@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30 June 2022 15:08:42 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>When converting from =2Etxt to =2Eyaml we didn't include descriptions for=
 the
>existing regulator supplies=2E
>
>- vdd
>- vdda
>- vddio
>
>Add those descriptions into the yaml now as they were prior to the
>conversion=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>
>---
> =2E=2E=2E/bindings/display/msm/dsi-controller-main=2Eyaml    | 12 ++++++=
++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 91324f0828448=2E=2Efd9d472437853 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -125,6 +125,18 @@ properties:
>       - port@0
>       - port@1
>=20
>+  vdd-supply:
>+    description:
>+      Phandle to vdd regulator device node
>+
>+  vddio-supply:
>+    description:
>+      Phandle to vdd regulator device node
>+
>+  vdda-supply:
>+    description:
>+      Phandle to vdd regulator device node


All three descriptions are the same=2E This looks like a c&p issue

>+
> required:
>   - compatible
>   - reg

--=20
With best wishes
Dmitry
