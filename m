Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72272EB5DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 00:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbhAEXHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 18:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbhAEXHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 18:07:30 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82123C061795
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 15:06:50 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id r24so836798vsg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 15:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TBITFTqV6PffwXxlyzM4ancQolf5iif5eFpCVo3z2EQ=;
        b=kOZclM5WFOaKzW+8A3iRvt0N9DiusMsfk4m3ba9rJtPyG3wjbg29HXpHaYs5+1iGUB
         zftwAhc4QqiZNMASTo0yA+ExTzZ7eFf/lOq4EIi0VRJDmtmwPWfJrxv5VeDTH9cXAp3T
         i4b6ss1fNuCVXmAtXTKORygfcZUOz1Iu9QO2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBITFTqV6PffwXxlyzM4ancQolf5iif5eFpCVo3z2EQ=;
        b=SrlXrK700ZqahEDg0JbMJkdGCVKs9UDyzsKkyJ+5asTc2PULeub/coE/JhsyQz+5UZ
         zeTmuxczgAArK+HFWxZtyYk/vBHiyQE1BGOKpjdHWWdkO1wL50QI874g6CT7mJpFIG3R
         Y/h+bKP43xEhdPvR8Qpzfgc5OJcPCF5WBak+Mx+pCkt/8twyiRKmuidYz52vpni57lkq
         LMlEIpXofMA++vFyrF1AF35XM5G++XYlsbYtVYmZSlyJGOEwJSlRSyBZzCIDTV3WNxbk
         R0sMsVDohiKXZtkf+BsvU2FkzBaqkJumODytwdtlmw8/nOg8XDpUQxjtjE1VEiF83aGr
         OeXw==
X-Gm-Message-State: AOAM533Ijo9nRMlBmB4Pe/HIUvAvqoSrIYEPOirAO2iiClV8t1+a2C9z
        6enxtXZLY9Y3Q8/wVcmlatUwEQFKDxDzPQ==
X-Google-Smtp-Source: ABdhPJyHtPD8V25IFstqKO9G/YO0fk29FDJuAwwkUlQ1cja5aL42O/q8cnBD4MZuaaE5It0kCFZDXg==
X-Received: by 2002:a67:db0b:: with SMTP id z11mr1160892vsj.21.1609888009090;
        Tue, 05 Jan 2021 15:06:49 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id y23sm107400vsk.2.2021.01.05.15.06.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 15:06:48 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id p128so372670vkf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 15:06:48 -0800 (PST)
X-Received: by 2002:a1f:4582:: with SMTP id s124mr1533105vka.7.1609888007477;
 Tue, 05 Jan 2021 15:06:47 -0800 (PST)
MIME-Version: 1.0
References: <20201216071926.3147108-1-swboyd@chromium.org>
In-Reply-To: <20201216071926.3147108-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 Jan 2021 15:06:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VZ7BPw0=_3mfLYmO+kUDLbOfxy=wzH5Vnff=MiGP5oVQ@mail.gmail.com>
Message-ID: <CAD=FV=VZ7BPw0=_3mfLYmO+kUDLbOfxy=wzH5Vnff=MiGP5oVQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Open read access to all for debugfs
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 15, 2020 at 11:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> There doesn't seem to be any reason to limit this to only root user
> readable. Let's make it readable by all so that random programs can
> read the debugfs files in here instead of just root. The information is
> just that, informational, so this is fine.
>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/socinfo.c | 40 +++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

One worry I'd have is whether there would ever be any PII (personally
identifiable information) here, like maybe a chip serial number.  If
so, is that something that is OK to provide to any random process?
...maybe I'm just being paranoid though, since presumably there are
enough random HW characteristics that could be strung together and
hashed to make roughly a unique ID anyway and hiding every HW
characteristic would be a bit extreme...

-Doug
