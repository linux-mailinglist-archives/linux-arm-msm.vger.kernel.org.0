Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E6F74C02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391170AbfGYKnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:43:18 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43595 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388928AbfGYKnL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:43:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17so22961904ljk.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqNWMnLE1PbsRnnTAlLi7jFwRUSXzMghW6te+X0yZdo=;
        b=Xll25p++OSqUympG1TKAn42FqQmeQWteoSD9URWb0ZedI4gKc+AC8GxyAuyEyNGFPt
         UZWbhBuSrtRR7sE7rXD19EcJT1aM3eMGJjGDenIhA8ya5vlewXcjoDp9Z1PvSdxHQnVg
         IEvOQecMvRMrMlV6fWr5FgGMhqMD8ToEERkByq8y+l3qtMByjjsGEwEqEVXTd4Prh/hF
         UB4OvljqaxQN6wHo2oay2+mQ8aBS/12QTCGDY7y/Bukv7b4Bhffgz9V9mKJB5wQ1/u5R
         YppvvAta56I7A+RsLGD5YxDcLSNVH7jOb5rEwdbF+TqlQ8wshQJ5oZ+yN0Yi0eFPpiR8
         +caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqNWMnLE1PbsRnnTAlLi7jFwRUSXzMghW6te+X0yZdo=;
        b=ZIv0v7abN2Ief6K2SE9oYP5yq2CjHC/pSP2cefPpLEXL7WkBz2HUiOJcikF2cgPl12
         LgAEYuDN5HJXDcUwmRYzSuX9fiSlTi+CW4vKbpLdN2YAYut9eMOx56zaAtFzNQAoym/1
         Bl/8gGD3jePUUlXxzXmrV/WJh4nA7wkj1Fq0TjHVM3j9RBoKvmwL1dWtn+OyfnpoxhNe
         XSZmsr+AMawGsbNsbwFdyA7RLekpBkEbuft+/WzVnShrphnRMy6fG3m27yyAxRkaSNfd
         1QvVTIcwJtYNztvMG1OjKeTfC4eNyuSJHOawLAlUr160Kw2T91QK/rylJ9KKxTzkpd/O
         4tbg==
X-Gm-Message-State: APjAAAWsuQ9VvuVGmahWneszoDhLYDUN2wQRZRwcmClBxoUrxuCgulGT
        MrauWx/Za4G1k6dC3ydbZBF/cg==
X-Google-Smtp-Source: APXvYqw5L6FlJHspttdMFLkgGxIyc8rrEJsJJ2fVabq6tJ+1l16Yk1HyGtXUmge5MbAWqs8jf0sSRw==
X-Received: by 2002:a2e:9209:: with SMTP id k9mr44596234ljg.96.1564051389696;
        Thu, 25 Jul 2019 03:43:09 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id 63sm9139580ljs.84.2019.07.25.03.43.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:43:09 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/14] arm64: defconfig: enable CONFIG_QCOM_CPR
Date:   Thu, 25 Jul 2019 12:41:41 +0200
Message-Id: <20190725104144.22924-14-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_QCOM_CPR.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 04b7fb26a942..3e7618818250 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
 CONFIG_ROCKCHIP_IODOMAIN=y
+CONFIG_QCOM_CPR=y
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
-- 
2.21.0

