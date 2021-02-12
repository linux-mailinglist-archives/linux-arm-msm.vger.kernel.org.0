Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F28319DB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhBLL4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:56:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:47786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhBLL4W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:56:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44C2C64E8A;
        Fri, 12 Feb 2021 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130942;
        bh=Kn2W7CYVAvREocCydapzoFsAV91gfj0UMuQXWUE4FHY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xzb0yq7Vi4RNVPSZQ8G3avCwDhvo5BjPHZfbyxjJLr0DTlHjwhz6MRtMiSKZ/Y5bO
         6/vmdOFR78O3FogPs4nT5evMeNtJHbF36/8z+NNlK8Y76FCiE1+IzKzpi+EFUUYouI
         Z+rspfrEN34XMpKJQY8rznFovDGkEaI2HgxTnblUPFt4rxRuY4bHAyU4WBAoNeXXWa
         LY9B2QBfvf4hDtjWj+Gx4s9UV+pHbR0NlDGjmBbpp4GBtSez4E/aqsiNj4Y+6ALiOe
         mD52htSupzdRFisaBlrYQ3x/z488MkP3Wwco03uSAKaWixUiRepmkBZijge1EzjVFK
         rd8kZiMOvbwFQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: sm8350: fix typo
Date:   Fri, 12 Feb 2021 17:25:26 +0530
Message-Id: <20210212115532.1339942-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the typo s/Limaited/Limited

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 188f4011352c..b53744618102 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2020, Linaro Limaited
+ * Copyright (c) 2020, Linaro Limited
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.26.2

