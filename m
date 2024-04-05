Return-Path: <linux-arm-msm+bounces-16523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3A899C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217B51F21CD7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 12:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B3016C6B0;
	Fri,  5 Apr 2024 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DC854iDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346A16C6B7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712318967; cv=none; b=Hbe9o8j+6HbCH1U1iFac4YdDG22j1E4VKMp2EAGFIFzeHjM57jEhkkKOWC8jFKTXWxjaDPTSw6ieb2Nxuc9mwMuYnonJG2Tq6Kre5uJUrkD4+IUqCf30cIMvfZhR71C/1s35tdpXZeIBr9sF9WoD+LfUelAeGwqLfaxhDwT5/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712318967; c=relaxed/simple;
	bh=Cz/8wfNWWTObsZ/skhto2RRyF2E/E7d1UqsZee0Hmw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n26IK/NWBxhbZWyPEqBDSHhgazzK9EyCVwEWd4zE4Gryau0Jyo77qF9ADbjZgCZW/Th5wa+hDfEtijx9700/N+dArHfuGNis4MwORZOtVoD41vkp8m/Wa6R/kk4mX0IB+V2hPUrLdKuZt0znduAagzZdcb+lfKNkLe42tXBxvEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=DC854iDn; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1712318964; x=1712578164;
	bh=jU5NtiO4Jmo6N6XEhJDq51V29uokcFWXuJa7qaP4spc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DC854iDnh1UXxMT0aTx7XFE+luousZF1j8Yexsb3qfOT4QH3aQcoSrhltPANVv6Ya
	 fy9gCo+6uvmwRw9R7X9J5nfSE7j7HGWZZnERCvugvna1KKnFZUoKEVv18s6w+AlszO
	 ziKN/p81sIv661MLyqGxJKRtwm1UcnmX5JubDgvNM+kgo0A+KJriWmNSwTPAeASTYf
	 n6ORjSIiISZsWx4ZbGzzxQSDfJbA2vx0dtwqQHXz4OakD1fmOtZ2Od71NiVMTsbOz1
	 zAg9/O+WOXa1LKfz00PVl/efMlFAgX1Lb6CQZ8XgnVdSl+BLXFbR7Uy51uXf9/Ci9a
	 K0ocUM+cxvaQQ==
Date: Fri, 05 Apr 2024 12:09:14 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-rossa: Add LIS2HH12 accelerometer
Message-ID: <20240405120803.20754-4-raymondhackley@protonmail.com>
In-Reply-To: <20240405120803.20754-1-raymondhackley@protonmail.com>
References: <20240405120803.20754-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Core Prime LTE uses ST LIS2HH12 accelerometer. Add support for it.

[Stephen: Use common &st_accel definition from common dtsi]
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
index b438fa81886c..db95bdbb9f32 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
@@ -26,3 +26,11 @@ &clk_pwm {
 &clk_pwm_backlight {
 =09status =3D "disabled";
 };
+
+&st_accel {
+=09compatible =3D "st,lis2hh12";
+=09mount-matrix =3D "1",  "0", "0",
+=09=09       "0", "-1", "0",
+=09=09       "0",  "0", "1";
+=09status =3D "okay";
+};
--=20
2.39.2



