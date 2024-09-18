Return-Path: <linux-arm-msm+bounces-31976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F06297C1FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7CD11F21DF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD521CBEA2;
	Wed, 18 Sep 2024 22:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5EkbuqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C71CBE9E;
	Wed, 18 Sep 2024 22:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700274; cv=none; b=A0hgcQnaSOGT76U3XeUy1FW+mmAJwbaNP9s1CJfK9A6EfKN0k44YDlF56I2DNAV/PrjT67xdVYN7w+9LxXt/2tiNge0Arcfv7NBu7U1OP2b7hFHMQvzuik6jG0vIpa/A9vHa+HhpmJyVimd0vmTTeLWv54rVv92NJZVuF89fT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700274; c=relaxed/simple;
	bh=lVs3+P3PVrfKB1JE19rE1ggJhR6Tbzok6Qn7Eo06ZJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDaBVMAYX309fmGixsqljqKBIIhjb8PH07GIaAdi6gioJ6zbQDaBii0govWeO9/xGWmawZ/Ppv8JUAYbq6ez52h+ND2ZdNJPsW4PBNVQaQGdAeUcqFxaK6b3K9lxxqLAk9V9S7ySCXP8mNIJngglqUdSeZ22pf0y2Kc4CSxS2kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5EkbuqV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92898C4CECD;
	Wed, 18 Sep 2024 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700274;
	bh=lVs3+P3PVrfKB1JE19rE1ggJhR6Tbzok6Qn7Eo06ZJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g5EkbuqVDKigUqamayGDiuaic3SDOCNVn3LD1qio8Z3zzqJunRod6q8A9kGOA52Rc
	 sspH9e46icBIrCmulUQCaWBa7pR0/NEr2sALWlDzUiWENcm0m98wTSMnXdh8L3bTD5
	 dULfXOEi2vKNmT00f+IgkcVXe0oh6C3AxWEzYSnjm8LVqkk/Zmgj1wF48CxMAA3Y15
	 zF3KwySntjvZFGn1aR4nkPfIRmN8NN9CZLHIU5tMeVleEleW+ZwcPTQcP9KaqVcFYJ
	 s5RXv6sET5uqjh9u1j0apcEg9kmN+RcEVwV7PVN3VHkuaOD/Vd61A8eb7wSdB++H8J
	 CGYKrRjZY8Kqg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:14 +0200
Subject: [PATCH RFC 01/11] arm64: dts: qcom: qdu1000: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-1-5b3a8662403d@quicinc.com>
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
In-Reply-To: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=1004;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=LyUvQG/s6kpNprKcZlTnppyjCx1IfqQG0TxgrW9JrFA=;
 b=ehhL9CgScd00H79XIv3UwRWv8jYtHtchqFTi9H8/6yOmI8jZ8rj6erqT4vSN930BC4KF6SVRD
 GQ9s4GEfQnfB1/5IWPxMAPhaDKJVv/Om5XPkFTkWWRAzxGlIXzKJal5
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent
pagetable walk via the IDR0 register. This however is not respected by
the arm-smmu driver unless dma-coherent is set.

Mark the node as dma-coherent to ensure this (and other) implementations
take this coherency into account.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 642ca8f0236b3944c5962e5b12b5959cd349812f..1dd760e97794877bae35d19ca264f8fc70f96c8b 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1412,6 +1412,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17200000 {

-- 
2.46.1


