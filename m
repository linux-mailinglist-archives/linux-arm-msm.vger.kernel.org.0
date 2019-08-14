Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5FD8C9D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 05:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfHNDJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 23:09:47 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34479 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfHNDJr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 23:09:47 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so46098963pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2019 20:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HT5agnFB9Ua1f+HiJVMbjVMLi62oFKHY9sExG5RcmRA=;
        b=iolgrg+yXRNATYsbEOlu9D72Y6cuxWB1oF5q6TXekIkX8mRpEK69FdqiNFv7XLjA+t
         FcGQ/WsyRg41D/BOnJQYjxSQgmko05AoDrQP8l7PRwVl3zym4hrqsRdFf/C5NJdKmsX7
         GZ2P20Urso3DH3FtiPIJArW43M2VOidJwP1fvmpZusTymGcOa/i60G3smXH+F1/miznf
         3QsZV4UthI9GdIyw26ruyfIBbZ0N/faj+B/5VeUhED07B+AhHEdLce+Nzuahj7O4xDG8
         Ff1sKUAeEmJL2mQ+1/OMUBZSm4fHnJw2ydQ1XD5QzHBVi1DI4NPaFbhBCeCAO6AQvivo
         v6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HT5agnFB9Ua1f+HiJVMbjVMLi62oFKHY9sExG5RcmRA=;
        b=aXuHty/96ykMU+J3rwAEoF+Jc/h9BSNBpqAIiQdd2wCmSPwSxY5T9oYn34vPCPqYuP
         ISGBs+bR7Iay1vHdIu7z7r2LU5AyNjiiG5eJV6Il/biULqaHHA47Ym2B5MUxhFF7GkgH
         4JzILNHe8TqeVn+a5PugpDJHacDeVfaoFsg065M9Lyl/uGeLNADzAYSp1mkHDQpO7bpt
         +dYf9LSuO/ZS3tTd4L2AyDuG62lLWGyv8rWuQaJ6o2z4cVHwt85cFQ27m+jRB9DiNRB5
         NeUPYYhIPqRcdeIaFl9Z1NhDCn5YQDNlfOvOmxT3ZDAuwCyZ+6zoQRvbeL1fZ+flC/mf
         apNw==
X-Gm-Message-State: APjAAAVHQt8SNVxWc+LHcBRIFXkhLqjW49UxpDX9/rKxr5zJV7IbGcwk
        7a3it2XYbMYkSJk2fgvMMKuLMw==
X-Google-Smtp-Source: APXvYqyF1tE3QKOyyK7LvQGdigD6LOt/gywd4f3eQFSrL0cCzGCl9LSpCTeL5FSziRSrw3Bo/+rhjw==
X-Received: by 2002:a63:e948:: with SMTP id q8mr35922012pgj.93.1565752186336;
        Tue, 13 Aug 2019 20:09:46 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u1sm106170929pgi.28.2019.08.13.20.09.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 20:09:45 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Mark WCSS clocks protected
Date:   Tue, 13 Aug 2019 20:09:42 -0700
Message-Id: <20190814030942.2638-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'7d0c76bdf227 ("clk: qcom: Add WCSS gcc clock control for QCS404")'
introduces two new clocks to gcc. These are not used before
clk_disable_unused() and as such the clock framework tries to disable
them.

But on the EVB these registers are only accessible through TrustZone, so
these clocks must be marked as "protected" to prevent the clock code
from touching them.

Numerical values are used as the constants are not yet available in a
common tree.

Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2289b01ee9f0..501a7330dbc8 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -61,7 +61,9 @@
 	protected-clocks = <GCC_BIMC_CDSP_CLK>,
 			   <GCC_CDSP_CFG_AHB_CLK>,
 			   <GCC_CDSP_BIMC_CLK_SRC>,
-			   <GCC_CDSP_TBU_CLK>;
+			   <GCC_CDSP_TBU_CLK>,
+			   <141>, /* GCC_WCSS_Q6_AHB_CLK */
+			   <142>; /* GCC_WCSS_Q6_AXIM_CLK */
 };
 
 &pms405_spmi_regulators {
-- 
2.18.0

