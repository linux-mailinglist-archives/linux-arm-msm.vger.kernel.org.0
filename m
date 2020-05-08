Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B27D1C9FA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 02:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgEHA2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 20:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727124AbgEHA2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 20:28:16 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FF3C05BD0D
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 17:28:15 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so2786769plo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 17:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d89QrDod8n3DS0mHAWOT8Nhxmdw/BYJeM/jPsxOJaUA=;
        b=BVCEG8eDlA86Kc3DaKoVApgyVNNVTpgY8y4vx9gcEnguJ1dEe7z5lgDTbTzC/qjCq2
         x+gJ7f7GxT27U+R8QKnfUV/JlbVxgcsBnP+mH8K3KG6LYrmVtMpih45iOxwrNuMXbsND
         i9pBLGXqA5iNRT7gde+iRZ/9z6Um+IIGKGmZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d89QrDod8n3DS0mHAWOT8Nhxmdw/BYJeM/jPsxOJaUA=;
        b=Irt7f2z8ikT0f5XCVFaDlnWGec7EiQIehsJ0qLfDfqjb4Ct4GX5tccFxe9DFBFzOQc
         jGtZAafFjcZEZ5HFByDq1KtgkNQBzss0mAsWD/MeoZWNHDIfU6lsvpq8MhVz8bHkTgeU
         Tm7Uw/8XDgMH2ooq2ci6w6rAL07Dueh/6gtFA3yJ6kcKM6LBiJFoOKObAsMmJPaziuWE
         Ry80cCy4/pGKrroRgRCFxTceffJ+f5yGr+FHgR9Zjw00h0MLgZ9oAoV5X0/cX3PrXQQC
         UxREtUtqBfLsHFuaqOiKLZSq1YWb7XreLpgup/0vcKv9DlrB3BgR8IdJIgiLQC3BtuyU
         rWTg==
X-Gm-Message-State: AGi0PuZrgf4WO0b3nyeu3YSSgG0qSFo2W6bXsnB2YxFCWHQFzqOlxNkB
        /0KMUkd3OB4pPHFhxjI8KHaJ+w==
X-Google-Smtp-Source: APiQypL9yg+UTfakfAY/PGrCH8wWW3n8ccPxXXOpi3O6KW2uN1JVvwO4pJpQK+Wqdfoa82/pMFJAYQ==
X-Received: by 2002:a17:902:361:: with SMTP id 88mr15726849pld.279.1588897694996;
        Thu, 07 May 2020 17:28:14 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id gz14sm882677pjb.42.2020.05.07.17.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 17:28:14 -0700 (PDT)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH v5 7/7] MAINTAINERS: bcm-vk: add maintainer for Broadcom VK Driver
Date:   Thu,  7 May 2020 17:27:39 -0700
Message-Id: <20200508002739.19360-8-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508002739.19360-1-scott.branden@broadcom.com>
References: <20200508002739.19360-1-scott.branden@broadcom.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add maintainer entry for new Broadcom VK Driver

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88bf36ab2b22..63eec54250f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3612,6 +3612,13 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/ethernet/broadcom/tg3.*
 
+BROADCOM VK DRIVER
+M:	Scott Branden <scott.branden@broadcom.com>
+L:	bcm-kernel-feedback-list@broadcom.com
+S:	Supported
+F:	drivers/misc/bcm-vk/
+F:	include/uapi/linux/misc/bcm_vk.h
+
 BROCADE BFA FC SCSI DRIVER
 M:	Anil Gurumurthy <anil.gurumurthy@qlogic.com>
 M:	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
-- 
2.17.1

