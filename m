Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B50358031
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 12:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhDHKEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 06:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbhDHKEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 06:04:08 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D123C061760;
        Thu,  8 Apr 2021 03:03:56 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o18so850435pjs.4;
        Thu, 08 Apr 2021 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9WWuGMK6QWrKXmXCP0SJOggiKZrKlD00bLprLvU14GE=;
        b=vKW15wE9wpb4Z4bqsxton7Cza20S3Ase+arqh19br/rlVZ9B+NTmAWcP/+0ObMoSAx
         e+RYD5FJBtrFcBYxKGSGpEPMpL3DKksc9AhdKETk7wRVntx/HSQqHH9hEwK+zCJy9ljU
         dxwNsWf8HrR+SU4LmPwkdvTrvk6KPHfh3/xZlfobH9ZigGssRGJ0I6Odjmb5XOmP9owD
         dME7EZYhWdadaFaxjwBOn+kLntcLU4BBJdI9zxAbkn9zHw13OiQ6nPIC6qZuUikqqxod
         NKMAtuG9+1ztSXoQQ+Eb1IRyDxKR1gBIETthNaFUA2Cz/egzgooEpWP8Mr5Kyu0Unj7q
         taNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9WWuGMK6QWrKXmXCP0SJOggiKZrKlD00bLprLvU14GE=;
        b=ZrKCI65D6Ct0H+YJXOXRTLGUZuD0cjmPdsBR5+TewwvtaAABpYqysJGVaJa5/ODjTt
         rULDLuN6OUdeufIluBcp6shd0LdJE0qvHVstNIQ9yKO8X6hhkyLUk1Gnnp+5dQXfHO9C
         gX9nyE4H2j6GyVNO7SyrLrWh6W7j8FiimssM6yFXaC/LlYMnXqzALNXM65WuwzcHexic
         FwjFZB6pE7vvYSCJv7pPxzmg3eIJy5nlkdrgol6jdI7/DW5Yq8oxR7C4RZOZIZx22DD0
         +sCORr5AE3MoSPrrGCkKb3uhnZr9KrZgmu1IYSBOj8q+GZfNd+dUTsK7TfSwW6y5zMF2
         EYhw==
X-Gm-Message-State: AOAM532UvxySx32AtO0iQMyGhUM5Nxnly1LzjpE2QNwviPCroN9ZxQoa
        mx8EpcWCf9tNHij5saM0cV0=
X-Google-Smtp-Source: ABdhPJyrsGUH7YD251DR30sQ9sv8dA4OY0qgSuHp5OBcCAb0zLNiP9Q664IMSu6A2jSvqA5CQHSO9w==
X-Received: by 2002:a17:90a:4309:: with SMTP id q9mr7327135pjg.40.1617876235950;
        Thu, 08 Apr 2021 03:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2.58.242.54])
        by smtp.gmail.com with ESMTPSA id p10sm1555230pfn.109.2021.04.08.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:03:55 -0700 (PDT)
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com,
        Jarvis Jiang <jarvis.w.jiang@gmail.com>
Subject: [PATCH 2/2] bus: mhi: fix typo in comments for struct mhi_channel_config
Date:   Thu,  8 Apr 2021 03:02:20 -0700
Message-Id: <20210408100220.3853-1-jarvis.w.jiang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The word 'rung' is a typo in below comment, fix it.
* @event_ring: The event rung index that services this channel

Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d095fba37d1e..944aa3aa3035 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -205,7 +205,7 @@ enum mhi_db_brst_mode {
  * @num: The number assigned to this channel
  * @num_elements: The number of elements that can be queued to this channel
  * @local_elements: The local ring length of the channel
- * @event_ring: The event rung index that services this channel
+ * @event_ring: The event ring index that services this channel
  * @dir: Direction that data may flow on this channel
  * @type: Channel type
  * @ee_mask: Execution Environment mask for this channel
-- 
2.25.1

