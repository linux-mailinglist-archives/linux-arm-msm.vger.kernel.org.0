Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B4441364B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 17:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbhIUPgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 11:36:38 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:30364 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbhIUPgh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 11:36:37 -0400
X-Greylist: delayed 541 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Sep 2021 11:36:37 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632237786;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=JqxV/QM2aORH0D35iRMcueybQwkHash0nrd4YqDUGUA=;
    b=GMvZJ7wnGvEIFPnHPYjkujtqrxLBqK8b4F1ghUNZRtGdb73d4Lf95TTl+ADt6cSM7F
    Wp1g2gVS0opHWYgt6s0jspwUg2xDg0qbkLGjSPyBNp47QXH8nqDDnQTAaonn0i/waz71
    FoqIVpU0HnS2yuyjvhdMF2enMvRH6WvkVEV+rmvhqMfB20RdEzmcm/Pys5A+3coS/e3j
    NvGSqPlZUDhhgqEPt2TQoVFZgujlg7s4wmjs+BaZI9xIjspC7EFzi1nD7qJuytlLkrdw
    +n84pFZaLjfOzRLcRyYV8NwfxkOwuqvh2HnHfMQ7T+uLUzWZgEngIYTaxlnKVw99IzCD
    UnHA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFOATg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8LFN3ARL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 17:23:03 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: Add unit name for /soc node
Date:   Tue, 21 Sep 2021 17:21:18 +0200
Message-Id: <20210921152120.6710-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This fixes the following warning when building with W=1:
Warning (unit_address_vs_reg): /soc: node has a reg or ranges property,
but no unit name

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 008b98fe8c6b..5551dba2d5fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -414,7 +414,7 @@ wcnss_smsm: wcnss@6 {
 		};
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
-- 
2.33.0

