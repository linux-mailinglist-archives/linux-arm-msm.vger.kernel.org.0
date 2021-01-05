Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEC52EA6BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 09:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbhAEIt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 03:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbhAEIt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 03:49:26 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD087C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 00:48:45 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c133so2263766wme.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=h9pO3KJbNjtBLOlj/22/l2ns9qMIkoStSdfqobGqOEo=;
        b=skBuExQ3rfLYSvofGqYugbd/iJ8xfVw9NY32iH//1IbS+XAzl3LUS3U9h9O2XsL3Jk
         O3ESxmdUqN6auITuw+riHtV5VDom2TYcGYERe7lqmyx9abTaKbkBso4CVQKgpsQQWTSt
         a8hrsVGcVSFM2zgB2UWOspli0Av0pCPhTBSc/tctUbT6YM9R5X+8abUjBoBzisBLs47H
         ofmSkLqzzLW/8vPmxJBZAmFSMrYOjwub+E53uCUGlF55QqshGzMuQxK78vqxE90WKooa
         GsKddkinIt8m3uia5OoNrnAb5Ckuv3MGWGO85/Hj6cWxwW6Pr+2cZOVt/hF0e1qsHjPW
         +thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=h9pO3KJbNjtBLOlj/22/l2ns9qMIkoStSdfqobGqOEo=;
        b=l5qqJgeCH1FFICLMpxCm8REMOjZoZn1Ij0mMNnI1W5rp2VgGgzAyP/9CAsVnvZmVQo
         PVHfqeIBvvJPEsybZAI/7k+t7wwUBHpU97xy/pd0wWeWxkM47VXPWjltBOVUsCibcYyY
         kGV8EIbaXEXMFMkvU/1LrDH84Miyab0nrXl0N53+H/8jb0l3lyOLrp2GEFFgQPwD1WDh
         ONBf4FGSinzvZhauBc1FOrC/91om5rLtiJJ+ESZhkcdlidz5rv+9hj7gdyxvRUd+Bn2+
         0civng+EADP86sWvZDVLX+pp3mimb29RLHzagMBWbvhTpYj6RNHTv5sdbQr6ixeoDps0
         CyWQ==
X-Gm-Message-State: AOAM530MNNYpyk33qGLvfFSl4Wxl3sbq+bhMnGA79MwrdqyYqOIRLqSG
        7rsO0UlQdIrAWFzr+HeADzj32g==
X-Google-Smtp-Source: ABdhPJzUj92xv3GbS6ZrlAnsgxuH+dNWzkHd6LcsCAbs8pJTjp+bDMqQyDJW6krjxPJTtM7h8FhVjA==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr2456604wmc.117.1609836524453;
        Tue, 05 Jan 2021 00:48:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:2285:e92f:1a49:4891])
        by smtp.gmail.com with ESMTPSA id q73sm3162673wme.44.2021.01.05.00.48.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 00:48:43 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] mhi: unconstify mhi_event_config
Date:   Tue,  5 Jan 2021 09:56:14 +0100
Message-Id: <1609836975-5758-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some parameters may have to be determined at runtime.
It is the case for the event ring MSI vector.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 62da830..48b1b2a 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -290,7 +290,7 @@ struct mhi_controller_config {
 	u32 num_channels;
 	const struct mhi_channel_config *ch_cfg;
 	u32 num_events;
-	const struct mhi_event_config *event_cfg;
+	struct mhi_event_config *event_cfg;
 	bool use_bounce_buf;
 	bool m2_no_db;
 };
-- 
2.7.4

