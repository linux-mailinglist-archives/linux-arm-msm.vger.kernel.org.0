Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBE425E97D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 19:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgIERke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 13:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbgIERkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 13:40:24 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC17C061260
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2020 10:40:12 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id ef16so4652502qvb.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2020 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RD8l2fQQKOKDdGKnl9LX5y5DxoMGyqywKhbieLOAYr0=;
        b=PuHiboVvZl6Td+/ckTlRqbM9dwWXBWl4PN09T0xtiWJgefJnVhpJXu5vM3U0vAqw6H
         ZjrAAxYAEzRXxJW3vx2JJkznP/wiioILpGd9nSkKf55fGA9rUQQ7/OqWo3dBmT8yDT9I
         cmrWs4iNIE9Dlalqoa4IAnvnmSTHSE/Ea4gc5eeoBCmxN7H5wpekwjsXUcxkXE6h73V2
         SlJrQ0F9LucPIBPU2rqpDUEU/vLDc41HHqaxAVE0SIdsGKpWpRbWUioJ3dgBm4Y/yDAC
         aBnOzrm54i4p7O4NM5WwpOq3/C25gbO9aHDCMlKatvwvdMC4lv4j3d0rnht9jvM5zB1X
         bh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RD8l2fQQKOKDdGKnl9LX5y5DxoMGyqywKhbieLOAYr0=;
        b=Wl9mLu/LVc8YyEU3+BfCo5KGl3IHE4+Rmtrqp7XY71mTF9VWct142r91q+cs1i6do4
         CWOxaXqbEv+88L1/d0CaOWNhAOlYuxmF/WOBZuIwsRTHrT8fVnsPl0FjTsoAqPzJpmDB
         BT4DJcNbSy9GenN0f+F18/sbrqjzWM9b4tVYKFTqrNpejx+Pm8BLYL509HgYiYIqNerp
         w7PSLjFQ1Y+unQmnSb8en0IaGpXUJgLPmKXFbEX2yAMtfU1eTdOqQQWXZk09BC/1jQoR
         7niYt9PPL1Bb/MBGLk8DDy9G9Mhpq4SoHScXpGXSLW5TRYo3Nxm+wVw7a36B+LGNycFI
         tfhQ==
X-Gm-Message-State: AOAM530oex77hl4/e5Ekipl9CMlx3CN4i8mC09dzeMjBxi9+rRCx4CWy
        jD7MkphyT/xjB0D5c0uFC9vr0657L91evS8BP7oulg==
X-Google-Smtp-Source: ABdhPJyuTKQWKjzMrkVdkHqOR6fCSGGE/V7bCG1Lo7qkVruNXgOL6QgxAZm9hgFSj6oY52+0zPPJNA==
X-Received: by 2002:a0c:9ac5:: with SMTP id k5mr13293584qvf.112.1599327609464;
        Sat, 05 Sep 2020 10:40:09 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 10:40:09 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
        alsa-devel@alsa-project.org (moderated list:SOUNDWIRE SUBSYSTEM)
Subject: [PATCH v2 4/4] soundwire: qcom: add v1.5.1 compatible
Date:   Sat,  5 Sep 2020 13:39:05 -0400
Message-Id: <20200905173905.16541-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible string for HW version v1.5.1 on sm8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 1 +
 drivers/soundwire/qcom.c                                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index 436547f3b155..b104be131235 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -11,6 +11,7 @@ board specific bus parameters.
 		    Example:
 			"qcom,soundwire-v1.3.0"
 			"qcom,soundwire-v1.5.0"
+			"qcom,soundwire-v1.5.1"
 			"qcom,soundwire-v1.6.0"
 - reg:
 	Usage: required
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index ff28794868ca..41dda3b85413 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -888,6 +888,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.3.0", },
+	{ .compatible = "qcom,soundwire-v1.5.1", },
 	{/* sentinel */},
 };
 
-- 
2.26.1

