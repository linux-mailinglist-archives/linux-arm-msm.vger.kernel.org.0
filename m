Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C24165AE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 11:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgBTKAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 05:00:16 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46748 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgBTKAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 05:00:16 -0500
Received: by mail-pl1-f193.google.com with SMTP id y8so1345410pll.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wCEC2ZRR03FX3LpFaZeS61EwGHy767mriaO/NK8EABE=;
        b=uOLozh4ocYZRgiI3Xgo/dMXSncitbyg/EdtaeRejTPSv+glh5Hj2ZS9fdNOok0fJx7
         BcfVa28+i4aoEuWk+pCRGBU/TsmRzKgJsTm/TQsL4mEMvf7TEPuufb7OzaGyKLn6BoQB
         sP1KpXZx7Zr7xONt6PtGsGyd10ACIu3+WLavCnQAWivASFoiwa60fgztDA7fxUw7DxXy
         Qc526OAaID+EqBHMdev+JUZxIaFKsiVdR3lPcTql5px63SEunVxlxDgYoMLteSgd6Z/2
         3Yx9pLmmPd+Z4C0penqAXS5PccJtMJ6Lxfd+/zOMewD2FEv/kGu4Fy2Jv321BytxvVPJ
         cv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wCEC2ZRR03FX3LpFaZeS61EwGHy767mriaO/NK8EABE=;
        b=t94ZcmTRIMnhl2ZHfGhwLzvBC8H5L5DI5TgoZgD/QgUtHwquntehoyRun8Lcylx9Pi
         b98pXdm+n7Oo967dLPaftpMQiTd0ctf9sEp639+ja4XbJQuDw/+Hc5a2TOjVbqAxlpE6
         MyApwwuSu+sXBaEaaDJyJYNQ5AIFFiGNUavSEOiOTHzPjisKuvTFUqyqTIeQEvrd7e4n
         LJe+H8yfR6Aj4a3uJ9YsqzsA3SubYI5aiAggDF45eX/e7yrfXlDPgVmXvdcdEGtfW5ru
         taT1KnEp6/Dx+QxJHuGxZKxu2bsgX9mTqZwbg5t/d2MPZ0n0vTIDfzJZX9R7NVD5t8A0
         Pg5g==
X-Gm-Message-State: APjAAAUGO1biu+kzzG8ejcLbw30gAKGpQGBGHXW/AO+0E5aNBI86H4Nq
        pPhM2diPWjxHdHNb6+Ew7ndj
X-Google-Smtp-Source: APXvYqwHpKUKUUfwxWu7wMeFFq8tHCvQXvc3ddc6xuQQDasnQr/PSbvx8lEinNqWdPi8260n7EtWbg==
X-Received: by 2002:a17:90a:fb41:: with SMTP id iq1mr2688737pjb.89.1582192815189;
        Thu, 20 Feb 2020 02:00:15 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:315:9501:edda:4222:88ae:442f])
        by smtp.gmail.com with ESMTPSA id b3sm2678644pjo.30.2020.02.20.02.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 02:00:14 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 13/16] MAINTAINERS: Add entry for MHI bus
Date:   Thu, 20 Feb 2020 15:28:51 +0530
Message-Id: <20200220095854.4804-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
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
index 38fe2f3f7b6f..d01b7e3f6cd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10891,6 +10891,16 @@ M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
+MHI BUS
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Hemant Kumar <hemantk@codeaurora.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
+F:	Documentation/mhi/
+F:	drivers/bus/mhi/
+F:	include/linux/mhi.h
+
 MICROBLAZE ARCHITECTURE
 M:	Michal Simek <monstr@monstr.eu>
 W:	http://www.monstr.eu/fdt/
-- 
2.17.1

