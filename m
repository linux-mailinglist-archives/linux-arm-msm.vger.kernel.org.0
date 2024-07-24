Return-Path: <linux-arm-msm+bounces-26964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C97493B2BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 16:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82DDD1C20C17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 14:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8B815A4B5;
	Wed, 24 Jul 2024 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="s1PSxEML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934BD1E50F;
	Wed, 24 Jul 2024 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721831605; cv=none; b=qdWdswwP3rUtbWW3Yo6udm4Kb3OjCZ7pYA+J3+j0+36JniOzKGMQUJtkZuZ3sO5Y4PlqmH+hZib695GhEtlAJo11L+xyRYs2LNE+JmWw55t/TXaFwiCHng07MPgmXmUJ4cE6CRCsQCckYN6kBa9HUciRNisQzIgr6CfSgOYY24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721831605; c=relaxed/simple;
	bh=EnV5UsbxFBuNVgZ1fpn8eYGK4awmnWIVIQgpXSfVkV0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pCtQuY5sK/CGRRuDV+Mnk5WVMfQesLSfBY+n7dw1cCciEvBGgW+wV+OgeUbIzU+ohDWBwVf+UzhmgqRqVxNDZt4tSilGAMen52f8iMZKJuku/hBjTydhWd41J+NT8nKTAGk1Ufa6ZK1/WeSAnWJSwKkVbPxIcIE82IYQuz7nVvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=s1PSxEML; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721831587; x=1722090787;
	bh=EnV5UsbxFBuNVgZ1fpn8eYGK4awmnWIVIQgpXSfVkV0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=s1PSxEMLCUvD6LF6DhbIib4nvaLF4ys6htTI9rPzgNoP6H9ClMqo2JTfHlUi+iSHe
	 URxXe7lCloK5sME4oukdwyS+ZQcYgtlg+jBAO2fyuRtUWEVXVwBNW2YPXvB+hH5b2t
	 y7s84TsRJQkuH78ztwjKdwpak5qqZQcRSDdcNNeTfnxKLP5njuYW50aKk7eY3wcyOk
	 ODXu0/tD9MKuV9ywm0LHojnG12+781MGPskrei9xEbeR19iBSf/2LDwn+oD9uVQSG5
	 odN9sTtWC7vsoCApKn/LzpswP4DAXK9qbqWk3M0DcYMaDVtXuWJSKyEYXTUmDVF437
	 Gcyy3+4BPucTw==
Date: Wed, 24 Jul 2024 14:32:51 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Add touch keys
Message-ID: <20240724143230.3804-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: aff0725e9f024821dc25699dbfd266db4bd634eb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Touch keys feature on fortuna phones are provided by Zinitix touchscreen.
Add property linux,keycodes to enable touch keys.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 81b3e0760154f..7a7e99b015d9b 100644
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



