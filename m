Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1A064088F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 15:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiLBOhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 09:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiLBOhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 09:37:16 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC8E70622
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 06:37:09 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id b2so11990863eja.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R7S1hXfJrdA2OO05qT0bVLolHIgquQtzY/qiJ0ELKso=;
        b=iFbV+ZBpq8wDqSDeD0899VZYy/j7fXEh0JVZ4Ka/doaR3TEJKeRuxWUCeWOlPa2fPr
         abC1KxI3WehkC31cOilHKIqbJIsG5th63gllZOJqo10ba+MTr51kqHv2Anx6CKgXJwY1
         Qn/K+41ta0ATg6z/bJC9YrqtPWaQT/RDRGo7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7S1hXfJrdA2OO05qT0bVLolHIgquQtzY/qiJ0ELKso=;
        b=XyLbPPM/xkiOpAesQdccq2PX2U8sFyCE0lzMP3Zl8nnQI3lYv1Uq07dEP2ccmtDh0p
         4g9fPgACM4I3Tb7OHWNTgk4PnvnmHK4AQ4M63dwI6BA8B3dtZBvB+aVD0Ddjko169k3i
         Oq8wtkReBqLh5b2W1LhROIqRVrvvOwlZJxmXqC1pXigplNsKS2MbiX78UJscMehB/20u
         MEseEeHW5WAgfmZOvUjzDFLdeTaINxDBwCXnb7D5la1VkKGmvhp7T9xkQjCl3uGuwZ7C
         eIB76HFq3VPVWYSXYUajux6ZQ2Ril9e6JLmWNi3Q0Jn60uHqjABc7Q9vaNrFbkkRLHOT
         i1Ag==
X-Gm-Message-State: ANoB5pmcmjLFFxEZquaVMN0/QhMh8RmZgPiX+DHy7PXzh2qvpQ7ahdji
        LwF/YwII/uZciMHoYmufZfTQEpFHERA6WW3eEJo=
X-Google-Smtp-Source: AA0mqf6HtwfgDCmf0dM04PGobmTkrTGt7Yq0O5E+dyhFapkTpzUzGuORGMy19TqZlu40ide8Xl74Dg==
X-Received: by 2002:a17:906:5dcd:b0:7bf:707a:7247 with SMTP id p13-20020a1709065dcd00b007bf707a7247mr21431777ejv.196.1669991828050;
        Fri, 02 Dec 2022 06:37:08 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id ju10-20020a17090798aa00b007bb751f9d10sm3066398ejc.77.2022.12.02.06.37.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 06:37:07 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so588952wmb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 06:37:07 -0800 (PST)
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
 bg14-20020a05600c3c8e00b003d069f4d3d0mr12058890wmb.93.1669991827159; Fri, 02
 Dec 2022 06:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221118164201.321147-1-krzysztof.kozlowski@linaro.org>
 <20221118164201.321147-2-krzysztof.kozlowski@linaro.org> <CAD=FV=XeaskcBRVRQDoha7Xiv9j57fuvtcSJUeN7HCZSGVJ8uQ@mail.gmail.com>
 <68bcdf25-e8e3-f817-f213-efb0bce3f43a@linaro.org>
In-Reply-To: <68bcdf25-e8e3-f817-f213-efb0bce3f43a@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Dec 2022 06:36:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WBNpeWK31dCgzX5QAuR7AySkp_dEyY8WK3o8+SaiPxOg@mail.gmail.com>
Message-ID: <CAD=FV=WBNpeWK31dCgzX5QAuR7AySkp_dEyY8WK3o8+SaiPxOg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 2/2] arm64: dts: qcom: sdm845: align TLMM pin
 configuration with DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Fritz Koenig <frkoenig@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 2, 2022 at 12:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> >>                         qup_uart6_4pin: qup-uart6-4pin-state {
> >> -
> >> -                               cts-pins {
> >> +                               qup_uart6_4pin_cts: cts-pins {
> >>                                         pins = "gpio45";
> >>                                         function = "qup6";
> >> -                                       bias-pull-down;
> >
> > After your patch, where is the above bias set for cheza, db845c,
> > oneplus, shift-axolotl, ...?
> >
> >
> >>                                 };
> >>
> >> -                               rts-tx-pins {
> >> +                               qup_uart6_4pin_rts_tx: rts-tx-pins {
> >>                                         pins = "gpio46", "gpio47";
> >>                                         function = "qup6";
> >> -                                       drive-strength = <2>;
> >> -                                       bias-disable;
> >
> > After your patch, where is the above bias / drive-strength set?
>
> They don't use 4-pin setup. If they use, I would assume they will
> override the entries just like sdm850 boards (where I override it to set
> these).
>
> Alternatively I can keep it in DTSI, but it is not really property of
> the SoC.

I see things like:

.../sdm845-cheza.dtsi:     pinctrl-0 = <&qup_uart6_4pin>;

...before your patch that would get the bias/drive strength from the
SoC dtsi, right? After your patch, you've removed it from the dtsi but
not added it to the board. ...so I think it's a net change. Did I mess
up / miss something?
