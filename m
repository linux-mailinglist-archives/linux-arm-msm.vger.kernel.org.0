Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6444300B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 08:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbhJPHAH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 03:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236837AbhJPHAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 03:00:04 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E03C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 23:57:56 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d9so3089898pfl.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=zoOpjybTvuwHtP4eb6cvosjEosqpSYWs5m9cP/9HS3A5UmQuEUqHIRSvYdvDmzD7eJ
         YnkVNam2jD6lLXbLZ9/UAGQ8JI4pCu+kUybzSBu70usSBZ9koN6bTcl3HdEsRhpzCYTL
         S4MTJCAshw8yl3ggdIdu9HZUFdgdPjijBpE3rKwFVMvYwjtEIcvjlqVop/tz5dptJ8aM
         8CQA9t6Y05qL1B35bGGeRHp1A8AQJXE4Kns96qRmRUgsGfBxDpDUgsuZnbYjdcf6AW/X
         ZyX+DMfKz0uGO/T1SVVlwjjtSrXjKJbl+vnzyvByCVo0M+mBMY5Hqrx3uCBZ0qqtcojJ
         d+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=2zsc8g8F6kvlZ08Nl6gdnDt4S2dmq9Jjx+YVePrFtIrCalrhg7LXTwrvfD5wEI27wq
         cUuSz/tZ0Z7u332WpcAHxCXN5r82d3NrzbTIhkq9phcSV+V3dRJqM4Y4r+N6DhYP4jDf
         frQZxrLADIjfKBbJNLmfx8Bz2z3sjG+5s+zvaip0UaozKMV3ZvVRoM35DrjxeKjY1GFb
         pqq9ZXwKkI8fDmxKXI5BOr3q+ZcbTPm8cEV3wduaEXBB/90mG+59RKaSJ/5+4JCn5cxg
         9SeBwfDyKftWoOKVMoZ5LrS4UMSOS4W1ibn6FumHKWZaJraUqs66yET2rPYbO0WS0+BP
         GlSw==
X-Gm-Message-State: AOAM532yeS+FJPjQjnqPEUhKhxtwQ1YiA7LKPhhPexCCyFUlqRZKIRl+
        5cQ4cd7RnWhO0TqkFN9x5SXZ
X-Google-Smtp-Source: ABdhPJygVbcWzrbpQlhdx7t70Ze9/6w7BrhXWkiL0BV04AdsCQILo2Sqq49ZybtPZpCaYiEisTZolw==
X-Received: by 2002:aa7:93d2:0:b0:44d:4a13:5267 with SMTP id y18-20020aa793d2000000b0044d4a135267mr16086049pff.52.1634367476342;
        Fri, 15 Oct 2021 23:57:56 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:57:55 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Date:   Sat, 16 Oct 2021 12:27:32 +0530
Message-Id: <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since Hemant is not carrying out any maintainership duties let's make
him as a dedicated reviewer. Also add the new mailing lists dedicated
for MHI in subspace mailing list server.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..8ae357d746c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12191,7 +12191,8 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-M:	Hemant Kumar <hemantk@codeaurora.org>
+R:	Hemant Kumar <hemantk@codeaurora.org>
+L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
-- 
2.25.1

