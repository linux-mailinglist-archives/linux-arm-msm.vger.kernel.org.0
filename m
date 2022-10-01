Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735CC5F1A66
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 08:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiJAG7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 02:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJAG7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 02:59:07 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC451A1E83
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 23:59:05 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id e84so7608524ybb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/17Sp9BcM/K21ZegnhdQ4++78L7Xj9RZxBq1LvHMm0s=;
        b=LL/ZnwIU+6rPgEcoBpLtalknoiI5HIXEFBp31J/zCF5e1oXQMYTYgiV+Ud4WP8XxLS
         pCkR3Fhcb7z8S089SvvAeort1q/IWu32XkRFeomqordIV9LFqHHZqmq0w8B0vdatdm2U
         uAjUs4v78BFpnfl/X06k/LTT4KolLm1H0E6EJbRznF0/TE5frJaL9GAAxE1tnraplvuc
         mjkFPZvNHt90ilVLbXomWsx6vFUQU6t9iR0R+xY8lublmkAim70EddHfxnoDH2hEcLh7
         g8tOTxOYCi1pKtiXK6K+Csqpo20byu2lZeb7cbcifgXlVJCqA3dsCAacNRUpwhcHcHnB
         NF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/17Sp9BcM/K21ZegnhdQ4++78L7Xj9RZxBq1LvHMm0s=;
        b=DipN2frdp7/4qWrSK650nr4HmNun+RGpTIWzB95Afbk5LQem0ErktN3fuOBAJeYysO
         G7Z1NYpAH+TA1GyQjDM3gze1WDC4llmOoYpf9MiYvG8jdN9tc6eDnD6Wh1yW47+j9oaz
         Xs4hUcFfEUmIBn/epS9coe3ydc87g+gegBnP36ebR+Vgx2vf/owOctw41QDy93xZwC+9
         fvh2EhiAtHSWscu3VRB/UsfAOt1eTMjN1/TbBaYl8Q0bRY2muIkr4pg5NTC6LcbSaXhx
         uA+KGBSAZVFBS061XJCiYVxha08Ikj/Yw0s7Szwpo1YxiHd2miLjK9f3KVleU5LSZEto
         HLSw==
X-Gm-Message-State: ACrzQf2T0YYCLvk6XOZtsBABzPQQWAa34kMOZ0u/ZLtWhXHrs3b169cC
        9NpCnuMb7rWNnp0WsdVR2UD8Z9P6HGHbrRTpI+aRgw==
X-Google-Smtp-Source: AMsMyM4KvrH0ZWXXGRicwrHKndSMkvbisTW6ycJvZzbQe17GicrRUb8kp0Je4DojuLPvtEZuyfZvph552bkPGEz1OKs=
X-Received: by 2002:a25:af13:0:b0:6ae:3166:1aee with SMTP id
 a19-20020a25af13000000b006ae31661aeemr11281737ybh.288.1664607544566; Fri, 30
 Sep 2022 23:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221001030403.27659-1-quic_molvera@quicinc.com> <20221001030403.27659-6-quic_molvera@quicinc.com>
In-Reply-To: <20221001030403.27659-6-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Oct 2022 09:58:51 +0300
Message-ID: <CAA8EJpof5JFDN978t98JxJgd2e+8VVDkXbexvNegA+2jY+tN=Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: clock: Introduce pdc bindings for
 QDU1000 and QRU1000
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 06:04, Melody Olvera <quic_molvera@quicinc.com> wrote:
>
> Add compatible fields for QDU1000 and QRU1000 pdcs.
>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index b6f56cf5fbe3..5c7b790db7e0 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -33,6 +33,8 @@ properties:
>            - qcom,sm8150-pdc
>            - qcom,sm8250-pdc
>            - qcom,sm8350-pdc
> +          - qcom,qdu1000-pdc
> +          - qcom,qru1000-pdc

Alphabetic sorting please. q comes before s.

>        - const: qcom,pdc
>
>    reg:
> --
> 2.37.3
>


-- 
With best wishes
Dmitry
