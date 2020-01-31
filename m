Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3AF114EDF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgAaNvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:51:20 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53707 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgAaNvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:51:17 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so2856239pjc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vVMDDP45gEarE2ftOW97e9LLiKh1M1ITIXoxyhoFdNU=;
        b=diJWGYEbpsbtiXdDmfNYGwEIlgVaXgkPL9C4gv2LukE/uuAlqIHy/JWsv9fS87BvQy
         4aRTS3l3bYhN+uszlO/yWEnG4k9Uu89b61jze3JH3pK0p46+2ZKcYTiSv8Oo8pd9SSXq
         tIByh3ZDXvYK9DlrN0rCXR2IrdFbBirxOWn1YNKT+ZCd4wqe3OtgV/ORtuEcuZ0wi4Tp
         dUE0SwHK3+/dv1baqE/WH4bHEpVHLa7cWDEE0snHIg4P61VowA4bvkIGPrIQge+YgVGL
         7izMQFEktr5GflPUrtbeGFwNc1pmwswm7puAiOLBaQW+n+Nq+eEUPyGxvfJF/RJKsPae
         SosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vVMDDP45gEarE2ftOW97e9LLiKh1M1ITIXoxyhoFdNU=;
        b=NjQH19OJ4lnaXVZZGs0mYjEKk0lzZ8iln8sXN3l7CP1AclE6F6+BOCLwYrLGQkAKbb
         87rchGWzP5z82sWO2ZGOxdS+GJvIRsKfUI6Ai5VupUCBrFQW+wJrSsWnHJZJ0UNquMT0
         ZrF/3Rd9WZ7OLlrL/p6gH4or0ZOqS9kuuLG84BR0RaVIZFfZQm4ZmsSlbQP4MhIUXgyB
         P7lnl3t/emi+dUomfpyioexZqivdnpYB3uPNqFqyPKoPyNjMTwoxe+pwLuaVbg4vHHuH
         eW1+sW8kYS2uo9ssBJke8YxEQxmKC/fPTwGJd6E0vVN+3fUrZc54MORx+hux8Icn0xpR
         ueBw==
X-Gm-Message-State: APjAAAXGjXJ8HEsqdB5Pq+8Lan0yfefWnC3ZzP90kMAnVykHavLuXFXU
        35OZbyns2clKYX6BpvGYJPXH
X-Google-Smtp-Source: APXvYqz/u1NsnI6hz7lxTDEFV1Ba73K2JOoIozinOTTVBHFU9EDn3x9/2F/xM4BofZ2Utu4S/5UaPw==
X-Received: by 2002:a17:902:8485:: with SMTP id c5mr10353463plo.330.1580478675836;
        Fri, 31 Jan 2020 05:51:15 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:51:15 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 16/16] soc: qcom: Do not depend on ARCH_QCOM for QMI helpers
Date:   Fri, 31 Jan 2020 19:20:09 +0530
Message-Id: <20200131135009.31477-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
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
index 79d826553ac8..ca057bc9aae6 100644
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

