Return-Path: <linux-arm-msm+bounces-34603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E449A0D54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BCDF2860D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC94920E01D;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuCY0kXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7D20CCE5;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090362; cv=none; b=NWRONGEvPlEFuTOxF8xNR+6f8E5JASHYU1pFTWVzPqfFnrtT4aY5iG5VJhMXJXeRCEG0JbtexrdjS17MPVT5hXZe53CWSwyXPMxP6Jmawdg0A02wmKb/hnhVGeZEMgwv/seHTehtXaEsBA5TJ0IPs/vYkolq86CWU2ID5SGRUKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090362; c=relaxed/simple;
	bh=PWQzkfszLDSGIBUFFJ2GL+D4KeQ0jkeURjrAtrKxIjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVIs2i5hSrzx2NKERPkSCYtwOE2IyoXm8xTkT4kXiYzqoYYbGcSfDoQnNa60rSNOKE0z9kMnrO4gmm6nFkllshKpAvf1gq45/p3Kqopp5BCEIgqEA81/GvXnQpGT5BV2hmL7A/tckuUFUwfddIqh+1wEXoosLukGO2MC1pkkBvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuCY0kXb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D2DC4CEC5;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729090362;
	bh=PWQzkfszLDSGIBUFFJ2GL+D4KeQ0jkeURjrAtrKxIjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DuCY0kXbORU5xeosnDzkYOtyNu6BuDppB4O2o9/cRpJ+Ro0bnJcYGWbaPo9ySvlrk
	 2ihO9vt2L3FvQnzgNA9xPNCcKwVarmFWbN4UIbpmftSmaLdIxFy7KmraCr+04PRfGM
	 pn4OY4HBPdj/gbVWZpG7fJdn1x5SBGVv/1rxGDzSL/yfzaZvqk9KlLssHqd4tN0Lcg
	 Rnayj2R7e8vX/qb/PVp3FS8eK/KilmdLg9eUbtSEyFesGlLa/k2YdYt5WELs86R31Z
	 j7a0CL9ucRMi4KRPdwn3lDV31XrzdhYO41xjZNrkDsbd3hqlxRXaeYewNaZxt11emR
	 u4RhnUzhiJ7Tg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t15OL-000000006UJ-3GfB;
	Wed, 16 Oct 2024 16:52:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
Date: Wed, 16 Oct 2024 16:51:08 +0200
Message-ID: <20241016145112.24785-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016145112.24785-1-johan+linaro@kernel.org>
References: <20241016145112.24785-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMe regulator has been left enabled by the boot firmware. Mark it
as such to avoid disabling the regulator temporarily during boot.

Fixes: eb57cbe730d1 ("arm64: dts: qcom: x1e80100: Describe the PCIe 6a resources")
Cc: stable@vger.kernel.org	# 6.11
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 10b28d870f08..5d2eec8590ce 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -300,6 +300,8 @@ vreg_nvme: regulator-nvme {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&nvme_reg_en>;
+
+		regulator-boot-on;
 	};
 
 	vreg_wwan: regulator-wwan {
-- 
2.45.2


