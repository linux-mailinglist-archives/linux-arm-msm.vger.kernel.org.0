Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01AF578CDD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 22:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239159AbjH2UtR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 16:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240531AbjH2UtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 16:49:11 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831D9CC0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 13:49:05 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-79a2216a22fso1847648241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693342144; x=1693946944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRj6oIeLsLoWDRIPaLOolZYdlfU92WGUkzkgfX02aeY=;
        b=y8ZPt5g4KQqBfd5AcCR3DwvzhwAatBh8oL/cRfn1qFK4ilQgR3+982bxgRSUxXO9rO
         TK3bYFZWLZ4RhQC7UP3HEBEpj+qmsXd/ojIUBNgUicG2BK4aD6gDPlpMPgKsLgCZFi9q
         B45kkk1M0HYstItmRVCN0ibkIBkarUyUtPAQriJNVlBKZxv6KwrI6yKMeTIIVEGqAuiL
         cW7Au+r2X7bWkFxSjMDvlRKR2oKYQzXPs5Wkrw36+FUqhUbv2NQAscuf+1J7ZmBOYh4q
         n51sYI2T//SCMihdR2+HqmTFvqJHvzzwkV+Tm1QYTH/hmrnbvvllGLKF7Q7WZidVAVf2
         qDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693342144; x=1693946944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRj6oIeLsLoWDRIPaLOolZYdlfU92WGUkzkgfX02aeY=;
        b=f6tGf1uBvIkBFYXvE5xpgikrKANg9rswcnCEzm9hmqdF8sXjHxOc79dmcuXW4Z1oNk
         jotm3aG82Tnb3gBPc0+Oq5+4qZG352ZPtOxbc2lwhGMnHu7MjDGWt9vrq5MrsTvVKGDn
         XsMN9TNNJ8mkVwKjf9D1rougxLY2ZTyNp5ovpwczDKuXz9TR/+aVaPpjY1DJPMdhT3ai
         PdBCUVyPc2oGymG2lzzEQfqsUArErPoB3zqa7by4qTrctBjqJamYiApA7AQMdprqxBRR
         7GTXrEZAXtDDSPCZUogrb7hvCN0VRf1b1HI7OT1z7qbVEq0dUzz3OnWf5WsrsXag0k2Q
         WNng==
X-Gm-Message-State: AOJu0YzTVXA7POOpJqzh5BDQLnhKcbatZijLvycmQ4eNigCELHzCxCOn
        L/ZqG4v1/Im1IO3xyftiw1sJv3fUB6ngQFqgRAFs+A==
X-Google-Smtp-Source: AGHT+IF7YRXkXJ355j1Ewd8JqLtawN5J8W6r3mYIaP1HoCS+5U7hrxkJJRqnSmslMlaAQn+nSwjUY90hjogjc08gTRY=
X-Received: by 2002:a05:6102:52e:b0:44e:9614:39be with SMTP id
 m14-20020a056102052e00b0044e961439bemr378634vsa.11.1693342144637; Tue, 29 Aug
 2023 13:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
 <CAA8EJpp_Uu62TDknZ-X0DQYinnwxxoriPpetfppCySxg_25YQg@mail.gmail.com> <CACMJSet-1tbTnMOab2GvMEc-b6Y3Xq5AZEE4mrfiUOZ=65z3MQ@mail.gmail.com>
In-Reply-To: <CACMJSet-1tbTnMOab2GvMEc-b6Y3Xq5AZEE4mrfiUOZ=65z3MQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 23:48:53 +0300
Message-ID: <CAA8EJpoFusQbZqUoqA-UZRfretUWOgox_LKfup6viVxXDQiS5g@mail.gmail.com>
Subject: Re: [PATCH 00/11] arm64: qcom: add and enable SHM Bridge support
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Aug 2023 at 22:03, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Mon, 28 Aug 2023 at 23:24, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 28 Aug 2023 at 22:29, Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org> wrote:
> > >
> > > SHM Bridge is a mechanism allowing to map limited areas of kernel's
> > > virtual memory to physical addresses and share those with the
> > > trustzone in order to not expose the entire RAM for SMC calls.
> > >
> > > This series adds support for Qualcomm SHM Bridge in form of a platform
> > > driver and library functions available to users. It enables SHM Bridge
> > > support for three platforms and contains a bunch of cleanups for
> > > qcom-scm.
> >
> > Which users do you expect for this API?
> >
>
> This series adds a single user: the SCM driver. We have another user
> almost ready for upstream in the form of the scminvoke driver and I
> learned today, I can already convert another user upstream right now
> that I will try to get ready for v2.
>
> > Also, could you please describe your design a bit more? Why have you
> > implemented the shm-bridge as a separate driver rather than a part of
> > the SCM driver?
> >
>
> It's self-contained enough to be put into a separate module and not
> all platforms support it so in order to avoid unnecessary ifdeffery in
> the scm driver, I made it separate.

Judging from other reviews, I'm not the only one who questioned this
design. I still suppose that it might be better to move it into the
SCM driver. You can put ifdef's to the header file defining the
interface between SCM and SHM bridge part.

-- 
With best wishes
Dmitry
