Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC5FB603AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 11:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfGEJ7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 05:59:19 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45980 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbfGEJ7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 05:59:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so5923062lfm.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2019 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UXki+BGW0EGKLauIq9G4YH7VjmEUNy+rZBQlchQV0U=;
        b=lnJtEzXEZe0doduKlbk4FsWysXDk5x3ZaYdVRE2m2HdMgKmN+9pMmfeZ74dUL40Bqx
         GKroKrKPXbNqogYNyCfbD0qnrR38ZXrNqRIWwfOBTpaMh+5sap1mG+e4Js8+KmcTU+Jr
         IteVA8mle8jUFaUKZtYM64SPwDKAsywcgGzkwMkVzXtqHijduZpYbjSBERVDhYgbiWeN
         xIOzFcbs+n4yqEK0zHbZm67WI3TbCR4D/0cH/5AnacG8eXnU7jtGYwAdR2vvs1opAy6k
         Vhmiw6Fwp+w2lZt0YGY6O3U/TwsU4v6QOsx+K6Zg2FLoja6Bwd6ejEzzKu40KOFYkgoE
         qZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UXki+BGW0EGKLauIq9G4YH7VjmEUNy+rZBQlchQV0U=;
        b=bpDI3jLpb6YzUd2IUE1HY1RCTVmTjH/ZQgp7MRbRREYQHpqThCnOpHXToiwyMLBRBS
         Xv6lKNJlZ8a2EHsf14HYQAH1N8/P0pLYqlyITFU/0bEDZVYhDXG+Z0SU1QrpImynkBtz
         XAUEo3PRHDReHev7Lirsfxhc3WLwUtKssMMTUaLv/IyuSEaTzLYfdilDBSkVSz5COR+g
         3bvDqttQcDsuLkCk569zkL0lO54L+zMXK25lG5BLu42o8qXBro7um3NVmljfvl6hDHTy
         wxaGSX3QiJxrxbhqktqTmG6P6jrhy0B3DAVK/8J+ddl/biHwrb7yOFNPffCXR9Sy7P28
         HJGw==
X-Gm-Message-State: APjAAAVpnmmmQlsdAepYGsIxLB2R9X5uZlJlQnsMJWnPeSueD7PeYIYZ
        sLgwFop90l8bipP8jSpvnqms8N7BcJs=
X-Google-Smtp-Source: APXvYqx6rO1fNB5391rPvpkrYN/KMXGjcLhiY8z8sZn5pk4g2lfDFIX7Ayg+RCvVMaFMn8GxNlkjgA==
X-Received: by 2002:ac2:546a:: with SMTP id e10mr1587427lfn.75.1562320748340;
        Fri, 05 Jul 2019 02:59:08 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-34-119.bbcust.telenor.se. [83.226.34.119])
        by smtp.gmail.com with ESMTPSA id 199sm1697601ljf.44.2019.07.05.02.59.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 02:59:07 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/13] arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM
Date:   Fri,  5 Jul 2019 11:57:24 +0200
Message-Id: <20190705095726.21433-14-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705095726.21433-1-niklas.cassel@linaro.org>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
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
index d1e8ad5d3079..ae458572d9be 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -84,6 +84,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_IMX_CPUFREQ_DT=m
+CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
 CONFIG_ARM_TEGRA186_CPUFREQ=y
 CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
-- 
2.21.0

