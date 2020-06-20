Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F893201FB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 04:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbgFTCWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 22:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730293AbgFTCWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 22:22:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD30CC06174E
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:22:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d6so5208827pjs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ILpDZ3g9RyhdCAmxH0qmTrsO+2Jv0SpzLTozx8GBn9c=;
        b=OHvft9pwOa/GYAdCFYxEz/NDExYtwokXsA2ThVXvvC3L2llsk0L4ygM7PglBrxfIlE
         riFeZNNFAFupw6qQDwIIFWO6oPyZGY/dkGSLo3f4KkqWwjn+WiMhqJ/jiUH/CDtHPtdW
         n4IKkbw8AENTUmfEVOtroQunniMAyN5lsqy9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ILpDZ3g9RyhdCAmxH0qmTrsO+2Jv0SpzLTozx8GBn9c=;
        b=QyQbYai8SfPv/6hTXQIe8jB89cozi6BUkWJX3AIM3oRAOEiT1rMyaw9wHpoeXcy0Nt
         4xlwDoBrV4wIuau+eHIQnUDqSxSiHWhySgvwePbUUgBgYpirVKVWog0NHPG+PirYhYKP
         PXc0epKfuVHdSfDK8QGpIhfrjVpdWba8u0jXTkxcZZLbh1lw5edfBvl9ZlU4Y5LAn1Mn
         p8wYap1OKs6Ft8JQSfRlGCKUPcGERTiXfzGz61Oa/RoCT2EhkMCwwcMxFKos07okBnV9
         3jxPQjnYcZVGcj3rqxiiHW1iKSEep4wz3xAaPTqX848qgINRzOZeTOcaMZN69j6WYrC1
         T8Zw==
X-Gm-Message-State: AOAM5319qTtvSGcbtsro/gZu8/3AeI1BdZJvYPCNAR+o7w/rN/hCIKXR
        6OJU1VY9gPOzXS80w4Y+QoxXjw==
X-Google-Smtp-Source: ABdhPJya2OjomlPpqTqbnSJht2OJvzEboztD2rUElEBmRBsqZobnQJMGxhW2DXb5CZF39tXbToWriw==
X-Received: by 2002:a17:90a:c717:: with SMTP id o23mr6365885pjt.195.1592619755094;
        Fri, 19 Jun 2020 19:22:35 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m14sm6241911pjv.12.2020.06.19.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 19:22:34 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 0/2] Some small spi geni cleanups
Date:   Fri, 19 Jun 2020 19:22:31 -0700
Message-Id: <20200620022233.64716-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To follow onto Doug's latest spi geni series[1] this simplifies and
reduces the code a little more.

[1] https://lore.kernel.org/r/20200618150626.237027-1-dianders@chromium.org

Stephen Boyd (2):
  spi: spi-geni-qcom: Simplify setup_fifo_xfer()
  spi: spi-geni-qcom: Don't set {tx,rx}_rem_bytes unnecessarily

 drivers/spi/spi-geni-qcom.c | 55 +++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 30 deletions(-)


base-commit: 7ba9bdcb91f694b0eaf486a825afd9c2d99532b7
-- 
Sent by a computer, using git, on the internet

