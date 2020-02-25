Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33E9D16F3C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 00:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgBYXqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 18:46:55 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40607 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgBYXqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 18:46:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id t14so1075112wmi.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 15:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TYlyvESdtJkkzEIVJoYhQjClltnzu2fIaM1HVjBTbAU=;
        b=Krc9sIsewtpswOvKmk7/S+COuYzreBWD7Ca8jY17fZ3k6AjVVACajXiS4CMmO1Nwtj
         v8D7QrhulrHl9PWsix3qtVdoUc2Z8N6LW9X0B7qS0YEKS5IP19BbEUnU++EaiUjj6wci
         KiRACC46tsHkWepzwmCV9H+GZZHdDtj4UyIxnM/IRi47C99hdartYCGwy3BZ0xASNVP+
         MDXYP48thmVn9W5WTj36Vv0peDrX/4uGae7VRvlPqThnWBRRgrTXWvdiSL88lAULo4Dx
         h6br15BkZNibYmn5UzAy/nL1OWM3dcCqrOunkGIbZP4T1dlmHaldJ/e+1HE3qalfG4tK
         03wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TYlyvESdtJkkzEIVJoYhQjClltnzu2fIaM1HVjBTbAU=;
        b=bWFnwhfE2KkfeDqYEgzbn6bMUXmxc3cXRfP/tkrHEDBWIDv/Qyfmq/p2Y+f2wr8sV1
         /qezF7UHVkXyr49ysahgZIIvuIdkbvE2eIR3KxawOlACl6C+MSDZI4yvpiek1uLfu5mJ
         cMasa/sifdubqGRgxpwWt722FmC7HMF3BDF0bBsrmIm+4VlC6w+oOk0zYjUBYiOKrVKi
         S4mI56BXq7HVrMmEXsnjPvpLOJxf8KL/XJLwrgGe/e8yFKiobbn2lGnvW2Tz0o/jCDe3
         dVXg63j0wvZMLtnPv4Wg/AitgGmC9ZGtIoyHnCeuvY0JspvDbPdhNdTjQ9PwWMiuIS+0
         Ahtw==
X-Gm-Message-State: APjAAAXSYAOtZ8cFJpyL8fdMGhmegec6ivrSdyx9+FEqhc59qeh/S/st
        dhpFO1JsCWu+cKfxhwZnToR9Dg==
X-Google-Smtp-Source: APXvYqwY6Dl9BUk+IfJpxezAcmeZBSNghy55b16qrsor7bN8A4eNGfhfbLFlczmxqOt85MjNWpJtWg==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr1582353wmc.52.1582674412106;
        Tue, 25 Feb 2020 15:46:52 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:186c:5f6c:221d:5ce])
        by smtp.gmail.com with ESMTPSA id t133sm356278wmf.31.2020.02.25.15.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 15:46:51 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v10 15/15] Update MAINTAINERS to add reviewer for CoreSight
Date:   Tue, 25 Feb 2020 23:46:11 +0000
Message-Id: <20200225234611.11067-16-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
References: <20200225234611.11067-1-mike.leach@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added myself as a designated reviewer for the CoreSight infrastructure
at the request of Mathieu Poirier.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80e908129509..a2ef2633ddea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1676,6 +1676,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

