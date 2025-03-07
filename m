Return-Path: <linux-arm-msm+bounces-50649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E933CA56ECA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DED216D205
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185F623F438;
	Fri,  7 Mar 2025 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXgbI2H6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2623ED66;
	Fri,  7 Mar 2025 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367559; cv=none; b=CSjoHYWVeKPou1/gze6TWR0iKmH0J/pwNOR/MHHYH8smJ7Tt7ut3UA70UGcWVKOaokjdlDW3/qT82sAN35IyhjLHqPzWhgmf6mUwODRGtC+9aTg3oond48hjwt8E4qg9m4d153nsjcAgFlSyRJ71laCsOyCaZi/pn40B5ie2hAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367559; c=relaxed/simple;
	bh=Q/vvrj9UGLHleS9BpAr+5VVP4/OHqMSL80va3MFiSVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFfIZC9No6MgTcpSAj/jykluQu7gdzpKYnaLvTLIpGBhR6AQGGt3HVWsEsanwIvxT2r+DTVz21EV7TAoKNCXLs/T0W7KFfq1Rlihp0toeDbz3S2W2UaKChjeOT7Za8uRV2FYdq8f32UNMjIybry9ADBcRI9kwBmC9ZWaiwGWjrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXgbI2H6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FE4C4CEE8;
	Fri,  7 Mar 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367558;
	bh=Q/vvrj9UGLHleS9BpAr+5VVP4/OHqMSL80va3MFiSVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXgbI2H66xdcgoB87/IfDMvXr1xwoNFTWtZOs7PGrADDbs1c3IWa7IjBzaPZE/zn3
	 ipTSD+XCbtUCMzpaXBRQS5CneXfErZ5Xr+kpK8XWO5kQoDqLSHGVkWDU82EEtyQ+qb
	 5gjbG7L7NFDZ7gC2c57XKXC3q8B5S8KCxj19h/YvGRNGMxfcQVDvzdHsB1PDyQjnOZ
	 usObnpEBNk6YJV9tUKupke4EnRQSd/KWw8yFuA09Os80X0z3mdKDrurK2l9twEL3Fv
	 +rYJdOWljfTEyMGo1FyV6Nqa3kKdNIRHAdiAtlhtJxZHGHGJBN/qrpjFMyEwpuiDo5
	 abcM9acGYztmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tqbFV-000000001x9-1Ovj;
	Fri, 07 Mar 2025 18:12:37 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch
Date: Fri,  7 Mar 2025 18:12:22 +0100
Message-ID: <20250307171222.7470-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250307171222.7470-1-johan+linaro@kernel.org>
References: <20250307171222.7470-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a gpio-keys label for the lid-switch for consistency and to separate
it from the volume-up key (e.g. in /proc/interrupts).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 0b62fdc85478..fc4ea6be5fd1 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -63,6 +63,7 @@ key-vol-up {
 		};
 
 		switch-lid {
+			label = "lid";
 			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
-- 
2.45.3


