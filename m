Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C711BE4EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 19:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgD2RKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 13:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727769AbgD2RJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 13:09:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7A0C035495
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:09:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p8so1308351pgi.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xcQN/WNJ3PKuzjvXhZJ/eOoFGMkNcGIRid3lH/vICig=;
        b=hcsCgevWbfyIOS3Ma5Zc7uCJmmPfS2go8mKkbtKUu8xteho7w++FLL7Ffz4bA6YcZ8
         FGvlufLOfG9YnHegDls4Qs4j6Z32taJJi+zIwlClvPhXiIWgYo0gOzCnCobc0lNn1Qkf
         VPCTGM9kESMs6PeCEbRweRhbksbnb/5EFhRQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xcQN/WNJ3PKuzjvXhZJ/eOoFGMkNcGIRid3lH/vICig=;
        b=TYfRZwsErplSDCOy/8hJWs+59bmKTsZGz8lYmgcnesXNdOCeW7gC8ANsq01wWQRaHz
         m9PjFwfAMi1dtKV0HxT+rQPNqLtV4mCSNPNYF0JpQolGTonJOE7R3k9FYqH9AzbW/odW
         SxZwrCLSNutlT2mYCKKkDDOHjdzxQ3V9rsbKo/yglSrA4q0cLb38ePQD0Mp/ZV403AzL
         0GYYh/uloDXfCcbM9ONkatMk/RI3odmkfPbmDrovCGscg6q10MWKphgqEdWV3wMesKwd
         Tnb6CthHXIxZrj7NCX0F6QwklLQQMkN8FRYT49Bi/YlXdsuY9iO4lvCizqlOPSKw59lv
         /GfA==
X-Gm-Message-State: AGi0PubUjesUvlZErgzrznAGjSZAeFNRbDWiLJEXSjg91TsmW7ybDSoF
        o+L3VkdO8jpdVSJFwQ52H3Oz/Q==
X-Google-Smtp-Source: APiQypI2r7KKRGsuq3L884nKjCvqNbuMuJC3pzGKQRH2L1+DsPz8xxzAhFZZOxGeTWra83HnQtHhMA==
X-Received: by 2002:a63:1e18:: with SMTP id e24mr31238033pge.296.1588180197178;
        Wed, 29 Apr 2020 10:09:57 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id y63sm1574456pfg.138.2020.04.29.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 10:09:56 -0700 (PDT)
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
Subject: [PATCH v4 7/7] MAINTAINERS: bcm-vk: add maintainer for Broadcom VK Driver
Date:   Wed, 29 Apr 2020 10:09:14 -0700
Message-Id: <20200429170914.30976-8-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429170914.30976-1-scott.branden@broadcom.com>
References: <20200429170914.30976-1-scott.branden@broadcom.com>
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
index c1175fc0aadb..cbc132a9b766 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3613,6 +3613,13 @@ L:	netdev@vger.kernel.org
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

