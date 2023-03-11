Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48556B57C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 03:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjCKCPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 21:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjCKCPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 21:15:52 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AFC12B03F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 18:15:50 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id t4so7075618ybg.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 18:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678500949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P72/RJyFTIlOOR1nqz+Xoe2ZHsjm3Y3o5gd+VOUMDcA=;
        b=cZ0ux9EyM9CnjQZCrSgOKNWMDmx5eNSA7IOy2JgtIbYXOU3gnhg2W8sM8PPf6qss/v
         DX8a7juSMW6gSRQd+TJ9keCcb7Qx9oloCnwVSHnk7WxK1zegKj2n2XcmOin5MRA0QFem
         AdUHSDEzrYY3UxDJQeiwPSkNKFrZ4BD1BxPavjE9OCVVsQ1wpHthczjN9ytClAw+kZi1
         dO+gJU2QPwH+xfxJ6Kt6ktavkMiBNuvvduL1mjGPFltaRKkMHjWMLttGGhxsV7oVey8o
         Tp5v/g7nBxNDfYFgA4cLGRIhlgCE5LGetUl6xwB0R7iXlgU3/QHDOjQW/9Q2pTX7zXtr
         2MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678500949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P72/RJyFTIlOOR1nqz+Xoe2ZHsjm3Y3o5gd+VOUMDcA=;
        b=T0J8TWlopmPhmBCiIWFpmlNXqtMB2/r0GMBgUpxyH4lbfgU1NHm0Rbbc9pHY0I2sfT
         fUCOD80S510AD1nmbXe4dH8MlnpJRtQc8VvAqaZq1IBphQ+mi82bKApabQFUhYjt91cr
         Y6OUAzQtKlVOMWE88INjeU8gi7gFQRLpBDW0bDxGI0dQvWwMDxCKZQ0rUvHb2Nh6VS6q
         t4ZHZEhghxHz65W7nl+95hL704O+aV0+sA7VwfVEh3uztVkwW7kPU29+JOqFZsQ2l80J
         yT5Dj9PCmEcrDdw5TrZzyr/YHtw3ZxPSps59O8EhpX/wisj5Fn4p4vQDTlFMrEC1hvVg
         tIqA==
X-Gm-Message-State: AO0yUKUQIY/uO9GQR8Esukhre71s74f1RQd5y6mg+odudhB0gKLJaVuh
        4nkB+lqjrLEHKhoRO4sIuc0E4N/Ww4aiGsOI34jJqA==
X-Google-Smtp-Source: AK7set80AcBHxqq7vDVn5XjODGmRjT7osMclTQs6OL9k19FBeri0jZG979X1OxLlJTN8KscizUWA1Kz3PYvJtYQRFL0=
X-Received: by 2002:a5b:c51:0:b0:91d:98cd:bfe4 with SMTP id
 d17-20020a5b0c51000000b0091d98cdbfe4mr17127820ybr.10.1678500949376; Fri, 10
 Mar 2023 18:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20230310203438.1585701-1-dmitry.baryshkov@linaro.org> <4e9a29b1-bcaa-8f14-3f2e-9ed40fd8e3ef@linaro.org>
In-Reply-To: <4e9a29b1-bcaa-8f14-3f2e-9ed40fd8e3ef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 11 Mar 2023 04:15:38 +0200
Message-ID: <CAA8EJprNViKG0z1Sy1wN3TMTzRk3eqqSSRPT70JPADMXGoUZKA@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: qcom: sm8350-hdk: enable IPA
To:     Alex Elder <elder@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Mar 2023 at 23:25, Alex Elder <elder@linaro.org> wrote:
>
> On 3/10/23 2:34 PM, Dmitry Baryshkov wrote:
> > Although the HDK has no radio, the IPA part is still perfectly usable
> > (altough it doesn't register any real networking devices). Enable it to
> > make it possible to test IPA on this platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I like that you've captured this, but I'm not sure I
> like the idea of enabling this if the modem is never
> expected to function as, you know, a modem.

Ack.

> At a minimum I'd want to be sure we could exercise
> IPA in loopback mode before considering this seriously.
> I could work with you to experiment with doing that
> next week if you want.

If it is an expected/reasonable feature, why not.

>
> This isn't an outright "no" though; let's see if anyone
> else feels strongly one way or the other.
>
>                                         -Alex
>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index 09baf6959c71..60fbb2f49720 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -746,3 +746,10 @@ irq-pins {
> >               };
> >       };
> >   };
> > +
> > +&ipa {
> > +     qcom,gsi-loader = "self";
> > +     memory-region = <&pil_ipa_fw_mem>;
> > +     status = "okay";
> > +     firmware-name = "qcom/sm8350/ipa_fws.mbn";
> > +};
>


-- 
With best wishes
Dmitry
