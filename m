Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38BF910DB3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 22:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387460AbfK2Vjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 16:39:48 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40708 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387449AbfK2Vjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 16:39:47 -0500
Received: by mail-lf1-f66.google.com with SMTP id y5so10851649lfy.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2019 13:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7+c1+/bAwglAnZeDLT/AzXmg5yCseUiMi1ICe2LvSE=;
        b=EzH2qPmCHNHcb1auzi3Ei2y+G1OXB1OrTfx+sjj78yReiH7lHbrViQH4E2FvJIsWG/
         AkF9Yr9H8uxC2pUaGuz+hZSVNTf677rUiBQqMVNOEjBSS3r+VeOHVRwZ0Js9oWG28AZ9
         5Sbfky7KacyC9lADKEw4iparWLA+2plZ6VxHZc5DBpMKM6X/RzV4QeY+KQnD8QMXTN1P
         4M+un0eT+YVHCI4MxEBnlMh5eKIgbAWVJbgJOaBDi0wpzMJFSPjx67ni3yuNyfzOmcij
         f+cjghCZ7sNG5oc5Z0rpOMOY72FiQdQbum3VyPETOhVS5E2ABk39JjogrTKqqKxziFrp
         7OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7+c1+/bAwglAnZeDLT/AzXmg5yCseUiMi1ICe2LvSE=;
        b=XoQgl0yNHzGzTJb5URU8stfU0esiTLBYPEct3riidm2w1w+euPtQZ5DlfqE0FEO/bJ
         fbPCS2IhgYzneoxa8hoh4kUfWqEuv/Rc4IqV6dL8RsYA0R1d8Ud0yT2qq1BoobhCUPS7
         LJ2Kvxwj3mZyak5pOUvi4C+7k6IjQywtReO0UFrXMjozqQRobN+hi8rm+M6ZuNiuc4co
         RxzhyV4jc89HmsKPyTtqhTex8uh4MQKfMw5lwQ4YbcmxaQ5hSwaUJbiYf0rJPvvKeQQv
         4GsVH5wStCkBlfKgVU/90/E5vrKhE0vpOxMQjqsloT3mXRNWjwx5AWQeclgT5HARWUov
         OCCw==
X-Gm-Message-State: APjAAAVcHFkLZ9BRp+VRaZvopPFwWqeHibbQ3zEErx/aM9iIBHlx1PPU
        4qHv0/goZyvdVQWs2Ngl5QUcVQ==
X-Google-Smtp-Source: APXvYqzmK1qfUWNO5+GqLc/J91X2071nazdIN1DT9krqNIkK4AEPNYvVcnX1v7Q8I1+d4adHRrcEnw==
X-Received: by 2002:ac2:53a8:: with SMTP id j8mr6064945lfh.163.1575063584334;
        Fri, 29 Nov 2019 13:39:44 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id p4sm10817755lji.107.2019.11.29.13.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 13:39:43 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 5/5] arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM
Date:   Fri, 29 Nov 2019 22:39:15 +0100
Message-Id: <20191129213917.1301110-6-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191129213917.1301110-1-niklas.cassel@linaro.org>
References: <20191129213917.1301110-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
Changes since v6:
-Picked up Bjorn's and Ulf's Reviewed-by.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4385033c0a34..09aaffd473a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -88,6 +88,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_IMX_CPUFREQ_DT=m
+CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
 CONFIG_ARM_QCOM_CPUFREQ_HW=y
 CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
 CONFIG_ARM_TEGRA186_CPUFREQ=y
-- 
2.23.0

