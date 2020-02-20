Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3731653DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 01:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgBTAtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 19:49:07 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:33315 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgBTAs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 19:48:59 -0500
Received: by mail-pj1-f68.google.com with SMTP id m7so603767pjs.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 16:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3w9edU0bQTA/j4i1GZ5kCMLx5L0gk76mGZ2Jl2DPJv8=;
        b=ZeNCpCRGcYvQriOrG7nnRAwG2HLKcfUbnNuky4kQOtRD0bn59Hvqtia7UjS5EL1wtm
         JrkWjvzl+mC614o7v8XfG8+JPEmBrAnWb79QYFg2id7JqxhegfEV05kzAUZv+YfGH2TG
         oohrRRL84DOMAWaN+EK4SCqh6Sx4owhTbcqhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3w9edU0bQTA/j4i1GZ5kCMLx5L0gk76mGZ2Jl2DPJv8=;
        b=Ctxa9lwgQksmziuHnTjOvVG3Ep3ffVcqWxkn0cv+rX9rCJjwRA+xv5hlrnzkq4O9gZ
         4m62+CE79skvcphEj+mo+ALJxlq7Wjg0fFflymASoB9o/Lsdmo59NNPYHLycZtQkhB7H
         vhf7O2WzDOg/4wSqWwB7VViSb5HbWy6/zkRRg7gTUCJuKPTZIUCq4UAvL+geD2G2ujBr
         8rD7D00J25/Xcj+ZJkA0YxVXl1YnGICuH86zNaq1YQUU6jgrgPZ3nrXtoiwf+zbDz+GT
         Ttoj/PBa+xfC7RrPZbK3obFuwKIVL3ZxvUD3RFebzUqNgptWM786kUMHVd6DE7fdP4JP
         2n3w==
X-Gm-Message-State: APjAAAU6D3Kr/oCf0b3RKDD/bb8zOKorVD9iAMhHNPd/C1mk/Vs4eCO4
        8hAFpHV+xYs6cajskA0IgQITEQ==
X-Google-Smtp-Source: APXvYqxvwfYCexceHmLY8+2NVNDKj2k6UoiRx/YzDmwMEI2NjRSexRZ7sLY6QpdZDmP32eZBMJa/tw==
X-Received: by 2002:a17:90a:8d81:: with SMTP id d1mr462100pjo.63.1582159738999;
        Wed, 19 Feb 2020 16:48:58 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 64sm816323pfd.48.2020.02.19.16.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:48:58 -0800 (PST)
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
Subject: [PATCH v2 7/7] MAINTAINERS: bcm-vk: add maintainer for Broadcom VK Driver
Date:   Wed, 19 Feb 2020 16:48:25 -0800
Message-Id: <20200220004825.23372-8-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220004825.23372-1-scott.branden@broadcom.com>
References: <20200220004825.23372-1-scott.branden@broadcom.com>
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
index 4beb8dc4c7eb..c55f34f00b85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3564,6 +3564,13 @@ L:	netdev@vger.kernel.org
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

