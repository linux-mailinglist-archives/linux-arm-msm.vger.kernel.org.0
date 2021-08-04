Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64ECA3DFD33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236688AbhHDIoV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 04:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbhHDIoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 04:44:13 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278EFC0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 01:44:01 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h14so1296533wrx.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=x+W4hpwl9df5CB8MZzAA4b3cZ5d3FhNu9Q7vDGYVJU8=;
        b=opy//H6TpPPBAFCpcce1A4l5KV7bZL7qbX1RWFxJ7wuIwIdB1+bX1h5gDUsTuRUdG5
         HePB7g7RtMMECstxeb/xQrNbe6eYweNRmwmQJT+oTogjsoJHDpy+wwNl1upRcA3Qt2BF
         C7YdD5kzFXPYpgjFW431GSaKKYRKKjKWiYi9jqlfnIq+/bhmL3EPnrJwA3rfdBbYW+df
         s8IVvImMfo9QjiPnHdEF7NMicNiogMZ2bHeYGbtPRjcJwoOC+TRnvr+AV+7Dz4nzS6nW
         KBYKNqGdlUbzt/U2lJL1qdC8U7ZjeFlB//39794AUgOpU2JNxUcFM4c7Eyk00BEnI85m
         WBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x+W4hpwl9df5CB8MZzAA4b3cZ5d3FhNu9Q7vDGYVJU8=;
        b=o1/jygsJhJ+pJqHIOFuHBdhhEInzZ5CfV9D1NBGOk3j6ArJKWGbAwikTjV81nTynvL
         EX6ri4L8uMQBpVy3jcy4i1UW4ZL+0LAZo4WG6kydU9jXXzehT+m++Xo77zwqjy5bYZSY
         n5AqJammvA4eTLBUH/1m5a5XhI5kC3FihmLHmqPEGOGX0VjTXcEcDYJZDrTiGu/WYKWj
         GGABzUbvmmv3VCA5WNMElpu6cyLXImTc+aiscD5f92gEm4EeIBUeNmEmMAhBTie9iePp
         5YjtinV0DM5upRGEU7ASU8uYqQah5MeUEJVLxG5Xpxkhs2Ki6ivvjh52OlfT9Eww5nrS
         2bTA==
X-Gm-Message-State: AOAM530+tl4lpvNh1BnDE+Xnj/gjQvTmFZhXXZKx8rXfaIIs+NIRjb8m
        dxYnpgU08cKoNrDF5FBXg0Jlxg==
X-Google-Smtp-Source: ABdhPJyj/S2rP9MNjtE9z92MZS5mlgBhOx1t8pR5WugZlVV70t80Js41VHUvD66MU2VvWH4T+Gg4Gg==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr27816676wro.207.1628066639697;
        Wed, 04 Aug 2021 01:43:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:69b5:b274:5cfc:ef2])
        by smtp.gmail.com with ESMTPSA id d7sm1681899wrs.39.2021.08.04.01.43.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 01:43:59 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: pci-generic: Add MAINTAINER entry
Date:   Wed,  4 Aug 2021 10:54:16 +0200
Message-Id: <1628067256-22813-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add myself as driver maintainer for pci_generic

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c32a9c..9759ddd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12098,6 +12098,13 @@ F:	Documentation/mhi/
 F:	drivers/bus/mhi/
 F:	include/linux/mhi.h
 
+MHI PCI GENERIC DRIVER
+M:	Loic Poulain <loic.poulain@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
+F:	drivers/bus/mhi/pci_generic.c
+
 MICROBLAZE ARCHITECTURE
 M:	Michal Simek <monstr@monstr.eu>
 S:	Supported
-- 
2.7.4

