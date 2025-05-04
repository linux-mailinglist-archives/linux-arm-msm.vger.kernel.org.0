Return-Path: <linux-arm-msm+bounces-56682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A19AA8647
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E1B1894AE5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3691B4242;
	Sun,  4 May 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="YYK0qPwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5331B3955
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746359521; cv=none; b=LvvUhlOrv/IVJqBlsW8+l+Y3NGUshCh2+3/JcMozQZyRyHxgLLQEVbJ7gX3nj0sGrjKzYhLJtly+qyyZP0MjU6rXSOe7xzDaUcx7DPmcYpOxnw7pKllAH21UryssyJH6oQKL24ksvfpQC+3q6QfkHtoVLs3Gph+1B3xS2S2Bz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746359521; c=relaxed/simple;
	bh=bOvRiIygzE0+Fg2nNN0/XwHOfMzhoSwoLpxUJMB84O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9K86Kk62aspdrqu83Waxvfl2WloJWOwaxcPnRxxqtErYAWXeglRB+YrBX8IcydF8MVddCoZ95X/p9Gx8IYpH1+N3ALAetwbJ0VUuQg0Jn8pWVesyZ7Pc4EvOB0zvWbJI29CPp5w45VP5FWjX/5u+NilGfCIBU6kv20O+PyipiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=YYK0qPwg; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746359518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUtG6/HQyiWXydDfn2ZhXjq3VKEFyoNl3hSf5snvTgQ=;
	b=YYK0qPwgJOJStOhtWOoYbsxGrVw8V/BAaoqNViHzdqODJV/Y7j+p+1iu2NIelao0r5AD40
	7OBNaY6cSdJBR0v8N6Jtz3HLPu0yJtVHYRfdkWsAMjvqQit6flPKwzjbH6nJ6UoNZst2Kw
	MKxzYzNYPmfzUlpjDa3l3QDNPu3Aitr9DX+xCVDa0xwyMa9WO2bw4Bykt7kBhPifgXMEL7
	ir+Dyk9qItOEGvlbRpv6jvFjm5oGtnHw5kXzChMWjxCYUBSsAj+cexPHTb3uj8fTEl4ITE
	MAuRNuFfQL8CG31FU2FBf46/+Z2IwMaY0Q63brDal2lH309VBb9ulWVF+12XmQ==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Dang Huynh <danct12@riseup.net>,
	Alexey Minnekhanov <alexey.min@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
Date: Sun,  4 May 2025 14:51:19 +0300
Message-ID: <20250504115120.1432282-3-alexeymin@postmarketos.org>
In-Reply-To: <20250504115120.1432282-1-alexeymin@postmarketos.org>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fixes the following dtbs check error:

 phy@c012000: 'vdda-pll-supply' is a required property

Fixes: e5d3e752b050e ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB")
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 0b4d71c14a772..a9926ad6c6f9f 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -107,6 +107,7 @@ &qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
+	vdda-pll-supply = <&vreg_l10a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
 };
 
-- 
2.49.0


