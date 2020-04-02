Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A5A19CAD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389104AbgDBUOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:14:38 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41669 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388054AbgDBUOi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:14:38 -0400
Received: by mail-ua1-f68.google.com with SMTP id f9so1831499uaq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3xnVk01EXqzg7moA4R1yAW9PPXebyh4g8UETIH3Gq/E=;
        b=IDP378Q/VvOE2mD9ZMEgZg6Z1NnCKss4dfxlUumNJhwIKibnLnUWx6Ipu5w2nFNGS9
         tny5YIJ+kPWqMna/I7tp4bFp4lJVUccz4q9Sh2C4rbD11PpHkIG/IsaN0k2iPdzE/sxa
         Dd6vyDJpxsmtUysn8dvyLRARqbr9P9fZpsoM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3xnVk01EXqzg7moA4R1yAW9PPXebyh4g8UETIH3Gq/E=;
        b=Lo68U4PgYvzJjJYIfexdLdJyT4olFsQMkVw+NgfXjlecOZ52gZ006cwUqLJ7ILdwwH
         rrfDFG+DW01JXkqiL1/NRX8ZRbYMRsKjXUlKdmvqXaBxDKjXUsZzNi5ae7xbLjLTA1QC
         20gvP+tZ1a1UDF0gVwJ8R/geM4mgxZFQyFGUhl91nqKdRfQiOeA2ZCuy7AOhcL0a3yIA
         ecifOz8gztgXUzNKlnmjjCt/NsST68HBsFcx02aocFq2DPRnljlSFhHcx6VdCfhmI750
         SSbehUjaxs58UN/3eDjCSVArErGFLnt1qKQtt0eTTpXdCMyKdI4KD1VxqzL5UjsBHZO0
         M9pw==
X-Gm-Message-State: AGi0Puasm1gLWlJ/oLrluUgO+cILqs7P+bYqqKPW6oWFW18T/2LFiqEs
        kmu7a3rB0Au4Z/HehyCIL0h7p8b2nzE=
X-Google-Smtp-Source: APiQypK8ZS17vQPZhVIxdzY16ActWu3ct29b3J20UUEtU8ZE7aM1qGe2ol5Hpo3hkRGJbdk42hWEhg==
X-Received: by 2002:ab0:288d:: with SMTP id s13mr3977909uap.39.1585858476331;
        Thu, 02 Apr 2020 13:14:36 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id k14sm1682913vko.33.2020.04.02.13.14.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:14:35 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id o3so3424504vsd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:14:35 -0700 (PDT)
X-Received: by 2002:a67:2c81:: with SMTP id s123mr4049018vss.198.1585858474864;
 Thu, 02 Apr 2020 13:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org> <1585660782-23416-7-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585660782-23416-7-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:14:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UqaTR7=i=5BApvnptZXpqVJiF1AE+Q+6H9Y4QdYfjfUQ@mail.gmail.com>
Message-ID: <CAD=FV=UqaTR7=i=5BApvnptZXpqVJiF1AE+Q+6H9Y4QdYfjfUQ@mail.gmail.com>
Subject: Re: [PATCH v15 6/7] soc: qcom: rpmh-rsc: Clear active mode
 configuration for wake TCS
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 31, 2020 at 6:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> @@ -243,6 +279,14 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>                 }
>
>                 trace_rpmh_tx_done(drv, i, req, err);
> +
> +               /*
> +                * If wake tcs was re-purposed for sending active
> +                * votes, clear AMC trigger & enable modes and
> +                * disable interrupt for this TCS
> +                */
> +               if (!drv->tcs[ACTIVE_TCS].num_tcs)
> +                       __tcs_set_trigger(drv, i, false);

Still seems weird that we have to do the untrigger in the IRQ routine
here and also weird that we _don't_ do it in the IRQ routine for
non-borrowed TCSes.  I guess it's not the end of the world, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
