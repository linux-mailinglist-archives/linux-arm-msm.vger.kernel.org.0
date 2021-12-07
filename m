Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD8146B3DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 08:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhLGHar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 02:30:47 -0500
Received: from bzq-84-110-109-230.cablep.bezeqint.net ([84.110.109.230]:49825
        "EHLO mx.tkos.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230073AbhLGHar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 02:30:47 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 0679C4406F1;
        Tue,  7 Dec 2021 09:26:59 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1638862019;
        bh=co7ghAu45Uvxw9aXKApsiTm/77awZeWU6WVNI0cLlpE=;
        h=From:To:Cc:Subject:Date:From;
        b=cRNjc412eTqk7F4ps/Qup/kdBDd0ShbP18FiWeO4wYFP6PruCv+8TzlGgVAyX+Cpc
         BCMIb0VEISIA04UPKwJ42yz+ufyH7YsRvlQfneBEHSOm2SOZHWwP+0oPJVC+FCO12P
         pd522aGNUIjVeTsM7py1bhx9f5Iqet89FPvvyEpb0Ku74aATCRuIs3Z+V94HQhRH73
         iaOD4isOzAzZly5U0mwsQRDWu4goNuEyuoEYrh4MdTurD6ksBYbSxNBRcD9zKI6Jr6
         Xfq6oGjYQSsNhmvrpu3W6I21unZhohCwP0A6bmGe0Za38x8NAp+X0ri7n9KtpOPp4S
         5OSoIDJoDmudw==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: ipq6018: Fix gpio-ranges property
Date:   Tue,  7 Dec 2021 09:27:10 +0200
Message-Id: <8a744cfd96aff5754bfdcf7298d208ddca5b319a.1638862030.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There must be three parameters in gpio-ranges property. Fixes this not
very helpful error message:

  OF: /soc/pinctrl@1000000: (null) = 3 found 3

Fixes: 1e8277854b49 ("arm64: dts: Add ipq6018 SoC and CP01 board support")
Cc: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

The error message was improved in commit af3be70a321 ("of: Improve
of_phandle_iterator_next() error message"), but there is evidently some
more room for improvement. As I don't really understand the code, I
added the commit author and the DT list to Cc.
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 6a22bb5f42f4..a717fc17523d 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -220,7 +220,7 @@ tlmm: pinctrl@1000000 {
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&tlmm 0 80>;
+			gpio-ranges = <&tlmm 0 0 80>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
-- 
2.33.0

