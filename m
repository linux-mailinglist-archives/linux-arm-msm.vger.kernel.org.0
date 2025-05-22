Return-Path: <linux-arm-msm+bounces-59150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FAAC1784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 867BD3BE10C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89C12D1F40;
	Thu, 22 May 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUQtQI5b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7332D0274;
	Thu, 22 May 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955935; cv=none; b=YD+IFQqdxrSVCI0/PmiCnEbNDuoKYmBdh+Olz8qjyso0ZobbkyXPRk46JLjG2Q8ADFSIZdwqrnZe5+TYE4z1SJ3A3Q4kueIXKtJWwB/1EmURpL06BwcDM4X04BbmaW2TEaeN8VOsFF9lnbT88z+TVvoH/n04SwgwToxlqIqv2Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955935; c=relaxed/simple;
	bh=oNfgoqfBodnZkmZEYmv0nVKdaEOPoFYY5NmO19Xs+XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpWvlF25YK+uq4qfmKLrQ36FtPcFjnni6XduxKkNOS1jbOUHpUzBIhjHsGrDoWKzNcab098LGQDmLrXNPKYh/qCPYG/x8eUUJqXWy8v48xt7XL9asmECwchL8P5EtEhw/rNNc9QcwPaHkE66SJziAR6ZwSY7XzlKavk2uYuAeQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUQtQI5b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE0EC4CEE4;
	Thu, 22 May 2025 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955935;
	bh=oNfgoqfBodnZkmZEYmv0nVKdaEOPoFYY5NmO19Xs+XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HUQtQI5bWugFHgUgMV2zD6+PrzeVidmgOsDRfmfgb74a5apJj1uIhYXZQPt7D98l1
	 RKOQ18X3qxmor0c5uPOBstSVKKc6HdyjkpDEHvClNv6XopuE7YXqSHRTIJvjR3UWHB
	 6G4e9/cV2ic2EFQBGCaGMJgv6/LbU5ylqDVcPvJlymvk5LKeoK96beDw7sPoHCFzE5
	 vjakrqymdlmVhU+gPNNoCtQbOwJHE8bENJaqE9n5Q1IcraerWFivNXNq++mRlu9kht
	 QKv/MND77v6d7OhHKwHwypa1gVhKX+fwMoT2hVoxTLPsT7a22wgR2GrepEobkNJnlH
	 1Ze2IRxFCEodg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:19 +0200
Subject: [PATCH 04/10] arm64: dts: qcom: sc7180: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1038;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=sGjrhtdj43txDAM8WeB04Z629jk9N6EdsPvL0Vif+bU=;
 b=aRAZPnX4ouL2FrBr//fN9srNSzagrh9iq9P/e15S957wkupBNONDFrpjiqVU5XGnS/+bTo976
 xRS0aABVupTA352x/s9+t3UgNj+eG/oabUGrFerN6Sy2SbthNTgrBxy
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3afb69921be363bd35a996bc1d6f70ff007c6af8..84b032dc09d36e56eeaf182125cceb44e7333765 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1640,6 +1640,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -3535,6 +3537,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			ipa_modem_tables: modem-tables@28000 {
+				reg = <0x28000 0x2000>;
+			};
+
 			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x2a94c 0xc8>;

-- 
2.49.0


