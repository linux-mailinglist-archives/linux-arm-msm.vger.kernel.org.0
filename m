Return-Path: <linux-arm-msm+bounces-51428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF988A61432
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE83046014D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA3B201267;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWJxuGsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B21FF7C1;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964107; cv=none; b=IMYqokV94CskV04ax10z88rWIf/dkw2BlY/jgzYi0l1thu8zc/rAl+p/n2Zna7ZhGMAIOe5byH4j79ZACCCrgvdOGVeVsFCtOwufITtLdPpK4oEtjc7VXC05sysjUae0BywNTYIMKtPwOkOvYEEf6sEWQgGfrE/dJSnT+kFPygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964107; c=relaxed/simple;
	bh=HLfYPHE6VAicm5TNJprnO5kbgrg42RQpUDkE+CAUiWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZhlMkHM+QvqM9suUmMmOkvgAmWO6vHZ4mAA4N3bYzdXGyxAnmNnsjWTyA9JbGW2/mroztV5mPrZEYNGibc1YOW/D2+uFfFpF0RPckW0bgiu7J5ze+9KmaSdOdC/CUcTGepCskSvFMiufFvUvJJw97rQay6H1XBh6C/ypYbQrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWJxuGsd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F16C4CEF6;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=HLfYPHE6VAicm5TNJprnO5kbgrg42RQpUDkE+CAUiWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HWJxuGsdfvnIWYl3nv5bW7sYwBGZYK10lJlZg40t3iFWWi/nAZgz/8JpzZPHuNAWz
	 sSDxNegN8oiTMlvwwORUTBfIpSGJYbouTZaXmSinVdhggh9nLWIZglfRMBJzCRb3YF
	 yWa9f9WNFtHN5QX2zoT3uJQvUkD48Sn1m8Qiu6Pku0f6UV6eR/rdLRSJkVPB2to171
	 cjrMLBY96b4A1QU2m3qXZMkVFP1IvXFb9/3G99bDSRXqsQ/MTAYlN0ixl3Zwb/ABvg
	 1y+89Map7AaJCvPIYQJqZHT59lAeb0E8RWUFJP2O+3TpnvSLWsBG5WqUZ0c3g2rQ/l
	 8bw8b605RKFfg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RG-000000002yd-3IBW;
	Fri, 14 Mar 2025 15:55:06 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:36 +0100
Message-ID: <20250314145440.11371-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314145440.11371-1-johan+linaro@kernel.org>
References: <20250314145440.11371-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Note that these supplies currently have no consumers described in
mainline.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Cc: stable@vger.kernel.org	# 6.13
Reviewed-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 86e87f03b0ec..90f588ed7d63 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -359,6 +359,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -380,6 +381,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l17b_2p5: ldo17 {
-- 
2.48.1


