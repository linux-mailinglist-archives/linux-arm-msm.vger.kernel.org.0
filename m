Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB96194BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 23:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgCZWpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 18:45:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43929 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgCZWpF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 18:45:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id f206so3513326pfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QCWn7QB+wZCv5c30k8RVCk7/lqCrOfd18UirhMPYmK4=;
        b=N33IqX9pR8IFxSujO89nN5pUaaCA4nBX1A1ln3UpDVDEWRFfxJaRnsPX0avq5hvOOb
         2ofJ0IBBH8t/FwzZU06c9vEIQcKf77XddzomwMPb+6JZrk9YELbqADfpE9DgebGdsfXX
         TEUkabHNL/Xf9KeDlhDNIsYiWxHpnUwyc6MZWIrseiXmmZkLH8Djn5RLV8veQBEa+Njn
         byOEf1yy3BkvYdzEBO6w0ebhXyxDA1qjB/rqCrdy2Y4gssPJTBegM+ZrCV04m0yL+sxC
         huhkDJBxyIr+XyucI/372wcf3Lyltczi9mNO4Ot7erYGL5w3pdhCbuRLh9B8JXVL4Gh8
         L8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QCWn7QB+wZCv5c30k8RVCk7/lqCrOfd18UirhMPYmK4=;
        b=GQIvdcrxaCpaP9pDdEUgalP+QqxueBEYq9+KBSPEFIEcAdtpbd8ClE0SKvs70a+tS3
         BTcyPvlFaO+USLaZk0LLWY3BKWC5zVkIyTbZMnZSlZE0AG6Ra+mJl35xDQYFA1Y7iu4R
         aYPjHblDcWg2zzjuS5pmDbh0sz9bypAhC4VoTsz3iEQiWx1zqNTOGeqyUBm2ZvQdLIfL
         kW+KZYiaqb5KdF5nGNKDDH6q7cR6P0inrCAmR8mpTfUQSXxurOFdG7xa+TON9TqIaGD0
         WMscJxDvHOCWZziiIGugxtjM6dpPbjL1P+wQtJh70SdYSQfVcqs+FPy2tKVvoODIdNu+
         NMFQ==
X-Gm-Message-State: ANhLgQ2C8BZH20qDX9jHX6Dr5YjqddRCpv57Se9nwV/xwwhlA7hDuaiR
        BwaqpP8Bxc72yWxw1h0bGzUj2J8nOv8=
X-Google-Smtp-Source: ADFU+vsRcEOs5dU6hbt47BGmrCU7JkCeeC2o1Umpy1nTagcIknKtZ13Kjd+KJ8ISVJMUMbzoNajxTQ==
X-Received: by 2002:aa7:9a8e:: with SMTP id w14mr11328537pfi.113.1585262702882;
        Thu, 26 Mar 2020 15:45:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id g10sm2592788pfk.90.2020.03.26.15.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 15:45:02 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] Allow for rpmpd/rpmh/rpmhpd drivers to be loaded as permenent modules
Date:   Thu, 26 Mar 2020 22:44:56 +0000
Message-Id: <20200326224459.105170-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series simply allows the qcom rpmpd, rpmh and rpmhpd
drivers to be configured and loaded as permement modules.

This means the modules can be loaded, but not unloaded.

While maybe not ideal, this is an improvement over requiring the
drivers to be built in.

Feedback on this series would be welcome!

thanks
-john

New in v3:
* Added similar change to rpmh and rpmhpd drivers.

Cc: Todd Kjos <tkjos@google.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org

John Stultz (3):
  soc: qcom: rpmpd: Allow RPMPD driver to be loaded as a module
  soc: qcom: rpmh: Allow RPMH driver to be loaded as a module
  soc: qcom: rpmhpd: Allow RPMHPD driver to be loaded as a module

 drivers/soc/qcom/Kconfig    | 8 ++++----
 drivers/soc/qcom/rpmh-rsc.c | 6 ++++++
 drivers/soc/qcom/rpmhpd.c   | 5 +++++
 drivers/soc/qcom/rpmpd.c    | 6 ++++++
 4 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.17.1

