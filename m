Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E1E452F50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 11:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbhKPKnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 05:43:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:51686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234355AbhKPKnF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 05:43:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AD4063220;
        Tue, 16 Nov 2021 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637059208;
        bh=Qc8ZBQhWfMzGFC9zpZm7g87nQ9jQMAL3DvjJ2hBhgmM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kzPqL3UyQcmcZiJX6U3NS438wu6gGJ1n5sDkidLASCsTuQS6gzeFIvT5RsAMrHNx2
         Nf8q6PwMoO/Y7VOpSrAKYJe6hZbOS2Y792wKPu/CPeJOVShT+bqn7uIEJD2tKIRQkz
         m63fPTlvlkBwvvx91nSxXh/oqdTL/zyP//c95XclNT7scFNO6KOG1THq/UesFJS/EU
         ik70F4f0TjZ87JA7D1+gz+Zbh3hGE4Xa+bfS8cUWQxh9/S0T4qUZHocSRjgYPj/6nB
         3j/24P2A00o0Q9dri5OusssRrvBxEie4HUj62Pg/DP8/1nEuTAmdSxvbRnf/M0f86u
         QGpSQ8S1D0iVg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] phy: qualcomm: usb-hsic: Fix the kernel-doc warn
Date:   Tue, 16 Nov 2021 16:09:49 +0530
Message-Id: <20211116103951.34482-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116103951.34482-1-vkoul@kernel.org>
References: <20211116103951.34482-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The comment is not kernel-doc one and starts with /**, so fix that.

drivers/phy/qualcomm/phy-qcom-usb-hsic.c:3: warning:
This comment starts with '/**', but isn't a kernel-doc comment.
Refer Documentation/doc-guide/kernel-doc.rst

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index 04d18d52f700..716a77748ed8 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2016 Linaro Ltd
  */
 #include <linux/module.h>
-- 
2.31.1

