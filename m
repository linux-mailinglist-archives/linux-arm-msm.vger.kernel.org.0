Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E6442525F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 13:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241031AbhJGMAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 08:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbhJGMAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 08:00:45 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA73C061746;
        Thu,  7 Oct 2021 04:58:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id l7so22371445edq.3;
        Thu, 07 Oct 2021 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jq3NsLxt4IRxGBWkVAMAXg2p190bOg5Ogw6QsBDoe+g=;
        b=D/sMr8A49VTiRJyZYYK2qmNfoERG7aamiJDohjZriHdRiBcqYYxEV6q38cxzv6LE09
         MJqPcXX1Pp/Yzk0Cedy/N/KmUu549D55/LhjiNGplZ082z54CMnGcU9uHwOuwJnXOXZN
         jeygvS9Lzu1O6XUspnrsiJIEoqqfVvASibwaATzXWPuLsJmzDISQIB1lKL+CI/sysET2
         s2O0gb4wF6lP1OVDa24fup7uD+dBUsh7exh7T4OZHdz/EcNkP1rSH63dtp5Z2y6jG3IG
         gz5cihYT/y8xA1B+gtMpalT60/S2ifgpSLhMv9nbiW6u4mbl03VBW3nHAkrK/7wjO1mA
         uNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jq3NsLxt4IRxGBWkVAMAXg2p190bOg5Ogw6QsBDoe+g=;
        b=BxdZ9cwX9+eoQAc16iRRWsE8NJj8kDOEbkRudP0GDJTOgYd5p+XpXctNVglGjNsTAY
         1JlNJKNOD4BZGxnFhksETaexezcVc92Y/mxob7Fz2Oydv4CYEKoh4YBvkN7F2G1yQV5Z
         2vDtLWDH9XIz0sj4ijAEkVBynD5iq73Uuo4+BzOg5xBa4jH/pASNwPK7wusIhiqeBVmY
         xyf5i/dZ50IbFyl8P2WwplqY/R2eLQCccXa5erIhFGwv1P12H4/PQYBlFrzn2rpU5u5U
         eIuugWlhN20YdbEdC5yd70Tui+e1EtYHBADB3EfNu5/msVKFs/P4O6lZpIqY1Tbf8UqP
         SP0g==
X-Gm-Message-State: AOAM533NCQpjQEvaL5A6FbN0E/6uXRMjzZRXwaenP3dJ/AgYsm3SlB/4
        WJflHsRJf/oOlan3sLXbAUo=
X-Google-Smtp-Source: ABdhPJxYuz0f0E9jm12DDwhkXsT3gr3wWDNLhTNgAoZWkU9YDw5melIEzMc2IGz6ka+zQae752PzFw==
X-Received: by 2002:a17:906:2405:: with SMTP id z5mr5078334eja.170.1633607930328;
        Thu, 07 Oct 2021 04:58:50 -0700 (PDT)
Received: from fedora.. (dh207-98-202.xnet.hr. [88.207.98.202])
        by smtp.googlemail.com with ESMTPSA id x14sm8805729edd.25.2021.10.07.04.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 04:58:49 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] arm64: dts: qcom: ipq8074: add MDIO bus
Date:   Thu,  7 Oct 2021 13:58:46 +0200
Message-Id: <20211007115846.26255-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 uses an IPQ4019 compatible MDIO controller that is already
supported in the kernel, so add the DT node in order to use it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 3a56e38158a4..5f562444c838 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -267,6 +267,18 @@ pcie_phy1: phy@8e000 {
 			status = "disabled";
 		};
 
+		mdio: mdio@90000 {
+			compatible = "qcom,ipq4019-mdio";
+			reg = <0x00090000 0x64>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			clocks = <&gcc GCC_MDIO_AHB_CLK>;
+			clock-names = "gcc_mdio_ahb_clk";
+
+			status = "disabled";
+		};
+
 		prng: rng@e3000 {
 			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
-- 
2.32.0

