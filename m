Return-Path: <linux-arm-msm+bounces-109169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOKaHrzzD2qXRwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:12:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E46685AF674
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADCCC3073736
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8969819CC0C;
	Fri, 22 May 2026 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/jJTGtL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD3F382F28
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430065; cv=none; b=kDthCjnIeGULJ2zWP48K38mdh7EKzRfuIsqmzadnTyZaky6wsMoTSPJHPbhWsoh0kEy34461So22QnLAh4bcOqoMprS8DIubRrYnM0rWs2voV6zyxRlXAXW4GAdywIegxHOvs6Dxo5P+1n9mgC9Ts8j/OKvpnXFU4FYiJ+D21us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430065; c=relaxed/simple;
	bh=tCgf4Nxi5GVQmf8H0tRvdS3R9HxkfuZfIUdm9ZjkiPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyriiOenrmzuAgbBl1qNdvxxuJhHjctiggbMcnS+vhfhppYZ438bIf7vEvjVd1UvPIXUGYpHZx19BszPkZLJdAWBfunZLrjnotDjAej8uwACoAEA6NXO7AAGTV1Bp3EP1KGanHMa48judg6aLGs0TMHQTyOqB1tJnRxpSin32vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/jJTGtL; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so4051495a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430062; x=1780034862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtlQB08OaLofyAigz7tBTikvmBp8Je7frCtpNBxUmSE=;
        b=p/jJTGtL3ye+b9h/sg5DRBBTWW1e5ceeLveeN/YUaOs5S13XotJ4g+QUBax7ZPqeOl
         AxVXQD4ThW0lrhic0EuVq27VI6TLwACIrm7ZESGgF3ewTzXxQV9BYqEAEp6v5r3NhSR6
         JUVyTtRu2CySeZmUNjKr+jsOUnR0ZyfOe+65sQmxfvX90gP1B724dMG9MyWM8VF4wxwd
         NPu+HaLUTcl8jrbet/R6FfpuQRzqWNS8ukzFC53a1BLjwpjyr9SAZ9mXrWu7eDt5gObM
         p8X5IO+3r7mkAWL3VuqqqdUF9nlWvIi95IIAg6eqJp9vjQtF2xQC57JMzNgkCJojnuKa
         cC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430062; x=1780034862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FtlQB08OaLofyAigz7tBTikvmBp8Je7frCtpNBxUmSE=;
        b=GK47fUFWL4VM+1McymjTs8S/h/36YIAiPvEswznfj3Jo3GjBZeKAjhzM5YZmrc5AaF
         zTMEu3iQr2un8Odoi0gslEn6QaGfAA87Kxc/VeS/B0kRslIZUxvvHKqaXFj4jewT1BzG
         RjhBvHvvv0fIhK6k4XM9aQ41NLOIsfWAAUuzXhEdPCXH1MqEDPakKqjXi+kEegCIiz6e
         Ra7OV+DeGaZG16l9t58BiWDEYxMYQTfHdW0+pDd5Fdf31F0bM3kpvM0OrBQMl93OQebi
         NNsOWEPBL4aqN8rTi2ijkesyawe2pqTmuKnWt4ICi7VrMC26oHeUFl6ZfKvgDuh+gRdQ
         U4Wg==
X-Gm-Message-State: AOJu0YyW0EnemOtREOHfpMyceeXKjl5q7FANmLcXQb00jmjD5HW/6Bbx
	aZ604TYn7/7xlFYNKtS7qaBqXKIUgbwpiG7rojkDNvstGTRuR8lkq1IHFsCiijLkN24=
X-Gm-Gg: Acq92OFc7j07F0XYr8eaq/GC159HPETlOhUDd+8zixqT7LtDSK66b5Ih8aPrf5/DYZ2
	GK60nSH4ty5ZJPp9da7SmPuPKgZapiqXw5EMlrvMXoFcI1hMULvv5lFW3nfyrpLoEdidi0GjXiH
	1MzxZg5nUFsgKGJvb9gvfGtWejOGLNRgxQ+CEMIif1w9lcvgRET28fAo9a/w2UrawSVq6z2rl23
	UpzPJAPTZkJZDdypYjYyCYQpYjGqBi2z7xMP4cyi5BDvGVz/CvFYUKHwF/Uar5YP/yCiT6JLsWj
	wxxQ+62L5GBQ1ugnXhp8/qhLdibBmHBvgM/RLBC9z2sidVtmVrmPfYojF/iciKLLGYWdxyrdcvn
	8HKiBcd2OWAUaJel4EwB6EaBvj6/OmtA2xLjasTyENWkXQvgq/8z41h6rkYijReGex+plfC6i3w
	7FwnX54udnGVaYx+peoIWKIiwUTsY62ujaKPZ5EShrhOZAeARKppmyITI=
X-Received: by 2002:a17:90b:3dcd:b0:35f:bfdd:f5a1 with SMTP id 98e67ed59e1d1-36a677fd1ebmr1992255a91.13.1779430061997;
        Thu, 21 May 2026 23:07:41 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:41 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 5/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable GPU and display pipeline
Date: Fri, 22 May 2026 18:06:44 +1200
Message-ID: <20260522060645.4399-6-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109169-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E46685AF674
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the GPU clock controller (gpucc), GMU, display clock controller
(dispcc), and MDSS display subsystem.

Add DisplayPort HPD pinctrl state for GPIO47 and wire up the DP output
pipeline through the RA620 DP-to-HDMI bridge. The RA620 is a passive
hardware bridge requiring no driver - it converts DP to HDMI
autonomously. Add the dp-connector and hdmi-connector nodes to complete
the display graph.

Disable DSI, DSI PHY, eDP, and eDP PHY as these interfaces are not
present on the Radxa Dragon Q6A hardware.

Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
connected to an HDMI monitor.

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 4003837ad..e8ad6e666 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1113,3 +1113,88 @@ &pcie1 {
 &eud {
 	status = "disabled";
 };
+
+&gpucc {
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
+};
+
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio47";
+		function = "dp_hot";
+		bias-disable;
+	};
+};
+
+/ {
+	hdmi-bridge {
+		compatible = "dp-connector";
+		label = "hdmi";
+		type = "full-size";
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hot_plug_det>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_dp_qmpphy_out_dp>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi {
+	status = "disabled";
+};
+
+&mdss_dsi_phy {
+	status = "disabled";
+};
+
+&mdss_edp {
+	status = "disabled";
+};
+
+&mdss_edp_phy {
+	status = "disabled";
+};
-- 
2.53.0


