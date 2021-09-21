Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C82413616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 17:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbhIUPYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 11:24:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:12732 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbhIUPYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 11:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632237787;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Td19UKq3T0glXNJuIuxRU4USqHAXzFvxdaOhOWmflRg=;
    b=jA1Mg9KanOKTmAGLq86s31pGXblWz8FO27KOiRsahzgPeRqMd3zs5KSjId/Fz4fdf2
    H0/BYdeKxKNUsyPRmXE61RuPssV4qL/BvOT87Th5wAshorEvnc1Qz9la2wq2/mldmhV+
    Sj0NaK+AA07XHvIW4nNUDcEJXB1CTzyvHo+SVHv3ERGg7NeMng35/hGP5LYE9f/ZdjkC
    OFBihgR7vNRak5l6fURhp054j+AC0TvpSujbZ/WhcfroENdjeaYvx3mHKumdKdLgJsKX
    kcbL/mXYe51mPqSx/H0hTQkhjBpPWJ6U5+2UmyFuTnKhauU2oXUmflIPqyPUzclsIeID
    rP5A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFOATg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8LFN7ARM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 17:23:07 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] arm64: dts: qcom: msm8916: Drop underscore in node name
Date:   Tue, 21 Sep 2021 17:21:19 +0200
Message-Id: <20210921152120.6710-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921152120.6710-1-stephan@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using underscores in device tree nodes is not very common.
Additionally, the _region suffix in "smem_region@..." is not really
useful since it's obvious that it describes a reserved memory region.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5551dba2d5fd..95dea20cde75 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -41,7 +41,7 @@ tz-apps@86000000 {
 			no-map;
 		};
 
-		smem_mem: smem_region@86300000 {
+		smem_mem: smem@86300000 {
 			reg = <0x0 0x86300000 0x0 0x100000>;
 			no-map;
 		};
-- 
2.33.0

