Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D55E7443C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 23:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbjF3VFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 17:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbjF3VE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 17:04:57 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066B34213
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 14:04:55 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bff89873d34so2182279276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688159095; x=1690751095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WArU76iRqH6SKzUD6+chWZxFx8/6jk4xhUrLjkiMcdQ=;
        b=B1Mqy3LGhDYbzvj/sFL3l+l2Rc8HWIhvqUrnaP4zsDmdfIaULy1wK4We3ZMPi37cFo
         Izgg7/uh0h8xb2I+IYiW2VtDhOOHUgYDfyAiRC6FPeHn642GiPKTv1uqgratlKUEazxH
         EI91R0SPYCfwByToGHKPuRs1jJxqfjf1iAHka3Wl88BZa9Y7w+zeeknzhZj0wIpoqa0o
         pJwUisuhUa0editg4tGQFVQz6QVsbFrSNPhv6t3YsJfGX1QMHujpcO4jdKkgtgElovLP
         A/Yo4GNTRqW+9y44g2kE03JBFWyrki9Gan/UeWXcm0Ghn5Yoa4zYukHDg+KGfIs73iyh
         9Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688159095; x=1690751095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WArU76iRqH6SKzUD6+chWZxFx8/6jk4xhUrLjkiMcdQ=;
        b=ROiK123DHklfPfhTfCbAhpbGD4hDGDegLF+jx9ezTQrgnlscT6f1hpTZ71eeY7+6Q0
         r6MOi2tMgH5sNVbZMlW0HSnmcV56kWI7nHeotZ//AHt2QbX8RRgOjmE97XL7BFDuCUHb
         ToAAuL4yTMk2jqKG/hiPI4VcRFRjhkFiLre+6C1z/L4unVUjJxDgewV1r3JlCbuSnYsT
         Ja2NdY3/0tEflhX7CBQWsvLneF6wKXOxDCxOt526PCNgFvbxjeyO0X15Uj5OVneKu/Ja
         83Sx8tV2xkcaEvQMWvjNHEUb8smkoX5hD0/vMbQ9pOzoIMP9/k6eaimvD7oCh10gLmqg
         jfdw==
X-Gm-Message-State: ABy/qLY0owmx0CZY0nUKFA6K1J9eyQQfOUwAtwffXJsDQx8luEGevKs6
        7KFvHssMjW6+EVLGM3k/6w+/cBQYoWR9U2rZ8sB9jcSUV6WYNOBB
X-Google-Smtp-Source: APBJJlH2A8VpylLDMOgUdGE6ghhfm6sGQRdNjSiLPjHdQQZ2BU7IvmtmbogLsohamOXrUfDQkyVYJ141UcR4uODzLUQ=
X-Received: by 2002:a25:60d6:0:b0:be6:6539:7fdc with SMTP id
 u205-20020a2560d6000000b00be665397fdcmr3216624ybb.1.1688159095052; Fri, 30
 Jun 2023 14:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org> <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
 <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com>
 <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org> <CAA8EJpopHRNTyuzi2V=1t7o5xbXaCjxjP=yQUigCYDJMULxb=Q@mail.gmail.com>
 <e2c6abdc-f586-be9c-b400-7bf57021d5fa@linaro.org> <CAA8EJpoN0nVJdBwYfRkS305fWjbHL6BUxcgo1CmS8jmn6gp2jg@mail.gmail.com>
 <20230630205920.GE1059662@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20230630205920.GE1059662@hu-bjorande-lv.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Jul 2023 00:04:43 +0300
Message-ID: <CAA8EJpri1xaZPTSi2pnCpNj_f+VG8B0K=5G7zz+ec7rfcQMUdg@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal zones
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Jun 2023 at 23:59, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Fri, Jun 30, 2023 at 08:42:23PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 30 Jun 2023 at 19:15, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > >
> > > On 30.06.2023 14:57, Dmitry Baryshkov wrote:
> > > > On Fri, 30 Jun 2023 at 14:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > >>
> > > >> On 30.06.2023 12:07, Dmitry Baryshkov wrote:
> > > >>> On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > >>>>
> > > >>>> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> > > >>>>> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
> > > >>>>> PMIC interface. This includes several onboard sensors and the XO thermal
> > > >>>>> sensor.
> > > >>>>>
> > > >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >>>>> ---
> > > >>>> [...]
> > > >>>>>
> > > >>>>> +     channel@144 {
> > > >>>>> +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> > > >>>> This define should be cleaned up.. Since it takes a sid argument,
> > > >>>> it really is ADC7_AMUX_THM1_100K_PU(sid)
> > > >>>
> > > >>> I don't think I understood your comment. The define itself is specific
> > > >>> to PM8350, other PMICs might have different channel assignments.
> > > >>
> > > >> include/dt-bindings/iio/qcom,spmi-vadc.h
> > > >> 263:#define ADC7_AMUX_THM1_100K_PU                      0x44
> > > >
> > > > Do you want to define PM8350_ADC7_AMUX_THM1_100K_PU(sid) using
> > > > ADC7_AMUX_THM1_100K_PU ?
> > > > Or to make all users use ADC7_AMUX_THM1_100K_PU?
> > >
> > >
> > > >Or add the SID
> > > > argument to ADC7_AMUX_THM1_100K_PU and switch to it?
> > > This.
> > >
> > > Since we have a generic binding for it (not sure what sort of ABI-ish rules
> > > apply here, probably not very many since it's just a dumb preprocessor define),
> > > we should not redefine it for each PMIC, especially since the SIDs are variable
> > > nowadays :/
> >
> > I think it would be worth to have per-PMIC headers (which define which
> > channels are available on this PMIC), but to use values from the
> > qcom,spmi-vadc.h  header to define those per-PMIC values.
> >
> > WDYT?
> >
>
> Note that the channel relates to this PMIC, but the sid is of the
> measured PMIC. So I'm not sure which PMIC you're thinking of when you
> say per-PMIC...

Not quite. Both sid and channel are for the peasuring PMIC (pm8350b,
pm8350, etc). On pmk8350 we further multiplex them into the 8 channels
of adc-tm.

>
> Regards,
> Bjorn



-- 
With best wishes
Dmitry
