Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADCB2F996B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732113AbhARFlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:41:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732083AbhARFlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:41:02 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A236C0617A3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:37 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id i7so10249566pgc.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWSz/xv5abtdTaszzL4/q2hKFGcrR7qY3z+l56mm+Q4=;
        b=IecGHmuX4j7xmqNweLahVKJHnsEYZcbSFyq9q8MyxlFvjsJF2f4Jc9Xh185GEQUQzl
         njlRbJud/JcBUQZiV+sUuoH1GLEs0hhFRwYP+n4QPAMRWrj/hjL9diqvqhsrfVvUwxKF
         D5dynL2ZKy75SeEILdBcTadLYyVvMk7dDrz0ieuEiD5XNdteBziyJpgcSEd8GiXtVbUi
         91d4BqneX7cg7cmI34cgpOQ7CT6+3Hy+O1kNkiqkyymdIkzv3AtcebjIqBuUx0Om3Onn
         /m2jSFDDu9CZvx8KfM/J/BzfIrU8D6XUJpJasT9C1qkJTwWvGchyfiwGyMnfmt0EO5Hq
         ICOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWSz/xv5abtdTaszzL4/q2hKFGcrR7qY3z+l56mm+Q4=;
        b=dMml0bq6kAmc8ecL/M55bceLTOXHeAqGt1kOp5xHimbI86FDgMWENCyr64cmIBkrO7
         QQyy1ij0Mds+w9Ha2Eb2Qc2FZv5+Vh91whcNc4a5ZUE4R+ZN2MIyCIQ0WRCIyG/zT9q9
         wXMA8Iz2T66eVfkFLFklAQ6If3+DPVAIh4knbhZ5+juZVRqwl7EwCpdBWhkXp74l/jm3
         yMwnPj3xyerTigzRwbdAZxrSkhc3XkDblv3Vg7THJxFSd7MoPr3f2ltVJ1wqb/T88slC
         ubvJpM+GcX3RlS1jeZ/WkJeqBSM4/DvxVaXfT9q0SIC5BcbE/HNSaMxUGn8kx11J0A/X
         mxaQ==
X-Gm-Message-State: AOAM5327McMf3xmPkPxmfW50YUh/SUr5zLeM/lxZ3zyGDCFvBMbhmdFh
        5mg0cgWyoGBsI+Iaoq4DLYI4
X-Google-Smtp-Source: ABdhPJzqKO3cPK6SLE8sKhwm3/8AGs997GhXvgWlHyjrsqgvUjV7wJvXfE7iczWdI0EtSpXXvTgYbg==
X-Received: by 2002:a63:f456:: with SMTP id p22mr24526081pgk.188.1610948376611;
        Sun, 17 Jan 2021 21:39:36 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id z6sm14627271pfj.22.2021.01.17.21.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:39:36 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/13] ARM: configs: qcom_defconfig: Enable ARM PSCI support
Date:   Mon, 18 Jan 2021 11:08:51 +0530
Message-Id: <20210118053853.56224-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
References: <20210118053853.56224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable ARM Power State Coordination Interface (PSCI) support on Qualcomm
platforms.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 9573c0406954..c9081e5afd43 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -297,3 +297,4 @@ CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_WATCHDOG=y
 CONFIG_QCOM_WDT=y
+CONFIG_ARM_PSCI=y
-- 
2.25.1

