Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C5B348EAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhCYLMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCYLLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF17C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b14so1902373lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=jtseuONb9QFK3RlyU9bxTU25y2S9tzvUWMk6sEmJ+6y2MP+UDkYn4AxEhHlqyM9xko
         BvkwVSDwBRof9OZR/ROGGnSM12wFsfUxlfcI2kwK8eRtiz+CA2TCT6j6Zr/EpFsLe/7E
         vCGgnI08ilMXuQV+XuiUfHgeS87zLiaWk+us3QrQlMwYEFWs4ZfLVYyKQFNBme1LvYJc
         9NxcxVWtbJaj47DESnTdQOgfmUVJ4i65OixHz0Ly8k5J/qzsY0RKbjy1MPWv2fs3N9VF
         oWilh0vad5HIu/kitv3/LCJKjfGbKMSP18nmJinVL9t1WnMLQlWhkBK6kjS0kmWpAwQ6
         uohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=XHbpIOcvQHt/7HDdw77oXNP6jL9Mto0BY322wXSSa/+b7pwXU/kx3KDhhpbn/D1jTz
         WdnPlsVqhFXUHZ0lttXwBeuNxoQzNSOPgjKoqoLKkfTj9g9TXXr8eMl9tFVmNnZXjGGR
         pFZPHEbzh74g770fB0wt5kMER/1KHAcLkf2v9mjBrV8/H5JUOLALsRbAXYOvPz0paw8q
         RVKukoYJFCb8YYCI2+spoBPWaDdkDFkyxgCsumjLBAekQZjWA9ZN8sxrdY+wyIqqhLGj
         3kUmZoyL7kzSlrX1tkvOKz71YyRd7DaseC0mRosIDk3+t5l6CFyfnEUF3a0VFIIxickw
         DRBw==
X-Gm-Message-State: AOAM5332pk1/+A2V4o5L+AKTCZRajrbTwAhbSIN3QYqHfsYHxTf3apX+
        hT9ZTvFp6aaBHpach4tkjxQj0w==
X-Google-Smtp-Source: ABdhPJwC4SUa7MA1gu7EPCykjjAuH890xuFSk8HvGIrmFw6MMRTxhOPlda6jst48IlBmcrFi2ebB8Q==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr4914650lfn.126.1616670713126;
        Thu, 25 Mar 2021 04:11:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 08/15] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:37 +0300
Message-Id: <20210325111144.2852594-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

