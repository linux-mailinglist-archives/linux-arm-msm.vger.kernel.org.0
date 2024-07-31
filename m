Return-Path: <linux-arm-msm+bounces-27487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3D942685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34B4285E19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A782716E862;
	Wed, 31 Jul 2024 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="QvpRbEKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD516DED4;
	Wed, 31 Jul 2024 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406793; cv=none; b=piwCAvV0E2aqU/IAvDMlmeh/UmT65CWMpKaW39Rn2Ap8cBNTzustkTz0lTrTUsDEm5Jk4v1i0CY+naWZZj1Ajk1mAxYUvPsJINj5z17NTo2yJ9+KIkzSnrfzzATEF7C6hSxlJSnH1yCj4SESY3JktEZDUW5WI5Gt221fGifeePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406793; c=relaxed/simple;
	bh=9A9XxjgiZkQnUiLhkENcD3MwWKR/LJU4+iO1P+XyaNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SokrGlnNxBg+Yg1u90ig23fRPmzEPKGo2gz89ge0S10DmQxqGc94HLu5dtKH0qCb7L0r6fNzQd4fAJraGbH5Gh43uxuSlwFlkE/St+U7xrSsJ3cpNp5o0i6SWsF9qJJyZvb4OpTG4M+t+gzKjL9dJNmAdxWcIcd9wHeFdJE7qQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=QvpRbEKG; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYhlW229dzDqPx;
	Wed, 31 Jul 2024 06:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406791; bh=9A9XxjgiZkQnUiLhkENcD3MwWKR/LJU4+iO1P+XyaNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QvpRbEKGI8M/p0COwIDSS0SHCJL5fkeA87APbpY2xIT6vDBSunaqo4LNEMMvjUO64
	 HgFbLRYtAULOUnvohKoFQnrHdzK4543VB5sw8I5a3Pix8HQX/FXz1L25EJu0Rhrdgr
	 BZcfdaWQZgLSsbEzPiOiWNUKmb6I5DlfczUJeRJc=
X-Riseup-User-ID: 6BC40A8C0B1387FB3AE791EC4542FF03DFDA41464EE6AFD8AEF624DFE6F3DC1F
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhlS3jnZzJt03;
	Wed, 31 Jul 2024 06:19:48 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:51 +0700
Subject: [PATCH v3 10/11] arm64: dts: qcom: sm6115-pro1x: Enable
 remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-10-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Enable [A,C]DSP and MPSS remote processor on this device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 34834a3929b1..d3782b2a7831 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -291,6 +291,21 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm6115/Fxtec/QX1050/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm6115/Fxtec/QX1050/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm6115/Fxtec/QX1050/modem.mbn";
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";

-- 
2.46.0


