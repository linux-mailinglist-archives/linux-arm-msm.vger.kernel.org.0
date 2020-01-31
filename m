Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3AF14EDF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAaNvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:51:08 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50895 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgAaNvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:51:05 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so2865769pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5Z7HXo4GP+f2mscCj2Lrc3wGR5IDDV26A7NOcH9deR4=;
        b=RWzDwV9YyJY9BKEGeGxbrwQfcofVdJzmm0E3P8P4NfiBqOv4mNdO9ttNeo5I5j0hIh
         /DyhcBfmxV5bAXGdytft6pTy9TxY+80pgfh8+aok1P7XVfX0LFRZ1ygOqmeycNCO0oQM
         RwQOgHDdJvyjNGchKlvBYz0qX50SaQeutuCmS7izpiuEdgwNmu7e/uOZeBhze7Joav+N
         qjshcHjpRk97nt2SACoYYPk6RJtii3+Rp4gt3rLlTngf3sFZsjhR9GJX1eUP1rvm+P5f
         8/Xh0dmiR5pY9wAlGwXXZXdG2TWAPSmp4EL94QWAMlRhUwm2AcHHjNHg2VmcxgS5OB53
         +VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5Z7HXo4GP+f2mscCj2Lrc3wGR5IDDV26A7NOcH9deR4=;
        b=QWipSfh/JGJUwj/tZ+zH/xfhTsejVq+lftyv3hIUjhszsoCYJscg81rkYTK4GXdAkv
         SbH8aNgzjt0E2cSG6y+x5s8dsNJMZOJaPNmWpTRyhp5A6a+Eim9A+BHfASvsbhHDmcXa
         zvFvIiBmOAusgb+GtK8nbspoR4g9+V3nsATiZsgsB+1jQDrY/QuIickdY37AdPX/g+MA
         y4QJYtfLwS2RC9vxwsP5InfUTwovu/VoaS3IEGeQYBo/Z0S7vtzN/9VBAByNSI0ShHhJ
         p3s3t/XAqZMpV8PJBvjcif05RmAq+YY49zrXVrtltg7PK+6+cfO2aoGoFn4ahG3gJ8tJ
         IxlQ==
X-Gm-Message-State: APjAAAUrVG2PaT4suPBo6G85bRM9EPpTdjf7UVUwxXdjYRkTWQpZv5Ub
        HOIuOCQ12wD2WRiLRqHalNro
X-Google-Smtp-Source: APXvYqyfVuwEG3t4S7Sqc4pU7YzcIWgpNWfYK2gwf5iwlPh4gC6yAw57C6bBedXTUeEad2PjiRAKgw==
X-Received: by 2002:a17:902:7d8b:: with SMTP id a11mr5446352plm.99.1580478664653;
        Fri, 31 Jan 2020 05:51:04 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:51:03 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 13/16] MAINTAINERS: Add entry for MHI bus
Date:   Fri, 31 Jan 2020 19:20:06 +0530
Message-Id: <20200131135009.31477-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for MHI bus.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf6ccca6e61c..9213d150041c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10777,6 +10777,16 @@ M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
+MHI BUS
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Hemant Kumar <hemantk@codeaurora.org>
+L:	linux-arm-msm@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
+S:	Maintained
+F:	drivers/bus/mhi/
+F:	include/linux/mhi.h
+F:	Documentation/mhi/
+
 MICROBLAZE ARCHITECTURE
 M:	Michal Simek <monstr@monstr.eu>
 W:	http://www.monstr.eu/fdt/
-- 
2.17.1

