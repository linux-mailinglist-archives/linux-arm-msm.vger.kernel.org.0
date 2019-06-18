Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493FF4995C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 08:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfFRGv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 02:51:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40487 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfFRGv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 02:51:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so5294724pla.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XxKJMd1N/7H2JNZBrL0GjfLdKt5XA0nEjEVfgW6l7ug=;
        b=Jkt/1rMftJP6m6z7TQi0Lj1ts9T3Bnft1lLH1k2/Owsf4O6uyB/NJkikR2b6Q0tUXr
         1kDMpWHVWBProI1B8MbJAdCZEcEfO/Y9IG/ZrI7gS4taTpy1gBOivJvCRfWR0qC2XOxe
         BPPsOVw5JyWj75xjUV7B5MdRajEhBAT7mVVSX9U5n+QPQ9SLfGWzGlcqPO2fGJ0X29Zc
         fKA7I8t6MkanAjFWFHIbB6v5pr8oYDzMF6lI2BuxrqIi2RD1DhZad0R98LZ8/9jYXA98
         H1RLSvZy5PSNx4VTR0BQWFaUKkTkruE7bG6+R4oeNcqymIzPx/SPutl9YlXg+2GPBauk
         lnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XxKJMd1N/7H2JNZBrL0GjfLdKt5XA0nEjEVfgW6l7ug=;
        b=eiMyVsA8SI1nKpjGdQix7aGbFnnvRRbfBTTqeia16oOXCm1F+TywdXSzl0dnpqTlO+
         AVPtfNJEE3vohoz9A0dG54W0ryzJk5aY8zxkzwgmBNXffUGN6mGPGaJVBttTZfs9gttg
         eG0E9s9duvyX+8biuuXjpjNoso48nIv3nWn98kBVIcLzoKzMgBuhbJCLVFU0qth0UBbu
         2qPzX+kniYbXk3b1+aSOJ2blpG7iYCJwHpzN5E6SxnXOtCTFOlh8BGLbulmktCp9Nsb2
         fqlxUftn8+IQEO/PSePJWny9c5vZO4b280qoK1NdFjsQJWfG19XDq9GzifUSiXZLJ7lc
         OBgg==
X-Gm-Message-State: APjAAAUcfXIuC/kLMTBOnjqgxwDptEFaHH8eUF8UjUkxn6tubNfXPiJO
        1P7MfkGoMMB5OZez0iIf3gPOElVEXlQ=
X-Google-Smtp-Source: APXvYqyC9+nnRj/+oVT15o3AC/A4OCdMwP0JLaEdRTbNBGjixQ6Fv5rz5PMgpGflDjfBe/pKedGKIw==
X-Received: by 2002:a17:902:d897:: with SMTP id b23mr22622007plz.214.1560835430352;
        Mon, 17 Jun 2019 22:23:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j2sm16457065pfn.135.2019.06.17.22.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 22:23:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Enable SMMUs
Date:   Mon, 17 Jun 2019 22:23:46 -0700
Message-Id: <20190618052346.32239-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable SMMUs on 8996 now that the WRZ workaround in the arm-smmu driver
has landed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1e3143c4fe8f..2ecd9d775d61 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1177,7 +1177,6 @@
 			clock-names = "iface",
 				      "bus";
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		camss: camss@a00000 {
@@ -1330,8 +1329,6 @@
 			clock-names = "iface", "bus";
 
 			power-domains = <&mmcc GPU_GDSC>;
-
-			status = "disabled";
 		};
 
 		mdp_smmu: arm,smmu@d00000 {
@@ -1348,8 +1345,6 @@
 			clock-names = "iface", "bus";
 
 			power-domains = <&mmcc MDSS_GDSC>;
-
-			status = "disabled";
 		};
 
 		lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
@@ -1376,7 +1371,6 @@
 			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>,
 				 <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
 			clock-names = "iface", "bus";
-			status = "disabled";
 		};
 
 		agnoc@0 {
-- 
2.18.0

