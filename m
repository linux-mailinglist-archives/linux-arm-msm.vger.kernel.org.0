Return-Path: <linux-arm-msm+bounces-51432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D351A61445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB76882BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F8A202C51;
	Fri, 14 Mar 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeIzwUz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BBB202961;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964108; cv=none; b=kaXhe5DCGCf+r9YI8rrSDsILYhsgJ20tJJ7X05dVoYYxTZsaQKGYN+5m6Ahc77BDXLxcLFs6CTPb6QZ0TheVSoAZTWCE8+jnNwgxqZ4q5NTfXOGa1KfTW+7JDX+r3MSU5c48BHPTdULb+G0sFOVaVNWdjr8PGNsT7+TTJebQIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964108; c=relaxed/simple;
	bh=fI28x3Kb0wSd41ADQjit6RLTqB9WgFWsDerWkeZyr8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPJEaumxkiyuxvqLjRfXHveq0VfJmA1/BbJx/MDFeD6Ra90QGa9sJv1glHpowoW63IPVppxNrxbQMgRDwKlB6xkEplH6/nslz1G54upSh/qhM0MZrqI+E3CBNcN805iOlrNX7kmv/QKUXHg31J4sYEv56wd1X+e5SO/juEi5p5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeIzwUz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55D4C4AF19;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=fI28x3Kb0wSd41ADQjit6RLTqB9WgFWsDerWkeZyr8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JeIzwUz2ManLaexSCIhf0YF5LzZ2QwRFP1m8coAuSr+Ez9uo78Wl3PimyX80Z+cta
	 PnmUlwomIPuuoU0dlsIrpQbBeyDKVxqFjTIaplU+OFE70yeOa/PpLJTzVg+3aUm1y7
	 105TZyNxvxD7L0ebo/5/4vpiZJOOzxiUlJsR8L4eDo2APYM1zbnJFw1YB2figYztGE
	 II/Cb6HiAXLnhAFpzcT10AllSQIkijIpOPQsWjMzXpJEDRrUPn1WHbMzmNUzrHE3DO
	 wXIfKxidslEWHql0Xkb+GV6Mlut1NZkhi354NjybB0Q+thAjBvomdkSSKA2nntBiU1
	 XKKEf00+fquwQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RH-000000002ym-0Hh8;
	Fri, 14 Mar 2025 15:55:07 +0100
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
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 7/8] arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:39 +0100
Message-ID: <20250314145440.11371-8-johan+linaro@kernel.org>
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

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Cc: stable@vger.kernel.org	# 6.8
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index ec594628304a..8f366bf61bbd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -437,6 +437,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -458,6 +459,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l16b_2p9: ldo16 {
-- 
2.48.1


