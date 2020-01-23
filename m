Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5CAC146698
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbgAWLTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:19:31 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36966 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbgAWLTb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:31 -0500
Received: by mail-pl1-f196.google.com with SMTP id c23so1226068plz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OOn03P2j4+kr/DXG8NPT0x1Kk1bZl2DSDVVAcxfmW/Y=;
        b=oNMapbpk822BP7CdcxtHz54BSReHACxR+26qB0HWnkZ4gytrswDazDLuWvp8kWTHyY
         X0EM7F/EpABqwyGi14/41RPld6Tb6ZigyF+qHq4HZIw95eLkKTsU0Aznzq9Xa/n5lfXZ
         3SwmcfunHdLLigUEHiATW5hTYmuxhxau5Iwo4I+pOo2p0IbEkPipHROpk8tMxqph6A41
         VGtD5AHIb3ZXNfM6ZTBVwoKZoh6Upe+hBcr93VLXovkzRuS6xVRc9IuQPKm0zG+M+zfx
         XVC2NomZ1VqNLZn5dOMb8A40GP2OrtIFiH+K/i3qD9orFKnIMYsp0xmOqOaotAQu7cKf
         3guQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OOn03P2j4+kr/DXG8NPT0x1Kk1bZl2DSDVVAcxfmW/Y=;
        b=QHYhqBZDFvnnuGKz80bPuo/Pwd4QO0h8CIDU3TF2OZNP7nL2HIgn/bnj8pCDi5dpJq
         EObqsfUhGVZkv1Kpwvrbr0Lph94oPrO5airRr4S2IXgmNrHtoZZLaN7dz/6ua+K5CIED
         1CqZSVI5UFjkbozfur7TcDMYlNImwB7sMcXD2GsfQx5ZDdOSPdzfSOtVOakOhGPI+AF5
         bKbDHViDVQL7nSfEu2Zsldb0MulqKEUiUfB/XWAQXYVu/sxG0tuIxFzKvA9AYoPJgSS5
         U4dU32Zl4l2d4sfRsgUTAobvB1U6AJ2HgkiTOgDn/Egus1/UCxtIvv5cw9kfFgwa5vZC
         tJHg==
X-Gm-Message-State: APjAAAXGgBB+M0hDBFAa8iiPEy5Ex9xAzP7E8q8sTgfoPe04UdEpDN+w
        2Gf6JyRDN/cwI19IrM4/Jl3/
X-Google-Smtp-Source: APXvYqzf7o8s8NL4+/h7QX2QyDG6Q2e+Dp159PX+H007Fn8qM0bcUDWCeLXu7wTK/APwY8aw2bW4zw==
X-Received: by 2002:a17:902:6ac2:: with SMTP id i2mr15626148plt.221.1579778370707;
        Thu, 23 Jan 2020 03:19:30 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:19:30 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 13/16] MAINTAINERS: Add entry for MHI bus
Date:   Thu, 23 Jan 2020 16:48:33 +0530
Message-Id: <20200123111836.7414-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for MHI bus.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf6ccca6e61c..927cdd907f1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10777,6 +10777,15 @@ M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
 F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
+MHI BUS
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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

