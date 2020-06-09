Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2D31F386E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 12:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgFIKrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 06:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbgFIKrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 06:47:37 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4AAC05BD1E
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 03:47:36 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w7so15951819edt.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U9rt/3Vl/6zlHKoX8Sru+cTCnsVpfXdCh6OHWoOo9RE=;
        b=FRLTeeLV+htxuHSVemMkC/H0jDbDMDBVLljGbI5nXTP0IhqF5MnV9KiofVJzjeP4z4
         0zwVRhu75Q4no06LDdOJshGV1LHb0S3tOA05xbRD40Dma+wJmAO9YFhwn5dctpuYIEWq
         ZLG3B+MAt29+JMNIQpeV11RNkNvsbXBA5Qgnm/0GE1KBf7nXFDBsqux+9o5VA0MU1ZWv
         AXpnSTeeFLZAnaiYcjBmlBixwTTthdz+l8s1TM87XZiEztoLc5XuK1HttYXUW9jSdJRS
         axs60D+IuuCnv1d2SKcZyZLFlz73Q6gnl4DPgbVQDWWCv71BwouRU8hzz7qDRGuGQR6V
         gaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U9rt/3Vl/6zlHKoX8Sru+cTCnsVpfXdCh6OHWoOo9RE=;
        b=YBhoCJVOQCk7TGJl5Caw2O/bsn9b/vY8ghzpxk89QdmzuMXDsJZtYFLCGogbFEp4VG
         s8sXtXydLy2jua/dv2sNBAQwv1MjL0r8ph4uweCzpHF42eiou9QMIX3QTu1MvhnUsTF+
         v1WHumYhCh26tGipKrg8mbKksIFAOsVs0HBZNWIoDMMul35ghhi9wONc/HXqCiQT6tSL
         FOh3/C6+0xLJCCLavNseUaxMpfjNNm9X6ENKnGlrF/tYhV3XHs8AG5PDxV8lvkAV4DBi
         zzIf4iJwksJYI3tz9iNT6U0W0a33gBvH2z8VqFgN8F9CWzyIx2igJJuGSNSrK1s8RPGm
         cNtQ==
X-Gm-Message-State: AOAM532dR71Onwac9DPbyWQsyRuuQ0SXOUohv37iirkojum4x9oF7ske
        4wVOHdwvSPRnpqAQiK+05DTmfQ==
X-Google-Smtp-Source: ABdhPJz+fdaUtgiiLd8gXAw1zn+Ihd7jWg7g+4P4sGhrrGs3vMrDi8lIPiEbt8jFBzavbp4Ebo9fZw==
X-Received: by 2002:a50:b0e2:: with SMTP id j89mr26765993edd.257.1591699655083;
        Tue, 09 Jun 2020 03:47:35 -0700 (PDT)
Received: from localhost.localdomain (hst-221-69.medicom.bg. [84.238.221.69])
        by smtp.gmail.com with ESMTPSA id qt19sm12267763ejb.14.2020.06.09.03.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:47:34 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-acpi@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Baron <jbaron@akamai.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 1/7] Documentation: dynamic-debug: Add description of level bitmask
Date:   Tue,  9 Jun 2020 13:45:58 +0300
Message-Id: <20200609104604.1594-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
References: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds description of the level bitmask feature.

Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 0dc2eb8e44e5..c2b751fc8a17 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -208,6 +208,12 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+level
+    The given level will be a bitmask ANDed with the level of the each ``pr_debug()``
+    callsite. This will allow to group debug messages and show only those of the
+    same level.  The -p flag takes precedence over the given level. Note that we can
+    have up to five groups of debug messages.
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -346,6 +352,10 @@ Examples
   // add module, function to all enabled messages
   nullarbor:~ # echo -n '+mf' > <debugfs>/dynamic_debug/control
 
+  // enable all messages in file with 0x01 level bitmask
+  nullarbor:~ # echo -n 'file foo.c level 0x01 +p' >
+                                <debugfs>/dynamic_debug/control
+
   // boot-args example, with newlines and comments for readability
   Kernel command line: ...
     // see whats going on in dyndbg=value processing
-- 
2.17.1

