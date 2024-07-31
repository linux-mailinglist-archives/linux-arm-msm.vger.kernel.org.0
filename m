Return-Path: <linux-arm-msm+bounces-27488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7119942689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2C228220E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1937B16E88C;
	Wed, 31 Jul 2024 06:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="k2lFNogQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9916E882;
	Wed, 31 Jul 2024 06:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406797; cv=none; b=NyptFD+S32peyDwnQvCn146RHww8aqu3H2GP2s135wAGCBSLNCJdo/XD1wR/7gmwqyQP/TnoYHwl/QPDzaz/Yqhhz0qUnv7p3cEtNkr43cC+v0wTPPjWG6fV4PjlJQ5LDagKX1L8EAnkJM8qX6AOvmFr/nMQ7Aex8Pn5HQysWLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406797; c=relaxed/simple;
	bh=4d7dJPqOfID8CMXCqgbV4y33y4RNKftN/ilG+Zx0HZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfGaMOkt1mFzGp0e9omrDWO2heuusAUgyFR7K5B/NCZotF0bw5atBGUiZlrqHA0E18iOlY3WN3gzzIGX4NWim/G7QNZnVAJ91q3xu1SbYF/8yIIlDWoQ5ROUeY6ayOatmQEI69cMZCeiygpI8WysEK2Hkqm4QHflCPCJproZtls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=k2lFNogQ; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYhlZ5pgFzDqfm;
	Wed, 31 Jul 2024 06:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406795; bh=4d7dJPqOfID8CMXCqgbV4y33y4RNKftN/ilG+Zx0HZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k2lFNogQ9xUt3A3bqNNycG11t1zA5Wy3Pda41p6Bi6chO65Qnd69vIywdEgGKVFHC
	 T4KwuFgHs9S3HuzoVKvnLeG0OeYZv3VFPR4hGjwVB7galpijo6Y6EHTczz/EozaOIN
	 a/Z5ocbXUHvzVfQy7KqmoDpvALoPhLEs9rPB0e1E=
X-Riseup-User-ID: 189FB079CBE3F2994AAA2370D583DDF537A2C03F983F7E60EC270CC0D40C633D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhlW3lBtzJmtl;
	Wed, 31 Jul 2024 06:19:51 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:52 +0700
Subject: [PATCH v3 11/11] arm64: dts: qcom: sm6115-pro1x: Enable ATH10K
 WLAN
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-11-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Enable onboard Wi-Fi on the F(x)tec Pro1X.

For reference, HW/SW identifies as:
qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
qmi fw_version 0x324103d6 fw_build_timestamp 2021-12-02 08:20
fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.4-00982-QCAHLSWMTPLZ-1

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index d3782b2a7831..b419cd32215f 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -560,6 +560,17 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6125_l8a>;
+	vdd-1.8-xo-supply = <&pm6125_l16a>;
+	vdd-1.3-rfa-supply = <&pm6125_l17a>;
+	vdd-3.3-ch0-supply = <&pm6125_l23a>;
+
+	qcom,ath10k-calibration-variant = "Fxtec_QX1050";
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };

-- 
2.46.0


