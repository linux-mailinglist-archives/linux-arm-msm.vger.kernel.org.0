Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E58351324
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 12:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbhDAKQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 06:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbhDAKQ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 06:16:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40538C06178A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 03:16:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v4so1225233wrp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWZ1dm6MzrhWKHD7bNxGPdRhKvoNcVvYyX/JddpXpKk=;
        b=IaEpg+qc5+I1Ploag/Tnb44OVlvHE2DjFc0u5MphHsIeVkx8oBXH1R5OJwNZ2Lea6z
         iNbIObJI8NfhxSKoU/oYyWq7awb7X3QK/qfGSYcohewAT3nec8RVr35EqA63HxsKlvdL
         ZShPaOm9ZEQddQsl1o8UavAYg2P4C9TbcbzohWKIESpHLlzSONV+HIb8YZBlCzsosK3w
         pYEeZPKE4DK3KKjZBGvJ33JcmbXg/ypJhqMkHrawkqkd+4GbDCfBCC0Dpoz+E1++ODWB
         Jki4D08WCOdWhglmi7QS4AYjb2PmJbRlHNbXAPIKQ7gVK8lvvQyQY/opPnmd05TEgnCX
         uqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWZ1dm6MzrhWKHD7bNxGPdRhKvoNcVvYyX/JddpXpKk=;
        b=PHD/+VK7iaftPR62pXFAHOEkm2kRssNBCcX0Zqwdq/qEgSGi41fD91k7FKBVj1JvRy
         LiXS/w14ONYz14BijLDlogQWp3ksLbi3T8+UZteLF5bziwJFATOBBU2xCatQ7R+FFXv7
         IX57aD6lP3QAZJJTBoSd7eOcNWfex0GqAH+B8fVNDJL+UvyC0yyR4gFHHpS47gR6tsRT
         AUfuYzipCUD5QXPKBNqRfKIkUsQradL85EqC15b9hOPoQThTKGTVqT2JM1S2nqaRZVkM
         k5woo5vuuRHoygkxmdWU+FQ6AtXfVDuEkcM7lvTxJGNemeZqGKkjrhoLNZjnYw1o6QUU
         jR7A==
X-Gm-Message-State: AOAM530SQ3jYegduBCotjRipRxZdqOmka+dhw6A0sraQxbJZ5QSyXjGQ
        AV5UisbfJ9DkPV6aTcn3KM2IjeLi6h/zNA==
X-Google-Smtp-Source: ABdhPJzgbae8sgkPuQaRC8n/HXPy7x6jNs1SbaYdFOeKUM2mYf8arZ2j8/nDxxLlyDlp66+tln2zFA==
X-Received: by 2002:adf:d1e1:: with SMTP id g1mr8284771wrd.287.1617272184056;
        Thu, 01 Apr 2021 03:16:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:6b57:bfc9:d5e7:1a80])
        by smtp.gmail.com with ESMTPSA id p10sm9586534wrw.33.2021.04.01.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 03:16:23 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1] arm64: dts: qcom: sm8350: Add support for PRNG EE
Date:   Thu,  1 Apr 2021 12:15:36 +0200
Message-Id: <20210401101536.1014560-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.31.0.30.g398dba342d.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RNG (Random Number Generator) in SM8350 features PRNG EE (Execution
Environment), hence add devicetree support for it.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index ea285147e43f..2a3ebf6964f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -673,6 +673,13 @@ tx {
 			};
 		};
 
+		rng: rng@10d3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x010d3000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_HWKM_CLK>;
+			clock-names = "core";
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.31.0.30.g398dba342d.dirty

