Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C30E3D0A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 10:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhGUH1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 03:27:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35401 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235562AbhGUH0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 03:26:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626854801; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=q0KpZYT1es/gzQrLxHYNUttthRrhNMAwcXeE7+pQsSw=; b=DGFHECg2DO2CEsgFgk0zHkySzDRZQCrmuEN6izZuI7gMuF1mgVF9OSNJVkChZwrf9XpNk9tl
 k/Z00NXHfD8XLKNJVarW/xTGnjbqnqwucDf+t3s1fLbLtoAxxtHLtZc+y2R6CLCn58SFIefR
 mzawn3l8l6Ap+Xh8pRW/Nr/u/xw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f7d578b653fbdaddecc2d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 08:06:16
 GMT
Sender: srivasam=qti.qualcomm.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 72476C433D3; Wed, 21 Jul 2021 08:06:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F28C1C43217;
        Wed, 21 Jul 2021 08:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F28C1C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@qti.qualcomm.com
From:   Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI
Date:   Wed, 21 Jul 2021 13:35:49 +0530
Message-Id: <20210721080549.28822-3-srivasam@qti.qualcomm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210721080549.28822-1-srivasam@qti.qualcomm.com>
References: <20210721080549.28822-1-srivasam@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Add dai link in sc7180-trogdor.dtsi for supporting audio over DP

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 31bf7c698b8f..a4cb9ee567ff 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -288,6 +288,7 @@ sound: sound {
 			"Headphone Jack", "HPOL",
 			"Headphone Jack", "HPOR";
 
+		#sound-dai-cells = <0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
@@ -314,6 +315,18 @@ sound_multimedia1_codec: codec {
 				sound-dai = <&max98357a>;
 			};
 		};
+
+		dai-link@2 {
+			link-name = "MultiMedia2";
+			reg = <2>;
+			cpu {
+				sound-dai = <&lpass_cpu 2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp>;
+			};
+		};
 	};
 };
 
@@ -768,6 +781,10 @@ secondary_mi2s: mi2s@1 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
+
+	hdmi-primary@0 {
+		reg = <LPASS_DP_RX>;
+	};
 };
 
 &mdp {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

