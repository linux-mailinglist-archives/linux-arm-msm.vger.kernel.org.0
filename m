Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3F1165AEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 11:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbgBTKAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 05:00:32 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42337 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgBTKAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 05:00:32 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so1671943pfz.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7CDJ0apex4QxluZnYsaSydajm/N1xC0JoUSC9Tebgog=;
        b=VtSVDyFQk8K+na1Mx/+MuHGMnxoAbxdw194HeaR/OqncDj0USEBa1bqwVIdTAH5hGs
         at0iU5yGjvh0Qmf8lVm86hC1yqmDh1HrRjtYDKz1ohIsTZWFFL2mqkDFDnygFvBdac+b
         OMChxI3R0BPyzYrYYc5R7SLTcDHR6E3myuB5apA8I5HSBhy1lsd9HI0PSBQRobZGIhDJ
         TUVpJ8uUysemqveexZAhvglYPFSawyb/2u33e8Adr8M3scoUaJAkQdh5k2kM0zOGR5QP
         jxoYwQ2aFd9CWmTQ9J9BJo8yvHaKsOHmoLekw/ZyhhCTxg5mVxh+tcCTRWju9OUmxgcw
         XKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7CDJ0apex4QxluZnYsaSydajm/N1xC0JoUSC9Tebgog=;
        b=BswKuwR2xGsbxvRV0ZmuyQ7/q+qJN6iwQU0dPvbpm06O+tKXVhlPk9KnwBtd2EHg4H
         M+UEaOuBZsEOZVrUFdj+7/ilsREOIDl1djwKP2FOW8MVc/ms2RsqP8MoS66LNuPOleqk
         IQNEBzG+9p4VcYTB94OaSTKhjsXw0qxHpI3hUPMSr6gdXOj4Jhttde29D5BYj8bmLlcx
         rfKgf3YsUIibAyKzkLXEOczX9jog9n/2viFJhRItC3fFN4dDqXpQEdlpun4MZwsJ69V4
         esBqZDNk/z8CdF/5vvEbp5r+/yI8DggAUetg34DiouqH1CWLxyUsfz5t9tlH9YvB0ahd
         QkSA==
X-Gm-Message-State: APjAAAXaq618XS5FlGSvoF6e+2SB1RQbvw9PoElxr6l9I6SMXpm3AG9o
        S0W482BO+ETanihXk3wTe8Ew
X-Google-Smtp-Source: APXvYqwO7+EPqgn+bXaMevuAy00OhTTCUFaHYmBhbIF6zEUPkuHV+3YliwX1sR0l6LugM66VYOwndw==
X-Received: by 2002:a63:7b5a:: with SMTP id k26mr29171656pgn.406.1582192831672;
        Thu, 20 Feb 2020 02:00:31 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:315:9501:edda:4222:88ae:442f])
        by smtp.gmail.com with ESMTPSA id b3sm2678644pjo.30.2020.02.20.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 02:00:31 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v3 16/16] soc: qcom: Do not depend on ARCH_QCOM for QMI helpers
Date:   Thu, 20 Feb 2020 15:28:54 +0530
Message-Id: <20200220095854.4804-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QMI helpers are not always used by Qualcomm platforms. One of the
exceptions is the external modems available in near future. As a
side effect of removing the dependency, it is also going to loose
COMPILE_TEST build coverage.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index d0a73e76d563..80aa8b6c56e0 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -88,7 +88,6 @@ config QCOM_PM
 
 config QCOM_QMI_HELPERS
 	tristate
-	depends on ARCH_QCOM || COMPILE_TEST
 	depends on NET
 
 config QCOM_RMTFS_MEM
-- 
2.17.1

