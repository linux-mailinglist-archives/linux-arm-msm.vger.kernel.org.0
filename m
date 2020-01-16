Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865BD13D34C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 05:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgAPEzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 23:55:48 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43319 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbgAPEzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 23:55:47 -0500
Received: by mail-pg1-f195.google.com with SMTP id k197so9262715pga.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 20:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8v+4DgG5fbcG655PWQyALbezwDT0tnYhquzZ6Aq2MQ=;
        b=eFA6wLdiEyl3ZoRG7Sqd18ajRt2HOl+aeMKbdK4pAQPh+xanYAztfw5U5LK0gzJC6U
         4Ko/MudJrnmRZIdvZ7rUiUhrXfklOq+riOxXv5OrM+XaQFdaRaEZkL73OMTYNGhtf+A0
         SSromzDHLBBuOP9xfqmg5KDVMnedlxikPtVONL9AM+5q1DeKkeAiuagJATY3XGidmeOp
         uy6GUdr3rDdNyAABTH2PnWA1WwJiv9qUvpvugtoYYEWFg6WmpidBQgc9OMOLnsXXkgyr
         O/0Q6KUrD+sOq3mYUobqdruGJEHQbuMY1Y98g0Iy+5/P33+4XoP9csFE6nS8ytsV9BWO
         qRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8v+4DgG5fbcG655PWQyALbezwDT0tnYhquzZ6Aq2MQ=;
        b=KUkawpkSRxQr2+z5qlQd1TWZjN0EqwCl2T7zSkijmrBerdTIakU5zCfhE9QejWLEwi
         ESN2YOsUe7rsBIN1LcB3/O/jYEKbz5iyHI/SiexAg2oTiXamVawqHQEE4RBHa79m3NVQ
         AGon+yChhBwvcBqmE/AAbzXsaNZKIZe+ilh8jC9js3KdjakLnnDXkwlaIjEJZAj/SzGl
         5MkD/7iLTq5jhf8yCcooPqjfwPHxOVtbgOGBnIfxWM04bh61I/75DMbqCOUusRRmcP3J
         uVVWJWV+znDfMmffJx4GL8E40MNPut0qA0C7Tsb6gooWY7/a4B9IIjsqEIRFLI25OWQQ
         3duA==
X-Gm-Message-State: APjAAAVa0SV/XHOQ/qYV3w9fTgO1JL21UGAgmxnmfDn7CtNqjci0eEo/
        0bbpDBMWPqzG/Sadi2xNAOQfyw==
X-Google-Smtp-Source: APXvYqxnV6r1cSp8obgrdpEsHKaYRE3hpOyfzEi1lowGIpNqD6SK+1CizrnQ2nn9d21ZheCDgnO6MQ==
X-Received: by 2002:a63:4d5e:: with SMTP id n30mr37091031pgl.275.1579150546866;
        Wed, 15 Jan 2020 20:55:46 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c1sm24140468pfa.51.2020.01.15.20.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 20:55:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Olof Johansson <olof@lixom.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SC7180 pinctrl and gcc
Date:   Wed, 15 Jan 2020 20:54:57 -0800
Message-Id: <20200116045457.2489704-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the Qualcomm SC7180 pinctrl and gcc driver, in order to allow the
kernel to boot to console.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8409aa80e30a..a1766c05cfe4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -412,6 +412,7 @@ CONFIG_PINCTRL_MSM8998=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_GPIO_ALTERA=m
@@ -722,6 +723,7 @@ CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
+CONFIG_SC_GCC_7180=y
 CONFIG_SDM_GCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_QCOM_HFPLL=y
-- 
2.24.0

