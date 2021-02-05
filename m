Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1C310701
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 09:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhBEItQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 03:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhBEItG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 03:49:06 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483E3C0613D6;
        Fri,  5 Feb 2021 00:48:26 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id k193so6150814qke.6;
        Fri, 05 Feb 2021 00:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BzE1rC9+4Ob7a//CgjHcInBulG7U+bfG7YEXt1wxsHs=;
        b=l9dVTCmGoAURLhIdtpY2Il8vjJK+VKdCqHJ1EiB/wVxGZPRe7SNrjXgBqM5mG5M3/E
         H+kS2t2WupnIjZSXM3GcR0RScM0ajwjrzV7/3Qo05Ct+ISrDtDrLNZ7xWsRFnN27tanQ
         4sG9dY24InlBdr0SMSoSY+HvLid8mHrsT/JbpFWdGaTQDJ/HdTg02kJrnFfHOyYIYwQV
         iBuerbx9c+FlAhT0i5h/1t/k74d89WBnIg6+CNdpIsOYZQp63+ArUXIArv/3ls4KokSA
         vm2IKsjVGNE2nvu+T+W7EPJ5FgH/Ud5MBb+f7qIeni0jCsYLYBHxTH8vj8LYy0IY0WSC
         ygcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BzE1rC9+4Ob7a//CgjHcInBulG7U+bfG7YEXt1wxsHs=;
        b=o/HLsBAfpYVDqKOTKNAAMoCqQkFWFV4sgRqWSiFKe/fZ54SDjHrQZirmOWuDik2JKE
         9FL0CE588zWqCHiDxLfg5hwj6enn6k84mnRJ9JkSycFV7TMJu//OWIainfpyg0xQ4xWq
         Ai0ah9ndnR1BKqnVon+m4w7guufRHmn3ri9jkbLxk4Zz3C468IY+dEup5cV0B8zxOC0m
         KGnFEaEwHVE16cVo+bwThjYyhucEdbOjLc4m3F77I4dKiOIR90ExrAFN/Ht+xcjCsYWx
         S86oJ7932kI5jcqqCDj2HPAewg9llEdEKQqVw9qe3Qp3WFlJR1AadhLnHpfVwilhDa1K
         XCSA==
X-Gm-Message-State: AOAM530Qa84ZcmSkWH9N2PTPMFXayJPDhH50qYBRr9iOfl3uZWWQlCVg
        LPPE4sXAKX+VDqa+UI84JYg=
X-Google-Smtp-Source: ABdhPJwEsp2HDY6aiAZnc37qMPpbhH6YkFjIEJrGnJSSGixJ0jWz4+FKSkGEAK6X9G6aC8EfvAL/EA==
X-Received: by 2002:a37:9bca:: with SMTP id d193mr3262357qke.369.1612514905594;
        Fri, 05 Feb 2021 00:48:25 -0800 (PST)
Received: from localhost.localdomain ([156.146.36.157])
        by smtp.gmail.com with ESMTPSA id b17sm7906715qkh.57.2021.02.05.00.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:48:24 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers: gpu: drm: msn: disp: dpu1: Fixed couple of spellings in the file dpu_hw_top.h
Date:   Fri,  5 Feb 2021 14:17:58 +0530
Message-Id: <20210205084758.354509-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



s/confguration/configuration/
s/Regsiters/Registers/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 8018fff5667a..3aa10c89ca1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -30,7 +30,7 @@ struct traffic_shaper_cfg {

 /**
  * struct split_pipe_cfg - pipe configuration for dual display panels
- * @en        : Enable/disable dual pipe confguration
+ * @en        : Enable/disable dual pipe configuration
  * @mode      : Panel interface mode
  * @intf      : Interface id for main control path
  * @split_flush_en: Allows both the paths to be flushed when master path is
@@ -76,7 +76,7 @@ struct dpu_vsync_source_cfg {
  * @setup_traffic_shaper : programs traffic shaper control
  */
 struct dpu_hw_mdp_ops {
-	/** setup_split_pipe() : Regsiters are not double buffered, thisk
+	/** setup_split_pipe() : Registers are not double buffered, thisk
 	 * function should be called before timing control enable
 	 * @mdp  : mdp top context driver
 	 * @cfg  : upper and lower part of pipe configuration
--
2.30.0

