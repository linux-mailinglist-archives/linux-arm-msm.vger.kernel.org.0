Return-Path: <linux-arm-msm+bounces-71286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470D0B3CC7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 17:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 689B97B88F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 15:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB70F28489B;
	Sat, 30 Aug 2025 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="LcBJ+zK+";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="LcBJ+zK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677B26980B;
	Sat, 30 Aug 2025 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756569493; cv=none; b=pjmQJxLo+DQbIxdTg6audwyRJPdjS0rH6t7f7wcGWrhGOysNqObXsBppKwxA7jzyLsk0r78VrM3b3bSaleBmUmtPgg3hCIEoDuDpWD3V2GBCa0TF9CEHBG3lr2E8+te/eUeD2qqTtGjCcwT3MmcRLhDc8Gq0WEn61wDWq5r8VKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756569493; c=relaxed/simple;
	bh=2NYra8bevS3woikAQuBf3T0J2BxLCqPEXnPzpCmkJ84=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uBIzis+sP8lU0qbEkySjHnwmIdRWwjSeIRZmVmm6q6sAVo4H9Ve/wVGxyBgH3Fmh+guPOOUoQooNl5s7eayflJ3QHnou8naRQdlyXuEmUR8dps+Ax6fwvc3V9eJPz8Fw6jNvvXt/Q3pSYS78+t+whCRF+ka+6sHirOalAU3P+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=LcBJ+zK+; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=LcBJ+zK+; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1756569488; bh=2NYra8bevS3woikAQuBf3T0J2BxLCqPEXnPzpCmkJ84=;
	h=From:To:Subject:Date:From;
	b=LcBJ+zK+1Xgkae7qRTSxGsugwr61QxR9A0cBw39itcEC+wx/crrKUjV4ASMUjSo/C
	 iXZpD5RzbMMFpufVQ5cbnBDgZKMSLxVeIE0SLC6jbvwkQrvqKdHX3LvI5NqLdtj7qs
	 yqeRJaGGoLBhDCl4Vqf1Gqg+hSTNcyyWpyXfZfvh9B1c27/cgRv/YWyo+4/v7Nd+rk
	 gyqLwuDaY9mFdElTxlZCAFfwhwVWJKlaNE9/HXrca8HAq0jJB8E8FJb59MMisck8IA
	 zuGwSjgAl4mEiOBtgWQ/yexo7NBgrwQwoaf53GsiolD8RM9AhdwaES1vvkBYsl7kQu
	 dE2LdSOdSQxlA==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id B9175FB05;
	Sat, 30 Aug 2025 17:58:08 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvm6FoYYZI8z; Sat, 30 Aug 2025 17:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1756569488; bh=2NYra8bevS3woikAQuBf3T0J2BxLCqPEXnPzpCmkJ84=;
	h=From:To:Subject:Date:From;
	b=LcBJ+zK+1Xgkae7qRTSxGsugwr61QxR9A0cBw39itcEC+wx/crrKUjV4ASMUjSo/C
	 iXZpD5RzbMMFpufVQ5cbnBDgZKMSLxVeIE0SLC6jbvwkQrvqKdHX3LvI5NqLdtj7qs
	 yqeRJaGGoLBhDCl4Vqf1Gqg+hSTNcyyWpyXfZfvh9B1c27/cgRv/YWyo+4/v7Nd+rk
	 gyqLwuDaY9mFdElTxlZCAFfwhwVWJKlaNE9/HXrca8HAq0jJB8E8FJb59MMisck8IA
	 zuGwSjgAl4mEiOBtgWQ/yexo7NBgrwQwoaf53GsiolD8RM9AhdwaES1vvkBYsl7kQu
	 dE2LdSOdSQxlA==
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: [PATCH] arch: arm64: dts: qcom: sdm845-shift-axolotl: set chassis type
Date: Sat, 30 Aug 2025 17:57:29 +0200
Message-ID: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's a handset.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 2cf7b5e1243ca..2b04adcb53ee0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -17,6 +17,7 @@
 / {
 	model = "SHIFT SHIFT6mq";
 	compatible = "shift,axolotl", "qcom,sdm845";
+	chassis-type = "handset";
 	qcom,msm-id = <321 0x20001>;
 	qcom,board-id = <11 0>;
 
-- 
2.51.0


