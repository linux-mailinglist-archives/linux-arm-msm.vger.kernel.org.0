Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B683855E3AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345904AbiF1MqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345897AbiF1MqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:46:16 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72FE237E6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:46:15 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3176b6ed923so115399737b3.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/o7h6HDeouJmmTiR7/vdU7nOVyyfqQGDGcnD2AIrn4=;
        b=P+XLSx7yD8akGOAU998jjSG/8kO1Cz+yxlAH/FwcQbXDiaJXmDqgI3mMrkS7lIyapb
         /NoF0vqvlp1YzbNRhwdpaV48X1uu4DcJEEwQfInGa3hosNqzHQHWXGSc75BJnrjdFkyO
         1753LezlvlhuEnGgEQ1yKLDDXd4pKrLuRXeMkqGSUbnw27ndRq+PDLLZ6qqdZ5gxwuO7
         p0iSwrXPeKhU3h1qZzdQYiIIahp25+uxTASMPTVovDcSJXD9xW1BWrCQ3HVYd2BSy1uS
         AvUHT/jBURD3HeO82AyZ8Em257ivuuZpqgQcjnHvr4krG9DI4HBN9/U+LJY3Zk6H0/uu
         m79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/o7h6HDeouJmmTiR7/vdU7nOVyyfqQGDGcnD2AIrn4=;
        b=QPWc5oeNgx6IdWBqkMxdtEEogZgAOEETu5fUz9IcxuozbYDxF0ojDezbr/vNhAm7qO
         Gm0n0wXKea+dvnYMF6Y29b2AIOD4DlDFmvFfYNYgqfyX/K8bfNC0NWD94cMC9iW4JIyG
         D3EwN1AIca7N3BSW8RymSLn+1mXdLPY70DJtwv3l7KnUq5XrJrMrIxxOgXQQCyzfABzZ
         5mCd3btDzJ0FjB8qcJRmwku9titFOlXTfWCUvNfarajpwcIFuvY2hTj4AnizFsKWlRiY
         BRLsweIdXqGCTYF3e4cusz+v6TSd8DogPiqB9NW5xN88NZwQKLyRw0GHLmxFg1p/OtOM
         FLug==
X-Gm-Message-State: AJIora+VcQKEgO3aHdF20rP29nlYQx7LUaauBE5CPP4CrW0iapQ97Lmt
        JJywozGWA2zHQHASkNvalXB1NYM8MZX9AJZHt/YQZQ==
X-Google-Smtp-Source: AGRyM1s7TJ7lIQB0P1Y0YWoiaMimpZET5SYEiRTwTddSx4NLLUKMWn0W0kXJByprycc3O4v/t6iZ2umtbvHx3WCkyis=
X-Received: by 2002:a0d:eace:0:b0:317:87ac:b3a8 with SMTP id
 t197-20020a0deace000000b0031787acb3a8mr21730890ywe.126.1656420374836; Tue, 28
 Jun 2022 05:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220201134108.2677578-1-vkoul@kernel.org> <YhUVAwtfjuIdKrRQ@matsya>
 <1c66890b-6736-61ef-7d16-619f90ced4a0@linaro.org> <4f1ae43c-0f22-19fe-0794-3cc268104396@linaro.org>
In-Reply-To: <4f1ae43c-0f22-19fe-0794-3cc268104396@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:46:03 +0200
Message-ID: <CACRpkdaSC1dSgQYJEXfL9OG-Jq9Q1UeMwuM6tjozd_oCVF_oMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] spmi: pmic-arb: Add support for PMIC v7
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <quic_collinsd@quicinc.com>,
        linux-arm-msm@vger.kernel.org,
        David Dai <daidavid1@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, Jun 18, 2022 at 5:30 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On 01/05/2022 22:41, Dmitry Baryshkov wrote:
> > On 22/02/2022 19:53, Vinod Koul wrote:
> >> On 01-02-22, 19:11, Vinod Koul wrote:
> >>> Hello,
> >>>
> >>> The is version 3 of support for PMIC v7. I have added a new property
> >>> qcom,bus-id for supporting v7 and then add driver changes for v7
> >>>
> >>> This depends on yaml conversion patch:
> >>> https://lore.kernel.org/linux-arm-msm/20211227170151.73116-1-david@ixit.cz/
> >>>
> >>
> >> Any feedback on this...
> >
> > Another gracious reminder about these patches. At this moment this is
> > one of the important pieces lacking for the full SM8450 support in the
> > upstream kernel.
>
> Stephen, yet another ping. This is the blocking point for the further
> SM8450 progress.

Pending since february!

I would rather suspect something is wrong and it somehow goes
into the spam or wrong inbox on Stephen's end.

Sounds like something Bjorn could solve if Stephen don't have time
to manage the SPMI subsystem right now? If it's OK with Stephen
or he simply don't respond we can just queue the stuff in the SoC
tree I assume?

Yours,
Linus Walleij
