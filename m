Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B14640A82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 17:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbiLBQVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 11:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbiLBQVc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 11:21:32 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0972ECE44
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 08:18:50 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id b2so12668593eja.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9sSKXcDsyGwMJeWY4NDSO718BkFmb+d6Aniz+mE21XI=;
        b=DMcjVh5J0PLUm4KCi2yThPTKI61xrD/51r2/Ok5zUYgIBjhEOFJPoR+53vqsJaGXeb
         o4FgU79/sR8k7rABYurayQCm0emRdY+OM4hauUeAM60mGgGe7HGCp+icrlEziWASk2aa
         lZYKIVVT9zINcAIrUgC9muSsvr6Whu52Zt+ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sSKXcDsyGwMJeWY4NDSO718BkFmb+d6Aniz+mE21XI=;
        b=dHa87ttTUjfp7VEOfK5uI/WUVKYO7Muwr/XZax0GX02WraOc59uhipFVMtFNkMVKkD
         j9VALQh/IWE8uVlDWTnynbG+OGYcB+boojoS+K+6nCloQ+hBzWneAXfhky+oO0eZr9Z9
         FGXaRMefCM3MVBwf8esidkI3DIFhEIucZFeDfoH+dv3H0fVIPWtZVIbAKxlrYbdFEk34
         qTJ4ff7Z+NrxMbwEYGgucbu37frSevc4dSC4Io3suMVDBJxn7Do/0BLdCckMT7JvJTdy
         kBaACbvjLVittt1I9YkVMYVbJXvSivynh3NMnxJ0TtHDfb/YAG6X3J+bKOaPNJbNWC74
         soDw==
X-Gm-Message-State: ANoB5pnjs+yh9iUdfvEEB4GYryp26T+6r9B/8gTqCIfSHcmSGrh20Px7
        ho4AeSzap8MyrJ7QMWDDpLX1Vaol1tFl5xScr7I=
X-Google-Smtp-Source: AA0mqf6eIMkL9jV8jzW78i1CjVKgmli5mM0BZ1cX+vrbo0471fJFIcrjsY+AMxqlyuiwC2b0ItGFaw==
X-Received: by 2002:a17:906:bce9:b0:7ad:960d:3a4d with SMTP id op9-20020a170906bce900b007ad960d3a4dmr42577750ejb.522.1669997894366;
        Fri, 02 Dec 2022 08:18:14 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id dm17-20020a05640222d100b00461aca1c7b6sm3129379edb.6.2022.12.02.08.18.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:18:13 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id h11so8494345wrw.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:18:13 -0800 (PST)
X-Received: by 2002:a5d:4943:0:b0:242:3ca3:b7bd with SMTP id
 r3-20020a5d4943000000b002423ca3b7bdmr4732468wrs.583.1669997893515; Fri, 02
 Dec 2022 08:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20221202155738.383301-1-krzysztof.kozlowski@linaro.org> <CAD=FV=U86PyVQP4wbhwEkzYprJxz2-S3ooniuYKJBNQOudx2uA@mail.gmail.com>
In-Reply-To: <CAD=FV=U86PyVQP4wbhwEkzYprJxz2-S3ooniuYKJBNQOudx2uA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Dec 2022 08:18:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VjfFx_GBNh9zC=fdV5gUBHww+4BhSSpAq0iq-72i62TQ@mail.gmail.com>
Message-ID: <CAD=FV=VjfFx_GBNh9zC=fdV5gUBHww+4BhSSpAq0iq-72i62TQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-db845c: fix audio codec
 interrupt pin name
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 2, 2022 at 8:08 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Dec 2, 2022 at 7:57 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > The pin config entry should have a string, not number, for the GPIO used
> > as WCD9340 audio codec interrupt.
> >
> > Reported-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > ---
> >
> > Cc: Doug Anderson <dianders@chromium.org>
> >
> > Changes since v2:
> > 1. New patch.
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Presumably should have a "Fixes" tag since this is likely a true bug.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

FWIW, this got copy-pasta-ed to another place, which I just noticed as
I'm looking at your v3. So while your change is correct, it'd be
better to also fix "sdm845-xiaomi-beryllium-common.dtsi"

-Doug
