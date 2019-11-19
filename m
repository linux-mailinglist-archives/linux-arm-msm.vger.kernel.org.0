Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5324E10287C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 16:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbfKSPq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 10:46:57 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43496 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbfKSPqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 10:46:48 -0500
Received: by mail-lf1-f66.google.com with SMTP id l14so10784587lfh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mduOSCKauFb3j3r6hILUAiEYXazQDNKgF2SjQXFQbkI=;
        b=oScf9xUteMXLAaLWoQ9x7ikhUGemCzDuLtClzRtrvXBEdZGSuhXeNXEEdc7fM0cPZZ
         4EDzkAg1qWI22+1VoUASkJ+ROGdGPVCpN4BoYYRsCqJsN1Y9bXI2+dKM1O20J3P8j1Bq
         30GIhWMcWSrZST5tojyirpAFUaSdQuCX1JLuODW2s6UFkzU3yYaclLSC13nSNFVzOwLD
         DASJvz9uCmPLIbatmly0lQPMHleMB/YeB3OLoobHf5Frz4nc/w+vvmiydL6sp8bizT9U
         0YPAno8EssdUUfIu9+W0qmu4dwc73hHvxx5YX5H0SUH6Fj1ixhctz/jZeuDo3znjjnIl
         EG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mduOSCKauFb3j3r6hILUAiEYXazQDNKgF2SjQXFQbkI=;
        b=SKosdP/Z1igeZte0Q7ab1Pp5uEyfFhpfQzLzcz+PSPVXAHeZ93/q/f42VYb9EKrVDz
         6mXH2XfaXmBLjsd9+ZW/iBUymrBjYy19g69hjGcmWQrhpd4ent4JMuhvaMY0bSedlZrU
         X98ck4by4VGKIf+xNdrb2CXSks3Zd9BkHgl2SSLZsUhmgmDQczJ9JQ2zbL2z00YuUWki
         WEK+0QIbP0FB9Wo0RxlMQMxMrPdVsY8ledPwC0EvxfEETJQ98X64b55jfNs3caojaT/W
         YUJwSLBWhElh3Li7ng6smErF1LVbol3uzdQEwTGASqHUmbB5vL4sHGKL6o4FeRn++ydb
         yLlw==
X-Gm-Message-State: APjAAAWxTuH3GIHgX3+sgdZVkF24OiNtuPmwfYT78evjOjV/OqYwY1KG
        A0rF/JdLZ0Mum1UGfZ+ZdxNegg==
X-Google-Smtp-Source: APXvYqzaxxG5ZqNc8iYg/clzpbHW2UpP3WOKI6lRquEhvqf/7jQ8UnBV+TmnjBteY/kPGirgoc7JKg==
X-Received: by 2002:ac2:434f:: with SMTP id o15mr4442152lfl.190.1574178406942;
        Tue, 19 Nov 2019 07:46:46 -0800 (PST)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e14sm10128803ljb.75.2019.11.19.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 07:46:46 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/5] arm64: defconfig: enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM
Date:   Tue, 19 Nov 2019 16:46:20 +0100
Message-Id: <20191119154621.55341-6-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119154621.55341-1-niklas.cassel@linaro.org>
References: <20191119154621.55341-1-niklas.cassel@linaro.org>
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

