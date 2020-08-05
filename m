Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E9B23D2F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 22:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHEUZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 16:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgHEUZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 16:25:41 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD59C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 13:25:41 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 125so9164858vsg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NeLZEQ55IXSBwyK2UtcYBYdp7h3NvOqG3j88PCLKXdE=;
        b=ldq66E588YQ2N2pcWRS0g7hqu2I61ObMKOqxKEQpKmUkiMb1rk5TLMnU+N5U1dEd70
         ULvtiu9eFIosjAgCa3rwlD4dYGk2ZWh+iYydq0m5hfNWZB5g8//uQA0AeXXZtnh26n0h
         nP+M6nQ+9eNipJt0FwYaO/LiVpyjl2JF22Dp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NeLZEQ55IXSBwyK2UtcYBYdp7h3NvOqG3j88PCLKXdE=;
        b=G5tcq6cqFvjf35QRi+BaziU775lTlTiDFO7enBufbQEmO+/bmOWiXAC22sV4ad+1q5
         L+jLIn3+zP0QnLybc9wsKbNz/QIq3uuSiIEFMFktLx+JZRYe36s73FB+rfBKS8JlJZPC
         G32h3yqKutylwu9L0VjlQgSeU0wyS25iCQsvFWfWDgRhtRNXjmvv/z4YXl91fi/IBzFE
         jdcsTeVCfXQCeEvhaKbp/xTNhQyCSGpyF2P8G7fh4+vShf+n+KrODO1GLZJpe9g70Dwg
         BHsDuFhJtT1XhELOizTA+EoRipp+gAuFnPfqcnRbl0/Tww4yZT0OERDxvYyCNuBzDjeW
         mbUQ==
X-Gm-Message-State: AOAM532L/NMc1j85rjZMFPe4NP028vX25WwTa1puGVHTr4evDxRDhwuF
        vSzydxufsXuD8815pE/s60X1DwHc2Fw=
X-Google-Smtp-Source: ABdhPJxSDUNcqovQ37H4sx29iV9nvuPUqsLKWxtn4yjjk0K22Ytz3HJ80Jv/5cDhsSD1j4IaHMj+ZA==
X-Received: by 2002:a67:e189:: with SMTP id e9mr3752734vsl.3.1596659140502;
        Wed, 05 Aug 2020 13:25:40 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id k2sm444405uaj.0.2020.08.05.13.25.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 13:25:39 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id q72so2794541vkb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 13:25:39 -0700 (PDT)
X-Received: by 2002:a1f:8c09:: with SMTP id o9mr4278840vkd.28.1596659139113;
 Wed, 05 Aug 2020 13:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200805091141.1.I86b3faaecb0d82997b599b1300f879606c71e116@changeid>
 <20200805091141.2.If847565ed7568448c67804f3735d5f8a61eda560@changeid> <159664848938.1360974.193633020977562116@swboyd.mtv.corp.google.com>
In-Reply-To: <159664848938.1360974.193633020977562116@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Aug 2020 13:25:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9K17Un9bPnUvieNO_6tpThPVqdk92_KcQxpOtMTYDxg@mail.gmail.com>
Message-ID: <CAD=FV=V9K17Un9bPnUvieNO_6tpThPVqdk92_KcQxpOtMTYDxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: aoss: qmp_send() can't handle
 interruptions so stop pretending
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 5, 2020 at 10:28 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-08-05 09:16:11)
> > The function qmp_send() called wait_event_interruptible_timeout() to
> > wait for its interrupt.  However, this function did not check for
> > -ERESTARTSYS and assumed that any non-zero return value meant that the
> > event happened.
> >
> > While we could try to figure out how to handle interruptions by
> > figuring out how to cancel and/or undo our transfer in a race-free way
> > and then communicating this status back to all of our callers, that
> > seems like a whole lot of complexity.  As I understand it the transfer
> > should happen rather quickly and if we're really hitting the 1 second
> > timeout we're in deep doggy doodoo anyway.  Let's just use the
> > non-interruptible version of the function and call it good enough.
> >
> > Found by code inspection.  No known test cases expose the problem
> > described here.
> >
> > Fixes: 2209481409b7 ("soc: qcom: Add AOSS QMP driver")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> I would put this first in the series as it's an obvious bug fix.

I guess I thought of it the other way.  This is a less serious problem
(no known way to tickle it) and so deserved to be 2nd.  I'm happy to
flip it as needed, though.  It would also be trivially easy to flip
when applying.


> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks!

-Doug
