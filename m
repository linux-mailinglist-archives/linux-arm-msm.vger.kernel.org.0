Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4678614DB9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 14:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgA3N1T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 08:27:19 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40862 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbgA3N1S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 08:27:18 -0500
Received: by mail-pj1-f65.google.com with SMTP id 12so1338802pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 05:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gOwA34ILdL4oq25kJIGC/jLpgzcKXdQaeYAFeBcy1qU=;
        b=dDfuPRQ92jWU0LIkSN1QSD3lU0PgvRSKLD0/H/oICMEy+QGRURjYYoIOpY68SEDw6v
         cvyLpxh1WKa9yC3IKL5OQnHVPccffzEltS+6hPhxusl5diXJU0KSernxH89Df20Lo1dz
         L2JvC+UEHFUOG92LTb0G0YPjVkfVQ/pbE/XDZ/kv4tjCSqBC56vDPSJbWio9hr9o0ts7
         bxMsA7iYWbuTGQ0v5Kse7F2G7ayr0SvYqa20rj3t5z39NtpIyA6MmbjUjZOs73necCLF
         j9t/5cckZplBRMr1E7VbV0Mqq05NAyNYlecxuoyeN+Bw+lO36miU8u2x015oZFk4T07e
         eF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gOwA34ILdL4oq25kJIGC/jLpgzcKXdQaeYAFeBcy1qU=;
        b=JZCAXeI2fwP73ccwSEfST/c9Slv9sTQDa3WipEmY8A5MNi8wa5VLzBQeNU7OeZ2zNG
         LFt40YSjUXVVhyvM6xjLr2ATbfgklvhB2Jn5IZeHuiXUqpLeZFESexkzbCi3JFvPYndn
         uHRq5dcY1UYFANfoY4Ygt3lZXPljCwuWhy++hIbS5fH/1aqUYgalPyMp08hurK+74mQM
         4/pO6eGStfZVpOHIWCI+FwOxOey2yQ1krxdGEQ/3ao07aEpjAcp2ll8f4AgP4E/ztXRc
         xohWHE2UxsCjT8P+EOTsXi3cFV5YlywtbwULgJ74IkJvwaGu3Ct6zIHveT6GHhnrIjS5
         QX2g==
X-Gm-Message-State: APjAAAV5lhC+OZUlMryZXwfj56I9eeuNBu3y9sfQCQjXAf7sQQuKF5DT
        MaTc70wtmajw8kgyc3FDnHNcyg==
X-Google-Smtp-Source: APXvYqybNMBlwVwbr5VBc7GgFdTLkBEI3jWbTqxHCsdTz2w9rxxEqg9xiNLt2XBIsvjvMyBQ31KyKg==
X-Received: by 2002:a17:90a:d783:: with SMTP id z3mr5766375pju.3.1580390836630;
        Thu, 30 Jan 2020 05:27:16 -0800 (PST)
Received: from localhost ([45.127.45.97])
        by smtp.gmail.com with ESMTPSA id w187sm6757314pfw.62.2020.01.30.05.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 05:27:15 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v4 0/7] thermal: tsens: Handle critical interrupts
Date:   Thu, 30 Jan 2020 18:57:03 +0530
Message-Id: <cover.1580390127.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TSENS IP v2.x supports critical interrupts and v2.3+ adds watchdog support
in case the FSM is stuck. Enable support in the driver.

This series was generated on top of linux-next from 20200130 to integrate
some patches that that are queued currently.

Changes from v3:
- Remove the DTS changes that are already queued
- Fix review comments by Bjorn
- Fixup patch description to clarify that we don't use TSENS critical
  interrupts in Linux, but need it for the watchdog support that uses the
  same HW irq line.
- Separate kernel-doc fixes into a separate patch.

Changes from v2:
- Handle old DTBs w/o critical irq in the same way as fix sent for 5.5

Changes from v1:
- Make tsens_features non-const to allow run time detection of features
- Pass tsens_sensor around as a const
- Fix a bug to release dev pointer in success path
- Address review comments from Bjorn and Stephen (thanks for the review)
- Add msm8998 and msm8996 DTSI changes for critical interrupts



Amit Kucheria (7):
  drivers: thermal: tsens: Pass around struct tsens_sensor as a constant
  drivers: thermal: tsens: use simpler variables
  drivers: thermal: tsens: Release device in success path
  drivers: thermal: tsens: Add critical interrupt support
  drivers: thermal: tsens: Add watchdog support
  drivers: thermal: tsens: kernel-doc fixup
  drivers: thermal: tsens: Remove unnecessary irq flag

 drivers/thermal/qcom/tsens-8960.c   |   2 +-
 drivers/thermal/qcom/tsens-common.c | 191 ++++++++++++++++++++++++----
 drivers/thermal/qcom/tsens-v2.c     |  18 ++-
 drivers/thermal/qcom/tsens.c        |  26 +++-
 drivers/thermal/qcom/tsens.h        |  94 +++++++++++++-
 5 files changed, 300 insertions(+), 31 deletions(-)

-- 
2.20.1

