Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A79D63D1AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 10:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbiK3JWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 04:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbiK3JWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 04:22:40 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA03D11A32
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 01:22:38 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3bfd998fa53so111999567b3.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 01:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esqAkKsNPNa+vWU1VEu3p5pJm5olzNFS6cZhKN5g6K8=;
        b=OH1nH0cfbXVH7lX96inipfihQDqcAzOBuPL6pnQ6uFYs+2t8n0RmwCJCpEqhJG6hMy
         gEd3CZlJJCZIDT4OrLt0d+L61dZuYlVu07TGc6SOGDgVrzdUlItR9clJ4k/tBn+WvfFu
         SwRR9u1dwsdHThjGptZYZGzIL4PxFiBxXdqCeDJmIGW8kjvUHjWDfuFso7i9fh5/OisF
         obXKDXIO981BzKPuhy+U7vgvLsJDsZL89AOBwJgnrDdNDqGZaE8BgoqEed9Oe8D6CSIy
         ODu58bEWerMuu1XCJWXaEAXXs4DEKWCsa4cHNQOtgxscHMdKl3u+JdM/8LcLXkz+oUba
         SccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esqAkKsNPNa+vWU1VEu3p5pJm5olzNFS6cZhKN5g6K8=;
        b=2IkfNMg2HJLtKkoc37oHfERdyaustniM6y6YGhwvR2cbH9LFMc9sR84SD35W42z5xF
         OGjQPdGvTrx4xNkfBAPs4RKZcAjfEzCl9TMDAUWeLX5D3+/PN01X6hcMwL5WBFwRyo2j
         4HAbo766A+TPuSBOdnHFv0P34sfLUkB9EIL4PB7CNOng/0e0DWcZ0TgyQpih6mim/eVy
         4DQbXG6qIO45lO2JgoV0slWEB27o5JW+dc080YJ8VeHe0aNxBcbhlMyDGQKNAl3s1Hnl
         NBHUPvEt4YehepOfcKzTySdq7dljHllC02vHy2wjBmnHJLbPphkIdyhbB1ng3yN6en49
         GeEw==
X-Gm-Message-State: ANoB5pkno8nFtjRgJ7oKQXlancXzErPucFWcDPPxWNbD5cNvMesAcdt+
        eQqszZ+r3nQM8L36FzN1kJQnyhk8oX+l0C2aT6qyPA==
X-Google-Smtp-Source: AA0mqf6eRY6wdCOqxX33Z4M4u21qczGijL4HTcdnMMJLEpRYeSokHrYtqrqbnwCO4ETK0bWEGQxk+x9Y9p+wGxJYsRc=
X-Received: by 2002:a81:598b:0:b0:3b7:78c8:a205 with SMTP id
 n133-20020a81598b000000b003b778c8a205mr26625010ywb.188.1669800157826; Wed, 30
 Nov 2022 01:22:37 -0800 (PST)
MIME-Version: 1.0
References: <20221126102141.721353-1-dmitry.baryshkov@linaro.org> <CAPM=9tyjMCOY3-tJASxNg6dFizfaivqfSrhSG1otFTvfuSg=dQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyjMCOY3-tJASxNg6dFizfaivqfSrhSG1otFTvfuSg=dQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Nov 2022 11:22:27 +0200
Message-ID: <CAA8EJpoN7HAkdRnJHFCqTxF__L7QwyDK4hLuFKn63A3TgosOsQ@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-display-for-6.2
To:     Dave Airlie <airlied@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Nov 2022 at 09:02, Dave Airlie <airlied@gmail.com> wrote:
>
> On Sat, 26 Nov 2022 at 20:21, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Hi Dave,
> >
> > As agreed with Rob Clark, a pull request for the non-GPU part of the drm/msm driver. Summary below.
> >
> > The following changes since commit 7f7a942c0a338c4a2a7b359bdb2b68e9896122ec:
> >
> >   Merge tag 'drm-next-20221025' of git://linuxtv.org/pinchartl/media into drm-next (2022-10-27 14:44:15 +1000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/lumag/msm.git tags/drm-msm-display-for-6.2
> >
> > for you to fetch changes up to 8d1d17d47eaebe4466459846d07e4ba8953fa585:
> >
> >   Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and 'msm-next-lumag-mdp5' into msm-next-lumag (2022-11-26 12:06:29 +0200)
> >
> > ----------------------------------------------------------------
> > drm/msm updates for 6.2
> >
> > Core:
> > - MSM_INFO_GET_FLAGS support
> > - Cleaned up MSM IOMMU wrapper code
> >
> > DPU:
> > - Added support for XR30 and P010 image formats
> > - Reworked MDSS/DPU schema, added SM8250 MDSS bindings
> > - Added Qualcomm SM6115 support
> >
> > DP:
> > - Dropped unsane sanity checks
> >
> > DSI:
> > - Fix calculation of DSC pps payload
> >
> > DSI PHY:
> > - DSI PHY support for QCM2290
> >
> > HDMI:
> > - Reworked dev init path
> >
> > ----------------------------------------------------------------
> > Adam Skladowski (2):
> >       dt-bindings: display/msm: add support for SM6115
> >       drm/msm/disp/dpu1: add support for display on SM6115
> >
> > Bryan O'Donoghue (1):
> >       dt-bindings: msm: dsi-controller-main: Drop redundant phy-names
> >
> > Dan Carpenter (1):
> >       drm/msm/hdmi: remove unnecessary NULL check
> >
> > Dmitry Baryshkov (25):
> >       Merge remote-tracking branch 'msm/msm-fixes' into HEAD
>
> This commit has no justification or signed off by line, I'll let it
> slide this once, but no backmerges without justification and please
> sign off merges.

Roger.


-- 
With best wishes
Dmitry
