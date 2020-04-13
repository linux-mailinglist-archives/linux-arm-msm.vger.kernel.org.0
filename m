Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16841A6AD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732339AbgDMREm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732285AbgDMREl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:04:41 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BB9C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n13so4691403pgp.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ceulhz3n3M1xBWzRxkP3qWy9KlyCG/n8MPY9jtHXKak=;
        b=cE0wMgMJTmg3KdGHenvJolN4TqRChZKPCuG0ZohpyvtJOUR5kGgiz/NP+wbVAQzTBz
         HDepdqj0PNCewtBACtSAlf6KGPSKmZVyXmOqddKtZizRvfdYT0Hct+q0Wrq3nm/2IHSG
         l3fEDQ0IwjjxBvpb8i00NeCPOJD4WRkrZaQQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ceulhz3n3M1xBWzRxkP3qWy9KlyCG/n8MPY9jtHXKak=;
        b=e/NSKneAA+hYQB9PqOweuWdpnCyeAIaCeggmx39ebPjL/N+a4+/tjmXxJY46aHwo7k
         lUd0E8nZBhKG82HTzWktfsA/YlZeZXNybNlHD6sosv/hZRZKlfKhCHqFDB5UUz0ArqRA
         CgYsqF6wXRITY9N+HH5mOiV0dYeMobmP/ek4bcjdpe9AnZiasddkACR7WT/1YLgkYU6m
         t7SHZJS/n6VNPNQ7RzBsCivgwDnHi2K3dnt61hpWiXeyOyKDGaa0CokzQEw88/dRbUr+
         TmOWI3aX8sCxcAIoeo+qCVOzl2iR09/MwMlPepye1ng9gB6dZvah0VOteksL2DuLwAXz
         UjEQ==
X-Gm-Message-State: AGi0PuaQWQZpTaX3PzQAkW2ct0uxk0UM1vJQ+tYhwQt0xvGHWwNKGygw
        FA8rIzcxZTQVtnDck9ZivO+zSw==
X-Google-Smtp-Source: APiQypJCj7EZAoTI/78OD3/Rna1nFDgg6H9lUbQV6x/gpSSn6lvb+SoYx3fzB5eW/lrsdnAwuikL0w==
X-Received: by 2002:a63:2143:: with SMTP id s3mr17727335pgm.20.1586797480703;
        Mon, 13 Apr 2020 10:04:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p62sm1634414pfb.93.2020.04.13.10.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:04:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>, evgreen@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/10] drivers: qcom: rpmh-rsc: Cleanup / add lots of comments
Date:   Mon, 13 Apr 2020 10:04:05 -0700
Message-Id: <20200413170415.32463-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to review Maulik's latest "rpmh_flush for non OSI targets"
patch series I've found myself trying to understand rpmh-rsc better.
To make it easier for others to do this in the future, add a whole lot
of comments / documentation.

As part of this there are a very small number of functional changes.
- We'll get a tiny performance boost by getting rid of the "cmd_cache"
  which I believe was unnecessary.
- We now assume someone else is in charge of exclusivity for
  tcs_invalidate() and have removed a lock in there. As per the
  comments in the patch, this isn't expected to cause problems.
- tcs_is_free() no longer checks hardware state, but we think it
  didn't need to.

These changes touch a lot of code in rpmh-rsc.  Luckily Maulik has
reported that he's tested them and they work fine for him.  They
should be ready to go.

I've tried to structure the patches so that simpler / less
controversial patches are first. Those could certainly land on their
own without later patches. Many of the patches could also be dropped
and the others would still apply if they are controversial.  If you
need help doing this then please yell.

These patches are based on Maulik's v17 series, AKA:
https://lore.kernel.org/r/1586703004-13674-1-git-send-email-mkshah@codeaurora.org

There are still more cleanups that we need to do, but to avoid having
too many patches flying through the air at once we'll do them after
Maulik's v17 and this series lands.

With all that, enjoy.

Changes in v4:
- Add "payload" to end of ("Don't double-check rpmh") patch subject
- Removed extra "make sure" in commit message.

Changes in v3:
- ("...are not for IRQ") is new for v3.
- ("Don't double-check rpmh") replaces ("Warning if tcs_write...")
- Add "TCS" in title (Maulik).
- Adjusted comments for rpmh_rsc_write_ctrl_data().
- Comments for new enable_tcs_irq() function.
- Comments for new rpmh_rsc_cpu_pm_callback() function.
- Extra blank line removed (Maulik).
- IRQ registers aren't in TCS0 (Maulik).
- Kill find_match moves from patch #9 to patch #5 (Maulik).
- Mention in message that I also fixed up kernel-doc stuff.
- Moved comments patch after ("Kill cmd_cache and find_match...").
- One space after a period now (Maulik).
- Plural of TCS fixed to TCSes following Maulik's example.
- Re-added comment in tcs_write() about checking for same address.
- Rebased atop v16 ('Invoke rpmh_flush...') series.
- Replace ("...warn if state mismatch") w/ ("...just check tcs_in_use")
- Replaced ("irqsave()...") + ("...never -EBUSY") w/ ("Caller handles...")
- Rewrote commit message to adjust for patch order.
- __tcs_set_trigger() comments adjusted now that it can set or unset.
- get_tcs_for_msg() documents why it's safe to borrow the wake TCS.
- get_tcs_for_msg() no longer returns -EAGAIN.

Changes in v2:
- Comment tcs_is_free() new for v2; replaces old patch 6.
- Document bug of tcs_write() not handling -EAGAIN.
- Document get_tcs_for_msg() => -EAGAIN only for ACTIVE_ONLY.
- Document locks for updating "tcs_in_use" more.
- Document tcs_is_free() without drv->lock OK for tcs_invalidate().
- Document that rpmh_rsc_send_data() can be an implicit invalidate.
- Document two get_tcs_for_msg() issues if zero-active TCS.
- Fixed documentation of "tcs" param in find_slots().
- Got rid of useless "if (x) continue" at end of for loop.
- More clear that active-only xfers can happen on wake TCS sometimes.
- Now prose in comments instead of struct definitions.
- Pretty ASCII art from Stephen.
- Reword tcs_write() doc a bit.

Douglas Anderson (10):
  drivers: qcom: rpmh-rsc: Clean code reading/writing TCS regs/cmds
  drivers: qcom: rpmh-rsc: Document the register layout better
  drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
  drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
  drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
  drivers: qcom: rpmh-rsc: A lot of comments
  drivers: qcom: rpmh-rsc: tcs_is_free() can just check tcs_in_use
  drivers: qcom: rpmh-rsc: Don't double-check rpmh payload
  drivers: qcom: rpmh-rsc: Caller handles tcs_invalidate() exclusivity
  drivers: qcom: rpmh-rsc: read_tcs_reg()/write_tcs_reg() are not for
    IRQ

 drivers/soc/qcom/rpmh-internal.h |  66 +++--
 drivers/soc/qcom/rpmh-rsc.c      | 465 +++++++++++++++++++++----------
 drivers/soc/qcom/rpmh.c          |   5 +-
 3 files changed, 363 insertions(+), 173 deletions(-)

-- 
2.26.0.110.g2183baf09c-goog

