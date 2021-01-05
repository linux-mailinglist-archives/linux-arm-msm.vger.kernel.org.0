Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B072EB691
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 00:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbhAEX4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 18:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbhAEX4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 18:56:53 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41198C06179E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 15:56:06 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id q5so1426203ilc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 15:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zC1K9HT6QN2ehRxAnmxur1sKN3lHvBdwnEoZbLeAquU=;
        b=cqjAnSYnENX5ERg+DqsuwA89OKXd3JYILriBzg9c/vBQYcUXwOKtxA50oGH73NZBRc
         2b1dUlqhMPmzLcfzNwsU1c7XYIwlmZ0/JQdJqQZJIbl5Dhcr7dITxAExlHf83hrVh4R6
         gz3Ws9dVyiSGabvZ29Rnpac0tn6zf5pxkZYa+S2z0GRsCXt6YvgSl5QZuo+fAAkilCNQ
         rMivHUPLk5yqV53PpawDTFMea3LUNaaVbw4qARkqtAHjWyDz2A488J9/SDWjMbBBEp8f
         cwN32aSkxdIqly1CXOclOVeB2qcJr/CmioAxs75DDpk8izmMibcqpwImtx8IQI5PNYZd
         Kc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zC1K9HT6QN2ehRxAnmxur1sKN3lHvBdwnEoZbLeAquU=;
        b=bQNmWaiOBhkl3PYdzV8ify23LFpeZCavUH/jSnz4FeqU0pLAzfBWOYEbc9QLBvu02l
         ijB8VCWvz7hAeIOLVQQHo1IG9QWI61aB9JXYYEjAEcTYn5BJaiyresYt2ltkk2dIOOfC
         gjmCtS0RLf7DxAG6OCOMpaCh1R+QXwMKaFqXFxzUpkVLKOXe6JREyn55T1JecVvNu1hj
         Es2LAg4SKXdxz31pasel3g+NNbst3dltxlCnYag0uxq/HEthLZM9gS7jmWvLSFu1TZpJ
         hSCwqESLE40i5YzjVq/hJGKHI5vXu4YXoqWvysNcDE9bV1TcnRwJP3DRoVBZb7PZJdhT
         5jSQ==
X-Gm-Message-State: AOAM531Cjf39a8OuRDQ/Y6jPR05G33AVgRion/GpFa3E2Te+JEgwCGgC
        g2wf97yMt0icUHZsJEwyV3lJKg==
X-Google-Smtp-Source: ABdhPJxY10byWvvKPUjmD2YnqJmZrfCbcnQO9DqeyTWZ6xLXVXsi1iJ+5UBTeXrEvIMS/9iTb/e0HQ==
X-Received: by 2002:a05:6e02:60f:: with SMTP id t15mr2004518ils.250.1609890965620;
        Tue, 05 Jan 2021 15:56:05 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id l4sm509077ilo.29.2021.01.05.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 15:56:05 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: glink: fix some kerneldoc comments
Date:   Tue,  5 Jan 2021 17:56:03 -0600
Message-Id: <20210105235603.32663-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The kerneldoc comments for the do_cleanup_msg and cleanup_done_msg
structures describe the fields, but don't prefix the field names
with "@".  Add those, to get rid of some W=1 build warnings on
an x86_64 architecture build.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/rpmsg/qcom_glink_ssr.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
index dcd1ce6169747..1fc2bf5354f50 100644
--- a/drivers/rpmsg/qcom_glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -12,11 +12,11 @@
 
 /**
  * struct do_cleanup_msg - The data structure for an SSR do_cleanup message
- * version:     The G-Link SSR protocol version
- * command:     The G-Link SSR command - do_cleanup
- * seq_num:     Sequence number
- * name_len:    Length of the name of the subsystem being restarted
- * name:        G-Link edge name of the subsystem being restarted
+ * @version:	The G-Link SSR protocol version
+ * @command:	The G-Link SSR command - do_cleanup
+ * @seq_num:	Sequence number
+ * @name_len:	Length of the name of the subsystem being restarted
+ * @name:	G-Link edge name of the subsystem being restarted
  */
 struct do_cleanup_msg {
 	__le32 version;
@@ -28,9 +28,9 @@ struct do_cleanup_msg {
 
 /**
  * struct cleanup_done_msg - The data structure for an SSR cleanup_done message
- * version:     The G-Link SSR protocol version
- * response:    The G-Link SSR response to a do_cleanup command, cleanup_done
- * seq_num:     Sequence number
+ * @version:	The G-Link SSR protocol version
+ * @response:	The G-Link SSR response to a do_cleanup command, cleanup_done
+ * @seq_num:	Sequence number
  */
 struct cleanup_done_msg {
 	__le32 version;
-- 
2.20.1

