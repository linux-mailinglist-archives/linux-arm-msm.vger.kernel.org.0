Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5234C2ED3D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 17:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbhAGQCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 11:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbhAGQCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 11:02:13 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB08C0612F6
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 08:01:33 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id e20so3847791vsr.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 08:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVKKP8zyOhDGnVR/3YtVW7x0rMfq/5w74jBHoVaOHoM=;
        b=YzKeDedpF1bzFmpNO1agtIykqm2SpYPV+ylY3RIdrRWg5SSRe2e/uEqNZYOB/46vwq
         qv1EwNw4g/C/7UwIgET0XB4Q/sLp9J9wV0c4OysveHLbf6HduIEgPt9od1onfYInUFeC
         I7E1ppEiLKlUPYfQL8nOB1v6B1DOMhv0EOq/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVKKP8zyOhDGnVR/3YtVW7x0rMfq/5w74jBHoVaOHoM=;
        b=THHBZsFpepwACJA1mHHeTYcAYM5FkLJKBY4Vx2+DpQy13OPfIgY9Pkn0ckMRDbiqEd
         vv6zJCaIRc6mi7DQCQlmjGAaGezCpRsS9aLm6Y5i0b4+Nhlnb9UkTWsbZe7JFnhO0kfF
         +w0W9ubjftVfgCJuV+WQ/15j9LSuhF6gVhwSaPb/sJy8HVYYM4wc8/qzp/CoBAJPW+Tq
         J2njsrMCbVuQ8Ycr6da8eKra8vQsL8xzw4Yudsl3mELcX5c6wPtonvMWUWlCsL2p3kCn
         osN2bAmgAtLL37+v30bs4C1bTpkrkVo82OJMrDxoyI1LtZ12feGQLLVRkr9yBIuwcZzR
         CabQ==
X-Gm-Message-State: AOAM530XZs4bRov/yrGhb9FHDzA7FYnQEX78zGjRcBkh4fg86G3ci+Ez
        OTDsu/RB8WFj8Smydar5XMFkyvWrxvelCA==
X-Google-Smtp-Source: ABdhPJxv0KXzhEPs+MDHfafcBtzK6bBfi+YQcAE91T7ATW7aDQ5rKTv3xD+V2Au2x6VM/OjL1sJ67w==
X-Received: by 2002:a67:fd88:: with SMTP id k8mr7910545vsq.17.1610035291649;
        Thu, 07 Jan 2021 08:01:31 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id r79sm912031vkr.42.2021.01.07.08.01.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 08:01:30 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id 73so2393302uac.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 08:01:30 -0800 (PST)
X-Received: by 2002:ab0:35fa:: with SMTP id w26mr8049339uau.90.1610035289548;
 Thu, 07 Jan 2021 08:01:29 -0800 (PST)
MIME-Version: 1.0
References: <1610008770-13891-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1610008770-13891-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jan 2021 08:01:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WbvfbU4G2H1a1LrG=fwASn3wscHwOymvO1uJwU8aH70Q@mail.gmail.com>
Message-ID: <CAD=FV=WbvfbU4G2H1a1LrG=fwASn3wscHwOymvO1uJwU8aH70Q@mail.gmail.com>
Subject: Re: [PATCH v3] soc: qcom: rpmh: Remove serialization of TCS commands
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 7, 2021 at 12:39 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Lina Iyer <ilina@codeaurora.org>
>
> Requests sent to RPMH can be sent as fire-n-forget or response required,
> with the latter ensuring the command has been completed by the hardware
> accelerator. Commands in a request with tcs_cmd::wait set, would ensure
> that those select commands are sent as response required, even though
> the actual TCS request may be fire-n-forget.
>
> Also, commands with .wait flag were also guaranteed to be complete
> before the following command in the TCS is sent. This means that the
> next command of the same request blocked until the current request is
> completed. This could mean waiting for a voltage to settle or series of
> NOCs be configured before the next command is sent. But drivers using
> this feature have never cared about the serialization aspect. By not
> enforcing the serialization we can allow the hardware to run in parallel
> improving the performance.
>
> Let's clarify the usage of this member in the tcs_cmd structure to mean
> only completion and not serialization. This should also improve the
> performance of bus requests where changes could happen in parallel.
> Also, CPU resume from deep idle may see benefits from certain wake
> requests.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
> Changes in v3:
> - Update the comment in include/soc/qcom/tcs.h
> - Update to keep req->wait_for_compl as is irq handler
>
> Changes in v2:
> - Add SoB of self
> - Fix typo in comment
> - Update comment as Doug suggested
> - Remove write to RSC_DRV_CMD_WAIT_FOR_CMPL in tcs_write() and
>   tcs_invalidate()
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 22 +++++++++-------------
>  include/soc/qcom/tcs.h      |  9 ++++++++-
>  2 files changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
