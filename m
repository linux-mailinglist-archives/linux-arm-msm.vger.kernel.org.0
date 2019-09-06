Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B498AC1B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 22:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732476AbfIFUy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 16:54:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55759 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730471AbfIFUyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 16:54:17 -0400
Received: by mail-wm1-f65.google.com with SMTP id g207so7789004wmg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9iZd0ALlBtpvj30ArgRGZaBRGe1rTkTBEtd4b0i1Vc=;
        b=btK5FQnLBlm6g7F416aGcrBn6jKUVra0FTu/DzgotZjZZuNDjoag8X+yBz0OLsKp6g
         Dq0RNsj2G7PfChBamSp11AcXANSgZLr7jxrx9kU6qpb1k3bpucpdf1T1h3RS1T+vBWsX
         GgAM1IG11ZZgh7Jkt5RnbO/uixzBtCrnMFg6A5nLkUyLBfuGRt+PzpF9KYtRBx65nrSf
         NruggiKMgiaX+ZtQeHwrIhQi0SweCAzo45ox8Z0bHnv6tcIktZ4vX/le4+SmtgWxIDuV
         A8fhK0Tos5nt8AvqRRiWJcFnrJcw3avzHgC+mJmpgsq+jOxpZbmCgHCwGQtRKzX7Lvbk
         fLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9iZd0ALlBtpvj30ArgRGZaBRGe1rTkTBEtd4b0i1Vc=;
        b=fcMIpvZS+2LB8MrYL9pvAQtfjwzdPuQonGYcHKrdOU1Bn+C1cRh0iYShKbtrU89KcL
         1ElfAwgWuHeiBiOYf8GjwBpf6p7R+56CwdCdYG/r0dtLxu1J4jwdLpeGncuXANxrHxg7
         Tskp5CDXgkttu11MZxRC5pCZlSwgo1LbpyDCwh1xuxUn+QV9cVJb5ZYe0xwZFmyDSo0Q
         TupRhjQhj83eJSpweC30vK8LgdVncdq2acrTvSjP7zVaDlpiLzScmvWonmrrQ0+nn9lu
         gvCYp4fmtYVHeue611zjA37Nq/Ot4AFDadcFGacysSES8/0615rZjNt/WpDvP+bTCuBH
         76aQ==
X-Gm-Message-State: APjAAAVwBRiaoacbnv/lqlph0+KDW3t6V046v4xc88azW7xf7FIB5RFs
        pOZxi/JoAfdCJUDpWpatJyk5oA==
X-Google-Smtp-Source: APXvYqyg2YEhEjYWydK83Ag5waDnG5m0XCWk7plAWFXr9llFtUEHf6PI9Pb+1bqi64S6ZcbbChrJKA==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr9335213wme.127.1567803255262;
        Fri, 06 Sep 2019 13:54:15 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q5sm317416wmq.3.2019.09.06.13.54.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 13:54:14 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        linux@roeck-us.net, wim@linux-watchdog.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] qcom_wdt bark irq support
Date:   Fri,  6 Sep 2019 22:54:09 +0200
Message-Id: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support pre-timeout when the bark irq is avaible.

This is the fifth version of the patchset addressing all the review
issues to date:

 v5:
    include linux/bits.h
    pretimeout only enables IRQs if value != 0
    remove unnecessary subtract operation
    add clarity to the conditional in the probe function
    revert the irq registration changes
        
 v4:
    remove unnecessary include and private variable
    provide macro for WDT EN register values
    use pretimeout as per its API intent
    handle EPROBE_DEFER on get_irq
    modify the irq registration as per pm8916_wdt
    
 v3
    remove unecessary variable from the driver's private storage
 
 v2:
     register the pre-timeout notifier.

With the second patch in the set, I took the oportunity to do some
cleanup in the same code base removing an unnecesary variable from the
driver's private storage.

Jorge Ramirez-Ortiz (2):
  watchdog: qcom: support pre-timeout when the bark irq is available
  watchdog: qcom: remove unnecessary variable from private storage

 drivers/watchdog/qcom-wdt.c | 85 +++++++++++++++++++++++++++++++------
 1 file changed, 72 insertions(+), 13 deletions(-)

-- 
2.23.0

