Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102E62F4E5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 16:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbhAMPTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 10:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhAMPTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 10:19:21 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4739C061795;
        Wed, 13 Jan 2021 07:18:40 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d26so2491564wrb.12;
        Wed, 13 Jan 2021 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=buvoavmYOHI9w2BN+lc90FsvqFASt4TOUzghq1I5hag=;
        b=QeuzpIgEG4bzmJrxxKhg7bzeQXGNa4HJ7ZhKZI7UY0X+bcKUyvYb84npsgpuqLTNs2
         Of4oMbzi8IHI0MsKwkTK1TfuwQKA7T3k8DPxkVP0WTBDzWZUGK04gaCZTNZUZeYP7Pvv
         zRYLrmEglMjV0r6JJf+hU6ODwFPE4zeUf+LjeSjVLX+g5YJfpixwLqFdLF8KVc8zvIYD
         LHbFEDAgvtnEX37/VRWmCfkz1U594xyDTMPt1o3cFFbcYv2BdDweMPQpahg1E4hTiJbf
         jgaNPFHs5orGcXqCRwarcpF0uOJtneAeXc7P7VTcxh/e7/WhMLgxh2AvjdGMbVYrSDck
         O5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=buvoavmYOHI9w2BN+lc90FsvqFASt4TOUzghq1I5hag=;
        b=isFZ6+SZM36oL5ZIcUnIMUi/1yfJ+ZVFtAjDeiaW0sRqygnjY/rUQNnc/T/RcaIuIb
         /9G8/6LWwDgk32IeexPgGviwiiPsiFcI0zy2eevW6fO14vgrLoSnazYjle8mUb8jfvJ1
         fK4MHz7iZggF6yXf4EuPBhuH5yOk9C+Slg1c/ue0pmnXkCcxtCi/3qtBdAW97TeYS3Bd
         gDTzMUyvJa/71fM4BXpNJ6+0RNgLRDSTMRrHxps2DFsld1YbQElrxS52eAKjU5MmU7Hc
         HVzowVGq8aejwdQPTHFGtSCBjuYK/oK4bXJ9hBQMMX4uTkb0iYRrAVs+DvQCdBom7iFs
         fuWQ==
X-Gm-Message-State: AOAM532PWjyM+SJVcmyIy6nC6o7QbBGRkwSHiNvaSPnH5vKrNXhF2Y/D
        vISs2M2+jvLjKe9aavIXg9UHgdzSpat4AEs3
X-Google-Smtp-Source: ABdhPJxma8ZGCirjJ6qTe6/JQexkVP7IPmDz9OamVHqmcsCQrOez94lfF3qdK4Uky5l7iDwJ/V++eA==
X-Received: by 2002:adf:d20b:: with SMTP id j11mr3068088wrh.318.1610551119156;
        Wed, 13 Jan 2021 07:18:39 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id w1sm3890553wrr.84.2021.01.13.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 07:18:38 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: pm8916: Add batt_id channel node
Date:   Wed, 13 Jan 2021 16:18:08 +0100
Message-Id: <20210113151808.4628-3-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113151808.4628-1-jonathan.albrieux@gmail.com>
References: <20210113151808.4628-1-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Working on a battery charger and fuel gauge driver it happened to
have the need to read from VADC_LR_MUX2_BAT_ID channel. Here is
the declaration from downstream msm8916.dtsi:

	chan@31 {
		label = "batt_id";
		reg = <0x31>;
		qcom,decimation = <0>;
		qcom,pre-div-channel-scaling = <0>;
		qcom,calibration-type = "ratiometric";
		qcom,scale-function = <0>;
		qcom,hw-settle-time = <0xb>;
		qcom,fast-avg-setup = <0>;
	};

Add VADC_LR_MUX2_BAT_ID accordingly.

Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index a7663bf867ec..854e51883289 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -95,6 +95,11 @@
 			adc-chan@f {
 				reg = <VADC_VDD_VADC>;
 			};
+			adc-chan@g {
+				reg = <VADC_LR_MUX2_BAT_ID>;
+				qcom,hw-settle-time = <2000>;
+				qcom,ratiometric;
+			};
 		};
 
 		rtc@6000 {
-- 
2.17.1

