Return-Path: <linux-arm-msm+bounces-52575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6BCA7285E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2509C3AB53E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8197C19E7FA;
	Thu, 27 Mar 2025 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6EnBa4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567CF19DF75;
	Thu, 27 Mar 2025 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040081; cv=none; b=rwzWI788pSuBV4px1WvPKm2om5PPbBgM19ELxfQwM2/yk0/IdzECuTzYTY69jvWKak7W2noBstK7vgLov1Zh5RMmHr3KniUymMsMMVve0f7P+Rm8IPHiLu0NAIJJQi/MGoxB/mipLAxZgPu6ZawkrFfzS8VlvU9R9SZ3uEFxeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040081; c=relaxed/simple;
	bh=K0UG0c8+isKpUH9oSXurt4BMBn78aQCe76ElQzJEo8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFsvc+hZnmEAwnAonUhL07ie8JUhmUf2GMMXj5tulyTgOnm+///Wz9qCNnJTazxKtKL31SlL1IXwudtdQUPyHmO+khmE27YQb9pXo6kvMOFFl58dDNUlx2U1L+JqFFqYcInxMxf/HemJHLrcarA6sOErOUwGOcfAeKN0CZ6ZpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6EnBa4Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F0BC4CEE8;
	Thu, 27 Mar 2025 01:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040080;
	bh=K0UG0c8+isKpUH9oSXurt4BMBn78aQCe76ElQzJEo8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C6EnBa4Y41Dtu7xfJ+u5zhsZoqoKuiyrApWg/Xgj2MjteLmfGH6MGh4rOP9BOCO0T
	 BNc0XDh8wkynUPnVeHflMXDEtoBPEkGgWHqpJv8LrrPTimWqr4LsCh8o53fMDgluGo
	 lKm2m6at5pKhYEsp45LbMUqELgW3sp2oeCB5y7hjtYPYdFD8N168D587qybC1urafG
	 bly/nvaoUx8e2cF3diynyIbfe0RybffMmNl3yBDO0Vrg+APsRuDwHblfWe1QBOhSfp
	 PLOKHxRxSwWaCGwG/S1YrGi0mjbcxQABIDzHdpkYvTEpDo6nvqyw+bMD+NwTQrWIMr
	 +5DvDykAnoGyA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:11 +0100
Subject: [PATCH v2 09/12] arm64: dts: qcom: sm6350-pdx213: Wire up USB
 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-9-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=970;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Qvo6BP16C5Ye9x4o42IWyl+gyBi5j/mfeu2UZU9Lkwg=;
 b=LIYzYBIs950NLjNEIvvTzWnjTyRrPCJl2RLPEhOAJPBAv4d893ZqvcWAg5cZn+fw20F73NL+8
 pn/31cYA9KuAxEHPhe6okaXt1yxOAnBbLfp8FAPJaSPvlXnpBioBXhc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Wire up the regulators based on the downstream release to appease the
devicetree checker.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index bf23033a294e3f6e5f248d1d8114e52a70d17094..8848043f95f29966127f4ed3d47e8216f4fa3183 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -381,9 +381,16 @@ &usb_1_dwc3 {
 };
 
 &usb_1_hsphy {
+	vdd-supply = <&pm6350_l18>;
+	vdda-phy-dpdm-supply = <&pm6350_l3>;
+	vdda-pll-supply = <&pm6350_l2>;
+
 	status = "okay";
 };
 
 &usb_1_qmpphy {
+	vdda-phy-supply = <&pm6350_l16>;
+	vdda-pll-supply = <&pm6350_l22>;
+
 	status = "okay";
 };

-- 
2.49.0


