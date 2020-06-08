Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C461F20F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 22:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgFHUpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 16:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbgFHUoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 16:44:13 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF99C08C5C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 13:44:12 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id w90so15839939qtd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 13:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1ZoKjAu6rUCzvrD/I1LBfsHlqmIe5OQoQGQY8Je51A=;
        b=I8PjRrlyoZU3BAI3OzVNM91CimCbn5sysy/JXuJpUgNi+rH3UxEGFMWT+P9SkEyNQA
         0B961pHl7NbCPMPzFzaKK5EeKforKgWTezUP3mPPA0qrSArnRnRKJi6KqYpulKbZEfK7
         CKQmlYbwGBi74uxkm+ciYUQucEHhCNFN/rBNGhvPmO+cs/WJZ/D8ogMciUABKD19TrJv
         IEunkHo3srBabcdqelRt9vfhwlBLjbEo4k6ROv+FVd/dM1g2SJ4839WPGzkQbE9qm+8w
         Gi3wkCf1OhbND2TCM8qYgzlDzluKpHXTvUXpd5q2BttitRnJrV0KV0A618kDRpvxIHIB
         7D0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1ZoKjAu6rUCzvrD/I1LBfsHlqmIe5OQoQGQY8Je51A=;
        b=am3Bg5RSkvy3arb1iId14xRYElw8yreRvJV70rO/zzq4r3QYCIEdgmOnaG8zyTpNHk
         /1a5nIDAnsOyGFTc7/Crtfczf1FjnseAxX08yHA0MO3UrGgsffyCzybfGVPt5LIrDA4u
         mwN6TDh2nyyl89VOtdBxzNG8nljqwTWFUwZvL7hYwfRqN+ul4H7GYKzq8PzMdB3Za+ef
         avAO+S4M4pkcsTkVsb4Op9A6qEMom5YaZPRdCpW8ijEb6c4/GUraJrJ5I/wVZMKkvptI
         bBSQ0C4VRz+8MhgYpWtLxvwj0mh73CGoXtKcq3d/e5tXSDZAKAjjQK5A0nrlOB5P6dla
         Bl+w==
X-Gm-Message-State: AOAM532HiUvt67mC9NtFZ6qk7fuIq/GRu62vaRfZGZGIk6Zyn4t/Q3ja
        BhWHzM93qjIV09foJzdhofYH0g==
X-Google-Smtp-Source: ABdhPJyNYZJ+80B0y31zjI9NpS6Sg0GULAYhl5LK6Q4WWLR0yFF5m1TPzUr/hk07+TKS0nHNjworXg==
X-Received: by 2002:ac8:1719:: with SMTP id w25mr26091041qtj.375.1591649051131;
        Mon, 08 Jun 2020 13:44:11 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y16sm8895565qty.1.2020.06.08.13.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:44:10 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list),
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/5] soundwire: qcom: add mmio support
Date:   Mon,  8 Jun 2020 16:43:41 -0400
Message-Id: <20200608204347.19685-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds initial support for soundwire device on sm8250.

Tested with the "wsa" sdw device, which is simpler than the others.

Jonathan Marek (5):
  soundwire: qcom: fix abh/ahb typo
  soundwire: qcom: add support for mmio soundwire devices
  soundwire: qcom: add v1.5.1 compatible
  soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
  soundwire: qcom: enable CPU interrupts for mmio devices

 drivers/soundwire/Kconfig |  1 -
 drivers/soundwire/qcom.c  | 42 +++++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 5 deletions(-)

-- 
2.26.1

