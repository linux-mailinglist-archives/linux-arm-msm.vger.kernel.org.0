Return-Path: <linux-arm-msm+bounces-77446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E97BDFAB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E95A504C6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98F033A01B;
	Wed, 15 Oct 2025 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMvuZhjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E97E33A017;
	Wed, 15 Oct 2025 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545954; cv=none; b=ElhuD7rg/neJ4dMKSAYbB7TzkTnDU7IMYnVT0NFkAVSL+R6LaOFPtoGJYrPFGOFg3O38iew5dSsAU1/Zf+SqaYWxxA2Cgr/BRUNVC9jR6UZxnL3wFjVJqLjA8Pb9jy3x+jIM3EtHfKvERgoTkoQ0DV0AO8kNQ2YxhtIYoFDUiNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545954; c=relaxed/simple;
	bh=BtBRFT9OH9toITx+iqxKA5MV06vL51Meb9jMOVUGTUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2TQil1NBtnbKJp+IapyshMoLlQ2+yqke3cH94WaZ1CJBWU6ezAY5ET2ggGz3JSvH9EDNVIx7qXCW7NqNnUyPAc/LqmhbTvJRAz0bULY5/nEc5QwmGzPtZ7mYMHLhss0p8AGsTMIBfMmnyy97xSEpuqv0qVe9JHvi7W2SJOAm5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMvuZhjL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A154CC4CEF9;
	Wed, 15 Oct 2025 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545954;
	bh=BtBRFT9OH9toITx+iqxKA5MV06vL51Meb9jMOVUGTUw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uMvuZhjL93yUurJSx7JEQccH+FrI3iobb2jC2mvEp/dHdQRM+LINxdLHULdd8KgZc
	 bFtLb0t+gly7+0SBf12IJQqh02QhuSOOIbmPwdcNqrAHjwTc/xT/xWZuBOQkB8Osw8
	 CatqPoQym5Zh8RDmb/KnPREgqau/09eHDJpW/YoB3kEZi0qZlZu3UhcHVncUttwceF
	 +tFZEtG08PVF7aq/MnknfaS5bPkBjziRyb2RRsI0kKUeBA7Lecdi1XSzXOc6BsD/Yh
	 e7fczabSIB/2snqzjsTEJEkT44YWhUTdaGVmiras462CprPqfyhiQf4FFYyP8hbcCF
	 h3devuxX/pD5Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Oct 2025 18:32:17 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-starqltechn: Remove stray
 #address/size-cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-topic-starltechn_i2c_gpio-v1-2-6d303184ee87@oss.qualcomm.com>
References: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
In-Reply-To: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760545944; l=963;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IhnRzo+Bwj6O2GRi9mJgkYXwZpnc+BC2mQXjDukXxEw=;
 b=dL/oh04zh0TlwgDlz+uyy7vrRBtvco56i+PBIvb60IDw3TjK5m7KKVQT9aC7dnJ3A2WFANFP4
 sVE79l+rhiYB3mCTt8SBCyi6f6Dnm1ud53Ywv8rgCfqCM8wbHDR+B08
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

maxim,max77705 does not have any children with a 'reg' property, hence
solve the following warning:

'#address-cells', '#size-cells' do not match any of the regexes:
'^pinctrl-[0-9]+$'

by simply removing the disallowed properties.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 61a4fe7f843c..c5c6c7988bd9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -606,8 +606,6 @@ pmic@66 {
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		leds {
 			compatible = "maxim,max77705-rgb";

-- 
2.51.0


