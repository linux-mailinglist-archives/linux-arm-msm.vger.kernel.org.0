Return-Path: <linux-arm-msm+bounces-11899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B985C2AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 18:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B470B281E97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 17:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCABA76C89;
	Tue, 20 Feb 2024 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JedIzxc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CEA76C76
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708450269; cv=none; b=nfh12dZKJLir+z4C/fsoEK16sAmVzNVosWXG9nR5lcmR7OyJJPOpjJix6Gn+iUhg1n+ApKH6FBSJyDm5zaRGXuOhe7kTXg5rfZJuApnlnX/firDjbZGtUiPqTCQNf4AD34xvC9CAAoZQKnIWxP1zIn9UQL8mWYtoBAJSb6YdTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708450269; c=relaxed/simple;
	bh=hx02bMWjni/BIqa32HymRwKbgZ45Y6W5eQY/go1X1so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dVZqeXFo5mOpZjvuidRBNKiETn4s0fC97QRVtrxIed80JUfJHKr4GmVgHuKsaoevoL7/zlyB90HHkd/7uw6HcAGl7Yhly5k+3nYH/ul2DSrYvItDBS+oQYaV6WAMxuZ1QI422bHOewhPwzxZsNej50p2jGvfR/B+qCI7GPoFLAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JedIzxc6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d204e102a9so73772941fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708450265; x=1709055065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTun3sjeHoZPuUA68W/Q0xsVB+hQlqb+IVl/9LKFQL8=;
        b=JedIzxc6avduODqdN4l3+h2poUwvi23qo7blM/3G8CfmVlxmTyajuAEUyoeBytg6Jv
         7/C8nZ9ZEL7z9tZjIUl9QtTAFBI9t2oXEGW7NbfHp2Hyn3XJWNYUShevgVH7LR1H4FuT
         Y4n1Gd4KYN9I5oneyi5CMqtLDRgT4rxe/pcOi+1e4L0A4FhXyg4y7EYMAEFVkld8xTbl
         hSWC7UDU7hc0uqDoYHhh5jxBaBBaAEi9UdZ29Nv5c0S1f2xbuDEVS+QoqbWBvRK06w+C
         fd7iozZ1DeffrBnAaYdr0XOQHw2Z2Mtmn8oDGLkMnR2+DKgMkMlO6UGltdI0PN0gFfrt
         86RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708450265; x=1709055065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTun3sjeHoZPuUA68W/Q0xsVB+hQlqb+IVl/9LKFQL8=;
        b=wc5xXJVDqGfDHoqRu/LPGPIiUBdPtExvu9jI3+sxTcyZPYnq7BG7qCwxgSRT/vnpmj
         RlCyFk091VnMgqiVf6Z8vYxAvzw6zBUhekYUd4aNLlbDuiEfF2NNuETkWnnLHfR4mcHt
         EHjpqS5TdexrOnjsS0WDcRm6HiPa/GYRyEBJlgNY7G/qwkwr5BpZ+S2XJX3xMghg+yFd
         AT41ZYYShPZrGbZqlbeJ8RUuv06VXRleS07JEDpgwvs8y6WOLdXwTsicETQSdxfil760
         K6PmwMqCQRR/zEeXy5UV0OvpiFrjETDvUSfzG2doM8PnALKoGx60xscsHh72gJypo664
         35rw==
X-Forwarded-Encrypted: i=1; AJvYcCU7MG7JgsUQ5NlunI4SMxbSTMzd+p0nrKdRYNhpooBxzR/G77YLZpdeQ7ROPoVahC+0l1XllhzhGL7l2invQ38TuSxHby5g79qOz0BpEQ==
X-Gm-Message-State: AOJu0Yyd2ua/krch1J9tDj1eY1iNwtq+ccSwo0Yy7Xx+gt6+DSgses8F
	43Tf7rtizPIWEPvUkuIgJZ69Sy3pdNhN9ZVguKThxRCW/ynsW4jX4cAjVHTYL94=
X-Google-Smtp-Source: AGHT+IF6Im9KKVZF6BrPLUUt83T7OwbOQ3FD2cFzceJ+n1jrzoKNH62XjIkgG0CkuvB6WON7bbYxkQ==
X-Received: by 2002:a2e:9e10:0:b0:2d0:e331:8d2d with SMTP id e16-20020a2e9e10000000b002d0e3318d2dmr10769775ljk.37.1708450265047;
        Tue, 20 Feb 2024 09:31:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020a2e9584000000b002cdf4797fb7sm1585042ljh.125.2024.02.20.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 09:31:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] arm64: dts: qcom: sm6115: fix USB PHY configuration
Date: Tue, 20 Feb 2024 19:31:04 +0200
Message-Id: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adding Type-C support for sm6115 was misapplied. All the
orientation switch configuration ended up at the UFS PHY node instead of
the USB PHY node. Move the data bits to the correct place.

Fixes: a06a2f12f9e2 ("arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 42 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index ee65ab073ba6..b344f6f6d556 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -884,10 +884,31 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
 			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+			};
 		};
 
 		system_noc: interconnect@1880000 {
@@ -1213,29 +1234,8 @@ ufs_mem_phy: phy@4807000 {
 			reset-names = "ufsphy";
 
 			#phy-cells = <0>;
-			orientation-switch;
 
 			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					usb_qmpphy_out: endpoint {
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					usb_qmpphy_usb_ss_in: endpoint {
-						remote-endpoint = <&usb_dwc3_ss>;
-					};
-				};
-			};
 		};
 
 		gpi_dma0: dma-controller@4a00000 {
-- 
2.39.2


