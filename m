Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E192342111
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhCSPhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhCSPhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:37:14 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06745C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:37:13 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id a11so7019179qto.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQ1ckpIxzyK43V/bt1ZmIWePw7DKixuOTINODiwH4kw=;
        b=m14l6wiu+fXwfLllo0iU2RvWRZQ5bXXhrrLKC3wrfszJv/m8GYBpl4TbXgw5UGiKfm
         /pCr6GKlmulJz5eZGSxMmx5/boZ1ZEsUeXc/bVJ535dXZxjhIAj5zkMPcd2jtrnpf1wb
         FoN08eT7J5LEyUex9ZOHi4Vp64CpxXpCjCD/iOggZxRvp+bwiOVKdjp1elluZ00jP/rc
         hJh7n5INvB9+XsGaUDaTluqerL+v0WhWCVZDsJZM8BJskQd297GmQWTUF15wwDPua3LE
         eW+MfXmDgSYpoVi6XTrStFLFhKby4NCNbH2FvVLluO3mfEorX1jv7/ey0MHRzjOhGKRk
         mClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dQ1ckpIxzyK43V/bt1ZmIWePw7DKixuOTINODiwH4kw=;
        b=owY1+LOjtLyk9ZUncJxxbeGk6ZuI28gz1QMfgatN/UZRys9RYRD6gVX23ZP2guJXW4
         mfhFGkCvzVaPh3FwDUBHiDVSa9M6t02l6N/dk8aQBtH0uu71tqZXGa1sY1PPK63DXZDp
         pUO6jgy6/oq/THLv6XTA+aqa+85tyLDIXW0k/E/ydwKJ/wlDOa1nN3hWJU8/z9jXFipD
         WlF3iIm9Q3SnivG6h1xF8RDWyt7LRKw6XMeGE5TrPXKRWJ4HVdSvjOgRvEDvSCek3tjS
         oJkEal5x3Zgl3Cs/PpsobdhEYRjV9XMR31bkVi10RITM96mJdp/TEInvY0fZTa5FwonW
         OxzQ==
X-Gm-Message-State: AOAM533bR78ot1c8fnUFRIMnN2gjCZqR/684CWdhEvTt44tLlmnXXDCg
        ugjGUIuFFXlRRlchAGvJlef5ow==
X-Google-Smtp-Source: ABdhPJzkFeGmfUoPoXTTj2XkmHXy4A0QGvHxvX86PEAudoYeltGWlEI0qTYWYFa+6SGDGdDqh5mIGg==
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr8485912qtv.299.1616168232867;
        Fri, 19 Mar 2021 08:37:12 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id m25sm3990790qtq.59.2021.03.19.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 08:37:12 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     daniel.lezcano@linaro.org, amitk@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add co-maintainer for Qualcomm tsens thermal drivers
Date:   Fri, 19 Mar 2021 11:37:11 -0400
Message-Id: <20210319153711.2836652-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add myself as the maintainer for Qualcomm tsens drivers so that I
can help Daniel by taking care of/reviewing changes to these drivers.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa84121c5611..ab66ab9a628e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14892,6 +14892,7 @@ F:	include/linux/if_rmnet.h
 
 QUALCOMM TSENS THERMAL DRIVER
 M:	Amit Kucheria <amitk@kernel.org>
+M:	Thara Gopinath <thara.gopinath@linaro.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1

