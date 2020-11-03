Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8142A3832
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 02:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgKCBIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 20:08:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgKCBIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 20:08:30 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929BBC061A47
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 17:08:28 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 32so14510440otm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 17:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBKyTW2xl7SqJf3gBQbyEjWgtmIkY7uGpGBFbTW7iiw=;
        b=EjMT4T4sXdFGuj7/NiOpTdCd6IGUpoM3RhaZU5hZapnh04MeXPu48AZzErrxvvZevD
         j9c49Eoohmokewf989PyNYdCrRpDVWJ9nSA25zuOTLt9B6QNB09tplAxcpt9s0JTciSU
         H98A6MshbVIm345VWkiBv42RsioQGHSyqDbmftiHK6SIHeBSZeZ5YRkX5+bDyHye3YnB
         6ZcwPiuuxj/6P9caWpJ6B8GbYRRjp/nURtkkjZt9uNdm31/Z4EabWaHAh5LQHJ59ehnI
         5IAtqlVjC1ri3c9P7xHIMu+pkSSoDVt61D27OGy6VYD72/mDn5gSK8vo6EypEzKclxAh
         KZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBKyTW2xl7SqJf3gBQbyEjWgtmIkY7uGpGBFbTW7iiw=;
        b=nyVWVrjUmBAeq8cTwXJDB2fkZCP++G8+iC0vRSm6T9cr6iW3ajDCjrbZiuJMIXl/3Z
         sEoFuD7vZRm8X5moIEoLEKeSX75rsMps7cFTOwcW00u8GZwnPDfvlAFoL/8ckaoYvdpK
         1bQkUFTupofij8fd0IkfUwIuLdg9O1m/7CfcCpdy73UMwY2yPTmWd+smoYAmFEeM3oLT
         lbSFBDLKMhRb66tbO5MrAaqakycT3G4VsU6nszQQx6YHlYybSqUZRKg48X5Zxstkg82o
         ZqW7mu27Ab0VKwJnRLZZXGcmEKEfJGlscyJNYQzfjGJ/g6+Cl49THoIn2tB21GMlXzPm
         5vtg==
X-Gm-Message-State: AOAM531U0BrfVdQfKywcfD3TrOdnjXW9gvXT7OwfPRYTGVx+OG76RQSc
        +9/Dr1IU6Z1MOigJq6HABqkuDA==
X-Google-Smtp-Source: ABdhPJxXtlFWaVmD5D+5RtzmD/LQTGrShIC8RUGMLBvdbbVzYZqFhdnGKQqlXoH2VT5zBfOu2vvxaQ==
X-Received: by 2002:a05:6830:2085:: with SMTP id y5mr13935964otq.37.1604365707837;
        Mon, 02 Nov 2020 17:08:27 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t71sm3787787oot.5.2020.11.02.17.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 17:08:27 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, john.stultz@linaro.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm Command DB driver
Date:   Mon,  2 Nov 2020 17:08:50 -0800
Message-Id: <20201103010850.757500-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm Command DB driver seems to have been indirectly enabled by
the Qualcomm DRM driver and up until the introduction of '778279f4f5e4
("soc: qcom: cmd-db: allow loading as a module")' this resulted in the
driver "always" being builtin on arm64. But with the introduction of
said change it, and all other RPMH related drivers, becomes =m.

The immediate result is that the uart driver fails to probe, which
depending on userspace's dependency on the presence of /dev/console
might be fatal. For systems getting past this the default timeout of 0
seconds for probe deferral of many subsystems causes the system to be
completely useless.

So, make Command DB builtin.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5cfe3cf6f2ac..9e0f664461f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -930,6 +930,7 @@ CONFIG_RASPBERRYPI_POWER=y
 CONFIG_FSL_DPAA=y
 CONFIG_FSL_MC_DPIO=y
 CONFIG_QCOM_AOSS_QMP=y
+CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
-- 
2.28.0

