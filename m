Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E9442AACB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhJLRcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbhJLRcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:32:54 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C219C061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:30:52 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id c29-20020a4ad21d000000b002b6cf3f9aceso3465013oos.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=z/0YDsWVgY8iQTsDuzbYnenwugKkL3hk/JKxgPGOGcI=;
        b=HkxFstT0p4m1QLP90AGW9wtYHvxedTtvyniXxElQkMbozckVbZpY+ySg4/JdDB/trd
         YmtybS62NmQKyuSF2NuUNk/j75EMhjXpkPYyXZ03J2Jfu55793aAlYSZtNV7lFbJFFi6
         sWDSf+PNXbeErsE4e2zK60JCUsOUnmb+5L7FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=z/0YDsWVgY8iQTsDuzbYnenwugKkL3hk/JKxgPGOGcI=;
        b=l/+z82X7JGZu0vdgXt3gX/Br3Q8V5e+tAN3atNO3QLuqBFZ7TRTqi0BHul02PiSYrH
         kV8Jdvm95r2WjoNpAUtm2oCZPUF0XIi8LzRXzif33Ut+sf7ax0duf4ckGdWZWOHPrfmS
         Px7V8zDCfpdssgSh2oegCKdpYu5QPzpNAjojh0JcceQ2wCHh6h7Ta2A5+sBkiNJmwFj+
         OU/L1FLwLn4YofXVnlk+DFgBxb0sTavq4SjF4OHcnfcEffbTjjw7lYKEWB1gxrJeoRPA
         YpzaVGUWK72bBqNN4+x5qhmTPHM/m06bGQOr3w76n0QONv457ktGMX5C7KkzZ8bY7ynZ
         FlxA==
X-Gm-Message-State: AOAM531yp/VuQqgccABsJfINyQmKdkotunywMJK8OWJoEdglqucLw+fr
        NRfqLNc6F2WL6oIw6umq2xtNCtbq28V0at+bcQfqbw==
X-Google-Smtp-Source: ABdhPJy9T8+9hT9hWwhL5IEf1cezLhdiiM+LB8rzFUvZfxvbjfDkAnsx9qGc3DeOFqc5EwvCafjQFtUNNiGGxNd26F8=
X-Received: by 2002:a4a:e2d3:: with SMTP id l19mr24660471oot.1.1634059851594;
 Tue, 12 Oct 2021 10:30:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Oct 2021 10:30:51 -0700
MIME-Version: 1.0
In-Reply-To: <20211011201642.167700-1-marijn.suijten@somainline.org>
References: <20211011201642.167700-1-marijn.suijten@somainline.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 12 Oct 2021 10:30:51 -0700
Message-ID: <CAE-0n52raCkcBxz0nfdtGK_kR+cQptT5dVXgDBj2fhCySQOVTQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Use division result from div_u64_rem in
 7nm and 14nm PLL
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-10-11 13:16:40)
> div_u64_rem provides the result of the division and additionally the
> remainder; don't use this function to solely calculate the remainder
> while calculating the division again with div_u64.
>
> A similar improvement was applied earlier to the 10nm pll in
> 5c191fef4ce2 ("drm/msm/dsi_pll_10nm: Fix dividing the same numbers
> twice").
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
