Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F6417C488
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 18:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCFRf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 12:35:28 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40825 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgCFRf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 12:35:28 -0500
Received: by mail-wm1-f68.google.com with SMTP id e26so3225089wme.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WS5qP7u179kr1Njq7EkS/NTh8wj2nrebtcRy9YLG5AM=;
        b=xqb1RQa1vV/JpLxiSLR2hKbooAcmc5K7LzW6is/TWIiJh5PJMNaBIrqeBffujewk+N
         f9bvlSOzPW33HMXvx5p8hR4tYADGUoW3iWgTd6Afn9KLIZNOYFZtxjKC4hs8o0Vux2bN
         y9IggIL8pIWAtisO+HFrwCtu0nKt5ccL5+C4CfDvvlH6wVR7/SoTEwMttW79V1wOIStU
         eHp2Bz9d9RoFxE4i7oz7eUp8hawIj1h1sN4kH5GcckTEvZftJ7qIVQCQLZjxIIb/J2fE
         lPWT5fht7mQYY8ya9SWQ544cqTmyT8XY0v2z6U3YOGolgm+T8bbGe5/vwsL21TOzNWam
         r2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WS5qP7u179kr1Njq7EkS/NTh8wj2nrebtcRy9YLG5AM=;
        b=smD/rJus7fwcrBieUDmD85uX757KL3UDxFzZTUPW7V8GJZcA77IB/YSieJW8JVMjTR
         stQFSVMOmaq0itwpl1cOzarb/u1SGgIeWP5gCsyRXkkCPor0QrsLkqugFmdkJBZINKuN
         iXwDENsPgzopwWMcwsYhtL+hxr14MBZ5x+OU5zI2tutOnYWyGSywMoPcY0fy/Jlrd+mt
         H0iW1QQfN5pC/GEsLv5/ohdNGo0/Uwu4hE34I50xB+yGz5J/+rJBKIZhabzzY+h8bY8r
         6c4PgXxWsGorMHDfocSrbw6NECJs1m4DQTGQswJyOliQz+Ov6JXB24yKLkm65e6nikE1
         eWAA==
X-Gm-Message-State: ANhLgQ0OLP0WA4Qjsbp/mTTsPht7j2KnrObJZez/eGX9H/VGLI8LBgHP
        aRj5VRyl1UCuJIIO8NK3WXQecqy8KD4SJw==
X-Google-Smtp-Source: ADFU+vth7yPk2DKQyFrQ7Es+IHfczBeUFgRvq5t+7zeM0jYvlB9HNo0+cxp/J5TSEQ1MxQwRYLi3CA==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr4814629wmj.61.1583516126739;
        Fri, 06 Mar 2020 09:35:26 -0800 (PST)
Received: from localhost.localdomain ([172.111.156.149])
        by smtp.gmail.com with ESMTPSA id u11sm1746505wrb.10.2020.03.06.09.35.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 09:35:26 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arm64: dts: apq8016-sbc: Remove wrong regulator supply
Date:   Fri,  6 Mar 2020 18:39:28 +0100
Message-Id: <1583516368-29593-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As specified in the smd-rpm-regulator binding and confirmed by the
pm8616 device specification, there is no vdd_l5. l5 vdd comes from
vdd_l4_l5_l6. Fix that (though it does not cause any issue since
the supply is not requested).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index e12a36c..0c36758 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -561,7 +561,6 @@
 
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
-	vdd_l5-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
 	vdd_l7-supply = <&pm8916_s4>;
 
-- 
2.7.4

