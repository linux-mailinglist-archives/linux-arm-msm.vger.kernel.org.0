Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A1E27E188
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 08:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgI3GnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 02:43:18 -0400
Received: from z5.mailgun.us ([104.130.96.5]:59842 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728161AbgI3GnQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 02:43:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601448195; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BksGRekznmzNQtnZP1AJnOQNKpw9uYJqgj+UFQEjtFE=; b=fXUe6ddYIS23c9m8P1Uqk5tz0D1ZUGc5iulZjwh5PaZbmr/ToK/GNWbynIea4T9DyL8Yd99S
 F+EfVx2HTia4lQDu84sS0sPTBkaH0KuN6Pz5psuLmgYntLvbH54xO+FpNh1k6Kpc1kYIf6+J
 E5WTXjsuXKvRYWxW2dqJYPZCScw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f7428fe1fdd3a139062a938 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 06:43:10
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2FFCC43387; Wed, 30 Sep 2020 06:43:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61BB2C433C8;
        Wed, 30 Sep 2020 06:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61BB2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI
Date:   Wed, 30 Sep 2020 12:12:48 +0530
Message-Id: <1601448168-18396-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
References: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Add dai link in sc7180-trogdor.dtsi for supporting audio over DP

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 5724982..850b43e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -231,6 +231,7 @@
 
 		audio-jack = <&alc5682>;
 
+		#sound-dai-cells = <0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -257,6 +258,17 @@
 				sound-dai = <&max98357a>;
 			};
 		};
+		dai-link@2 {
+			link-name = "MultiMedia2";
+			reg = <2>;
+			cpu {
+				sound-dai = <&lpass_cpu 2>;
+			};
+
+			codec {
+				sound-dai = <&msm_dp>;
+			};
+		};
 	};
 };
 
@@ -782,6 +794,9 @@ hp_i2c: &i2c9 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
+	hdmi-primary@0 {
+		reg = <LPASS_DP_RX>;
+	};
 };
 
 &mdp {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

