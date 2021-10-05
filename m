Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CA2423050
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 20:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhJESrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 14:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJESrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 14:47:42 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46AAC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 11:45:51 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so160824otj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OHTvFeyJP3J+uo/9wz+ahOIzpwEg9uJmeumv+TyQfVM=;
        b=KlgpGE95LIxZlb/pXE9cZu9nugQIb8LshfOewuCbEuACzl+rQB1xWDjBU3mPOLrDcW
         j5C+gbD94hGL4uSgBoXfUM5rt42vBONs9pSviN0hEYnzNWeOvmPxCoa6eWbHPVH7pzq8
         9uUd3ccnAK2NsO+petzbwloyc4I76262QBVaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OHTvFeyJP3J+uo/9wz+ahOIzpwEg9uJmeumv+TyQfVM=;
        b=ixDi4Fqp7eQxXiKAPedzXZke/cRyBhMhP306uBs1fait5kBK1TOnUNm4TOnsyYhIoT
         LD8yIb4E8vCWwLmlqXLXdwjvuyNNddyCpKtTicf3BEp2SJsLySYrvLfEz/gZ25fDc/7G
         cIpEOywSmBQcDvF+ZCAfI6gZJdXHNZk2eTJhkwvSfk1GMW3HAsXoZyrdkME9EzrryfiZ
         yAJFe7s9eXXbeSnKD+IcRYWH1xDabKEWx1FEA2w4+nVlfpBwnwx7HurS6j3fgKo1sqk3
         Q362OB3feMOhwQI/pB88TqfB7bs6gS5oYnDoHL+ZvtoHQUNDlJ2y/W4xYTnUpki1dA6Z
         5oVw==
X-Gm-Message-State: AOAM531fY5hBxS1eWlFVh6qKDGzA9c9EU79hdXEpyl0hfn5tqkpmJvUK
        b465M0RWhRR4V2GoqWO/HF6mwceOSrEQsPZOePLbUQ==
X-Google-Smtp-Source: ABdhPJzA4iPXbH8yz7UdLkbyMSd1FJG8yE9lKOiGiI04UiNVk5/3sbM0WRNEBTKxB3XmF+4HfBHW7j8fmcgm3mYJLEA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr16240694otn.126.1633459551057;
 Tue, 05 Oct 2021 11:45:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:45:50 -0700
MIME-Version: 1.0
In-Reply-To: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 11:45:50 -0700
Message-ID: <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-04 19:37:50)
> Found in the middle of a patch from Sankeerth was the reduction of the
> INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> is initalized and HPD interrupt start to be serviced, so in the case of
> eDP this reduction improves the user experience dramatically - i.e.
> removes 9.9s of bland screen time at boot.
>
> Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
re-read the code a couple times to understand that it's waiting 100ms
times the 'delay' number. Whaaaaat?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
