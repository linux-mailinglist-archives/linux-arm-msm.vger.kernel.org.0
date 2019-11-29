Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF7510DB36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 22:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387418AbfK2Vjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 16:39:46 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41139 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387435AbfK2Vjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 16:39:45 -0500
Received: by mail-lf1-f66.google.com with SMTP id m30so21708111lfp.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2019 13:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0VIY072ZJlZj4z1mcJleK9agtZhmef7Eqj9dCGXoaPE=;
        b=kJAnMVeuP8snQfAobCu21qO8VB0dZHBZDPwF5pdzuZliCBWBT+7/r1Tw/t58TzPqwM
         1aa98YIogWyt2+iNcVZbXaWIIupi/Pmt+Xr0fC62sXUhkXmgmY+8c4ZreiPAW/TeXWoG
         8IzwcuIIpzDlF/3ad4TGLYYP9iY76EKv+fWvPb16UmLjI49qPVaj9BXZd+wPztIYrL90
         JYW25jtOhjy2gqXw15XYCrFv3FauXiP4hNh56HgVC7t6lAg5+2z+TNM9t9KETuSBITjy
         GHDWYit7hXxO/dGQLTO+bLl3M74QFXmppNBsE7bYL12YBUtwu7jiHCpAs3Yumc6G/IlA
         fXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0VIY072ZJlZj4z1mcJleK9agtZhmef7Eqj9dCGXoaPE=;
        b=HfJQrQlx3cpcc2XlKmB+AgXJ5RclGq7dBjZ2Uyi7NIj4mmee/r0HP/psF1oLsO44Ew
         n9POeISZLHSWqOmy2x3s8uxvX7sRUUX9gxFus4FCtWmB7WYk9bPbhKAqGa45UjqU4rcQ
         qsG+n+HgTiRV7PgY9UGXN0zZMk3eV4k7G6WXZp4RZr0uJu+Y49D7nbgOPvLRdMxoWY7v
         xf3pawltjfhvnpm0xvFH3Jb5mHOJRUsEqn7LejQImOhBM7RWH2ZVjSgzx+5vcQ+q9Gh1
         ctapbmXEiwDLhm30Py8BtWRZf5oBVKVKNQLL4fXce77fzWcb7O77Qc5XQKcW12o7NPdW
         wkgg==
X-Gm-Message-State: APjAAAWFF8qGl4Egoqeep//wvyEs3CRdIVDGGPS0A6rDMFUuwMAWTB+L
        bI0e91+kILIFTQ2Q8w0zm5u1hA==
X-Google-Smtp-Source: APXvYqyPFOJP3LbNcrnULpaVcK05GoYjbZkn25HyDBR+a/U/LXJclR53qLuaVJaE8rGEZpxPtw3NvQ==
X-Received: by 2002:a19:ed0f:: with SMTP id y15mr36683832lfy.3.1575063582905;
        Fri, 29 Nov 2019 13:39:42 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id p4sm10817755lji.107.2019.11.29.13.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 13:39:42 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/5] arm64: defconfig: enable CONFIG_QCOM_CPR
Date:   Fri, 29 Nov 2019 22:39:14 +0100
Message-Id: <20191129213917.1301110-5-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191129213917.1301110-1-niklas.cassel@linaro.org>
References: <20191129213917.1301110-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_QCOM_CPR.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
Changes since v6:
-Picked up Bjorn's and Ulf's Reviewed-by.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e76b42b25dd6..4385033c0a34 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -438,6 +438,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
+CONFIG_QCOM_CPR=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_XGENE=y
-- 
2.23.0

