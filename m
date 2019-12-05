Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327EA114494
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbfLEQPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:14 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:37682 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfLEQPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:14 -0500
Received: by mail-wr1-f49.google.com with SMTP id w15so4330815wru.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G+NmQUe0c+qIbje24nUgvku7Fmunjz9xZZxlYbhx3n8=;
        b=bOL+TW5mZxQmXzmHkX9fSwkNFV0qbQpXMcfExtFf8xEy1iEYs85yWLW6R+Mrh9EV1p
         RMc3E6HfMkMaxbHQPneFv6xG7zSCe1Ve6FzGotn/2zRjbhp8O7+zn0/sU7nD4tZ1Nr5S
         nxT9OmUxo/a7aDYzX0qvBTfhp3SbpSSlzfc0SZUpra/0Z1+I8JqHBJeAXix/QDI9fC99
         PeuuCz/GbjBU/7oX0Cyt33NaFtSXsbfrtA/zJqrVZvk/7qWf0WDxM7ZPnids37HtzBWQ
         Liytzg3bwljUe8m5rdrvhBq76xaCiZ/9ArvflO/1JCF7x0rCKM23TDGviZYdB44xFh5X
         lLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G+NmQUe0c+qIbje24nUgvku7Fmunjz9xZZxlYbhx3n8=;
        b=nAxwWEqRL1lxb8/cRvWnIJNEJ4sSy8EfHAB074Lsy6AALByY1DLr1JJOcQW3nSt7Dv
         eXYCzuQrqdDXw7ucjSJig78sO3lMO8QyHs7zAy4Zeip97hX+c15+rY42myCMc+9PeEj7
         +zTZTAgFN3GS9Hztp6+pLlg+WcQoVgntv5t6lqvRPpgYib6MTZtKdgYJQzfjUDuveXYf
         ILhE82505kMyy2FLarGNmdtozCGT/zzS2farvR1NXOR04VFkuvkkghxbaZGsCIn22Ds1
         M0arGU7ipuGpcZcMxYTXKmOFQE0Dx1hhYEGWFCndtH0Wmj0FicxJGR2k9RrLgQVWUC/2
         rrPw==
X-Gm-Message-State: APjAAAVW+ni99rpI2LxYj+INNGXDt63IaPUYaXMP66g/8agw7ZYU0EAQ
        +9gdgobiHQYw/7j3IPk74ww=
X-Google-Smtp-Source: APXvYqzyKkg//0SPWNEm/nKvEpNzi1ibVSy1ePcpQh8H5MDHl06J93/QIICHP8lLjUYAwwMs0OX1xQ==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr10644583wrn.245.1575562512471;
        Thu, 05 Dec 2019 08:15:12 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id h2sm13235208wrt.45.2019.12.05.08.15.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:11 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/6] arm64: defconfig: PHY_QCOM_UFS=y
Date:   Thu,  5 Dec 2019 17:15:04 +0100
Message-Id: <20191205161505.15295-6-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-1-p.pisati@gmail.com>
References: <20191205161505.15295-1-p.pisati@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 560cb54..2c91d75 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -859,3 +859,4 @@ CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_MEMTEST=y
+CONFIG_PHY_QCOM_UFS=y
-- 
2.7.4

