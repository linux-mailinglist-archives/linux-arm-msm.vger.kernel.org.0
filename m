Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711565189BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 18:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239490AbiECQ1T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 12:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238303AbiECQ1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 12:27:13 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EE03D1DC
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 09:23:30 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p6so15784093pjm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBkRzMAF2fmEnDOx5cm8C4yWv3/2n1bAuqgP0781Seo=;
        b=rwEXmlzY2KoxV8/zMOBhFvw5DlF20vRth0I3M6jTU1SBvoigzfwCSX0X/3TwY2FX2g
         cUK1K/5FcUA7Ds5MteSf/FmNEkvAmYM0Kd9Q7c+dLfOp55GMrUpz6uvxaFzw0EdNqNyI
         HIhMr8cPEAJly2++bk272jmYqqVUihy7jEA1ZeKD65Nh6jnDVbolLI22uffyumPkn8Ks
         zm4zXgSuKOzZI5I7zxUae+wyl3GCh7sfk2jLoiLjX526hGjIY5kayZiEhiSesv40gSnp
         rdilNPxeJBSUaNxrRchYjHVsOocXcNuzbPUPjZvJi3qsLrsReOcmcmgq/xg+G0nr8sAv
         BWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBkRzMAF2fmEnDOx5cm8C4yWv3/2n1bAuqgP0781Seo=;
        b=AkNYQWuqP/T5QB76UiQLlJEeA21hBgxBi8/29uXCdLFGUb37PZ41o95Z5kblnvMqvp
         ZSxUxCl6J0H/a6etbdSSeq+zyqiDCQQGs+8uN2H0mJot2dfxP5TCvYPij7B9/1QNwxbg
         eg8DxkdQjM507btgAD38j7/P9ipvyl492s8GiQnnVTss7AFuDSyNDROA3yFmCOq453FK
         eQ5fVD0ZAzGY5480j+pqkI6BRpzDqeJsaRD66JzaDWaMO8XSnX9LCJMODZUzcG3sfzok
         CH36I2SHJyhEK7o9EBqbQKTq8eA+K7vMA1g0nAQUVnrcGFppfIi6yXuyBUlK4bKf1WiS
         5x5Q==
X-Gm-Message-State: AOAM531NpO0sH1a0QVpZGCMCxyvSQ9+P044ATwFdia0vq7WExkX6MIPm
        lyVbRqa+mvaBLK2z4T0eAK79d71tu8IVS7RYPKiiKQ==
X-Google-Smtp-Source: ABdhPJw39icUVJEDcTiertqWvLPqVUfip6kCDsWWoVMMdikQYdwVn01b80vuxcGqwl3p1a4PT4NkwLxO/a7Xy7YvTmk=
X-Received: by 2002:a17:90b:1e4e:b0:1dc:583c:398 with SMTP id
 pi14-20020a17090b1e4e00b001dc583c0398mr5517440pjb.232.1651595009809; Tue, 03
 May 2022 09:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220503130448.520470-1-robert.foss@linaro.org> <YnFDwUvFCgrH12zY@builder.lan>
In-Reply-To: <YnFDwUvFCgrH12zY@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 3 May 2022 18:23:18 +0200
Message-ID: <CAG3jFyvMFZbELm8eydGm4Fp+UYQq9SCSUnfF79Y6QvZe4guYDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: qcom: rcg2: Cache rate changes for parked RCGs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, anischal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Steev Klimaszewski <steev@kali.org>
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

On Tue, 3 May 2022 at 17:01, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 03 May 08:04 CDT 2022, Robert Foss wrote:
>
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > As GDSCs are turned on and off some associated clocks are momentarily
> > enabled for house keeping purposes. Failure to enable these clocks seems
> > to have been silently ignored in the past, but starting in SM8350 this
> > failure will prevent the GDSC to turn on.
> >
> > At least on SM8350 this operation will enable the RCG per the
> > configuration in CFG_REG. This means that the current model where the
> > current configuration is written back to CF_REG immediately after
> > parking the RCG doesn't work.
> >
> > Instead, keep track of the currently requested rate of the clock and
> > upon enabling the clock reapply the configuration per the saved rate.
> >
> > Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > Tested-by: Steev Klimaszewski <steev@kali.org>
> > ---
>
> This patch has been iterated since and the latest incarnation can be
> found on below link. A reference to that in the cover letter would be
> sufficient.
>
> https://lore.kernel.org/linux-arm-msm/20220426212136.1543984-1-bjorn.andersson@linaro.org/
>

Will do, thanks!
