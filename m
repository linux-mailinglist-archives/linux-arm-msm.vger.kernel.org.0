Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F3533FF89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 07:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhCRG1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 02:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhCRG1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 02:27:14 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9951DC06174A;
        Wed, 17 Mar 2021 23:27:14 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id x27so2687087qvd.2;
        Wed, 17 Mar 2021 23:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNT32jP7JgS237wrtS8YnRoKTooTz5SRowW1DWksDxM=;
        b=OvJV+tg9cEFf0tEjIixqrWyXv9B3ROsCHelq8dmjgbAQDe4cF0R/AWxEcQx9GbnzfU
         +WBzPtzfNN08nteo4nR9Qb8IgAB/Vbp42NCB/auQt3XGIquVkWimOcf7fdEFswB+Qk5L
         TSODw3mSqf33LC8kvG1XibPB/lhRSvFbmmdbecB7ddl+A90kf6nA8vYvVOPMylL6D+0d
         auQ+XydzUUPDl6qlz4KSyRppzDPHFDmm1Zga6462akRlIogecqu69oAJC5FBzySSxt8g
         LC8UXfjdcMuNofVvxN/9yXHFRBvMxSzOBkaPQlR9f60l3S8MoBMGHccFgDPfSAkS+GJH
         I24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LNT32jP7JgS237wrtS8YnRoKTooTz5SRowW1DWksDxM=;
        b=FnZQAW5nlyfqMSaN+4B8BhnYjviRFr1FEeVwYoeIYeOoR3PyIDILF1jf8YnnZWq/aV
         bG4t6oJB+WUICRtd73kWp9HYjozcj8ONKH7wmjFBDDQ2rN/xYClbP0usBGinMTLf+ogB
         l4np/qQmbwvfZ5vBKRJ8ZnkHwpP2kLfq7XP9GovzVdPvGQ6Ashgv3RSwdS2nY4bajnsx
         RycYK7ibXIgULLJBC0qKKo0KSf5Qd8fWfXIS4QHSiD1kAE2ksTRYRWNB1Cc1g64vjuCD
         E71NF5AMG7aBfQJnjD4HENjp3nLJKh5IEAnb0pq1mFh2yfBDqDFcaXVIU0/8F1NZgQ9h
         Sjiw==
X-Gm-Message-State: AOAM5327uVcajoh5LUAAGjknCX20E2fkzcpLQ/4Myb1Km7zdw3ycCCSz
        WTyaIESEHK5dmVI9ZLu9HJ4=
X-Google-Smtp-Source: ABdhPJxXtydecwAhlh8IEYYSOjOAHHi0Mx6IE05vvj2WBXSc8tIQDKtpj8c4E8Ww4Ldziy9qf/+iyA==
X-Received: by 2002:a05:6214:18e5:: with SMTP id ep5mr2959617qvb.32.1616048833952;
        Wed, 17 Mar 2021 23:27:13 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.26])
        by smtp.gmail.com with ESMTPSA id 124sm1050782qke.107.2021.03.17.23.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:27:13 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, khsieh@codeaurora.org, tanmay@codeaurora.org,
        chandanu@codeaurora.org, swboyd@chromium.org,
        unixbhaskar@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] drm/msm/dp: Fixed couple of typos
Date:   Thu, 18 Mar 2021 11:56:50 +0530
Message-Id: <20210318062650.19886-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

s/modueles/modules/ ....two different places

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_power.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 7d0327bbc0d5..e3f959ffae12 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -88,7 +88,7 @@ int dp_power_client_init(struct dp_power *power);
  * return: 0 for success, error for failure.
  *
  * This API will de-initialize the DisplayPort's clocks and regulator
- * modueles.
+ * modules.
  */
 void dp_power_client_deinit(struct dp_power *power);

@@ -100,7 +100,7 @@ void dp_power_client_deinit(struct dp_power *power);
  *
  * This API will configure the DisplayPort's power module and provides
  * methods to be called by the client to configure the power related
- * modueles.
+ * modules.
  */
 struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);

--
2.20.1

