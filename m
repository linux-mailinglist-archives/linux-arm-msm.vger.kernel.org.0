Return-Path: <linux-arm-msm+bounces-34604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC89A0D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B25286D45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E2E14F114;
	Wed, 16 Oct 2024 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts0kwwVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151B20E00B;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090362; cv=none; b=GjaBeTbWiYwIBEHUjYxHrpKWfWXwzkVsI1PO40vjXZc7KC5atzuGMwfCZxVbaAwHZMt0btykYInhaZVJ4aIeSoXCum6OmYzKd0T5pb8aKZMXtyYVO2pbWmly21Uq1Vpc/FbCatPcBd+tkfNVf94CY66gqxMcOd8HpptfwwJZbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090362; c=relaxed/simple;
	bh=qsOPJiLdiSLqBOc3H/UA8L4Kp1b6RdcZFhR2y1ZZCA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwiSWEwybBiX83objAf+WMG2bgL4Zie7hzFqblDqaI9C4cfGReCtgDMv/LqqSL16gte/PnkGWyRl33ddPos5118wizTdqqIyVLkdxEk4JNWyMSHAKaIm21gN87+mCw2mXHeIYOISqFiGw8TBUn6h5EWb5zvM3YH23e/u7+mtSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ts0kwwVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70497C4CEE6;
	Wed, 16 Oct 2024 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729090362;
	bh=qsOPJiLdiSLqBOc3H/UA8L4Kp1b6RdcZFhR2y1ZZCA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ts0kwwVbzhAddWuejYYHhXXMmk3ObkgAL27Jp+wBnBfL2mEUJ3KFZ53Sidcg0ppab
	 DpsDdeu++gbm69AYPsYV+JsLE6Zv8NhLP9DRliqyLtnGqWAU21NAxN1bhXmIR/1Yh5
	 LVNw3hGPVFMhuGcj3ux6De+NhWzNzcVOdjTq1778duESQDkhUypGDUpvZxjNIW7AkJ
	 /Qv9qU+mTv0GSUvmK6QN96FiMgr0WfhMvnGuFF9BnRg5Zkqs5WFPKrUmdqCBgPvan6
	 rdzJq+CSEycrsWz2SAj7GTZyp/qLj0i5w5LxhYi6/X0W9BywIRcWVkYspW6/v8qrTK
	 10vLD3Fkq/rtg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t15OM-000000006UU-0Ryf;
	Wed, 16 Oct 2024 16:52:50 +0200
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
Subject: [PATCH 6/6] arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch
Date: Wed, 16 Oct 2024 16:51:12 +0200
Message-ID: <20241016145112.24785-7-johan+linaro@kernel.org>
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
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 1c3a6a7b3ed6..5ef030c60abe 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -253,6 +253,8 @@ vreg_nvme: regulator-nvme {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&nvme_reg_en>;
+
+		regulator-boot-on;
 	};
 };
 
-- 
2.45.2


