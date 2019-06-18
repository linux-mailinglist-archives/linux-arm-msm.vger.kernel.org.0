Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A304D49A1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 09:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729006AbfFRHOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 03:14:04 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38013 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfFRHOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 03:14:03 -0400
Received: by mail-oi1-f194.google.com with SMTP id v186so8301027oie.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 00:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qy2FdR6Glct2vKzJvpmQSCzJgy5iEEmaOujs7pDw8GA=;
        b=txKOyGl5liwOrHwHqS2y2mJP8cEAM78gyygiX00CliWDz6qGxGNqNLaI0IG40Ubte6
         dwib17D3CUTO1QHXmNrenNhpQbKksG1Xj4A1LymqmiYp9wnKSadK5xTbq++TY0KawAqy
         rNcolgypU2uUX7pP8cL1IuKBcQGL6a8/YpZ+Rl/J3iqLapjNb7ckxwQLjYPQC9PHx14G
         YJHN86dCj3jNpF8cMN3j8pMStWU5BMB/O3bZwJhogFpINSwsByfimmbiQhw4UZguHOiB
         PZFTKn89HPPYhDqP2v+E90CW9K3tTpUOazXAtiRlnXwJiy5P38/Jr0A3RzYpIeOpAvgY
         IAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qy2FdR6Glct2vKzJvpmQSCzJgy5iEEmaOujs7pDw8GA=;
        b=TlXV59qTChw54IX7iNQMgk8yKtEqcTBowN+LUVuMNhl4qJl1DYvGBC4X5qc8WQkpFB
         pnBe/GDgKTmOgCIlMtHaLKwDDEtcKyNSdnqWcCIl6u1X0piPmFOks8khzfElivZkJbyy
         g+I2uI28svGGPNhVg7BRO9u2AwfPaT9N4EgCclz2K1O/iSXUfMVZaU34ZvCPYWuogVxv
         Tfs0GLsw2n0CaXaOR6j43La48PqnHX+YJS79EJe8ov7y6dmQqnJxnbfuFtZJl9JzXbhc
         ORIrpNgqKGBzFfMOh1X9EaHJ5i7zgdTYMI+AwL+rLtlHf8GyTMOSfFWplz6TCjbAuXxK
         BlxA==
X-Gm-Message-State: APjAAAUGhnFic7nES1lqEEJqToIYjwJWe6vUVyKx/hB7FmhGPB/ytuor
        gMsYh5wYKjUgG2XY67vdy83yqMLPUbQ=
X-Google-Smtp-Source: APXvYqwabpjxe1V064XCNOyWH8q4caObRzcly+FAT/rfy5W97dlFHwq5/HtzdJi92MY/4evDYT1X7g==
X-Received: by 2002:a63:224a:: with SMTP id t10mr947130pgm.289.1560835550760;
        Mon, 17 Jun 2019 22:25:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i133sm10011704pfe.75.2019.06.17.22.25.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 22:25:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Correct apr-domain property
Date:   Mon, 17 Jun 2019 22:25:47 -0700
Message-Id: <20190618052547.32376-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The domain specifier was changed from using "reg" to "qcom,apr-domain",
update the dts accordingly.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c934e00434c7..1a139cfb240d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1831,7 +1831,7 @@
 				power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
 				compatible = "qcom,apr-v2";
 				qcom,smd-channels = "apr_audio_svc";
-				reg = <APR_DOMAIN_ADSP>;
+				qcom,apr-domain = <APR_DOMAIN_ADSP>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-- 
2.18.0

