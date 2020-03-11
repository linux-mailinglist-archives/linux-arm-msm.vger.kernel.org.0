Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B15C182599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731447AbgCKXON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:14:13 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:42956 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgCKXON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:14:13 -0400
Received: by mail-pg1-f182.google.com with SMTP id h8so2015989pgs.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fzqV9CIXY2BfnMARHLSgEpUszUvgGeFszKnXnVPv7A=;
        b=HfrBcWnOvQslSDkVIY+fV4VXSCSPc3FGdKCKUKZv11fcEjDmlkcTf8/HlVuJX/yQF0
         a9XpHbmV0UvsVi4zSHm0OBynQoVmqmE0KK82kPqlUg8/aODuMRaGcd5HEHAyDPYqh2OY
         L9QG0IiHzhCZngnxt1/5vAzlysvG1A7fNhknc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fzqV9CIXY2BfnMARHLSgEpUszUvgGeFszKnXnVPv7A=;
        b=H4+QUgS+pgCmpmU4E6inpSM9ODzbyMXu8DgsCps4d7ykzCE8kn3zMv+k3IQoq6faiC
         VV2OIX7fax+sUkDQHDbiyXNA5RGEqPCGJaL2LyC1Qk1yVNE57GchiELbrmFWSpcH1r5y
         pizmB2KzHpkzcUWBY7IRrhvqBep+pmwueah6yTVY1NNPfSO9THAbPWyPxmHdVWK8lylp
         xBrwPh9N2mM+MxdRVQ88+FisH7zBw9m77Y3k7eG/Og9zYJ7WVQNJvYMzC8EHMAZOnuZa
         aWOWPROJVtGNdlISBfPU58FYcrb/QmCJf7xYNN80snpSjiIwurM8tl0Cil+nh0s3xHjf
         xJJA==
X-Gm-Message-State: ANhLgQ0OsnQy/9z6ItVrYW29TYJXDTdbYmvK+++8jZovI54fMqUNlm2I
        xv+sWg44nJ1jyNgffBJqbwzkNA==
X-Google-Smtp-Source: ADFU+vtx6aR8psbf8LLqN1yirRS07sqKunMTmuIDgxuvkV+qlMK9XEO/i3wXp4RKuxjEwBLPylZHrQ==
X-Received: by 2002:a62:15cc:: with SMTP id 195mr3165847pfv.276.1583968451595;
        Wed, 11 Mar 2020 16:14:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g75sm2606334pje.37.2020.03.11.16.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:14:11 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 00/10] drivers: qcom: rpmh-rsc: Cleanup / add lots of comments
Date:   Wed, 11 Mar 2020 16:13:38 -0700
Message-Id: <20200311231348.129254-1-dianders@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
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
  which I believe was unnecessary (though just to be sure, best to try
  this atop Maulik's patches where it should be super obvious that we
  always invalidate before writing sleep/wake TCSs.
- I think I've eliminated a possible deadlock on "nosmp" systems,
  though it was mostly theoretical.
- Possibly we could get a warning in some cases if I misunderstood how
  tcs_is_free() works.  It'd be easy to remove the warning, though.

These changes touch a lot of code in rpmh-rsc, so hopefully someone at
Qualcomm can test them out better than I did (I don't have every last
client of RPMH in my tree) and review them soon-ish so they can land
and future patches can be based on them.

I've tried to structure the patches so that simpler / less
controversial patches are first.  Those could certainly land on their
own without later patches.  Many of the patches could also be dropped
and the others would still apply if they are controversial.  If you
need help doing this then please yell.

At the end of this patch series there is still one TODO left in the
code.  Specifically I think we still have some problems when we try to
borrow a wakeup TCS for an active-only transfer.  The problems I think
are there aren't new, just the comment.  It's unclear if we should
land with the TODO in place or wait till that gets resolved first.

With all that, enjoy.

Changes in v2:
- Now prose in comments instead of struct definitions.
- Pretty ASCII art from Stephen.
- More clear that active-only xfers can happen on wake TCS sometimes.
- Document locks for updating "tcs_in_use" more.
- Document tcs_is_free() without drv->lock OK for tcs_invalidate().
- Document bug of tcs_write() not handling -EAGAIN.
- Document get_tcs_for_msg() => -EAGAIN only for ACTIVE_ONLY.
- Reword tcs_write() doc a bit.
- Document two get_tcs_for_msg() issues if zero-active TCS.
- Document that rpmh_rsc_send_data() can be an implicit invalidate.
- Fixed documentation of "tcs" param in find_slots().
- Comment tcs_is_free() new for v2; replaces old patch 6.
- Got rid of useless "if (x) continue" at end of for loop.
- ("Always use -EAGAIN, never -EBUSY") new for v2.

Douglas Anderson (10):
  drivers: qcom: rpmh-rsc: Clean code reading/writing regs/cmds
  drivers: qcom: rpmh-rsc: Document the register layout better
  drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
  drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
  drivers: qcom: rpmh-rsc: A lot of comments
  drivers: qcom: rpmh-rsc: Comment tcs_is_free() + warn if state
    mismatch
  drivers: qcom: rpmh-rsc: Warning if tcs_write() used for non-active
  drivers: qcom: rpmh-rsc: spin_lock_irqsave() for tcs_invalidate()
  drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire
  drivers: qcom: rpmh-rsc: Always use -EAGAIN, never -EBUSY

 drivers/soc/qcom/rpmh-internal.h |  52 ++--
 drivers/soc/qcom/rpmh-rsc.c      | 443 +++++++++++++++++++++++--------
 2 files changed, 358 insertions(+), 137 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

