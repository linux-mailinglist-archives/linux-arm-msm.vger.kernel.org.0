Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7EAD4B1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 01:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbfJKXoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 19:44:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40923 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfJKXoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 19:44:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id d26so6643937pgl.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 16:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8eY4wo42WtOKmlH068hhmD7B1nLmX1zbEw5wgAbsjlQ=;
        b=eLpfoF0wE61FQRBmPO00nr4+AnxnTlXQ2ao2dwJB9LOttMcQVHs9oWsivwHKUTPGly
         TPAXI9vZRGYzbtPRPD8PC45YeUKVaOuvrdQcpTzSGR/NvQNJT6/WCxv13ZGXgJ1frJyw
         NlBcYWTxskSfXttkB+f7Kv7+DeMqZujE1PZZysCyuAz4XRtnaffRWOXVI+TplbLfHImj
         BIZ08dOmjmuqiy3jA0XWeKcDMK6955aNInAVdxA50YLlmCWCEKb9U+b4gS57H2swLGKg
         FhkmTWTr/N8kZajZUIgdyxy1tofrw60zgHGwg7c5kEih+b0p/53FoYT5VATXI7fGuGAp
         NpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8eY4wo42WtOKmlH068hhmD7B1nLmX1zbEw5wgAbsjlQ=;
        b=D7M/IDRJMSw41D0Xa1kbj2hnwzX9UxQy2Gb3nTcChZ9tIo7oFqDAgVGua4UHgUJuzl
         e4iR8I8aprOjvezV2Rqai1Sptp/2S7uFuivfty6fe5VhB/w1/9d5na3xO7AFWO/HDbxa
         8yp/G/3kGFpiBdJMKj507kZEhwLnzGKLRxGI4xs8v2st7CZ/6HKblLE3QxMCUSX1YQQF
         JUMXBd8bMaEJ8MlQ5JkKhK1PoKMJRXDQ7cdAj65wQ2sB8uiitEkZ90AlzKxT2sxVHv61
         ZbvVaGxjNU9FNS6NXF6Ny0aGqmHX/hDL43coTHzrrrpkZpa8OlJZK6g1yXg8G7Fj6yhP
         SrbQ==
X-Gm-Message-State: APjAAAVAcMzcF/U7Rb7tJ3AVopD33JhorVExLqqX9auF1MMqUjuVu/gy
        Blce9gIE/aRQkMdEtkTpCV7QxPadpQM=
X-Google-Smtp-Source: APXvYqzXusObm4NkLuSv7bqxR3WbrsWyP6ALbO3rVDrXKGNaw9fy9O32fAWsRG1xQpCh5bH97voZkg==
X-Received: by 2002:a63:8dc2:: with SMTP id z185mr19553539pgd.228.1570837447240;
        Fri, 11 Oct 2019 16:44:07 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 62sm11011253pfg.164.2019.10.11.16.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 16:44:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm CPUfreq HW driver
Date:   Fri, 11 Oct 2019 16:44:02 -0700
Message-Id: <20191011234402.374271-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm CPUfreq HW provides CPU voltage and frequency scaling on
many modern Qualcomm SoCs. Enable the driver for this hardware block to
enable this functionality on the SDM845 platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dea051a64257..45e55dfe1ee4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -85,6 +85,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_IMX_CPUFREQ_DT=m
+CONFIG_ARM_QCOM_CPUFREQ_HW=y
 CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
 CONFIG_ARM_TEGRA186_CPUFREQ=y
 CONFIG_ARM_SCPI_PROTOCOL=y
-- 
2.23.0

