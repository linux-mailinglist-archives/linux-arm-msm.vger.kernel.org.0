Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9152B1B515B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 02:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgDWAiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 20:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726379AbgDWAiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 20:38:13 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B7FC03C1AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:13 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t4so1625172plq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mr8P1LPs1Vjaksgvzxuq3twAg9ab3cN0vSb3pRYBwK8=;
        b=cg/TNIrILEIS1kusnDCvuL2dKp0dhvJxkUjtKRVYGfAXnktmVuItclINzic5egdxPi
         qpUcOoItZ00rFBCxVvYNt6ZnlnDryY815JUeGVD+4fSvl2EBJF7E3eS7fa75yo2KGXJ+
         bXvsPF/gDxbCUI9T5Q0/tc4FgNBhbXV+4EeRG/RhHjN9jMWzuSeuQSGv6mw3mWBZHtKF
         ncqUpE+CoslVdFHP7cukhfZUS2RVbEjq8JpXzBFJI3mzQ8o4UX4OGLtTcO/WwIGnPqTV
         tYwnQt4gceY7rIAuvBaOPqis8kgKCIMASqew6c3oKsaCcLyQTFp+eVlxSSIRpmQwxmZS
         hPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mr8P1LPs1Vjaksgvzxuq3twAg9ab3cN0vSb3pRYBwK8=;
        b=QJTkgucgRqJ83X4u6m1RUdqVG8yW8En722pYQjRWwbKPVDLXL3hTwuAg48xbDRaplH
         Ez6iYp8aw03U8hvzPKbTEjHlv8pFIqUy2G5ww2sgwK0iRg02Zp5SIdbS7/k0+64cPLP8
         g2PgI3lf2vL6XJDmwWzpT74TxVXwpgrgkXy7G2hLV+JaI7WA0j8GTKG69L+uaOhODmjG
         oP7BHnmwDBocaBSZQ6j1umNcWIM2IKKWpJlEY0kh4okxW5lRoD3Zk5uj+aL/rFZAtUu1
         IoIB9mvQWFy3Tck1vWlzVdfm57s1ncEzI3p82WF/WvbYpK0feOp5JtFjwRRMaY0SHLXp
         wncA==
X-Gm-Message-State: AGi0PubS6MV8nCwrbIXkW8eoptz2wugyWu88FNmKIm20qxdyumoNEhAf
        jXJXPPferIqTr+xZzS6TvJcCvw==
X-Google-Smtp-Source: APiQypJkHjUHw/lHehFz0pmGelhKZYWp3m+WQonWrCq6yl5HRJZCQmYMsvTVSLGsxacPZXkFvJGZDg==
X-Received: by 2002:a17:90a:17ed:: with SMTP id q100mr1524109pja.80.1587602292780;
        Wed, 22 Apr 2020 17:38:12 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm432225pgz.0.2020.04.22.17.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:38:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 4/4] arm64: defconfig: Remove QCOM_GLINK_SSR
Date:   Wed, 22 Apr 2020 17:37:36 -0700
Message-Id: <20200423003736.2027371-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the QCOM_GLINK_SSR option from the arm64 defconfig, as the module
is assimilated by QCOM_GLINK - which is selected by other means.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f9eefb5940ca..f26a0b6ea0e8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -838,7 +838,6 @@ CONFIG_FSL_MC_DPIO=y
 CONFIG_IMX_SCU_SOC=y
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_GLINK_SSR=m
 CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_RPMHPD=y
-- 
2.24.0

