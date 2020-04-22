Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2471B4FAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 23:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDVVz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 17:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgDVVz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 17:55:58 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19440C03C1A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:58 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id i22so3594634uak.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ee+zATalvFDSHsDJhhon2QlCCkUj/d0VudmLHXnBmsM=;
        b=TUd4rJqLQZsjq6KLXtPQcP3sPAG8zMj1ACMMw0j6JpLd66ThrMzdO2Q6cwbu7nRl/O
         YbMYQ1NFClJK2gnsolCt/ewAhNbddIrazAl3MHUOx8excckMfhPbqY8ihcky+e7LVQ/e
         9go05fP/WOtdAH34H5vTlfDfGvX8gSYH9ZHCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ee+zATalvFDSHsDJhhon2QlCCkUj/d0VudmLHXnBmsM=;
        b=BcFNZvZ2RHmxSzc1pimSMMsB4tMWERp/q8cpNx1LQxLHCnWYEoTAbEoZWiDy6X8VoZ
         udHBtev0kklx2WT3Y6BUfrhtZuOqEarnjPlF9S1ynlakQMkJHf7XYoPmrJ6G/IiM5ff3
         wv0C11xZKLfLteIMo4VdHtd/3LJCvlp2klMVwEf7r6yYwBYHo7rvQLGH+FoQfkp4UWW0
         s7ZnEaRjf4DZVvxR7e36jPWLgowgOgFz/FPdy8+DKqtC3XfkjtBKfSHgMNfpKky5/xIl
         yuwlOy6qRrZ4Q9wB81aw3nDfF8HrgYtzb1O56AzJlqhKKaZidXvxUUNn34a96ebWOfU0
         OdSg==
X-Gm-Message-State: AGi0PuZ00AHFDeTXOYxZFPmYgB6HPWXv9AuR37HmkS/NnvTbdu/cprwz
        EiNKqPE7xscuPcmA5zthenLRYmXJF1c=
X-Google-Smtp-Source: APiQypKzxpdxJuYfgVMSxMA7w641QJHLzYUIzsBj7y7sY7Hg7hbd8fu0EASkQ3HufSzpQpyIeuPiXw==
X-Received: by 2002:a67:2046:: with SMTP id g67mr793942vsg.107.1587592557079;
        Wed, 22 Apr 2020 14:55:57 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id g130sm205813vke.15.2020.04.22.14.55.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 14:55:56 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id i5so3624120uaq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:56 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr808727vsq.109.1587592555835;
 Wed, 22 Apr 2020 14:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200421102745.v3.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
 <20200421102745.v3.3.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid> <158755160722.163502.9129728895530548942@swboyd.mtv.corp.google.com>
In-Reply-To: <158755160722.163502.9129728895530548942@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Apr 2020 14:55:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKAVSsk=4NtqgsdR3MVTtTQiJVHGaLnu+WLt5mWCZXtQ@mail.gmail.com>
Message-ID: <CAD=FV=UKAVSsk=4NtqgsdR3MVTtTQiJVHGaLnu+WLt5mWCZXtQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] soc: qcom: rpmh-rsc: Remove the pm_lock
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 22, 2020 at 3:33 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-04-21 10:29:08)
> >         case CPU_PM_ENTER_FAILED:
> >         case CPU_PM_EXIT:
> > -               cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> > -               goto exit;
> > +               atomic_dec(&drv->cpus_in_pm);
> > +               return NOTIFY_OK;
> > +       default:
> > +               return NOTIFY_DONE;
>
> Can this be split out and merged now? It's a bugfix for code that is in
> -next.

Sure.  I guess I had visions that the removal of the pm_lock would
make it into -next soon-ish too...

Interestingly, when testing the split-out patch I found that it wasn't
nearly as important as it appears.  Specifically we don't appear to
get cluster notifications except for a final one at the end of full
system suspend.  Grepping for cpu_cluster_pm_enter() the only calls
(other than the one from cpu_pm_suspend()) I see are in "arch/arm",
not arm64.

I've also split out my own bugfix about not getting notified about our
own failure.

v4 posted now...


-Doug
