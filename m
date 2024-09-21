Return-Path: <linux-arm-msm+bounces-32127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88F97DB18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 03:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F311F2205B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 01:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83F653AC;
	Sat, 21 Sep 2024 01:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="yE4Z32Nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E45227
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726880589; cv=none; b=udX128GKCHiGDlG2IL8ADS4nJxdTy3KB7JcANxe5V7+VAYvtrU7ULl6orjz/9y+kg19xAJD3lpzaw42pUB1VRMfWZirdPoSAVIQI0QM4rIrZ8nrj6Iimd8cOA24jzO5KyQyGI1G+UFz/Dn4Dqc4rwu2A7Kc+z/LkYIn+MQpK6/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726880589; c=relaxed/simple;
	bh=9x5VCa9UFcC5/iIiaPZzN6hVzAWR1F8Bf2mhpq+zXh8=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=IzAqe73SiT4HgSuHgh7g1mqS+WvF3+caCz+KKjGeS0O52Qr+8UfTUFenStL31kz8FeOUTGmRCPVzwP6txeuwznCJ5D23mWtsq3j5gTmFhfzfO9NA6GQ0WkvAHCXxlTpkDF8zxb42W6x11koP/A+c6x3bSqy0q7IqLW4BXq//Jkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=yE4Z32Nd; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726880585; x=1727139785;
	bh=9x5VCa9UFcC5/iIiaPZzN6hVzAWR1F8Bf2mhpq+zXh8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=yE4Z32NdeJzE8hYalNpILfRlWDlFMf9QEzBhliqg+PNmC8Y78sRW9KCNV6QbNzHin
	 n+tuyQHM+Q/2lwA/ZB2WadT/8juvd6ay3LU9H+k5Y+Zaym+zIizb/nqKkGwKkMNRrx
	 rlJC/oGYutcPL1FSXJ0NndL2AOVliQ3YP+Q1Zm866m1a+OtRTNlvELdLtULKGh0Xmk
	 7vfkIIk6SbWLeRikkjoxWA4jb0lbM9P8XYloW5damnhzPcKQfUy9Wc8nyhCZrzrUiq
	 2xQ2Dwc7z7MYuCDQDi3c/9qBG8NAozNGllHCO2ycRHuFIX+NKxtLxaCn3DKgfrM41r
	 Bwg6lmaMImWsQ==
Date: Sat, 21 Sep 2024 01:03:00 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: John Schulz <john.schulz1@protonmail.com>
Subject: [PATCH 1/2] Changing Ardreno X185 Check to X1xxx Family Check
Message-ID: <eXTmCkW-1fFjQPMz9pDuTV6stWYM2-k_vUP8hhFhSQGIVNAITUWcadIMLvtpufgBOIUY4S8RYGU-vSxIEehZknZv9n1tnS2ivaSvUSyQpGQ=@protonmail.com>
Feedback-ID: 15150580:user:proton
X-Pm-Message-ID: db048c6717f885d12d1b2295621bd9d7874065ec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

First time submitting a patch. As work is made towards integrating more QCO=
M X1E and X1P SoCs, using a family identification function seems better fit=
 than checking individual devices.=20

Thanks,

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_gpu.c
index 06cab2c6fd66..34ca8f6d5d99 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1026,7 +1026,7 @@ static int hw_init(struct msm_gpu *gpu)
 =09gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
=20
 =09/* Set weights for bicubic filtering */
-=09if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
+=09if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(adreno_g=
pu)) {
 =09=09gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
 =09=09gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
 =09=09=090x3fe05ff4);

