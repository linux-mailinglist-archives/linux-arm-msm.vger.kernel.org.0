Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B4A3BAACB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 03:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhGDBeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 21:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhGDBeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 21:34:01 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E61C061764
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jul 2021 18:31:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n33so1506993wms.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jul 2021 18:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gNEaQb0fIENMx1ex6ijnu94BNCTxNqJRzzbxuRHhkzU=;
        b=cwYcW/cSxPsqnmivuYII4nJI67xKGifXXJeEdKJEcH6btMBQceTk36zl0nF7lN5Ewj
         TG4Gfk6RZE3oz0iT6fIfGwDP7mMF3pOa1AdYMu03dWCZnIT1cy+q6R1d2EJq4A17rgvs
         2+P3Q7R9patIw/AKbE1F8e5uMY2ctIjNxdZ8gY+B9GMIZTLZZgp8Qf6PsEqGDzMfWX/C
         tQByU9R1Y8ugYTOC7XGXzwG79tvOn8JerjB/BkHk42k9BJ5pwMYe7WWEuHylnD/ANCsy
         xisAml9IMDlsn9EKluiEL3mbIzZox/3X+vQzPAgM653vdGc2X41GvHBuYe30N9iiuv1R
         Qgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gNEaQb0fIENMx1ex6ijnu94BNCTxNqJRzzbxuRHhkzU=;
        b=HLJ248vMjtz10C0aaeL699/7KLYOugHVQBS04S+6a0FMGbyewno7glgRrYlCyKLzCe
         KyqV00xzFqJ5lH/Rh/394FRKJGiaw6haC2hDZOYfTC3HTWIwaQBAr4VXv2GJuQQ9IWLd
         nyygp3W+kGkg1JLEl2dbtzm7BfeHQNOVGav60TOkigBkIgWpCCsfUjPP+HT6+UU2rlBk
         SJZwKRFhbHCiLaG/AodMm93SZqFR5CQns6TYC3B+c64lgl7BlrgLtfoLHwihXFAAMxJK
         DhNWts7EkMQZnfPi6bpb7oO/k4YdVGN1JfP26xCSAbhKqTClDumIXRy1GI83Sti4W8st
         sx/Q==
X-Gm-Message-State: AOAM5306eRS/h45gi3KbZ/laDhuSPTgqUoB33Kuc2VUB1mawB0pSjdL0
        1lLQJB7Y6+dK4rr/hK20Z5A6Nw==
X-Google-Smtp-Source: ABdhPJw7sk7ctRLD7L9MfqhmLRUKyUBrSBPKOftH6fRS5gfm0xeVtI69S2h57dR8VCCdPshwyqByhQ==
X-Received: by 2002:a05:600c:218f:: with SMTP id e15mr7347926wme.28.1625362284850;
        Sat, 03 Jul 2021 18:31:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l16sm18026717wmj.47.2021.07.03.18.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 18:31:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to dwc3-qcom
Date:   Sun,  4 Jul 2021 02:33:11 +0100
Message-Id: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a topic we have been discussing for some time, initially in the
context of gpio usb-c-connector role-switching.

https://lore.kernel.org/linux-usb/20200311191501.8165-1-bryan.odonoghue@linaro.org

Hardware availability constraints limited scope to finish that off.

Thankfully Wesley Cheng made a new set of USB role-switch related patches
for dwc3-qcom, this time in conjunction with the qcom pm8150b type-c
silicon.

https://lore.kernel.org/linux-usb/20201009082843.28503-1-wcheng@codeaurora.org

For the RB5 project we picked Wesley's changes and developed them further,
around a type-c port manager.

As a precursor to that TCPM I reposted Wesley's patches
https://lore.kernel.org/linux-usb/20210629144449.2550737-1-bryan.odonoghue@linaro.org

Bjorn pointed out that having the role-switch triggered from dwc3-qcom to
dwc3-drd is not the right way around, indicating a preference for the
original notifier from dwc3-drd to dwc3-qcom.

There are two approaches I considred and prototyped to accomplish the
desired dwc3-drd -> dwc3-qcom messaging.

#1 Using a notifier in dwc3-drd to trigger dwc3-qcom

   This would be nice since it would accomplish the desired layering
   dwc3-drd -> dwc3-qcom.

   However:
   a) It would be a real mess as dwc3-qcom is the parent device of
      dwc3-core so, if the child-device dwc3-core deferred probing for
      whatever reason we would have to detect this and retry the parent's
      probe again. The point in time that dwc3-qcom could potentially parse
      such a deferral in the child device is late. It would also be weird
      and messy to try to roll back the parent's probe because of a child
      device deferral.

      I considered making some sort of worker in the parent to check for
      child device probe but, again this seemed like an atrocious hack so,
      I didn't even try to prototype that.

   b) One potential solution was using "__weak" linkage in a function
      provided by dwc3-drd that a wrapper such as dwc3-qcom could then
      over-ride.

      If a wrapper such as dwc3-qcom then implemented a function with
      regular linkage it would over-ride the __weak function and provide a
      method for the dwc3-drd code to call into dwc3-qcom when probing was
      complete, thus allowing registration of the notifier when the child
      was ready.

      This would work up until the point that you tried to compile two
      implementations of a dwc3 wrapper into the one kernel module or the
      one kernel image say dwc3-qcom and a similar implementation in
      dwc3-meson. At that point you would get linker breakage.

#2 Using USB role switching for the notification

   Wesley's implementation took the approach dwc3-qcom -> dwc3-drd, whereas
   the approach I'm proposing here is dwc3-drd -> dwc3-qcom, which is also
   what we discussed on the list.

   Having implemented it, I think USB role-switching in the direction
   dwc3-drd -> dwc3-qcom is also a much cleaner solution for several
   reasons.

   a) Handling probe deferral is built into Linux' USB role switching today
      so we don't have to re-invent that wheel, unlike with the original
      notifier model.

   b) There is no "wiring up" or traversing the graph tree for the wrapper
      layer to determine if the parent device has a compliant type-c
      connector associated with it, unlike in the dwc3-qcom -> dwc3-drd
      model.

      All that has to happen is "usb-role-switch" is declared in the parent
      dwc3-qcom node and the role-switch API takes care of the rest.

      That means its possible to use a usb-c-connector, qcom type-c pm8150b
      driver, a USCI, a tps659x, a fusb302 or something like ChromeOS
      cros_ec to notify dwc3-drd without dwc3-qcom having to have
      the slighest clue which type of device is sending the signal.

      All dwc3-qcom needs to do is waggle UTMI signals in a register when a
      role-switch happens.

   c) It "feels" like a layering violation to have the dwc3-qcom SoC
      wrapper receive the event and trigger the dwc3-drd core.

      The standard model of parent/child role switching or remote-endpoint
      traversal that USB role switching already has works just fine for
      dwc3-drd, we just need to trigger dwc3-qcom for the role-switch in a
      non-vendor and non-SoC specific way.

   d) Less code. It turns out there's less code implementing as a
      role-switch interface in the direction dwc3-drd -> dwc3-qcom.

   e) Portability. The mechanism used for dwc3-drd -> dwc3 qcom can be
      reused for any other similar wrapper which models the wrapper as a
      parent of the dwc3-drd.

For all of those reasons I've opted to use USB role-switch notification
from dwc3-drd to dwc3-qcom.

git add bod git://git.linaro.org/people/bryan.odonoghue/kernel.git
git fetch bod
git diff usb-next-5.13.rcx-rb5-tcpm..usb-next-5.13.rcx-rb5-tcpm-v2

Bryan O'Donoghue (2):
  usb: dwc3: Add role switch relay support
  usb: dwc3: dwc3-qcom: Make dwc3-qcom a role-switch signal recipient

Wesley Cheng (1):
  usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API

 drivers/usb/dwc3/core.h      |  2 +
 drivers/usb/dwc3/drd.c       | 10 +++++
 drivers/usb/dwc3/dwc3-qcom.c | 77 ++++++++++++++++++++++++++++++++++--
 3 files changed, 85 insertions(+), 4 deletions(-)

-- 
2.30.1

