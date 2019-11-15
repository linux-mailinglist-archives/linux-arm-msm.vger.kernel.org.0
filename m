Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823D4FDD46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 13:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfKOMSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 07:18:12 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45161 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfKOMSE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 07:18:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id n21so10431122ljg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 04:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mduOSCKauFb3j3r6hILUAiEYXazQDNKgF2SjQXFQbkI=;
        b=vbiYZOTeqUAVzVDgDlbIZVeaduxvSlDcxM60I4FonIbaAMu8P1XdQ24NQzaBi3asR3
         u3A1xmlhOe/B0S+IlzLwr52sd0EYyMHb2AVYfpo31GnafFeOuR7uad/sLjQJFNhKhtbv
         Yy99j1Uq+jKfq8n509b9D0vOWHyKRHOvqOcC568u+z9SZXIF7s3RgGR8b4H6qljKQeJt
         nDeAamnSSRzVVc9l4sWNHvo7p1A/PNrNMqrYN6AgbAxqAPjKLOa4yhqY0z0bkgFjzz9S
         +NFd54bGysbeoI0hAaRlIwDD02f6Ll6SpMD4PBWcl7TqXUID02nqZ/yOTkVLBsfDbE9A
         UZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mduOSCKauFb3j3r6hILUAiEYXazQDNKgF2SjQXFQbkI=;
        b=D0TkclVwFaPFcB9rzwla2VNWnhVUJ6LA75ey03tA75SmzEhiH11Sf0Ghz4w7RVr79P
         r0qWPjL+mD4sJOx0O0Mm1gzUajVHaCoXFq5zpyh+1lpuHZ9MIC8vvgLOZC1eWXCQCrg9
         rnJqEi5JXCpsADm4qkOLdhtAx9DNAD4LsnnA7D1Moi30E+k3/AdIDG3vPvGFBJmPzhOz
         Q/o4PSYi2D5NqOY5DvsG6PyiAhktLJDQ27zEjaE+iIZPSMng9BwbAwwdxb1m2X5cJiUt
         knOO+FgcN+8Sz2YP7WeSTTD1AdFDSDk0nP8Cvrw3KqjBbS5Ishdn+LOHE2P4J+t0xgka
         t5GA==
X-Gm-Message-State: APjAAAXXqX8A9CNfCdCLFhbcNQfEbchFjRXQI8zBZlH113scOhSUpuT1
        9ZLIBAKviyFaMPGlcFdCxiI6/w==
X-Google-Smtp-Source: APXvYqxbUCkeTtglgl2HCSMgv4Zcw5rQ0kPuIS3uqC18GHonYnsqTN47gEHHRwZaQT7gbr1LIyHSPw==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr8405280ljj.56.1573820282063;
        Fri, 15 Nov 2019 04:18:02 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id c16sm331070lfp.93.2019.11.15.04.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 04:18:01 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/5] arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM
Date:   Fri, 15 Nov 2019 13:15:42 +0100
Message-Id: <20191115121544.2339036-6-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115121544.2339036-1-niklas.cassel@linaro.org>
References: <20191115121544.2339036-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
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

