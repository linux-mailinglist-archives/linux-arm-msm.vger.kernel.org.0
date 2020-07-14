Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5DC21E4D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 02:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGNAxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 20:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgGNAxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 20:53:33 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AC5C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 17:53:33 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id u33so2656308uad.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 17:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uBmPGkwb8F27DgB7ghpu4ldmH1wyapHT/SdG1wNVoGM=;
        b=DsVuBHOSfihKaNkABXRm4ftNILFS5xlzW6RCsluK4T11o2qaXfRJa5N0UNwsp+0kCJ
         53tVV/PwX28dzQ54HAuuCIN7gy+nUOCPu2EunQOHMCfOVUG950g7F3158McC+Q3pXBLw
         KdViqNVDKlGvtHk3ZRRKIfsi3+Ub9nFkvXgaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uBmPGkwb8F27DgB7ghpu4ldmH1wyapHT/SdG1wNVoGM=;
        b=N4qFtluCFmhPUMxduBjzPAZaTzk1d6P1oAoOOzrHiJw7NIXiS/FK91nKZ79GqO2eCf
         u838R71Wu20SIWx5FenZPaLIojFvFKI3o8FXiPK486osdbr9yd0n7giR5nAv9oDxU+Ge
         1wOVjQlVhizwKWP6dopX/9jwrtYrqyb+2zlLYm97d37cleG4FQKmGy9+7uCKtw2OG7VI
         dLQFmFCLuIjHmYY7Qy/K/G6c3YPIq1tUlm2Pa1esbWnjfRQlWdXJqefPpUp5XCQdjtS/
         79fmRnrpE7l31w/BWRNMImtjkUUFI+LeUiIq+hWGH8ElABn5ymyyVHHNsOhsB47mzUmO
         D21w==
X-Gm-Message-State: AOAM531lCtTx0iGhRAYC6anIaQS6SJdSvhJVbMfUQxx73g6GqgKqxO/2
        43DoY89a9D6Kvqz56PnIumYLz8NUKbc=
X-Google-Smtp-Source: ABdhPJyQl08f+53cbub3EdLa7+i8Zzr+NrVu7fwqK64EKNcG0o/EA/6bAD9FjSMXuUjuLaneymOvSQ==
X-Received: by 2002:a9f:31b3:: with SMTP id v48mr1623526uad.87.1594688012708;
        Mon, 13 Jul 2020 17:53:32 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id b21sm1722274uap.15.2020.07.13.17.53.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 17:53:31 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id u33so2656263uad.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 17:53:31 -0700 (PDT)
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr1932767uav.0.1594688011224;
 Mon, 13 Jul 2020 17:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <1594287420-24141-1-git-send-email-rnayak@codeaurora.org> <20200710124152.GC1567243@kroah.com>
In-Reply-To: <20200710124152.GC1567243@kroah.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 17:53:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJQaAHsDb6uvKpwU87qtqTQgNeoiuRr2kF9pqjBLhLpg@mail.gmail.com>
Message-ID: <CAD=FV=XJQaAHsDb6uvKpwU87qtqTQgNeoiuRr2kF9pqjBLhLpg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: qcom-geni-serial: Drop the icc bw votes in
 suspend for console
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-serial@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rajendra,

On Fri, Jul 10, 2020 at 5:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 09, 2020 at 03:07:00PM +0530, Rajendra Nayak wrote:
> > When using the geni-serial as console, its important to be
> > able to hit the lowest possible power state in suspend,
> > even with no_console_suspend.
> > The only thing that prevents it today on platforms like the sc7180
> > is the interconnect BW votes, which we certainly don't need when
> > the system is in suspend. So in the suspend handler mark them as
> > ACTIVE_ONLY (0x3) and on resume switch them back to the ALWAYS tag (0x7)
> >
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > ---
> > Note: Patch applies on qcom for-next, which has the ICC support patches.
> > The tag macros are currently not exported and hence the hardcoded values.
> > Perhaps if and when https://patchwork.kernel.org/patch/11619705/ lands I
> > can refresh this patch to use the macros.
>
> Feel free to take this patch through that tree.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Could you post a v2?  Bjorn landed some of my geni serial patches to
make console / kgdb work better, but then I realized that your patch
no longer applies cleanly.  It's trivial to resolve, so hopefully a v2
should be quick and then Bjorn can land?

Thanks!

-Doug
