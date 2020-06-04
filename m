Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71621EEC13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 22:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgFDUeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 16:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbgFDUeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 16:34:20 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E9FC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 13:34:19 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id 1so4314049vsl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
        b=ctMItykuizT2FjCtlj3c7yeA8hejo1Eu0YvNGbgfHWNvUAZmSu1iqvjTuxpl6Rm/XM
         /bOQT4clHDMwkaa7CQpWJ+/aULE1pYzv7SNXe1g+1d4Jvdus2Zf/u2kDn//UPtypAuEw
         ce+XSToUwc8hZkd4Z5GjQqIAIMzFGI0iD70BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
        b=Cyg7elypvJjA4OXbsmWpcfohjWMm4jN4li/KFecE3cQ+0hj15ZJ/AuX9vg+MjQUG+U
         SalDRfntaArabAqyDgqw3qUKI39Swu22HvwiqAiJJvDaIooDE22xHHEbkNXYopWvcMvT
         4M1ufa+Fa93gSmOEpjrkYc4XVUOVPrPdwZKom9i6/ts2QtetG4f54rh3Wq3b8XOYyZZp
         QV7B2EEr0CdTcbPs9nrUKoaQxCnuRnQXX4xlo/9/U9YCcVO87VcP7fOTQ802iQHD+Wel
         1G1TXCJLWrSFrPEGmAGSKQ94vvymaPg1IGV45c9qrHTQyVjfJNmmRMvV2fdq7Dvt180Z
         NO3w==
X-Gm-Message-State: AOAM531H/Z/8n1vd+igSPI4SQyRxs0VSewS+BZGWVFj9infMw6k4uOGW
        Vy35xLPtQOhsqiNcvfO4xIruKTJmDU4=
X-Google-Smtp-Source: ABdhPJxB8LztA8yfRz+Sc15gSTfEw3STyowAIZjgg7AfM51wRdTmr59zanfTc6YZ0MTj2W2SIEZ3oQ==
X-Received: by 2002:a67:7c94:: with SMTP id x142mr4968305vsc.192.1591302858766;
        Thu, 04 Jun 2020 13:34:18 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id v141sm893038vkd.9.2020.06.04.13.34.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id l10so1694553vsr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr5087675vsd.198.1591302857244;
 Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 4 Jun 2020 13:34:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dpu: ensure device suspend happens during PM sleep
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 4, 2020 at 6:20 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> -#ifdef CONFIG_PM
> -static int msm_runtime_suspend(struct device *dev)
> +#ifdef CONFIG_PM_SLEEP
> +static int msm_pm_suspend(struct device *dev)
>  {
> -       struct drm_device *ddev = dev_get_drvdata(dev);
> -       struct msm_drm_private *priv = ddev->dev_private;
> -       struct msm_mdss *mdss = priv->mdss;
>

nit: remove blank line at the start of this function

>  static const struct dev_pm_ops msm_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
> +       .prepare = msm_pm_prepare,
> +       .complete = msm_pm_complete,

Presumably you will get a compile failure if someone compiles without
CONFIG_PM_SLEEP since msm_pm_prepare() and msm_pm_complete() won't be
defined but you refer to them unconditionally.  Probably the best
solution is to just add "__maybe_unused" to your prepare/complete
function and then always define them.


I can't say I've thought through every corner case but at least this
change no longer raises alarm bells in my mind when I look at it.  ;-)
 If it works for you and nobody else has objections then it seems good
enough and we can always make more improvements later.  Feel free to
add my Reviewed-by tag when my nit is fixed and you make sure it
compiles even if CONFIG_PM_SLEEP isn't defined.

-Doug
