Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F64F36557
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 22:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfFEUWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 16:22:54 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41430 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfFEUWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 16:22:54 -0400
Received: by mail-qt1-f194.google.com with SMTP id s57so48284qte.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=QJQbMka1MXUwYIt/ZO5sWq6DO1jrK8MhlctrAEsYl7o=;
        b=z/jx0n6rsGTbQSFzvt5ikx9wlxvOJwDIcrBdGcbuAJ/vYaJszYqgNGBH/ysXQVLZ9V
         8Oq41zXAr8lov85dQndkojs6gARfWDm/dnN46Kzi/+47f94ktklVlvO4lfn/4dmqBz6e
         415MTiIZ57QU/NAdAz5Ty0gXI4jQN05qF/kQ0Fe8rrLAbBZTkI1695u8eh4+qjhq41j2
         5UsawJrak9nMB1MHo45kAXNfidWNFXSeTpuUu36BkKQIi3JimeYc4To6UromjR6erZsJ
         s8pVmhGSRnZazsg41G6BxAv3om6f5TdgWuHTSmOP1j93bQX9FetCg9b3PNZq4cyxclpl
         ZrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QJQbMka1MXUwYIt/ZO5sWq6DO1jrK8MhlctrAEsYl7o=;
        b=ZzzzyFiSG3ehiGb/f26TxrRfSZHjv0jwxNsR2iJKiVvhoUVE4DGKyqf7N6nFwk0/F1
         OE+eeH1+RmU61ci9veNm+s0Uu9oTVlsdt/qeEbspRKd5d4NqrLOdCECsHDBqRk+snSIy
         88ZL7/dH5+qlG0+dGdTfuU58GGc56i8JNEJZB2UrqHFyrVj+Yd2x+FKjHJdVcl1Itq/9
         JB3bnlGMRcDNboOgcIlHj2WndbMM9wblgGWbaETIHxGUTR6kVL15kOlVzECxWdbm0fsU
         6Bz9QmEsMB0N0OzDRXOpQJBZkYD7Sr9MfopKm8FKvCffwguUWdWpgOjfORlT8OU1mwYA
         Xzeg==
X-Gm-Message-State: APjAAAWk2yIi2Jm7ZDZH6v+byqH3b47PdN9RXKMPDUe/i824WNUCE0uD
        5HVDvz+yLoR/ZSANAT1pxxMZyw==
X-Google-Smtp-Source: APXvYqz/pc+6CZnS6Ffj6aSGLxLVCXIV4qPrJdrKC4gzOOijyHDtYguQjYVphUllVM9vfHQKIaUIMA==
X-Received: by 2002:aed:378a:: with SMTP id j10mr37083052qtb.6.1559766173362;
        Wed, 05 Jun 2019 13:22:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id d38sm7565318qtb.95.2019.06.05.13.22.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 13:22:52 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM VENUS VIDEO ACCELERATOR
        DRIVER),
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM VENUS VIDEO
        ACCELERATOR DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Revert "media: hfi_parser: don't trick gcc with a wrong expected size"
Date:   Wed,  5 Jun 2019 16:19:40 -0400
Message-Id: <20190605201941.4150-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit ded716267196862809e5926072adc962a611a1e3.

This change doesn't make any sense and breaks the driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 34ea503a9842..15804ad7e65d 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -569,7 +569,7 @@ struct hfi_capability {
 
 struct hfi_capabilities {
 	u32 num_capabilities;
-	struct hfi_capability *data;
+	struct hfi_capability data[1];
 };
 
 #define HFI_DEBUG_MSG_LOW	0x01
@@ -726,7 +726,7 @@ struct hfi_profile_level {
 
 struct hfi_profile_level_supported {
 	u32 profile_count;
-	struct hfi_profile_level *profile_level;
+	struct hfi_profile_level profile_level[1];
 };
 
 struct hfi_quality_vs_speed {
-- 
2.17.1

