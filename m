Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E415CD553B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2019 10:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbfJMIIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Oct 2019 04:08:13 -0400
Received: from onstation.org ([52.200.56.107]:42494 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728760AbfJMIIM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Oct 2019 04:08:12 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 66A033F229;
        Sun, 13 Oct 2019 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570954091;
        bh=zE/PDCogHWCdqnjYcxRtt4Rl3eaCim48zWJK6YKnC7A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OVo7JFSOFjY4VFBseGrZ7F7kpob7N09njvHhA93fa3aLcUzqxQZs6zIDM3ysIu/dN
         abVe012OAgql1CPg+5xtVuj/yVwsJLsO18dDisGLuFCruy8+OeZ8dt1eQD+5smrWDu
         HPRft4k+eMVJkUWox/Bi3sqtmz4j737wTrpwPaJA=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] ARM: qcom_defconfig: add ocmem support
Date:   Sun, 13 Oct 2019 04:08:00 -0400
Message-Id: <20191013080804.10231-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191013080804.10231-1-masneyb@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ocmem driver that's needed to support the GPU on a3xx and a4xx based
systems.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 02f1e7b7c8f6..b6faf6f2ddb4 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -226,6 +226,7 @@ CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.21.0

