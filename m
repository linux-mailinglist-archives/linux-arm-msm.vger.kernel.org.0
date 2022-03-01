Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1BDC4C9908
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 00:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbiCAXRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 18:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235625AbiCAXRd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 18:17:33 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3385A92D1D
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 15:16:51 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id jv12so186742qvb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 15:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6LEQhSD9kPhUFJhdm4QVnYBLxI6Q1dvUYGGtcoYTPY4=;
        b=JXjc6V1oUSYysMCD8ROsxbutKaDtrNzAIhjxm/BHI8OwiUW+CLPoK75FJu0mlozoot
         NoSY+sBH/f7W6JjAZWt4Ls19FaRwx56UEzv4i9tHRXLIgdg+ZTSdGcbgWPZiwt4QX2uW
         ZMaZnOhbkHEziQvmynDZeAIyV7mWo5c4F0ujFx03MqmHCZoT55jQKVZkqIK2y+WuawiX
         jMUGu0j8N/DZ5AnxsGH7Q9gTImSMm6zNogRE/4rozZgs26fUtTNksXyneSU/sb0TlyOi
         MCaRZy8CVa8xIkjHl/l/4TcjyzGk8gizZl/hPKvZ6EeC2GIq5+GbKhWU5fsDveHnfSDr
         j6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6LEQhSD9kPhUFJhdm4QVnYBLxI6Q1dvUYGGtcoYTPY4=;
        b=A+M+527qVDcU6paoVzZ3TaFztBOHy72saTqHv63GgvqDQidue4zhCx9GtqlwwhT5CZ
         aqSRKVRbrLISAhzxnOCRZ46EMoaUF6PBmhyiP1kcEZj104r7nAc4wsGZVBJ7OH//Zdd+
         f80QAkxEfDPpurT5GPZM6KB56oUod5M95Eak029TLOzYC/Gp+dstmh9UUBwTHO0K8MIq
         0EFcCiAkdr3sCI4fzwqKRpKcQCrPKGBngDox4BWFHD9o8mw4ncE8zMRxTQUijp3E4XEG
         X9CfTiFZV057ATFZ8m4X1fCYkExu9SdeUjrcHEMe9p99COl+R9Z/od8UmdtHpt844W8t
         eVlA==
X-Gm-Message-State: AOAM531beUS5fkL5hrSeJND4kOYJ2wwNmm9Q38bXWHmpr8kGtIK+n/oz
        QQtj9doSc5yKxT/QizyGfXiEdGga2NOqP3eunvUp9Q==
X-Google-Smtp-Source: ABdhPJw25ridC2MDvo8XWVUeik7An6TOGY6ncUYKZQlZ5z1Gz2h5pIoUJpn/RtQ4xXAqZMGXxlEmL+3fbfu3FTJE3AU=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr18928372qvv.115.1646176609345; Tue, 01
 Mar 2022 15:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20220301210513.1855076-1-robh@kernel.org>
In-Reply-To: <20220301210513.1855076-1-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 02:16:38 +0300
Message-ID: <CAA8EJppACmfoz1dgRXbrG2zw_Wa1oJf0zGRCB8utPDXNhLZftg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: Drop bogus interrupt flags cell
 on MDSS nodes
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2 Mar 2022 at 00:05, Rob Herring <robh@kernel.org> wrote:
>
> The MDSS interrupt provider is a single cell, so specifying interrupt flags
> on the consumers is incorrect.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../devicetree/bindings/display/msm/dpu-msm8998.yaml          | 4 ++--
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 167bc48748d7..2df64afb76e6 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -155,7 +155,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>
> -    display-subsystem@c900000 {
> +    mdss: display-subsystem@c900000 {
>          compatible = "qcom,msm8998-mdss";
>          reg = <0x0c900000 0x1000>;
>          reg-names = "mdss";
> @@ -192,7 +192,7 @@ examples:
>              clock-names = "iface", "bus", "mnoc", "core", "vsync";
>
>              interrupt-parent = <&mdss>;
> -            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupts = <0>;
>              operating-points-v2 = <&mdp_opp_table>;
>              power-domains = <&rpmpd MSM8998_VDDMX>;
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index 8766b13f0c46..28617bc1d2ff 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -197,7 +197,7 @@ examples:
>                  power-domains = <&rpmpd QCM2290_VDDCX>;
>
>                  interrupt-parent = <&mdss>;
> -                interrupts = <0 IRQ_TYPE_NONE>;
> +                interrupts = <0>;
>
>                  ports {
>                          #address-cells = <1>;
> --
> 2.32.0
>


-- 
With best wishes
Dmitry
