Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FE41FABCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 11:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgFPJD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 05:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgFPJD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 05:03:27 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDACC05BD43
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 02:03:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so19928185wrc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDNCxnb1DYpdrlf35UqFFy3yTai7H7N9sG+v5i2Zww4=;
        b=lvgHYSHqKLTgxAzGT3gCKD6NOFxMOgIo+PIl/yDI6gMclwq4OQV1ovp19Kor1PUUrI
         tKySpt/PQ5tTwntS6GZzuU8k5yeWtrUw1ZKnSWx1pNO2a6ZcRBLLJmB4asgr9qGADtil
         bSCXvzeeCed3I8OacKe36YhQhSpp4PBme2AkyXxWR8O/kHiRmHkcEe+KPbnI/ZaG2yYU
         JlpKI+gZLSdFs7OVHGDbm0nG3bX5V4V9zHzFLvfqk//ZXDuz4xT2vcY0TAh482ZBxmIr
         Sk1KZdP2tlOLbzlPkcJXF7BwFbmRVkut+KsI/qUiyKEaYNNjJ99G8nsmKMqftCOR0ia6
         2+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDNCxnb1DYpdrlf35UqFFy3yTai7H7N9sG+v5i2Zww4=;
        b=jBTk2oYRMNWFGP/YtIjczNqktdAItx3maD+tAcej59BwLaPb5C25ZVJN9jJW/xcZ3U
         vi96yFs2FYBmoX1IL0vbmyAAW+Ge8YpdxrSeG8vkNvE34OEECrZBADX5oG1esqO7WJDJ
         hDalp/34k0DX6b1Spe390/LrlMAR475ZztgHfk4WAVDcZ7uP2xT5LfM42kN52YZ9mius
         RI3whMRfGNO3oMmzMdr4u8JaNTyDTJphGFldIt5DJzBjYpbJyHeu88r6mhqKDBJ/XyIQ
         z3OIJEZahow3I1Gpa1ojxe2g+zmtxMsWqrMNtnMAIzoLLuJ8iCY3Ip1Yzya/4AtfLIus
         Qe7A==
X-Gm-Message-State: AOAM530veNMWHfnkQga8OLvD9+jxT6AoI2ioXW/CRmpnxpWiHZIrZs0+
        2PPZd7OkEb8CzCi7hrBNAqazFA==
X-Google-Smtp-Source: ABdhPJzMuAADdmSq767ybrYcZCnAWj09SBWZxI0QASOBJ9pzkRuk1jisXG0pfU51rUiGLS95P85bhQ==
X-Received: by 2002:a5d:42cd:: with SMTP id t13mr1874691wrr.355.1592298205550;
        Tue, 16 Jun 2020 02:03:25 -0700 (PDT)
Received: from localhost.localdomain ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id c66sm3148331wma.20.2020.06.16.02.03.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jun 2020 02:03:24 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        geert+renesas@glider.be, marcin.juszkiewicz@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH] arm64: defconfig: Enable the PM8xxx RTC driver
Date:   Tue, 16 Jun 2020 12:03:24 +0300
Message-Id: <20200616090324.6976-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the driver for the real time clock found in the PMICs on various
Qualcomm platforms.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 883e8bace3ed..387807e40010 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -760,6 +760,7 @@ CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_RTC_DRV_ARMADA38X=y
+CONFIG_RTC_DRV_PM8XXX=m
 CONFIG_RTC_DRV_TEGRA=y
 CONFIG_RTC_DRV_SNVS=m
 CONFIG_RTC_DRV_IMX_SC=m
