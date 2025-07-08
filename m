Return-Path: <linux-arm-msm+bounces-64026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC30AFCA4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC101BC5F5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787DB2DAFD4;
	Tue,  8 Jul 2025 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wr3CC/X3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545CD237165;
	Tue,  8 Jul 2025 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751977319; cv=none; b=nNMByzFDtM8W68nijzk8JZr9O2RkRjD2fLCRkAwiddN7ixHGWyzUXHC1FHSJYjlh0UV6yRIn0leEadtduCeVXi5j+5IKrgTfuOBDTNN9IRPtWXEut9bUnxmBQZgPWxVDZ40xMfKrfLXl+2ohKu1LL8zMaPGCqRlfEGC4f1+O31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751977319; c=relaxed/simple;
	bh=NggV/VQ4gB4OWrQ70ZfEFkYSIKnvnY4qf1kuOMRWzck=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SYz6w8tg7rcUzu4t8rLvthka7Uqat5c+xLxCn3k2RMWbslofDehdBhmXxRSx28kOE7Ma975KJpf0/TftNGZo+YjzrKPKy8eyW2G2yHjfQpP1iEDGuuq6LZ86KuZDUXAtjwn46l5nKgXx4kptEeJReKyJVQVRyC6u1Je35J9TM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wr3CC/X3; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751977307; x=1752236507;
	bh=NggV/VQ4gB4OWrQ70ZfEFkYSIKnvnY4qf1kuOMRWzck=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wr3CC/X3ePa5RbxKYApkEfTBWzPRaBEy/u4cccw8b1ITE5kCC3atP1Zvq6cl3pyPy
	 IwiXYNcUv3ms/3HLc7aqnOEY0uFML/z/5iUNKmekqe7Jl8lKaD+jPaLE3Niwk0efCo
	 G0UzutB1vP12x6RzOoq/qvMHeX3Tf32M7Pu24xsizQ6C/rxn9WgkPW0o+RXznaV7kW
	 j9sS5NNp1YIwBhXnLgwcNJzjxVA6hi3n0I4sQeb4EE0QZNcwznv/2NyX9rFH4271rq
	 BTh3mRh+frjQ57WHyB8d8RLVuBdMj+/EPURaX5OfEduPEBbIl2+VNhV/VyPetZvAnG
	 y8ALKUAKeGsAw==
Date: Tue, 08 Jul 2025 12:21:42 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH] ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys
Message-ID: <20250708122118.157791-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: d749f57c2a305573acdc0957c3a9db5a2d0fef47
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Touch keys feature on Galaxy Grand 2 is provided by Zinitix touchscreen.
Add property linux,keycodes to enable touch keys.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts b/arch/=
arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
index 0c7f07b35ff0..6f5be32942d3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
@@ -173,6 +173,8 @@ touchscreen@20 {
=20
 =09=09pinctrl-0 =3D <&tsp_int_default>;
 =09=09pinctrl-names =3D "default";
+
+=09=09linux,keycodes =3D <KEY_APPSELECT KEY_BACK>;
 =09};
 };
=20
--=20
2.39.5



