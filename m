Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752792DD877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 19:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbgLQSe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 13:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgLQSe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 13:34:26 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE06C061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 10:33:45 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id s26so25348147lfc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 10:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Foy2IH04nLZv6t+FNZrv84jPZYor6kJPDkEl5GeJUJY=;
        b=nbrEfB3+iNOYepDbTysjMyobWTkH1FRZKRPcbm/4eVk5Dz/h1SXpyLxLHGC+MiyMGl
         KRS3S9J839bzPJMpaQ0n0ggJBSW14iOv0CQGjcuguQwT74hrc5H6xdCDufCg0duogkbA
         H6LA6vwAvdEAt+yZvq2L50bZ/8PuUTu7veUllV71y4awIRp3NYsCD8+4RbVVDgjL+wi7
         gKoKgEmecXBTWyP0alOcej5jER1ivr/8L5iF25Tlsagsv6QDGsd4PV/DxTtnC8mgI0vr
         BUmvJWKQmg16XF4SrQDE3U1jMBo/JdP4o+gW2CGvzQusXYTzjQomBwVNc0rmGQvsevuT
         h4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Foy2IH04nLZv6t+FNZrv84jPZYor6kJPDkEl5GeJUJY=;
        b=aSSoL9g8HDvLOiEkmbGCsxMsLzCw7vMVzjyrL4vMLht7Fi1bPoM0QTV+m0+Ghno3wg
         Xlk25PYKXtSNldB9IAiKuWIjvDkHp6EL9dg/szYL7hKEXVoKfCzULhbwPDIKFwkv1kb5
         0YJwlzqy7ffcnsjO57FaSRhPXvfMA71Q3cdWiGuBsvedcF2TjPelDuFe06pXFfFOPQ2d
         ypR9rLm+l7uL7XkmYEXzK20M7TNew5MJl3whS1/pK47xCGLDzxsYDEsowFeheArz6W/I
         xA1srsm2O1s1d1IiyaC2oEH7VBGWg7uXyDFUFyONPYxLjOZUlPzZ6rCk5UgevPMMphjk
         L3/g==
X-Gm-Message-State: AOAM530+wKuq34IjP5MgfDkJeMjwyJdHkq/vhqkETA0ywSDuqqr6K64n
        5RAXlCwBEmkOzR+aXJ+yrA5ZNQ466Gi39A==
X-Google-Smtp-Source: ABdhPJyLoslUwYxWOYFGJgAjcPVuy7Ol5NU4Mb5KEg1vaqcDc2dgbRn5J4udCKFA4TO9CsiTQ1Tyqg==
X-Received: by 2002:ac2:4211:: with SMTP id y17mr25788lfh.49.1608230024191;
        Thu, 17 Dec 2020 10:33:44 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
        by smtp.gmail.com with ESMTPSA id v5sm665824lfd.103.2020.12.17.10.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:33:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: fix uSD pins drive strength
Date:   Thu, 17 Dec 2020 21:33:41 +0300
Message-Id: <20201217183341.3186402-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lower drive strength for microSD data and CMD pins from 16 to 10. This
fixes spurious card removal issues observed on some boards. Also this
change allows us to re-enable 1.8V support, which seems to work with
lowered drive strength.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Fixes: 53a8ccf1c7e5 ("arm64: dts: qcom: rb5: Add support for uSD card")
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index f3da4b0a63bc..3cb3914b8305 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1081,8 +1081,6 @@ &sdhc_2 {
 	vqmmc-supply = <&vreg_l6c_2p96>;
 	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
 	bus-width = <4>;
-	/* there seem to be issues with HS400-1.8V mode, so disable it */
-	no-1-8-v;
 	no-sdio;
 	no-emmc;
 };
@@ -1382,13 +1380,13 @@ clk {
 		cmd {
 			pins = "sdc2_cmd";
 			bias-pull-up;
-			drive-strength = <16>;
+			drive-strength = <10>;
 		};
 
 		data {
 			pins = "sdc2_data";
 			bias-pull-up;
-			drive-strength = <16>;
+			drive-strength = <10>;
 		};
 	};
 
-- 
2.29.2

