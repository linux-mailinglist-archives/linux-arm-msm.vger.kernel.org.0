Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45D6562110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 19:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbiF3RST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 13:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbiF3RSS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 13:18:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0ADE0BD
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:18:17 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so34931136lfg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=UpQMYfTCkZFCElPUIkQZ0t3q6QcWT/d12W6Q6Gj/wdk=;
        b=KDSjQztjqQQrjMn0kmMzCWNHZ2HRm6CDDz8fgbDsvk2e1kTyNN6fgjbKHXUCJRasiq
         P7AluDq9/SMEIfVagtwgIOt6CZQqf6huCYPPtX8r0y7Bhu2SeaIGC51SHT7YRjcSqSpP
         hVmR4rfT/hupzC2yhpiCZ2FWyRuxEZ/8/OnrtqEIqZ5IROcoID/qaBGSdVnNa32VB1vi
         On26XhRD+v11DJdWgwAKXq4i41DW65lZYOxlRT33Tx0NnHZiTP5aD7I8wxJ3cM/Ib4al
         OUZYFx9ccLhB6znssJBxfCxnUOfl/pkK0uksS61SGi7A3mwZQRTbJfr13SL/0ZA8qre6
         T3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=UpQMYfTCkZFCElPUIkQZ0t3q6QcWT/d12W6Q6Gj/wdk=;
        b=ktNZwbTY+ik2iMGzwrygz6nOTV9QUlG2Fa7HW81dfwhTzazrpzO9Yz/5vYM3gTi9K7
         UtlhRPAyP77N+XBbPsVClyHIrlK1yfNLWwt2RvYv7Kqi4+2KWYdBjqwFK+A/FUWrrjyE
         9Iv0JxV6pDGra9auZ9dvADr3aO54PJZeyjS+CUh5IPMS4KtpwfKw/DQWZFKDM7sQxVNK
         Beorpc3NKaNyZNhdaJ1i0wzlfAEbhDf0aGVmD0wdydw7dHWknYNgCi//IiggYCsYPQjK
         g8UM/TW6q9UH5yByBfdIEgYT4Z8w6nnejVB5T7wrTD3tWfDc/CJaIUMutuUwsefMMyTJ
         KoEg==
X-Gm-Message-State: AJIora/yhTNNYbFNExQ+H3H33WicPf/Ey/CFefHzM/R0PH9dUgXSx8l8
        cVtq+X09LPkbZLBrgZTD0Zt51A==
X-Google-Smtp-Source: AGRyM1tQzKJXYNFt5hP0RUwkl5L6brdWePRXelfIltOSkZTl37nvLKOgiaGQjx1/xBLyBrtXukcB5A==
X-Received: by 2002:a05:6512:2390:b0:481:6f3:2de7 with SMTP id c16-20020a056512239000b0048106f32de7mr6343987lfv.497.1656609495560;
        Thu, 30 Jun 2022 10:18:15 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id a8-20020a2eb548000000b0025a97366430sm2679838ljn.68.2022.06.30.10.18.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jun 2022 10:18:14 -0700 (PDT)
Date:   Thu, 30 Jun 2022 20:15:53 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
CC:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
User-Agent: K-9 Mail for Android
In-Reply-To: <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org> <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
Message-ID: <11097A0A-862E-4600-ABF4-34BD36CFB6F3@linaro.org>
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



On 30 June 2022 15:08:41 GMT+03:00, Bryan O'Donoghue <bryan=2Eodonoghue@li=
naro=2Eorg> wrote:
>The existing msm8916=2Edtsi does not depend on nor require power-domains=
=2E
>Drop from the list of required=2E
>
>Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bin=
dings")
>Signed-off-by: Bryan O'Donoghue <bryan=2Eodonoghue@linaro=2Eorg>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---
> =2E=2E=2E/devicetree/bindings/display/msm/dsi-controller-main=2Eyaml    =
 | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml b/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main=2Eyaml
>index 101adec8d9152=2E=2E91324f0828448 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main=
=2Eyaml
>@@ -136,7 +136,6 @@ required:
>   - phy-names
>   - assigned-clocks
>   - assigned-clock-parents
>-  - power-domains
>   - ports
>=20
> additionalProperties: false

--=20
With best wishes
Dmitry
