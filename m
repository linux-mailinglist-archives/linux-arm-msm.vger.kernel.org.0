Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089DD1A2CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 02:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgDIAKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 20:10:16 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:35501 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgDIAKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 20:10:15 -0400
Received: by mail-ua1-f65.google.com with SMTP id a6so3355032uao.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B6pS9OgAcPsD6CSPKpIIvHEG5zqVSzQLTTYkVt8jyck=;
        b=QzNPLo5RL3lO4TmcYcF4V23HmCtH6zvc/crCSse2osUeXKghPrIz35H3jROp57Pjgn
         bNzydnCYuDad7TyqCSU8b4kqNffY3kKjr7V85Po1uBZTiSt9EqlzUwi3Ra7nIr2/HtKy
         U+Y0d1OkSTzwAv2urvP556j42eGzCmag+ojsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B6pS9OgAcPsD6CSPKpIIvHEG5zqVSzQLTTYkVt8jyck=;
        b=qsIi9/20GBjuQHsned/JJNpoqtOxYt11XL8YkTQLIMIWj4o9xsygPEulPqJWQHJ45r
         aIJ3iQRm9UkGZQ1VbvROD37gVfD7PvkYcTgHn+6Rm5B0A3GC00zuxcPa3BHZJC+HVbs+
         ZSSoAhhy3NfBRM1qbboWq5OLes9NDk07KASMH262oEsthlBQm8SoXCm18UyLPhmfgz5N
         UlQQbG+wD1Vd1dzG9m9DcToNU2btovm9RTIesCIzn4cz0WyJ5e+hDQjPrXT/LCRy0SfP
         i5tR60U8Iie0O7lS+DCraeXtW77k6DpUFFe/eDxNm/2u4kltKEnxS5tTEonXKGv7Io7I
         1yaA==
X-Gm-Message-State: AGi0PubTa50hjZVmNpiWOxdyZ3XzhEQX28LAooj1QU6BJ6d1i4vTj3uV
        6RnrCQJ54qqxhTRGNGj+NWrFMHmmsHs=
X-Google-Smtp-Source: APiQypKfYqn2sjGtrISNji3s3x+9klSRmTN6+aRrO8am5sLfM5lP4ynepQSC4D9uyvBOqEJ4O0dmgA==
X-Received: by 2002:ab0:2389:: with SMTP id b9mr7355574uan.120.1586391014504;
        Wed, 08 Apr 2020 17:10:14 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id d1sm6581236vso.10.2020.04.08.17.10.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 17:10:13 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id i22so3334302uak.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 17:10:12 -0700 (PDT)
X-Received: by 2002:ab0:2389:: with SMTP id b9mr7355490uan.120.1586391012513;
 Wed, 08 Apr 2020 17:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.8.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid> <b61a5b31-d614-93f2-7fdd-ec372fba3080@codeaurora.org>
In-Reply-To: <b61a5b31-d614-93f2-7fdd-ec372fba3080@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Apr 2020 17:10:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQbtrkK1u6jTuc-pP4fUx0av3eMYznSkUSC2io7BGmmg@mail.gmail.com>
Message-ID: <CAD=FV=XQbtrkK1u6jTuc-pP4fUx0av3eMYznSkUSC2io7BGmmg@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] drivers: qcom: rpmh-rsc: Don't double-check rpmh
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 8, 2020 at 5:24 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> In rpmh.c, rpmh_write_async() and rpmh_write_batch() uses
> __fill_rpmh_msg() which already checks for below payload conditions.
>
> so i am ok to remove duplicate checks from rpmh-rsc.c
>
> can you please add payload at the end of subject.
>
> drivers: qcom: rpmh-rsc: Don't double-check rpmh payload
>
> Other than this.
>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks!  Bjorn / Andy: if you want me to spin my series I'm happy to.
I'm also happy to just let you fix this nit in the commit message and
the other one Maulik had when applying.  Just let me know.


> Note:
>
> rpmh_write() is not using __fill_rpmh_msg() and have replica as below,
> probably since it was declares message on stack instead of using malloc()
>
>          if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
>                  return -EINVAL;
>
>          memcpy(rpm_msg.cmd, cmd, n * sizeof(*cmd));
>          rpm_msg.msg.num_cmds = n;
>
> Making a note to remove above if check and start using __fill_rpmh_msg()
> here as well to do memcpy() and num_cmds initilization.
>
> Although it may end up writing msg.state and msg.cmd twice (once during
> defining msg on stack and then during fill rpmh msg) but it should be ok.
>
> Below two lines from __rpmh_write() can be removed as well.
>
>          rpm_msg->msg.state = state;
>
> DEFINE_RPMH_MSG_ONSTACK() and __fill_rpmh_msg() seems taking care of
> initializing msg.state already, so we should be good.
>
> if you are spinning a new version and want to include above change as
> well, i am ok.
>
> if not, i can push separate patch to update this as well once my series
> to invoke rpmh_flush() gets picked up.

I'd sorta be inclined to wait and do this later just because it seems
like we've got enough changes stacked together right now...

-Doug
