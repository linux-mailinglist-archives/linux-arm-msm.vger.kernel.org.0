Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B791440C78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Oct 2021 03:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhJaCJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Oct 2021 22:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhJaCJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Oct 2021 22:09:59 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF13FC061570
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Oct 2021 19:07:28 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x66so12972396pfx.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Oct 2021 19:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FZws8a0NnRSfwKNA4DrXN6xO9IuC3RkTXLzHBaK74pk=;
        b=eDNKkWqtGF0RWMlK58QTj864wOzXAzCXSKL9KtcgTbTd2gMCLI98kC8pPmwD7DFf4/
         12qDdcW8DLjQfaztzlMBd5DRJMtX0YQi/zHDaIQDbDe0W+0dcxEUoF//deFOVdJiulgV
         iGIYyE7GmyEO0u9tHxUP62iczBXLTFdXdQyv3H3FClkFZpvF/8wRXlQpO5Avn0a+ka63
         ajIE6i2e5fhS40igGpxanW//H+xW5ypoLCqdzPzMtjVP3kKCw0XQS2fr6OohH1G7LIh4
         thv1nwuc0Lci5Suv97vvmPAo+fFm1M+q02nz48v49YwwFVqfRZ+L8WKpqxFAJQFyZQnJ
         YeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FZws8a0NnRSfwKNA4DrXN6xO9IuC3RkTXLzHBaK74pk=;
        b=rYNIrDHfWAW7FSuQDDhfL4YjcEqPpPSUrqDS78Y2HQAK4WyqCwjbgQSJ6jeQPGK0Zx
         s5cv2izXnzDSEvRnYOQ/I7xH7dDAIY1eTXnBRKocuFUUpzRIaCd/amAhI7URspXzES5z
         GrDBii2azh8zKdpvHFdlR3xQaUzdX+FukDnDvxk17TWekQB3Nr9Dzdog7CATfJCKLlcZ
         lbooAs404HtQua17DuQIIKmvLp4xdiiBRSHT6Zd0OmCQiA75qky72A7YLWEW9zyOeXT0
         cXWoX6Cp/YYWY76M/rf4iqyNvl89285/mz5M/tZozyT5rMnK91dSaFM2BvknlUDAtN9c
         j4Mg==
X-Gm-Message-State: AOAM5309Ii5tYGs1pqph1Y08tTANp4M55WJ5en6IGtAc52og5HGI7YuB
        +sQbe0s2MKdTXMGepchFWMg28A==
X-Google-Smtp-Source: ABdhPJxZRsL6oy18FF58BzLeRINGjp4Deyiv1s1R/0ulZXTTdGGk268zD341ubKIUG9CWFVgkQWqtw==
X-Received: by 2002:a65:6a54:: with SMTP id o20mr62852pgu.227.1635646048199;
        Sat, 30 Oct 2021 19:07:28 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p9sm10748986pfn.7.2021.10.30.19.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 19:07:27 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] A few smd-rpm clock driver cleanups
Date:   Sun, 31 Oct 2021 10:07:12 +0800
Message-Id: <20211031020715.21636-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here are a few smd-rpm clock driver cleanups found in the code
inspection.

Shawn Guo (3):
  clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
  clk: qcom: smd-rpm: Drop the use of struct rpm_cc
  clk: qcom: smd-rpm: Drop binary value handling for buffered clock

 drivers/clk/qcom/clk-smd-rpm.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

-- 
2.17.1

