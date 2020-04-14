Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8002F1A72FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 07:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405512AbgDNF2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 01:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405511AbgDNF2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 01:28:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5F2C0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 22:28:38 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so4820438pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 22:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xgp243WtEP1LNdfVIpvVcbQ0zjOhDHE/KM2PzFcpiyc=;
        b=OPAU9TvDwl7qJCu6OAs5YyahFBZC3Q6cV59WauujCBixAKS7weSNUnQPm/5+MZSb/I
         pAetxkVzb/jb4aTsYFlB8rtTnm+8gvja6ZVuG15KzTf+4UPKKa6XaL9WI6lfJDQ3HMM8
         NvJdkYFKkUZbHwr1bUHSMeEebhcnGFyhWeytsELWUa6+bTHVAGAIB/hH0h706oyWzl22
         2FM/msTcE6mS5aA5+66sYub34SDWu2Rh3SG/57uMrnHRzMxOhQxokRzdQPuWwCaBfttl
         900oFYEkMK+3Q+XM1Wna3FlMzkh5ZmWWHfMnD/VUW9gGakFyT2Jg73ABFy6BoH1GaW+9
         vnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xgp243WtEP1LNdfVIpvVcbQ0zjOhDHE/KM2PzFcpiyc=;
        b=K6uxNPDidYEvhSnle+xhsHqE1JQIbENeRnhGV+1FzNRaFuq8mDruXGcl0xFywKijNI
         5gJxuOEdUt9CE2250Bhas+/SohJ1mV5d7GPjD+yYVsACcMFe7XWM+KKBAqfvFO7MGfA3
         MV16qwvJ9lYsufka8+dPCjr4vaPUcCM2Yc8fugE7V5u0djaHGveCfXBV9Z8nSedE0MB1
         uDJz0Eqs9NA7hCRa2thHFvziEuwafdQJh63b3dRubyPwIFijOGuiM+B/gTNCYS/iOM7n
         nn1Nstc0oTxdpMK/64NqftBn/ms5HKgYpyru0uLzSM60PCMdtTxzFU3pKB604b0rKAwU
         6aVA==
X-Gm-Message-State: AGi0PubKiZSfJSRe+GvYpqtUu+ePxAp+SdcBnk2qQikRNsIu8LQQqlrp
        tUZUYu/rnbuGXz95fSW9SEbFVw==
X-Google-Smtp-Source: APiQypJ2DGxHe+wxDjPG889/Q8OzEdTTI9TJ3wHcYRBPl0exjYxmCYOm6PNGkhxghXFnC3kWQsUmfw==
X-Received: by 2002:a17:90a:23ad:: with SMTP id g42mr12454638pje.35.1586842117393;
        Mon, 13 Apr 2020 22:28:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h6sm10088233pfq.200.2020.04.13.22.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 22:28:36 -0700 (PDT)
Date:   Mon, 13 Apr 2020 22:28:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] drivers: qcom: rpmh-rsc: Cleanup / add lots of
 comments
Message-ID: <20200414052851.GI20625@builder.lan>
References: <20200413170415.32463-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413170415.32463-1-dianders@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Apr 10:04 PDT 2020, Douglas Anderson wrote:

> In order to review Maulik's latest "rpmh_flush for non OSI targets"
> patch series I've found myself trying to understand rpmh-rsc better.
> To make it easier for others to do this in the future, add a whole lot
> of comments / documentation.
> 
> As part of this there are a very small number of functional changes.
> - We'll get a tiny performance boost by getting rid of the "cmd_cache"
>   which I believe was unnecessary.
> - We now assume someone else is in charge of exclusivity for
>   tcs_invalidate() and have removed a lock in there. As per the
>   comments in the patch, this isn't expected to cause problems.
> - tcs_is_free() no longer checks hardware state, but we think it
>   didn't need to.
> 
> These changes touch a lot of code in rpmh-rsc.  Luckily Maulik has
> reported that he's tested them and they work fine for him.  They
> should be ready to go.
> 
> I've tried to structure the patches so that simpler / less
> controversial patches are first. Those could certainly land on their
> own without later patches. Many of the patches could also be dropped
> and the others would still apply if they are controversial.  If you
> need help doing this then please yell.
> 
> These patches are based on Maulik's v17 series, AKA:
> https://lore.kernel.org/r/1586703004-13674-1-git-send-email-mkshah@codeaurora.org
> 
> There are still more cleanups that we need to do, but to avoid having
> too many patches flying through the air at once we'll do them after
> Maulik's v17 and this series lands.
> 
> With all that, enjoy.
> 

Applied the series, with the typos pointed out by Stephen fixed.
Please follow up on the additional suggestions with incremental patches.

Regards,
Bjorn

> Changes in v4:
> - Add "payload" to end of ("Don't double-check rpmh") patch subject
> - Removed extra "make sure" in commit message.
> 
> Changes in v3:
> - ("...are not for IRQ") is new for v3.
> - ("Don't double-check rpmh") replaces ("Warning if tcs_write...")
> - Add "TCS" in title (Maulik).
> - Adjusted comments for rpmh_rsc_write_ctrl_data().
> - Comments for new enable_tcs_irq() function.
> - Comments for new rpmh_rsc_cpu_pm_callback() function.
> - Extra blank line removed (Maulik).
> - IRQ registers aren't in TCS0 (Maulik).
> - Kill find_match moves from patch #9 to patch #5 (Maulik).
> - Mention in message that I also fixed up kernel-doc stuff.
> - Moved comments patch after ("Kill cmd_cache and find_match...").
> - One space after a period now (Maulik).
> - Plural of TCS fixed to TCSes following Maulik's example.
> - Re-added comment in tcs_write() about checking for same address.
> - Rebased atop v16 ('Invoke rpmh_flush...') series.
> - Replace ("...warn if state mismatch") w/ ("...just check tcs_in_use")
> - Replaced ("irqsave()...") + ("...never -EBUSY") w/ ("Caller handles...")
> - Rewrote commit message to adjust for patch order.
> - __tcs_set_trigger() comments adjusted now that it can set or unset.
> - get_tcs_for_msg() documents why it's safe to borrow the wake TCS.
> - get_tcs_for_msg() no longer returns -EAGAIN.
> 
> Changes in v2:
> - Comment tcs_is_free() new for v2; replaces old patch 6.
> - Document bug of tcs_write() not handling -EAGAIN.
> - Document get_tcs_for_msg() => -EAGAIN only for ACTIVE_ONLY.
> - Document locks for updating "tcs_in_use" more.
> - Document tcs_is_free() without drv->lock OK for tcs_invalidate().
> - Document that rpmh_rsc_send_data() can be an implicit invalidate.
> - Document two get_tcs_for_msg() issues if zero-active TCS.
> - Fixed documentation of "tcs" param in find_slots().
> - Got rid of useless "if (x) continue" at end of for loop.
> - More clear that active-only xfers can happen on wake TCS sometimes.
> - Now prose in comments instead of struct definitions.
> - Pretty ASCII art from Stephen.
> - Reword tcs_write() doc a bit.
> 
> Douglas Anderson (10):
>   drivers: qcom: rpmh-rsc: Clean code reading/writing TCS regs/cmds
>   drivers: qcom: rpmh-rsc: Document the register layout better
>   drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
>   drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
>   drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
>   drivers: qcom: rpmh-rsc: A lot of comments
>   drivers: qcom: rpmh-rsc: tcs_is_free() can just check tcs_in_use
>   drivers: qcom: rpmh-rsc: Don't double-check rpmh payload
>   drivers: qcom: rpmh-rsc: Caller handles tcs_invalidate() exclusivity
>   drivers: qcom: rpmh-rsc: read_tcs_reg()/write_tcs_reg() are not for
>     IRQ
> 
>  drivers/soc/qcom/rpmh-internal.h |  66 +++--
>  drivers/soc/qcom/rpmh-rsc.c      | 465 +++++++++++++++++++++----------
>  drivers/soc/qcom/rpmh.c          |   5 +-
>  3 files changed, 363 insertions(+), 173 deletions(-)
> 
> -- 
> 2.26.0.110.g2183baf09c-goog
> 
