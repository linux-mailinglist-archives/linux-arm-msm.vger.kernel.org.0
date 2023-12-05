Return-Path: <linux-arm-msm+bounces-3461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D29805790
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 15:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 661EA1F216CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 14:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A12765EBD;
	Tue,  5 Dec 2023 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u6x3hn88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5959F1BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 06:39:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9f42ccb55so39895771fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 06:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701787148; x=1702391948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+ofOOqwlUZnjaPwU1R/ES77wt7OX5hZOTqDiest6VM=;
        b=u6x3hn88iZxYsicP0yAPRZx4cFz0kT37XCKZiD5i/5d6FajUhqe7nexqWcJSmkZOXY
         P+noi28p7fdMmloaHPY/GvmPcWQ9BiX4XMLLzz1I3JrC8PXQy/nrJ991s3ygu/sCTwA4
         buPKq4LabNaALC9UYOUmA2CPDI/2CiNJ6tj96aP7sW0npkjxWLXQYPYJqFwTzzRtK6B7
         2D5/wSqqFviYRWHTpF2yEhnfqaZvRgQuBFTyvxSAW+r6ztbtZgkGh06H5EQVS0w3gx3L
         zamK2cXpwyiBJrsuc3cJI7u9poyFNVIqtIUu5J0uAuSel4GMbKBUA06qZCaUH+88gnsy
         a/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787148; x=1702391948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+ofOOqwlUZnjaPwU1R/ES77wt7OX5hZOTqDiest6VM=;
        b=kcu5jRauvp4+vbTTFVj8mLoA7pRCd6Ao7XRsfU/rOTT6+pkmM8wdZh8iIjVH6YMAXG
         2JajLpoWS06gUiaBI2sbWYmq6nBoJvHOfWXXbCn4lP1lla0gO0oLMRmsHYt4/ovoI8RC
         oCrmUMWSv9ArJsWTV0bmubX7FJXQM1+keXfdbE0SEdMJpOwb+Zi9fB9xE/SOSZLehFnC
         HvhnR8tfrOXvvlIr5xjjKgE+WI/9ikxO/iT6UZ+Zlr6rCHuozrHrjHXmqPNPFX3cfbZ7
         gs3SWWQ7s0xaaLrvdpNZgc5hxneXh5B3sCKGuW/ZAJZ/2B+/hY4+KBZGvTU6O9iEJnyz
         WKLA==
X-Gm-Message-State: AOJu0YyBWBV8z0NAvn1B3rUbB7AINyd6neOQnhs+GKvfTzRXtPCDW3Nc
	8merEmL0qFZ4ckZygSc9wXRqUQ==
X-Google-Smtp-Source: AGHT+IHKyGeqSHI4C76BFrpUe9AY2vCsFYb/QFgG8MWHMJLRWg3u6lh9YniJPF17xPkIOvhuOE9RlA==
X-Received: by 2002:a2e:9b14:0:b0:2ca:1ea:4b20 with SMTP id u20-20020a2e9b14000000b002ca01ea4b20mr1744004lji.8.1701787148330;
        Tue, 05 Dec 2023 06:39:08 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id gq18-20020a170906e25200b00a0a8b2b74ddsm6795404ejb.154.2023.12.05.06.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:39:08 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 Dec 2023 15:38:56 +0100
Subject: [PATCH v6 3/3] arm64: dts: qcom: sc7280: Add UFS nodes for sc7280
 IDP board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-sc7280-ufs-v6-3-ad6ca7796de7@fairphone.com>
References: <20231205-sc7280-ufs-v6-0-ad6ca7796de7@fairphone.com>
In-Reply-To: <20231205-sc7280-ufs-v6-0-ad6ca7796de7@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.4

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Add UFS host controller and PHY nodes for sc7280 IDP board.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 2ff549f4dc7a..a0059527d9e4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -499,6 +499,25 @@ &uart5 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p9>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.43.0


