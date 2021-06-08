Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1703A0722
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 00:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235327AbhFHWkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 18:40:52 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:45876 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235308AbhFHWku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 18:40:50 -0400
Received: by mail-qk1-f174.google.com with SMTP id d196so16778896qkg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gf/gvBlQFNmF6oryMbQ5ty+xg+wHb4DfA+pnrBCpmI0=;
        b=bgUpMFATARs0MGDJlV4pjkgb2I+9leyfC4Rh115OkfVq28I/PjhvyolCbunoiQenwf
         Yuk1VkJgTe+3DOkwB61ds9ouMszSiXS/v5yFQTzap0yk2MUMyWtaWgpRHSme0uxhEXuN
         zLVvOIxDc9nsSsfrY74rBaviDAjb+oCNgJe1JJWxHrb2pO3zseMhlHWiUPPvU9t/Je1r
         rA4zfCs0qBMzYYsRYSGIYom8jBzRQb/9zHE1mEtOzYLw9UAxOmdHbbXHVHAhKyRLhB89
         jRpX9rMHVjoXbKlAYYgi5tdJVvEhNTPXhB/JQHTx03pwqBDg4ENEIIi/wfznaAKjOLjD
         ddWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gf/gvBlQFNmF6oryMbQ5ty+xg+wHb4DfA+pnrBCpmI0=;
        b=Z13vsgRTz7FwaRAt/Pce2VzIdkI5ItORHDBIoeOIo73D6wtMKv+HrYYov0r8dPaqhp
         /bwDxcBGSwT+xfqVQacpo0Bfhl7AoUV7W37Eo2MWXSgpc+RskaZYNJ2dYGwA0VbzA61V
         4c/VTUIK+FMY2FU4m1gF3rwMl7raDZP4b3w5DTZK99pANM+VVNDHgDNaVHopV4DXNsPy
         n6IMBwBKnBzf/9e9D8JD54j5bokDu8H0fNysCQugj+kAxiTVSlQVm9AQaKv6CHmYFnfA
         ZfBOn+wgD8Qb8wYmJVjE86H/hL05FwuHRAWeiApx7Oi7P0Yy1/n+HVHpfN4rBO/VdeHi
         jUww==
X-Gm-Message-State: AOAM532zK6MrgsvuMyZF9B2+lt/vLAoFJCal8YOgU6zO6TUheM3ALcNu
        fcnoppLVgy2qne/nL+Qo0zZvtMsyC4dO238p6E/NRw==
X-Google-Smtp-Source: ABdhPJyC9ZSw2t5AZbmqjpUqqDY6xU9LVKgYYdzdX+EAhI0Az0u240Xf0vjJ1u8u4uhESNaUEW0L7g==
X-Received: by 2002:a37:5646:: with SMTP id k67mr4860749qkb.333.1623191864144;
        Tue, 08 Jun 2021 15:37:44 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:43 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/17] media: camss: csiphy-3ph: don't print HW version as an error
Date:   Tue,  8 Jun 2021 18:34:50 -0400
Message-Id: <20210608223513.23193-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Avoid unnecessary noise in normal usage (it prints every time CSIPHY is
powered on).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e318c822ab04c..5948abdcd2206 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -163,7 +163,7 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	hw_version |= readl_relaxed(csiphy->base +
 				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(15)) << 24;
 
-	dev_err(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
+	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
 
 /*
-- 
2.26.1

