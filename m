Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA755A139E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 10:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfH2I2E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 04:28:04 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33090 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfH2I2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 04:28:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so2515906wrr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzOzQ7ynNYPsf5UEf3oNVdWEvvfgnb0uEvn4yxU+dLs=;
        b=QPNyl9bMqWt4Ql4fbNSFnjlCr6qZyRx72Wt1Cmuc/ixB6/sURqA0apu4dMeF95ssMH
         z7Z52E5m0ZoGHzwad4fl9hFfZLe1KPqYa29im2xvPtD+RqsvLfRlGWc9tN5Taw5Lzzog
         NOrUwBGhR4z3bRwYlKnvJzpRqR6DIXZpsVSl/3/JRBLEvZ0QoVtvmuObXYFCJ9jHB5pL
         EfRzj+6ciBU9+Yc82c2SLft70V/uKGHcyx4GGFhUajRtlBaQ30eHJu/a2PcaIxihMV6y
         c8cRLCU5eqJsKFNP05qxPNNvGnECK11TMuAbR2flOLod0XdSjD4L/fzhioCxei6Nd2Pq
         SnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzOzQ7ynNYPsf5UEf3oNVdWEvvfgnb0uEvn4yxU+dLs=;
        b=KS9Vog+bMI8Rf0aCxAyXysgz1NSRrisRzfE3HvqSES5Sb0/MyX23SkLGHMFi9uYEIc
         8pCeV/ViaAYVSP7TR5T6ONYtetHcmNDTXug5Vpqo+bU+tFlnEAggQTtFGd2C0fEVbIS5
         U3r5QL9Rfs1A1EFTU8Fzc4NCkshpEjYiZLxESGVynHm3ksZaMmudKCA9qLB9NNWTq7YE
         2Sn2JOoGXiKAWwyjyKv3B2jRlG6SFgYjaeuDKTuzaIW0V7KTilIX53grAE9ZqimO0nBd
         9Excd04nVqUMGZqrBHzOvTfveIwNDqtR1rmjJIihfJSMzhKGloq1zCkPQh8N8Gos9NGe
         fP3w==
X-Gm-Message-State: APjAAAXyvdXcVqZwmlMeZnqAeoBUzG8eFVTy6FvvXZx/oNCXqYZYvy9s
        6FVv2YcndTHtmHqKt0w/r6tO+Q==
X-Google-Smtp-Source: APXvYqzo/MzO7CuJCSuJyZul1Nz9EvB3vy9Skp24N4C+UVIfER7+lsH6iDc5xX2Ky69Od3DEsRhOBw==
X-Received: by 2002:a05:6000:128d:: with SMTP id f13mr10054615wrx.241.1567067282414;
        Thu, 29 Aug 2019 01:28:02 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id f24sm1884489wmc.25.2019.08.29.01.28.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Aug 2019 01:28:01 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, jassisinghbrar@gmail.com
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mbox changes for QCS404 DVFS
Date:   Thu, 29 Aug 2019 10:27:57 +0200
Message-Id: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are the mailbox changes required to enable CPU frequency scaling on
Qualcomm's QCS404.

v2: sboyd review
    replace if statement with a of_match_device
    dont modify platform_set_drvdata

Jorge Ramirez-Ortiz (2):
  mbox: qcom: add APCS child device for QCS404
  mbox: qcom: replace integer with valid macro

 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.22.0

