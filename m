Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C90DB68D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfIRRTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:19:21 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45224 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731322AbfIRRTU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id 4so198560pgm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bRO4CCi6O02IiQvOc11mCJZTaWPh+1gIDXkPeGZg2yU=;
        b=bn4andAXlapruN28brXgH2AM8ReanDolwH7WcQgBc8GyiIvksNsmBbbHU+5j5QkmkQ
         dNQdBRugV0VibxQmM9NcBdxXs6X/DbEnHxcN9Nx09qVwwwO/LxHop3kOqVHYd99IcQzB
         bQMgViSIuf4qNELiCIajF6lozazm2IeSQdwwJYHNXX5Mztwm9UY+f1XEONWam8nPuq8K
         eefbviSYxfXdXkEAjmgOtgbPBKlZWbWRGwyE62QPJhzOZojvHnDqOUB+c6XtFB0fwaiM
         1XqOChqRHMdJfgk3iQAI9T33ur0YmWvt3TXXSyzWkf/x5iXX0ETXfj/dms0i2Oj0KxUD
         c4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bRO4CCi6O02IiQvOc11mCJZTaWPh+1gIDXkPeGZg2yU=;
        b=W4A9aDw3sDpkoW7ZU0BLf/TV6dysjnaCbmYivOl+nKqQknFJWnmyc6/S4mgMN8c9Zf
         /DyrN9SjGOSsflyVNmC8L6bjBU5CO+jXGLGmNUuK59BLHA+zNpqqzgYjUHoSA7D48rbv
         gwV+x3YCou2gqDcCv7VCb9u6wyP7KrfKpbOBzySMbZyibBPgCpYAz2P3/HgFd2WP3xp0
         uvHm8iKqRS7MWU8CniXcS/ELvwafvRwE3r7UK35E+m8kHZL6q5YUP+lnD4lDO1Lc78Op
         oISp517I/GdNNomRcFUD7S9U0L5Y/LhXm1h8gDiFUuUmOpoBcB8Dbd9nQLfezgdggAbF
         DHpg==
X-Gm-Message-State: APjAAAWRUCFFDU+YtcIgFjdQL8tIfiYTXMY2GomjScJ+Wt/JVq8uuXn6
        7h1I+8ztJAvCMZkRm1Ejhk8jPA==
X-Google-Smtp-Source: APXvYqyPk20iR8I62eO+samk866W6GDYk7anz2Mi1dRwIdNGKY38wrQ6lsz0CSIlroam2w1NoQuQQw==
X-Received: by 2002:a63:791:: with SMTP id 139mr4554810pgh.199.1568827159819;
        Wed, 18 Sep 2019 10:19:19 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] rpmsg: glink stability fixes
Date:   Wed, 18 Sep 2019 10:19:10 -0700
Message-Id: <20190918171916.4039-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes for issues found in GLINK during reboot testing of a remoteproc.

Arun Kumar Neelakantam (2):
  rpmsg: glink: Fix reuse intents memory leak issue
  rpmsg: glink: Fix use after free in open_ack TIMEOUT case

Bjorn Andersson (2):
  rpmsg: glink: Don't send pending rx_done during remove
  rpmsg: glink: Free pending deferred work on remove

Chris Lew (2):
  rpmsg: glink: Put an extra reference during cleanup
  rpmsg: glink: Fix rpmsg_register_device err handling

 drivers/rpmsg/qcom_glink_native.c | 50 ++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 8 deletions(-)

-- 
2.18.0

