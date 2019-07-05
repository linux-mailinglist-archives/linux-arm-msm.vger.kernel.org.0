Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81BBA603A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 11:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfGEJ7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 05:59:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41048 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728296AbfGEJ7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 05:59:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id 62so5941387lfa.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2019 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1cPBfq2GzbVD8exE+fzniVCq/VcWabo7kryXBDUIbjU=;
        b=L0gk+ILoleJySpePiJIVgS/nH2x5/kSzqo/ptkeLXnPwSEn5R3XOqVGST4U2EUXzNO
         f5JEO1AdEmbDjoI59TtEMPHBGvqm1gFS/HpPpxRC/5WtzEKu8KhUI0lyIIieufesgEq5
         djLHMyqoyXZkXmj3sensXU6c52BvMzPHUEX0GNi6b4vtVyJIsknoYRXNzSi7arsIPqrE
         vAxYgdcDyVD7YoJA4MQoOdueaeKjQCwYmmnw7paMz6kzUmYAX3LH4gXXd53AzaSs+xzr
         MawTn7r+71wX1fGs7ZKgWbCFrhMiRRRWcIW/F6xLZRQOtaCI+iNQU+9IDQlIP0VQsvTg
         V9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1cPBfq2GzbVD8exE+fzniVCq/VcWabo7kryXBDUIbjU=;
        b=Bo7owliKIhZ08g1iRE8O/u8btTzhJAtSMu3QywvHiIBo8bbLQIUdgJk8U5R6AVp4Za
         kvdT9BAKPwpVP5WSlvbYOz29g5y3VRNgVxJZ90UqJ0bKtfdiY7yNTT07HUKCTyR9+/oN
         AC0UqwWKUhMe/lRGP9Jwm/IdVNsgCvV0BSb1aVTrQcth2w95PAOifdLjD7+L4UYOhLmw
         Q9WVnOpNg+s06+tOinbGFN1j+p007WTpWEd3EkFEeNVXr3si0o+Tafd/EAqKbPVhyfLm
         eTKPDgGkvWE5SgNwir6OXe4H7HPe1FGQc8EJ2kmi6Tr1eIkxaBq4z51BaTx9XmjuNcvl
         et7A==
X-Gm-Message-State: APjAAAUfE3ar9qFUBxwH+7PHrAqbnOCg6gqonu9vEIafujD8skbQPR6Y
        rFHIBqWLxBo+t8w0X5/FT9wemQ==
X-Google-Smtp-Source: APXvYqyb9EoNGR9FLxYunMnKJIZZmJEnuWiIilgIzZvMx4xJOe33N5O4vHWCRCtyVhTf7FKKrex+yQ==
X-Received: by 2002:a19:c503:: with SMTP id w3mr1377654lfe.139.1562320747177;
        Fri, 05 Jul 2019 02:59:07 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-34-119.bbcust.telenor.se. [83.226.34.119])
        by smtp.gmail.com with ESMTPSA id 199sm1697601ljf.44.2019.07.05.02.59.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 02:59:06 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/13] arm64: defconfig: enable CONFIG_QCOM_CPR
Date:   Fri,  5 Jul 2019 11:57:23 +0200
Message-Id: <20190705095726.21433-13-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705095726.21433-1-niklas.cassel@linaro.org>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
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
index bfadf18e71c2..d1e8ad5d3079 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -416,6 +416,7 @@ CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
 CONFIG_ROCKCHIP_IODOMAIN=y
+CONFIG_QCOM_CPR=y
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
-- 
2.21.0

