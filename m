Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F23FA11D3C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 18:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbfLLR0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 12:26:23 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:16722 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbfLLR0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 12:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576171578;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=BlCiMYhbq8IkQLA4/tbBRj9bcNcO7BYIvAcuw+Qgxq8=;
        b=kMK+I38Oss7L7W8zktfIS98FgC0pZpSwDa4tB6M+JFGgVroJ6agdVfPxpf0r0jhlTL
        oSGSag0N+jocIL1fkkj2sL+kD28g8CPHkwh1kutUlH9KdSYGoPvr3aJYPfg5mTwMzY52
        a0FWbzJj3xzA8MIiV/pKGZBZ3Cvm80hdgG/7MdAXeAfQ4PrH0/eBa5MpLkW9l8NpzYC0
        9o6TCKYbGxXnDCl+KZWKGCdmT68OegJUL3+VIxGDkS6GrYd+l7ImjM3Ytl+BuJ87oguv
        Lu7puiSMWYLV2SwK1rna/4HOcEuFuXJ+kZLUL+7gDJT0Xhb+q/UF1a5rs6nhWs1e7kB2
        Emsw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMvxqxtZHg=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.0.7 SBL|AUTH)
        with ESMTPSA id N0b206vBCHQ63lw
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 12 Dec 2019 18:26:06 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm PM8XXX vibrator support
Date:   Thu, 12 Dec 2019 18:25:13 +0100
Message-Id: <20191212172513.13200-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pm8xxx-vibrator driver controls the vibrator motor driver
available in the Qualcomm PM8916 PMIC.
Build the driver as module so it can be loaded when necessary.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2646fc76b8db..26ee460bb00a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -316,6 +316,7 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PM8941_PWRKEY=y
+CONFIG_INPUT_PM8XXX_VIBRATOR=m
 CONFIG_INPUT_HISI_POWERKEY=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_AMBAKMI=y
-- 
2.24.0

