Return-Path: <linux-arm-msm+bounces-24744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02591D1D2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 15:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2137281C70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2024 13:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93572145334;
	Sun, 30 Jun 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WR3M82Jn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch [185.70.40.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06513E881;
	Sun, 30 Jun 2024 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719754175; cv=none; b=klzuYRjRA5DldcKIaaFgLx5E4tmk1b5eoLLltrTkbY1x59fDC6H/bbbBteviebYRitVoudBfYoF+Ed9FqWx3icmEcQgiI4Vk1ccj9IWHimLbSjhz0teI1eHp/NyWWeknlFeriux7qlRFhWQfTZUyolbFlsJg2t3z43+ugIMdxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719754175; c=relaxed/simple;
	bh=EEoDOWvrfhdAgAcue1y3TMvWRlAS758VxMB3jaAZaZ8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwNELbs6ZrF4IA7Lr+GLZRKdfxYK9syhQr1o9c4cDVYDBbL1BXCoFSXIyP7acIDzIGal+BK5b0M49i7ZGpho55VOC9cQEGFTKtRbzYu8oOJpellqIDVi0kTvHZYE3cmiGszcUR3AvKD2YR1iRtFdR+P4Xc1/F2t+zlNltSTbg70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WR3M82Jn; arc=none smtp.client-ip=185.70.40.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719754171; x=1720013371;
	bh=3IZSrVHE5nxJLlfS0hoy4u3xcXjdItN9VWt+RopTAiI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WR3M82Jn3VcwCukQFXQYrm8PHNZOilCk+V51M6sw5D+2c6JkyScUUhg0apLswbEZf
	 MEvszCjXBLZPJrHbp592/oyFlDYUOv3jtu1v9D55emu3jpLjmW2tWMlq2XfQdL5f6a
	 5bOm1dYSp7I59FAB3R6dhUT8Y/xiJ/xj6YQ/jp9dJbClE+SmdjnbHWL2fooaP0PdE8
	 +sTRYaC0xi+wrVfMCdpTi5ISocb27VS2IrZ8oDh1ztm1Nmq924sXhTbueOnSWsXWrj
	 42a5qIQGCRdBKG8SSTAt/2bJDxnC+XM5EE0E8CFB8cTnP1wrqnYmCBE84q1nnnf+c7
	 09w7+2vSyxuPg==
Date: Sun, 30 Jun 2024 13:29:26 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Document samsung,ms013g
Message-ID: <20240630132859.2885-2-raymondhackley@protonmail.com>
In-Reply-To: <20240630132859.2885-1-raymondhackley@protonmail.com>
References: <20240630132859.2885-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 9eef7cbca1696d80c69650106ee4d5a4530ea8ff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document samsung,ms013g for Galaxy Grand 2.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index ec1c10a12470..7990e7e27542 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -141,6 +141,7 @@ properties:
               - microsoft,makepeace
               - microsoft,moneypenny
               - motorola,falcon
+              - samsung,ms013g
               - samsung,s3ve3g
           - const: qcom,msm8226
=20
--=20
2.39.2



