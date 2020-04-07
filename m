Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DDE1A18CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDGXu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:50:57 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36227 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgDGXu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:50:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id g2so1843872plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eT68veUdahfIguyUyBYQoqVQI3dpUpP+dfw8Z1rw5oQ=;
        b=dKeiEDM/PDcbX+fPQvAgtDORBZqcmvJ6BvEJWJJCDxNNCyzNjQhJpBTP3d3xIgQ439
         EHC2t7qMFaU01TDtZvzIdZZOe6jtOMYFF/FRidLta6hxWbb/2We2PvfJ/+zG1YUfx0B6
         MOFHzw0uf5F6afuyvwkxKCU7CNR4pj5q4Pv3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eT68veUdahfIguyUyBYQoqVQI3dpUpP+dfw8Z1rw5oQ=;
        b=fS4+5eeKiZduGVropbsxWTn17fSSO+lzE5+FpHyl9J6YGd4kJTVjPJtHVv8o7VAOcz
         ywARMSAwlDZmKPRnjKxHvZtFVXgUJsd6B9AKgaeXtvMsTXIPAXKMVOoTKdwePrGa/Bo1
         79OmX13xq1HUtXgWEPPMc3PkLZhOKhQfqhRMX1KuXVUnktE54h9mj/XLmmvrQHJIjAq5
         6IodIr5ZoNdZTJekUHSnjT05JukDzKcTfIYsacgiDXnAOJELrADpllP6jJpodSoormqZ
         pZCjqtFmS2wNLiyTPWCG5JSecuS+Oic7eJ7YZ/0MAj32CZvRmf1bQ8qDIpCuLe9iKziW
         9zrg==
X-Gm-Message-State: AGi0PuYTRwUpEQ2OcPQOJ3R5i0j6FRP+bORuUp69Zhslmzc/H37TgqcF
        8/s+nmqp8+itiNPh2ZKylCLM5YjQU876VA==
X-Google-Smtp-Source: APiQypJYTmO0cbgnxZFQZqkN1iaxMEolwKi85hzl9BR9MlhjVCBjNxuHbd1evldXYryQV0IDGem+MA==
X-Received: by 2002:a17:90a:ba09:: with SMTP id s9mr2081513pjr.20.1586303455987;
        Tue, 07 Apr 2020 16:50:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:50:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] drivers: qcom: rpmh-rsc: Cleanup / add lots of comments
Date:   Tue,  7 Apr 2020 16:50:14 -0700
Message-Id: <20200407235024.260460-1-dianders@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
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

These changes touch a lot of code in rpmh-rsc, so hopefully someone at
Qualcomm can test them out better than I did (I don't have every last
client of RPMH in my tree).

I've tried to structure the patches so that simpler / less
controversial patches are first. Those could certainly land on their
own without later patches. Many of the patches could also be dropped
and the others would still apply if they are controversial.  If you
need help doing this then please yell.

These patches are based on Maulik's v16 series, AKA:
https://lore.kernel.org/r/1586154741-8293-1-git-send-email-mkshah@codeaurora.org/

With all that, enjoy.

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
  drivers: qcom: rpmh-rsc: Don't double-check rpmh
  drivers: qcom: rpmh-rsc: Caller handles tcs_invalidate() exclusivity
  drivers: qcom: rpmh-rsc: read_tcs_reg()/write_tcs_reg() are not for
    IRQ

 drivers/soc/qcom/rpmh-internal.h |  66 +++--
 drivers/soc/qcom/rpmh-rsc.c      | 465 +++++++++++++++++++++----------
 drivers/soc/qcom/rpmh.c          |   5 +-
 3 files changed, 363 insertions(+), 173 deletions(-)

-- 
2.26.0.292.g33ef6b2f38-goog

