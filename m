Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F37D1F49CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 00:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgFIW6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 18:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729008AbgFIW5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 18:57:41 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1D2C00863F
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 15:57:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n23so68451pgb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 15:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I8ffuKnAI6ePp72FbTqXndKW4mWsmd4YfaiykgykUjE=;
        b=ggaIRQep0r9gJKaPKzz5zfk2jSKqaYojEj7TqbGTeEGhi6jnwUsuWWBXbsRvtVLUIa
         4t9J+N5/UNu4Ti1R2tXux1oeDcnxz5wd5BEz6mgmzNx5+DLrPeUulrM/iklcpFFBvvKL
         Cmc2f9h0KIN4UoLrbP5IHbVNb5+Vg8MBFIH0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I8ffuKnAI6ePp72FbTqXndKW4mWsmd4YfaiykgykUjE=;
        b=mW6tEQNS9ZPfTGIgn3noTt2qn1g93rDo8IZtCsa1sQLWJhtrBeUzl7jqzsAnlXowDG
         p965tZuz+zW2qh1+z95j7YeGK/3dAcxIPRfxujbKJYlDZcrrW+OkkUAIGb2PSHMKzo5P
         Nyb45LUG4EF9Sqhlv63YpdZ5nprvfZs0IZyVYfWf6/D6cLnXWClLnaz9vME6AW5opoHj
         Vj7k/rvMy6+a6P3mjeSvo59NdogdwWsvIH5BGGJy1hJwANDFMFWZ76+LeSlr65kLln79
         Ry/pVND4BW8Uca0vX3/yKPiktpf6bq174zbXD2RkXBsEw5EDy/Ve73L/dHxdllYoBbfU
         XMFA==
X-Gm-Message-State: AOAM530k0N2y0LlaLV+K327lYo0HOYZ2pch9dL5VUCol6GCDUTSqAtB5
        tAoKUGKyn25TvNC90aTdeSlUcg==
X-Google-Smtp-Source: ABdhPJwrq+BbJyVNoQDQIQYM/E9dbeyvZqllAsieA1UQyWozBug/ETQFIesWoN1TqS1km0emwF07RQ==
X-Received: by 2002:a63:4b4a:: with SMTP id k10mr217449pgl.135.1591743452273;
        Tue, 09 Jun 2020 15:57:32 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id p8sm9104978pgs.29.2020.06.09.15.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:57:31 -0700 (PDT)
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
Subject: [PATCH v8 7/8] MAINTAINERS: bcm-vk: add maintainer for Broadcom VK Driver
Date:   Tue,  9 Jun 2020 15:56:55 -0700
Message-Id: <20200609225656.18663-8-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609225656.18663-1-scott.branden@broadcom.com>
References: <20200609225656.18663-1-scott.branden@broadcom.com>
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
index 5985a7847316..28e3dc1d3244 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3656,6 +3656,13 @@ L:	netdev@vger.kernel.org
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

