Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE74546DF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 22:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348711AbiFJUEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 16:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348870AbiFJUEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 16:04:32 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE43C41331
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:04:30 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id bl34so531245oib.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=W6khq/CJ/jK9xDdyCa3D6opio63P/2KRxReDZd/cxiU=;
        b=L2f6GdlZB9hiNU8S/GkGCil7hfYiQF4xIu0hJbUyR36m4jSLP7Jz9XQMVdA+Bq0rgD
         JtKfbtpayzVcDX3CtE2Gzr5jVUkCmBFzZJG5rH0xB8/hbZbsAli8Zm9flefmXwV4kxc8
         9uH40PA3iZzLPO2GepIiin0N8bXwZJIvC1meE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=W6khq/CJ/jK9xDdyCa3D6opio63P/2KRxReDZd/cxiU=;
        b=zx9gnSdGWLeVY1PNCCm8JqKyw2vk6srozA+xZSgULzEArAWRovwlqJCFnebqD/Hfjs
         Ecm/Z+SuvxJNiV9SnZ17g+uJdqa2WVLO3iXi8dvuc2GEcmk7C3q1RTZAQi7KJv8ux30i
         yIK2drNHtqvvqNMJFnGho67Pgf9/ll6qw9soLnXN83tuGdHSkGs0zrRyb2wHBy/NQ/qr
         lSD0mUEusQZuisjAfQSlqUPS+occS/keumCZtMkAv37JunlecJRSPtb5Y5M/OF3eLood
         DNOwR70R1yHlfLSF5gTzBqbDgfhB5evM9Jzc9WLLC+2xiwZ3oSUg/LbhWans4bmJmcvi
         nmDw==
X-Gm-Message-State: AOAM533CyQTvwwVhjgi6rC/6dwDXJQAe2JTEhH5IW4z2W6r7NWqg/jbd
        5Bq5k2w73YoYACdoSrt3uiPpreHNO47oXPSYsAorZQ==
X-Google-Smtp-Source: ABdhPJwSTDK+pBxm//5P5qx/CDLFe4k+ZU2smS4RLMyknqIy9EX3kH8/LMzqdWgLhly1FkW9ePNj8azaOd9duk3Y/ZE=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr743744oil.193.1654891470062; Fri, 10 Jun
 2022 13:04:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:04:29 -0700
MIME-Version: 1.0
In-Reply-To: <1654872335-4993-2-git-send-email-quic_srivasam@quicinc.com>
References: <1654872335-4993-1-git-send-email-quic_srivasam@quicinc.com> <1654872335-4993-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 10 Jun 2022 13:04:29 -0700
Message-ID: <CAE-0n53NdTwAO4DY0x7Fy9h4eRVR-3iKnGfqfZ-ggyghfsC9UA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: sc7280: Add boolean
 param for ADSP bypass platforms
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@quicinc.com, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-06-10 07:45:34)
> Add boolean param qcom,adsp-bypass-mode to support adsp bypassed sc7280
> platforms. Which is required to make clock voting as optional for ADSP
> bypass platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml          | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> index d32ee32..ea9920c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> @@ -17,7 +17,14 @@ description: |
>
>  properties:
>    compatible:
> -    const: qcom,sc7280-lpass-lpi-pinctrl
> +    enum:
> +      - qcom,sc7280-lpass-lpi-pinctrl

Drop this part.

> +
> +  qcom,adsp-bypass-mode:
> +    description:
> +      Tells pin controllers want to make clocks optional for ADSP bypass
> +      targets.

How about "ADSP is in bypass mode"?
