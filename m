Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5A910B0CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 15:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfK0OCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 09:02:53 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35287 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfK0OCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 09:02:53 -0500
Received: by mail-pj1-f65.google.com with SMTP id s8so10011631pji.2;
        Wed, 27 Nov 2019 06:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Qqnu36JyHB0qpO7U4bBKm9m3czEGEUiM2+3oKiYtY2A=;
        b=qBFsxvaiBkLt4/gjk0R+enVePgY/BnRtVuoKL2xLigzPBFFfEhTq/gDrz0Q961DJyM
         IH2FQZF+NNM/F9y47VQyc6LaXREZ1fwNSSz/S5AfMhAnZomSoSMOW+UYdGxjiqUnYDek
         bHKCsMdGFtYOJKAPEsyNbB5yRkPgIqaGzFNC/lJDfhQriZ0gD1WEZpT5uirKbWmUrloT
         twp6jUIz5K1F7xGammpFK0vmoDTKJTPckYzrCK0GwHpgyE9sFff6Rv7YlP/9PO1Kw+ma
         YZOfYrMHvEK6r5R9L4fHJjQiStTD1+MQk3Sz5WV57GOhVxnwKvGnOcBKSRs5dmRVh25r
         Wxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Qqnu36JyHB0qpO7U4bBKm9m3czEGEUiM2+3oKiYtY2A=;
        b=RLKJmpFDagb95bL6gPhaIsKsZbG2tDG59/zIGFxHZuO+IWdBEUZVdLXG9AXoqr7QS9
         OnQAw/fKGq26xzWnx67rS+uK6quc1DqRLCkEmxPdrJPuDagckig5uVyxtc0h6Bjndn3I
         kdoBzvPfgiDkUB1d0N99BbIajuxOJzueCClcwPuiFABdh3jdj2pabmSDuP1rcYd4/9ei
         YAgyX0gZ5hPkuy4Y4MA4tFfIJyPYw9GOpRn7As3VIpRCZzqFngS5yiRLDa8acgwc8xSK
         EHX05rLPVozHq/YP67aztYrDMc4TPRit8APGWvtXkxDckSQebKPXlHvw0obq/IYyUkAA
         tErw==
X-Gm-Message-State: APjAAAVFiIk1WIl7U6slV7didW9dW48lYIWECOKnhh+elgExMAv6P1BC
        6LkgQZXQGniQlBPwH0+z6+0=
X-Google-Smtp-Source: APXvYqzpzi/A3NjNPMw3sZI/pDOo5qFWUzB+SnDkURkl/8aVYZQdx4V9qGBLmswIBEeOCc9RLZDY+w==
X-Received: by 2002:a17:90a:a4cb:: with SMTP id l11mr6206536pjw.47.1574863372749;
        Wed, 27 Nov 2019 06:02:52 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id x9sm16800145pgt.66.2019.11.27.06.02.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 06:02:46 -0800 (PST)
Date:   Wed, 27 Nov 2019 19:32:33 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom-qmp: Use the correct style for SPDX License
 Identifier
Message-ID: <20191127140229.GA30510@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch corrects the SPDX License Identifier style in
header files related to PHY drivers for Qualcomm platforms.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index ab6ff9b45a32..90f793c2293d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017, The Linux Foundation. All rights reserved.
  */
-- 
2.17.1

