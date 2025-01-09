Return-Path: <linux-arm-msm+bounces-44667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7508A081D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 21:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC23F188CD38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 20:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06531FAC4E;
	Thu,  9 Jan 2025 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="fBUKw6wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2991FCF68
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736456029; cv=none; b=tZzE6ae4XUgHY9JNOmHawBV/lHiP61oVHgY68qQH1+BtG8/M82vqxN2H9rx99WiAGoD2OuV73i7NrsPjLhg5BL4BNq2wqjEjAm0wig2FEo2ACTSuzY7Sfx8CFDUT8UXpuNZmZ3UbqhD8umRQORrXb2+AvETRUTDMvxBkf3KEpog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736456029; c=relaxed/simple;
	bh=ITcxx2R61W/a9GHGlsQtUxc3zBbtFLF5H0fPTqSSbE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRwHZX4oGz5/7+kZ7j0lYa+2RCJTXHNKHD4Kk93SXKY1328NWzkuIlIPvLMs/4r9mS+YE7eaEuFPPJocSK+FQZV7Q6VXPZibbJnN7ragpSvUFarkTUHdI6XxWCo2925JUVV89e6r8AZ5c1p4qB9U1KYQ9Fkaf6L09lHElyzMW/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openbsd.org; spf=fail smtp.mailfrom=openbsd.org; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=fBUKw6wa; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openbsd.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openbsd.org
X-KPN-MessageId: a78d5086-cecb-11ef-8d58-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id a78d5086-cecb-11ef-8d58-005056999439;
	Thu, 09 Jan 2025 21:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=vkv9PfJ4EbRruG4ZObMAZPzBFOSa5PGl3Zdwr1Q4OVs=;
	b=fBUKw6waKDawtvXntYavqCFP063XwaUCpJrTl8XbNKj4lEaSGmQBwlU3HiaNPh4am3FVmojnkkwz9
	 lh549IVnCnAeIFtZ5cIpCnqyB8hm65J9OyJ1T0CIcbUqK8meh/hqIfR7lQGLO6L/fkBN7ayhl3YOdp
	 6iluilcYphHzFChc=
X-KPN-MID: 33|YKJ+AiEbRxSiM0QmtFWvUQOgVHsX8doJ+xCz8GEbY85dHjhPugNo7vd+MZnv/DY
 Cwejxs58aWAkBLWU7bkFs+ekQ0aaKIvykHVKa0/2fjzc=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|mVqOFBAVwp60RSNbMTlzhChc8JStiLWf5qv1WMFxBikqA/A5l63aa+yaDpR6PaJ
 1n1NK9resg3LeDQLgBHbOwA==
Received: from korngold.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id a8aedeb2-cecb-11ef-8948-00505699d6e5;
	Thu, 09 Jan 2025 21:52:37 +0100 (CET)
From: Mark Kettenis <kettenis@openbsd.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: johan+linaro@kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
Date: Thu,  9 Jan 2025 21:52:31 +0100
Message-ID: <20250109205232.92336-1-kettenis@openbsd.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make this USB controller consistent with the others on this platform.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff..aad1153a443d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4814,6 +4814,8 @@ usb_2_dwc3: usb@a200000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 
+				dma-coherent;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.47.1


