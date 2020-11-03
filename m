Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CC42A49C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgKCPac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728611AbgKCP3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:39 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29048C061A47
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:39 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p19so142012wmg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hKLhDGotVpYlSY7XT5Gezu7H9CaCp/SMWpqDth9yk3U=;
        b=QpMsmQO67eVM6YsqCPBfDNYmpau0qbEYkzAgaaGhqWm4Nv5A7+DtxDiGfrtb4D04hm
         XKCXPURzMW6XwOeoDOd0kfdiXnMOSnQdi7uZawBLKM1CRJHDB50ogUbGygWDZXBpHwLG
         J+ZCzEWZ3vShZaMi1VsyBe37dm3Rq+YhdbGHJ4gN9VYzH34moSDj+T6ZOZQaRB3+I8mZ
         s1LixrmaloMUcaj3Xof2j9B6Y8ETcbf3X24dDCRd978DTdTog1KOGUEwI7W6llXYomO5
         Z0n2vqvrfAWb/DUzD+6wH6Co2aPT4E8ckD5EbIoPZ0KKv5pfqHDzE7jg/O7qU7sOgW57
         BT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hKLhDGotVpYlSY7XT5Gezu7H9CaCp/SMWpqDth9yk3U=;
        b=kXNTzbn2yFD+/xukhSpqPFf3ggiGm331vzxX9GpfNM1HJ/2z5KbfjH0yzbDHlA6xv0
         AKQLrt5iDfR6hrnPWc57NLUSIYHMAOvsWB3IWwbeYq3fr7fVdhb8+pzH7t98t17b3ALq
         bqOQALveiSdKm0QwehNgtbQWTmLYhUWnONH8O/UbV6VNM2I+BXkjuTPDch4OpIl+YtCu
         3KYxfk4SYStTTmR9EksZ4aAeTOLDupCTbVtWWDZtcpODSYL8vixZTChSyONjJuwKBcTn
         BV677t9ZPMTCjRP1Gp1pN2Cd+X+uZXIxx/O4mBPCPUurQOV/6aQNbmPSIhnt1mtl+B64
         atSA==
X-Gm-Message-State: AOAM531SQwZ5TKBmnZFMPhnLKDvPtfOXi2jy86hKuKT+hSUfdW/KNIrV
        0r/kAAZksPIaGVmFgJnJOd5xlQ==
X-Google-Smtp-Source: ABdhPJylT0JzCgJvG+ohdnVIEUUS8WbedAVMmnEclqJKRS957iBx98KqX9JyjBqp1JdRuLF5G8fJdw==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr302748wmc.71.1604417377831;
        Tue, 03 Nov 2020 07:29:37 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:37 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 21/25] soc: qcom: rpmhpd: Provide some missing struct member descriptions
Date:   Tue,  3 Nov 2020 15:28:34 +0000
Message-Id: <20201103152838.1290217-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/rpmhpd.c:52: warning: Function parameter or member 'parent' not described in 'rpmhpd'
 drivers/soc/qcom/rpmhpd.c:52: warning: Function parameter or member 'corner' not described in 'rpmhpd'
 drivers/soc/qcom/rpmhpd.c:52: warning: Function parameter or member 'active_corner' not described in 'rpmhpd'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index e72426221a69c..6bab57aa6d488 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -24,9 +24,12 @@
  * struct rpmhpd - top level RPMh power domain resource data structure
  * @dev:		rpmh power domain controller device
  * @pd:			generic_pm_domain corrresponding to the power domain
+ * @parent:		generic_pm_domain corrresponding to the parent's power domain
  * @peer:		A peer power domain in case Active only Voting is
  *			supported
  * @active_only:	True if it represents an Active only peer
+ * @corner:		current corner
+ * @active_corner:	current active corner
  * @level:		An array of level (vlvl) to corner (hlvl) mappings
  *			derived from cmd-db
  * @level_count:	Number of levels supported by the power domain. max
-- 
2.25.1

