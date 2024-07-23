Return-Path: <linux-arm-msm+bounces-26905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386793A0F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E3E1C22090
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9F915253B;
	Tue, 23 Jul 2024 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="P6xBap2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAD150989;
	Tue, 23 Jul 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740340; cv=none; b=p14p1xVKJ8NPWzFZQ8YeFdPUnvOY2z5sv0qzaUx55BucsHJvbh1f1UqEFlY+jcGblH7OJDrR1bOhQ95amZLSWISSMuispUSKqeMByJpWaYexQk3/wmy86hJ/Qw7pdLo29XWNnQJFktLux1kHR0Al5W8a5QSbVkXSlYj+/JbxfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740340; c=relaxed/simple;
	bh=EzdHCvGI+GIEZHbbuo1DnK0c0037zty72h8Xf9slRqA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qTlfqjeCvMjebwAgsftN7+p+rTxfWRSAg3Lil7T8ayQHd8PHlX4lNVUc8FGlrrLf7ys5ZSdDs5UXm39Cd9f0l0qywe1qrFq18SJ/OM++EeGTzfcXqT7gVGt30wd0Sf0D01foOPgCKWO6PSzq9h4UCutXis9VRlLgpuamZiN1tNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=P6xBap2h; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721740331; x=1721999531;
	bh=EzdHCvGI+GIEZHbbuo1DnK0c0037zty72h8Xf9slRqA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=P6xBap2hd7oV/DZU0zic6bZlwIB5xVcJdX8lYEbnyVfeTHlsr+CHRPYhL0enjCm8T
	 J3DwACMzKR4m/89uPYvmlwMjmBa5XAkfcSJlsId02EoFiBqltOOUSEN4fjmZjQqHyY
	 f1fjvC95j+khbCO+fM7s1rCZBTTVS+gkegTCAYj5dXyP/ZMFeRpozmTWGHufOaKbN/
	 RyFoa6HV/mZoKSPmstb+8hxcm/PXUAhKb4zgfRN+RV5Ah78xgLJ+OFKtvRKB49Glnr
	 5BdZK76LKsrcKf3IWfLfZ9Sy6/LVarCT2I+9kpJ1bvDQV8oDo4mF0hsSrndQFMzyaD
	 8rxyauEQSxCYw==
Date: Tue, 23 Jul 2024 13:12:06 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Enable the touchkeys
Message-ID: <20240723131142.1703-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 14843e34b807371414d9995cb7ddf746e757489a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The phone needs the touchkeys to be enabled so the sense lines of the
touch controller are mapped properly. Otherwise the touchscreen is not
mapped to the display properly.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 81b3e0760154..7a7e99b015d9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -262,6 +262,8 @@ touchscreen: touchscreen@20 {
=20
 =09=09pinctrl-0 =3D <&tsp_int_default>;
 =09=09pinctrl-names =3D "default";
+
+=09=09linux,keycodes =3D <KEY_APPSELECT KEY_BACK>;
 =09};
 };
=20
--=20
2.39.2



