Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA499700
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 16:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389316AbfHVOhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 10:37:38 -0400
Received: from onstation.org ([52.200.56.107]:46940 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730624AbfHVOhg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 10:37:36 -0400
Received: from ins7386.localdomain (unknown [207.110.43.92])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 4DA7B4BB69;
        Thu, 22 Aug 2019 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1566484655;
        bh=GuDTYaLtRS6VZNi4k8Kar+jH90CMSgZMuAHOBomIJfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c8S1G5EV6qFXdTZwEeL6EdIRVCWHpelgf+iieIqoON68BKn9WO8d2AKIdunPkUjtq
         /JrJRpdC3qp8GIGmwjmEbgqJDDWP6RG8trZWOLwMppevFtmp2J1J218SQVjumed4pe
         lDqxDsMkyLltlPrYX+fCsvmVEHrMf4jlA8/pwH+4=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v6 7/7] ARM: qcom_defconfig: add ocmem support
Date:   Thu, 22 Aug 2019 07:37:03 -0700
Message-Id: <20190822143703.13030-8-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822143703.13030-1-masneyb@onstation.org>
References: <20190822143703.13030-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ocmem driver that's needed for some a3xx and a4xx based systems.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v5:
- None

This patch was introduced in v5.

 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 34433bf5885d..595e1910ba78 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -225,6 +225,7 @@ CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.21.0

