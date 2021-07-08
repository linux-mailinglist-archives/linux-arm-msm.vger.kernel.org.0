Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C3E3BF2CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 02:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhGHAYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 20:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhGHAYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 20:24:15 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B5FC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 17:21:33 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so4130152oti.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 17:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4Jcoi/05Elu+fjtRGsBy67bn+XnaWnaiX33y57x5HyU=;
        b=LJ/AaTjnptRLUW7CzFFdWX5BhvP80VTDIH3AaF6G4I9qFjmvr/2KfE8Vg+C50eaaMq
         7YJr2OOr46Hd2NJ1J0WWWRd7p463OjFl5lobQl5SCifALPPlPQlexEK0axo6uMr6qG0q
         n8JHZXsiZ0h5qNabNJfhjC6kWrPBmVMDMV6ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4Jcoi/05Elu+fjtRGsBy67bn+XnaWnaiX33y57x5HyU=;
        b=Q10Xu04EIyJxjzu0lvxyUBWoDhDZqaNTWlHr8W0eD6qiGGrTbePK2upADnZPYbip1U
         Jwu5BoDNrkMkHbLHlm4cXgN5UhIpH3bicr6vR5zZ0Wjx9pfMnJOtoZJV/GkTnqDH8BVN
         Bg6ufVwnKxVBw4WHr0lBKBQ8f5amjWtjlWbNxuasPMaIsgkdmTjUm+Vw+sIz418XZQSd
         sVl12kVF1bQW/giXYDHLamGfiJu4uPWR0e5ni5ww14+wIiao63g+/+UjErY37I9nAgz4
         NytJJWDw2zA+p7jg5wV+9T+jpzn+Gz/Fx/1oX9zuWE6Wytk0gI6EYEScJEtYRN1kr/8V
         mYFA==
X-Gm-Message-State: AOAM531gL5C6xl7kTjeKhCA6J7As+rMuxKQOEGMk0zVwbj2EciHPDPGn
        5RIzQrvvMwtipJGYdkPcn31hGkIaUYnJ1tsP/c/WZA==
X-Google-Smtp-Source: ABdhPJxkZSDT3o7+bfi83Znt0P+srvdSMLyyBxjSz6HK12eJFcI+NWnaXAGie57cQXIy8dzSEbgbgbsiYK9wRxWQ6eo=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr21941770otf.25.1625703693006;
 Wed, 07 Jul 2021 17:21:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 00:21:32 +0000
MIME-Version: 1.0
In-Reply-To: <20210703005416.2668319-2-bjorn.andersson@linaro.org>
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org> <20210703005416.2668319-2-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 00:21:32 +0000
Message-ID: <CAE-0n50EvG4qV0n+Ag+dvFxKKasnUzwH=MA+f-jsgDdBqaqziQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Use corner in power_off
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-02 17:54:15)
> rpmhpd_aggregate_corner() takes a corner as parameter, but in
> rpmhpd_power_off() the code requests the level of the first corner
> instead.
>
> In all (known) current cases the first corner has level 0, so this
> change should be a nop, but in case that there's a power domain with a
> non-zero lowest level this makes sure that rpmhpd_power_off() actually
> requests the lowest level - which is the closest to "power off" we can
> get.
>
> While touching the code, also skip the unnecessary zero-initialization
> of "ret".
>
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

I think this is why qcom folks talk about "virtual corner" and "physical
corner" because there's the one in command DB and the one in hardware.
Maybe we should change rpmhpd_aggregate_corner() to call the argument
'vcorner'? Unfortunately we can't really build a type system here to
make this problem easy to catch with a mismatched type, unless there's
some sort of typedef trick we can play?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
