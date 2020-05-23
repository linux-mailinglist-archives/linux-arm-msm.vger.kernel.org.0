Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8636E1DF486
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2020 06:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387600AbgEWEKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 00:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgEWEKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 00:10:19 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC17C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 21:10:19 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id a23so10045393qto.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQRdlWeBFwW72SP5g/vtRanTpJEntmyERJEmpRIOS+U=;
        b=2UK8WjskI9kR3d3Yd3Xf0+JoSkzInKHntBynwegfLlXiIHBwQobw2szryEAyvj43jS
         TxOlTFMGWYk5AsV5diEf6P857m47Zs+fWZRhAyYqprtRbdfzIbbfDcWiuVxeBEeuTGgY
         YraepTvs+5kbMkGLpnkxPzqFjg0hqjvk/C1fXMXi2ZDcQnFh3c30ZWOyDgD83gReiynW
         WAAJTBp4874+smcHo1+E+/3MPEbH+opaoGYNg0IdC9xQEVdeofpnuDu8N5fpvnU3Q0AF
         ODivAhPXAiyy9A33GhsmPxaCcBH498MlcmuwrTUYGq7PvHKPES5I68wR9i261RlG6lP2
         cLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQRdlWeBFwW72SP5g/vtRanTpJEntmyERJEmpRIOS+U=;
        b=RwDTwddbGIVAMqGVfU/c0FNOs+WLJsA4DmlQurzwE8q44dQ6iI0VdxHpByZh2yVg4V
         kz96v6UbIpojIWZl+h8arOB14jDlDZZzKRXZ4gb94VnPXCq7UJJKWAmlggDcTrhdrlPb
         hLirC+gtXuccE7ZoWpIKr+vdflMcHJQEMpAQ4Ujkei3doyk9NOSR6LDjQqml47XeWSWa
         ugeIZbYUShwTT+UVqaz0F51FdfDStTZUzJUcHaRwcZwA/ubedv3CJYsHYBZgrSEdCxnW
         z571IlbdnyJFWe7I5JGQJvDPluN+9FAn0wuJ5xGOzB1hpUv2aQJCJzwz6E6YkYbNXqkH
         2vjQ==
X-Gm-Message-State: AOAM532sxAG3BR+edoZuNLRMhC8dmQljgXqvgrAA0k6YHsUQUWoEMVxa
        W+rC4M4zGmYtdyUBA9hfM/H4DZxGySg=
X-Google-Smtp-Source: ABdhPJyc9SpWKGei/BBZrhSmxes65VLODl8xKcISTm3+l4/KHO2KPyL5MVOuWiE5nTaUgboE2AH6OA==
X-Received: by 2002:ac8:4d02:: with SMTP id w2mr18743140qtv.170.1590207018696;
        Fri, 22 May 2020 21:10:18 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n85sm6219467qkn.31.2020.05.22.21.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 21:10:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: qcom: sm8250 gcc depends on QCOM_GDSC
Date:   Sat, 23 May 2020 00:09:47 -0400
Message-Id: <20200523040947.31946-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver will always fail to probe without QCOM_GDSC, so select it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 5df110be52c1..59dc0bdafad4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -378,6 +378,7 @@ config SM_GCC_8150
 
 config SM_GCC_8250
 	tristate "SM8250 Global Clock Controller"
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM8250 devices.
 	  Say Y if you want to use peripheral devices such as UART,
-- 
2.26.1

