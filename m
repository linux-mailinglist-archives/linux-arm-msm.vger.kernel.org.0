Return-Path: <linux-arm-msm+bounces-31983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67497C214
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C7B71C20FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076741CCB35;
	Wed, 18 Sep 2024 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzSM6405"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B61CBEBE;
	Wed, 18 Sep 2024 22:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700299; cv=none; b=bLhDuYITrBlfRVFqJfVJzkQp7xrkLw15HEvvNFb8DTuhsgsrRNQRo6Mgkj0LbkIdMK/KcVo8z33rvoFVXGuwpZ+CgGHSL9ccUUvW8iCRTon36jslAi/rEaUDCMIRUvqQwshPSpiHMXpMeGlgk607fSp5I6FU1WK7vwxoEfYrJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700299; c=relaxed/simple;
	bh=QBoB4Ot7K+O4Obyl3HKNUXhThAi16EowUegHMtqCUIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiqOeDfStMLgcGlEcVcE2JUPEsHs+ZWYV7t+kLolREhwLltQceWUlZ1BQJPXPUOeHASqBr5n6W1d0wu/Fi06Kj3HRegduKd+AcnIszAQt+PqjIZsCxg1XHqO+z6Vl+lRtdUHSPVhTwV0GmjpCZQZ28WkqqJe4gF09FCP+o/qa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzSM6405; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1712C4CEC3;
	Wed, 18 Sep 2024 22:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700299;
	bh=QBoB4Ot7K+O4Obyl3HKNUXhThAi16EowUegHMtqCUIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SzSM6405yLBVU1koWb31yvaReURCjG9mqfPJFtEX49SRRBykYHwylAZ6DVgHtoVB3
	 //9W0HTWgyKPmCiju/MJAK1rn8ZCr16h9NpL19CZeDcNW7tiUuu981QV+U+4O/fyrp
	 YNZzx5jIHfpoStjIBf6R2bnAleg8p7kUvp/gp6uvMqW5QhYmKvHAQHec1NJMnJGs7l
	 IsAdaQS8fehXRp5XL0KUy5ejagwlA+WNkjt6sxAgJD90LP3OvNetHQH85W4x3ZexgZ
	 XrPEL3F2kQcd8YkyyQKqd5q1ukPa4ZtArGxxgec01i59yJog308C5QGLyWi+2t5sGJ
	 UDBo4ZKioOsLw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:21 +0200
Subject: [PATCH RFC 08/11] arm64: dts: qcom: sm8150: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-8-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=1000;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=bNTOagUjuIT9eHqmrzEiDX4QJTZgAhZ+fZt6gBTJGDA=;
 b=ba3+Ql0LiulBh7MP0mcaWqcqciZl8E4CMnoVuMDLBTRibQ7K+Boz0AE1d58KwaIEp74f/T7zt
 XZ64hG7JZKLDF7FJIu9sN8VHEt7xsIJlLGWQL6SWsNp7WMtn2ovlG7V
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 27f87835bc5595f5023319f77878a8ea4090a3f6..28e57ad885f4f64abbf429c337d45504ff2830ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4296,6 +4296,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		remoteproc_adsp: remoteproc@17300000 {

-- 
2.46.1


