Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE1B1C49BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 00:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgEDWnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 18:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726291AbgEDWnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 18:43:15 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBF4C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 15:43:15 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id x4so75323wmj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjruGVFTYIkCOp/6P69N/+5GVlaNIjo9XcpDR89Pd+0=;
        b=mQxmO5SnyZe8PfDf60tP3gPYEkzPyOIcM3Md/Gdw43BDEazdiO5THIRKvYImhxW/Zc
         pVDzQsWFc2hJiOxJRlfPlTREeMHRkfu31jRlhnmOZdBcAH1bUT5rbqFurdQ0Uggdix30
         CVCzDXzUR2F85C+OLcSgpFtmXOdapgTjEA677JX92wUCrj3NHgxubE5ogp1gM7sGmpjd
         cCVWPBCJ9CfgLP9G9gl3DAArd7M2Zr3lD17FanRN4rDT+iFj21P/m11WthnGCQJwPqBp
         Q0LSt67itKjxxTb9YnXZKvIBESSlM86++zJrBaB9GL9NByXCxAX7QTQxW2RWRd9b5MQr
         6u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjruGVFTYIkCOp/6P69N/+5GVlaNIjo9XcpDR89Pd+0=;
        b=UfwJJzHX6mO941F5uDpAGbPn/xDgdSMvdB7xA5ls6Ry/AQ6GVWDcIDup0TAipguQmb
         26xrzajHfh1TQDI9JKJv6AJlqtjMCxoolMu2+g1SKYC8LXLtu7kE4xigZlcjH95X2YNB
         98qX4d+tx1FwR9pstLjLz6MZgXRefMENM+gp8KQgCYyqoCZ7JS5aX1Yb5obTvUoer5Ud
         Mk1TLTtTQZc2Xg4cNnxBwV9Rd1xyDZ8/c1r4pKSoylsOhhpfyydLIUxAt7yin/J6SY49
         0wAurmXAoIAwuBbzx5WzsOvEcRRHi3T6uHBmrst104DPnZEUKPJ4wRbZmIuWLJK9GxfP
         jwTQ==
X-Gm-Message-State: AGi0PuY/A3kBmjmAuOaHBL2QgrQ8Qd1GDbb/CSvD/hkIXeKJGTF5MCfJ
        pCmPujLg4//9sJoGrvXiISg5Ow==
X-Google-Smtp-Source: APiQypJFVRDUjBynGeveRHht+yHkpJBWWsZUQG2vKRa9MtV1rTwsgkSsdhGYav7UCSZmEFtT5TcXUg==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr16162694wmc.132.1588632194182;
        Mon, 04 May 2020 15:43:14 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a13sm13895888wrv.67.2020.05.04.15.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 15:43:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] ChipIdea USB role-switch fixes and tweaks
Date:   Mon,  4 May 2020 23:43:44 +0100
Message-Id: <20200504224346.613377-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This set addresses two things:

- A bug when using the USB role-switch API.
  If we are using role-switch we still want to switch HS_PHY_GENCONFIG_2
  bits.

- Adding the flag to allow user-space to control the USB role as other
  controllers already support.

Bryan O'Donoghue (2):
  usb: chipidea: msm: Ensure proper controller reset using role switch
    API
  usb: chipidea: Enable user-space triggered role-switching

 drivers/usb/chipidea/ci_hdrc_msm.c | 2 +-
 drivers/usb/chipidea/core.c        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

