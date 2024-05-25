Return-Path: <linux-arm-msm+bounces-20468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C58CF0F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB6AAB21C64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C197129A8E;
	Sat, 25 May 2024 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgwovX5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F190F9F8;
	Sat, 25 May 2024 18:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716660137; cv=none; b=m25dAtH3UNgsv8z/MYWx9wvY99whCM6nFtiSI4lVOG/fLLSmeSIGfdZQQAdINYK6V5cVqIyWvgW5++MwwEPqhkyUC7VqzL9eVBthpWywv+qjm9QUVImSh/4gTh9WNGW9edfBGCa4VdfA/3DQZaYU7fDIgkRlZp97KJDCNEC7gnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716660137; c=relaxed/simple;
	bh=4M17/UuBqlQLLBcYxcVFcVbZ+mfrwei8UC03mE9Scq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BvAyNU07FrJu0VLdHcX8rORLnMEKVO4y7fTGeyok7WbIp+UqSLgMZ1qEW5BfBPtdCNdaUFqTTwZcF/vc79LZT6kjSbwX8DtrKA5oD93yRPgfhP3Bf1sO5ej4Ss/Z1CbgylRnFsnAl175fQMIHkDwrHdn0WvEpCKyjJfhZBnnKGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgwovX5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B86CC2BD11;
	Sat, 25 May 2024 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716660137;
	bh=4M17/UuBqlQLLBcYxcVFcVbZ+mfrwei8UC03mE9Scq8=;
	h=From:Date:Subject:To:Cc:From;
	b=MgwovX5FI/eKmKWoOWcIyWvTu59yWBlCwKI5hHHocdev++n9kHBjSf706+IFTyl99
	 2mO88F/5htZvCdAkN5xZNoueUSwTI7WcdSFLJfpEQ0hglAHHwfH5wgYY/QSCQTcLKr
	 TBr3JNJFmxy46IwKs+E1WMwy1GiAkjsYslPKPHk/oBECYX59SbNU0nK7sI9lI9wybO
	 fB/MRVPv6GrSWUoDyAIHzkjPbEfsqW1lrcSGDOMdD5mVIB0k+xgMX8RnqfFnG5wJrM
	 qibKCcJSsrFkY83wZRbVOg9Hyjj1RMP5mW277uu5SrEMUaMyhAZuQg6tIDbNFA/B9v
	 qWsdtnbTNsJuA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:07:05 -0700
Subject: [PATCH] arm64: dts: qcom: sc8180x: Drop ipa-virt interconnect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-drop-ipa-icc-v1-1-84ac4cf08fe3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMgoUmYC/x3MQQqAIBBA0avErBvQyUi6SrQQHWs2KQoRhHdPW
 r7F/y9ULsIV1uGFwrdUSVeHHgfwp7sORgndQIqMmmnG6q226sFQUkbJDsV7JHZRWVomZxh6mgt
 Hef7ttrf2AUuqS3JmAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=CsEqn+n+Eza70hGJCXG87FvFxmm9W6wEylukMsBMkJ0=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUijJpCOxSYulkA+DyZmMvwG6XaCKPAKa1ajSB
 0RfpArzLPGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoyRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWAeA//YOriADOVYlqnT2GTtcSfranK31ON1AbTdLpaIZE
 pJp6oAGuhFFmf5kcw6d7wD3i+fkJAoMhjx2/G5ztZeFOwSBttOJXWCynpFLNYDYysegFAfsdl5r
 Utm9GXOH2lvxcqVRZyJiH9rkqG/5O6+lu4GXu/OZpQsOwL1PAbC676kGJd6tEzj6YunPA9APqpo
 HRz4c9mCTieq2U6NTPi7ztUsXligWDqMpTVHIl5xnQEn6r2NsIq+BZ1auteExU3sLYTJ2YR0nLb
 Ldar5GF1OrAhPCasMZxZeN+wiag2hC3Rjqrv5qfPC/HJDOsD72pljDk8BcSmJRjQW8KPz72m9Wu
 g+Vc/KEuvPbq1WU6r9r1t8ylvs6B2WC1ptWxJkKGylZUGOdwN5n5OpWvB2k4A6rb+lYsXjIG12k
 sff1fW1XsbUGvIOtiFFABX2rTLkpjZCU4Ie/r3UeihIR9rTyZBU2bBzgeBF2y3rW9ftFo504XRq
 dI37uI7JtkjJmgM2IBOeuf799dn+2fxmEE+pMBkqOsY7TkI/mKwdmUeRBQfBGy5ENYZP/5nfNdN
 DbdIIEAxW0/9O744k0T45CYqG3W73i7Fnry6I5J3NWeamTwEmnGBygFGdwOrvxY3na1cCj0ypMC
 5WGtBn1qJ6ltaQG2sb0L+GkgnB2g6izz4QumnIhvNiwI=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The IPA BCM is already exposed by clk-rpmh, remove the interconnect
node for the same.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..2be1a5ab0e60 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2250,13 +2250,6 @@ ufs_mem_phy: phy-wrapper@1d87000 {
 			status = "disabled";
 		};
 
-		ipa_virt: interconnect@1e00000 {
-			compatible = "qcom,sc8180x-ipa-virt";
-			reg = <0 0x01e00000 0 0x1000>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-sc8180x-drop-ipa-icc-2eaf08273a4e

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


