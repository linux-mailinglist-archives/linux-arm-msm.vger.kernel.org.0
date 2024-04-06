Return-Path: <linux-arm-msm+bounces-16633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0EF89AA92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 13:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D44282AC4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 11:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0A42C1BA;
	Sat,  6 Apr 2024 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="uURzRbvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A22C6B6;
	Sat,  6 Apr 2024 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712402113; cv=none; b=ERdcspu0N+HtBc5WeVPQAnNshBSi0UB32Vgm5rxGauFrHd3y8aqawxkP8dlVfwFmmW5S0jLZqgjd1un7LWH+CrXpNHARveeoZ2tQUBaAq4U3mDFt9aowU4smo3YnM1JEp0xxgEAzDJamZ6L0Hp6OzqMz8oUZcArlAKGBOF5asxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712402113; c=relaxed/simple;
	bh=Cz/8wfNWWTObsZ/skhto2RRyF2E/E7d1UqsZee0Hmw8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tmuY86qd02tOIXhRKRB7S2zsBhtXtw+RYCzhCJZ+52TWTvThbHf0D1Do2gpAmunEE+kPc7UuYb6HfplzkE1bzA9CEfT4x1p4+rW2hrEd/nac3cqDi0IO5SWkoHeyufP/4VUcimRflxC7d/f9ZG++7ZKPSKcFDqPngY8VvQ8HoxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=uURzRbvM; arc=none smtp.client-ip=185.70.40.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1712402103; x=1712661303;
	bh=jU5NtiO4Jmo6N6XEhJDq51V29uokcFWXuJa7qaP4spc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uURzRbvMm7jxWJYHA/fwrgulAd0/wo5n1txiHo53L8o8zyghV9o4hzPSDJISrraA7
	 pcxlLzWf6+oh5CvUyMr6m/mEhc5pS6oJ0FvJma8gDyEkl9X5VJThcFpic26u7PT/ic
	 Tnl/5eo4q8cF5I7jWIPwlUFj/wUGMgEgNAgKCLaGeqarlMh8Lj19ArB7f4nve6N7Cv
	 bLHrgLF+JB36m/ZIIEqRJrpbSfoB5n6z1ukwe7Tig7H+vHUzuM8+2MpDUzDZCMrbXd
	 UwHi7yK5WSSpPDy8O93QfHiKDJ5fwzShO8MXYwSsUSp3yWToLg6OTVVNOwb94ZfPi1
	 eAxtehsX4ok+A==
Date: Sat, 06 Apr 2024 11:15:00 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8916-samsung-rossa: Add LIS2HH12 accelerometer
Message-ID: <20240406111348.14358-4-raymondhackley@protonmail.com>
In-Reply-To: <20240406111348.14358-1-raymondhackley@protonmail.com>
References: <20240406111348.14358-1-raymondhackley@protonmail.com>
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



