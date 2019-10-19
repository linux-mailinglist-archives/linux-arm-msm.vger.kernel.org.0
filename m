Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8F4DDAC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 21:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfJST6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 15:58:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37026 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfJST6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 15:58:18 -0400
Received: by mail-pg1-f195.google.com with SMTP id p1so5252117pgi.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2019 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=266Y0hXS9BC8c58tj7q4sT9jtJ0HQTa0yWk7IcR2wTs=;
        b=uG/U93b2A8I0PII6bxFfdt6TH1kECEIuI+qHTm6K3KY0l7I1StEOvn+GUkCZFZGlKr
         R0K3mq75ExZFMrumknpnY8XIfzX8oBIdma6UHZyEJugAdc5XYAgbJ7WPC1spzgoS8emV
         G3iopRckBMDrp3PlUBrjv4fjm4ExFy/LGiWIS9ynO+IJ73IGDDfJppCnZLKCr7RE0qSI
         QV8Bzds8wI6i2DkYLb1iysEgMiSirDuwBooSKX1WvMkelE1av2pCwKMl4gowVrybBF7y
         6bYl0xgazXqgiJ3fMHyi+1BOvcAaJzrdmhccY3RSdG6uSN3+MeeqZLlcxiSX/movlg6k
         1s/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=266Y0hXS9BC8c58tj7q4sT9jtJ0HQTa0yWk7IcR2wTs=;
        b=cb6ulTtHGdvtEfmiaTHscUgyEsyMJw/bFh7H3puBbflJmFOKfFB3vsT8AxiOLUUdNs
         Au4xHKYcFWQ/u47Wnj+brAt9nPvCwV9+DCEVV30ABoQydjVHs7Kdc3AlHWnmmnsgGVNU
         1b3uOzq+/eO9JQ21H5TF583FYMN1xX/VjU3x6pm3f03D6/R/KlTDshTDVnYkLxxCHCFu
         YsVjafsZPVAcQ7VTari1Fxx1fo72uDxuunL8R9uT9CELqB4TeeTbeJV3FzrlxgOdWDpy
         SXdS6+vYEdwhg2CYUR5Qiz19h+wTM4F5uACoGvY+SnlwMCxGlPZBglJRVyXgo7tbj4E3
         gncg==
X-Gm-Message-State: APjAAAUtLAmC4M2zIiJBShQtZI8KOI3dXkWNoZnsmZfUm8J0L1r2FQ2M
        bPXDp2QH5CSyCV7+Dn+D7IgjzQ==
X-Google-Smtp-Source: APXvYqxthdjowhAfa+DBog8jfZPwJlkwc/5bBE/nJLagsS8UKZv/Dc/OwAsuZFQAQGcWOh+laGTHFw==
X-Received: by 2002:a17:90a:bd0b:: with SMTP id y11mr19444285pjr.28.1571515097002;
        Sat, 19 Oct 2019 12:58:17 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v1sm10183866pjd.22.2019.10.19.12.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 12:58:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2] arm64: defconfig: Enable Qualcomm pseudo rng
Date:   Sat, 19 Oct 2019 12:58:12 -0700
Message-Id: <20191019195812.3834545-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most Qualcomm platforms contain a pseudo random number generator
hardware block. Enable the driver for this block and also enable the
interface for exposing this to userspace.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6baf90875263..4591bf1303da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -860,6 +860,8 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_USER_API_RNG=m
+CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
-- 
2.23.0

