Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93FCF17C94D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 01:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgCGAAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 19:00:25 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44083 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgCGAAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 19:00:23 -0500
Received: by mail-pl1-f193.google.com with SMTP id d9so1502114plo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 16:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5pvACoah+YTTljftSxoduxMKYWKsL5YE+zB34vW08Y=;
        b=CvqUusHLkMo2qsJm8O80aprBPlWs52SizV1Wf2O9Zy4VrN0HRD4bh4Ki9i43+jIbpC
         3ZT2vJrBGxhR5rRoJ05E99pNTS28Sf1P4Y5DeA36pNzVrYAogsN8deAVwSsoPhKUTGA9
         zHq0yfYN1ssFQZC2jWxgVamSEQSW7j/d8vs/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5pvACoah+YTTljftSxoduxMKYWKsL5YE+zB34vW08Y=;
        b=KaXLx8yE9hvFR/b2SGaWlKBFMFJaMsEOP8JWzAWQyqT5CCcgVxgg+r0GvvnA+gNqQw
         mahHuEgrX358rq78gLOAlr0vWFeRw16TXXVcN4WUe39JcehzuF9wilLk0P2x0hk8M5VV
         JFd1pfnpkpDjnIwGbkhcXn0rTGadX3a+uIUW6U7GYNcuRS49MNS/O7sAuFg04FAQ6moK
         YL1WkQM9vpIcJWOrMak2/P2Swg4VYT5HtubQaBITqnPaArrjPYJxAbCGgnsdunrVKEle
         viZ9Ve0/AH+D24T5oU42RDhkHHEfZ/GNaDH6BbGKbVd8EhoV1lXGe2zKtijkgM2d5di1
         eQaA==
X-Gm-Message-State: ANhLgQ37yeJunLFWEn/z0wo0I60HvoxQWAzis0gihIO3WTCKf+fg33az
        5oiraU/Qp/KScmm4ZGCUWsY/pw==
X-Google-Smtp-Source: ADFU+vt4hq/H8L4WQS5SPizCah0I3Zb97UIDPQyMnokI74nhBS6dt1hJe6BjypJemWSUbY2X3MCpMw==
X-Received: by 2002:a17:90a:1912:: with SMTP id 18mr6155112pjg.124.1583539220692;
        Fri, 06 Mar 2020 16:00:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 9sm32302246pge.65.2020.03.06.16.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:00:20 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFT PATCH 0/9] drivers: qcom: rpmh-rsc: Cleanup / add lots of comments
Date:   Fri,  6 Mar 2020 15:59:42 -0800
Message-Id: <20200306235951.214678-1-dianders@chromium.org>
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

With all that, enjoy.


Douglas Anderson (9):
  drivers: qcom: rpmh-rsc: Clean code reading/writing regs/cmds
  drivers: qcom: rpmh-rsc: Document the register layout better
  drivers: qcom: rpmh-rsc: Fold tcs_ctrl_write() into its single caller
  drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
  drivers: qcom: rpmh-rsc: A lot of comments
  drivers: qcom: rpmh-rsc: Only use "tcs_in_use" for ACTIVE_ONLY
  drivers: qcom: rpmh-rsc: Warning if tcs_write() used for non-active
  drivers: qcom: rpmh-rsc: spin_lock_irqsave() for tcs_invalidate()
  drivers: qcom: rpmh-rsc: Kill cmd_cache and find_match() with fire

 drivers/soc/qcom/rpmh-internal.h |  45 ++--
 drivers/soc/qcom/rpmh-rsc.c      | 390 +++++++++++++++++++++++--------
 2 files changed, 313 insertions(+), 122 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

