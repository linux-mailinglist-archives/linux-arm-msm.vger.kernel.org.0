Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CCB1FA094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2020 21:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731162AbgFOTmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 15:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731135AbgFOTmc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 15:42:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A30DC08C5CA
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 12:42:26 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z63so7338321pfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2020 12:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EN1IhuHOwzgoOcWyZIy9cQLF20jppiOEN2CrFnDInH8=;
        b=U9lxy3jE22JUx9l9TV8z9qLuPgIwP3ylxQU8Oumrvr9oyBQsLce9TnB7+K5bfye5Rt
         uSfK6xnQ0iLu3hF2G/vBHdDn/bbuiTEXKjRZhRPX4Oe5f9f7l4y/eKqXwqR0BaJFJ6Kg
         yVYKCNCf6yBQoC4Q5z7/kPeFqVPc4lPPSW40Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EN1IhuHOwzgoOcWyZIy9cQLF20jppiOEN2CrFnDInH8=;
        b=plCipuzVbGuTdFFsNlV/GUoaRfuOx647zi9evCEbY4PjOkr22bD07X+DJZeDcpaK/9
         LglhW/c/DlwBjc27GLVbeSX2zZuOyzgMPfQsOWg+f47g5qEyrdUOUXetHoyT11vgIOTV
         igtyqdU1x/0W2V+/hKDPW+pPmKBfpTSRNum6r2iwlYZqJUCsxHT+VS0JQpEFwpbpNcoq
         gQ0Q1tLCqcY9813unpnsY2MWrKqnZsy8/VZ3RFQ4xbO6W0Y2oSrZpN927dmcPfqwLRWu
         JA9qb71ZkxbJUpSxyvyoSFU8DaEkGvQ3Q0xvVOquvtfa0EKQE/pSwDq7n8APTY1387Kj
         NVBw==
X-Gm-Message-State: AOAM533aEt9B5uJ2IFtsFEtWhNt7GY+2bQ6kMz39xAcEUwHjFz465S3t
        NouY5eWlW6f74twRpDZrO3v6yQ==
X-Google-Smtp-Source: ABdhPJyBz/jS9zEuqkK2ql9UA5VzjypmIVHnFoC/77SXnpjE2nUSYBpVs6rkRwL2bVBYYLvYR9xePA==
X-Received: by 2002:a63:214d:: with SMTP id s13mr21585779pgm.277.1592250145955;
        Mon, 15 Jun 2020 12:42:25 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id gq8sm293663pjb.14.2020.06.15.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:42:25 -0700 (PDT)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
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
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH v9 7/8] MAINTAINERS: bcm-vk: add maintainer for Broadcom VK Driver
Date:   Mon, 15 Jun 2020 12:41:50 -0700
Message-Id: <20200615194151.7011-8-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615194151.7011-1-scott.branden@broadcom.com>
References: <20200615194151.7011-1-scott.branden@broadcom.com>
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
index 83078661cd2b..ce29c7d0b228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3657,6 +3657,13 @@ L:	netdev@vger.kernel.org
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

