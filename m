Return-Path: <linux-arm-msm+bounces-27486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035CA942682
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3575E1C2402B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0AA16DC1D;
	Wed, 31 Jul 2024 06:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Zsb+P6DE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B00216DEB1;
	Wed, 31 Jul 2024 06:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406790; cv=none; b=HVY58NOFbazJ35BefiKp9Z7kUJTr1zlOznokLPLtNhpLB3hEMXLlQseIb3BwwUxw/UI4lo2H5hFJgvG6ikUW6Bs81UMBjT1AT5DU1AOJAAOQDqgkiJcR1j0gI8Uateaxx8cz0vYfvQukcFzaNa1IQsjU7+Qlbz70Gmy+a2ejSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406790; c=relaxed/simple;
	bh=fJ5hurlOVOtDQJIiuvSbZhsIIZd4EvdSkmXYcyG85kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9S9+aJnyhVLvzeDNT2TrSukGpwAkfhdGJUocvnuaYEM038hDQspNMFCbRWJoe0EebBHQXe6UqydB7F4lfrM4vEnp8OC7+pH3QHj5TF0MiMlUM71PPFwWb+pdiNFhw5imH/Hua/0NpyqWxZ2yrQRAKQBpxivZ7ROcwQRH3jGmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Zsb+P6DE; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYhlS1rldzDqMM;
	Wed, 31 Jul 2024 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406788; bh=fJ5hurlOVOtDQJIiuvSbZhsIIZd4EvdSkmXYcyG85kI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zsb+P6DE0FZnjF0VjzQwF3689VitbLAavu7Fh6De9hJWIes5bEngLmnRYOwj0XxzJ
	 YSpvGb7GBfkXVl+Vh7hd/PRRacDAdXH7Wd2kB2bUWZTGAuueJR/+Yiz1PSMErbOkf5
	 vZWuM7VihiFwQSPYtTkOBVgCxaZ0Fs1K27ZuKcg8=
X-Riseup-User-ID: 84EE1646F2B1EC5C44F13C4EA051D7912B9FC8CC34442FD38A43B92E1E286C65
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhlP3fjkzJrXc;
	Wed, 31 Jul 2024 06:19:45 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:50 +0700
Subject: [PATCH v3 09/11] arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-9-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

This device has an RGB LED. It is used for notifications.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index be77a8318800..34834a3929b1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -211,6 +211,33 @@ vol_up_n: vol-up-n-state {
 	};
 };
 
+&pmi632_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &pmi632_typec {
 	status = "okay";
 

-- 
2.46.0


