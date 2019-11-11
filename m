Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F61F7FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 20:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfKKTVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 14:21:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46390 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfKKTVf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 14:21:35 -0500
Received: by mail-pf1-f193.google.com with SMTP id 193so11283648pfc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2019 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=zZILD+44OX1q5dyQzdM2BbgJv0kkr/NqvYdzqJF0VWU=;
        b=jcc2cAskjWBgTeYwsSv3lvsFyjpx3z/2/dQVMzCjv1lmIFKWhkHxwaMJrmIvvzX4Zr
         OF/rQM08+qFfbfpDc8ai8eZ0IFQ4+o3hIYKkDKyXMOLL24DVR1C15WLDsCUXefgV4oKA
         pMO1W8OkboYcq+mtU/Rj1PxtqnJR3JahYQwmQeCGRHFcMGdwDyYM2RtjQwMqyZJKryNL
         Ax08rcC/xS5IEgOE60HRwPIja/rZ2eeyJTh3DI9MAGLckAXXO4Tr5GPKw9R3kv6Kq3ye
         lYqLrULR/t+MCbEALuBHLQJacFwZUVEGlAqbpTSFu5C3nv2uCt0XwGTOVxA099KQGn/h
         IfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zZILD+44OX1q5dyQzdM2BbgJv0kkr/NqvYdzqJF0VWU=;
        b=Uc/46418CeOBic981pmML2kb0BKD7/YpXuu6VpuMSDOd+hVnHoYQzoarFsnyuR4Mi4
         jw1GG6bC/H0CvlgaQHPwUnZvOJLs225blnP3DhZcsyFw3P/E8tasnPCy/i5wZAvGKSqt
         Sj9tU//E0H5w5OFQnCBE6toPMJDUnyiw+jfAwHnPaMVOKBkVYYmflVuIXJ0eQlCK0CbP
         f10XyJpzyO0Vhg8NMFFDNAI+mUkYXW9QPU0hTnq2aXJMwCF0WWxe2EnsNJlAbj3K5zPk
         2nHzW1AKEBMhoct2rsPw9zFop+NUl7c2Qiqx4btHqfXb2DIQwKq5NAp6mFaG+stkauoH
         A+6w==
X-Gm-Message-State: APjAAAUuqR5hSSVhFYrPQcG0D/02huNKGUVmYbP0e72kzJtU93PGK0Xv
        gyncymzot4JG8XKzMCnQC3cMOg==
X-Google-Smtp-Source: APXvYqzvHgUVjW/Rd7K/W+r2O5+4vx7SxfEQkH5rCRHJfWJtzF7eQkUWs7LcfgNd2hnpOUHjHrobqg==
X-Received: by 2002:a17:90a:2623:: with SMTP id l32mr861971pje.70.1573500094683;
        Mon, 11 Nov 2019 11:21:34 -0800 (PST)
Received: from localhost ([49.248.192.129])
        by smtp.gmail.com with ESMTPSA id v24sm4331651pfn.53.2019.11.11.11.21.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 11:21:33 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/3] thermal: tsens: Handle critical interrupts
Date:   Tue, 12 Nov 2019 00:51:26 +0530
Message-Id: <cover.1573499020.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TSENS IP v2.x supports critical interrupts and v2.3+ adds watchdog support
in case the FSM is frozen. Enable support in the driver.

Amit Kucheria (3):
  drivers: thermal: tsens: Add critical interrupt support
  drivers: thermal: tsens: Add watchdog support
  arm64: dts: sdm845: thermal: Add critical interrupt support

 arch/arm64/boot/dts/qcom/sdm845.dtsi |  10 +-
 drivers/thermal/qcom/tsens-common.c  | 170 +++++++++++++++++++++++++--
 drivers/thermal/qcom/tsens-v2.c      |  18 ++-
 drivers/thermal/qcom/tsens.c         |  21 ++++
 drivers/thermal/qcom/tsens.h         |  85 ++++++++++++++
 5 files changed, 289 insertions(+), 15 deletions(-)

-- 
2.17.1

