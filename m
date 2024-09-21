Return-Path: <linux-arm-msm+bounces-32128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179097DB1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 03:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AF99B20B31
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 01:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C672119;
	Sat, 21 Sep 2024 01:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BmOCZwjY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9AF36C
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726880811; cv=none; b=P0Y+gyukL+gUJT0MmKGogCBQNa752qcT0Urc8OGHAey8ZQa44PX/wRGL9YY9TgZ34izqh3f648OzHyzxdfDD/oP03CuWzefdxDU3DkRZXIQ3PZjA5FQutC5cp+KPDBwdAL92lI97ElBfbfOmZZ1Am2L3onDyNKrECrsRV3Wg/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726880811; c=relaxed/simple;
	bh=rvSVhSQRP2VPiTMUSng/M9I3CwjgHj+FnMgDfWfbPH4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=eBlpSZxXE1PYYErRXu3P+fSGZopzkRPebmq0W2AI+a/fZzlAqprnSTZ6Vptpjz9iaSZA5OUkj986EhzJlHVmN+cvwu2DzfdwINkHQAa04X+RmV9s36v8CDlcQNKIKGi9zzBKCOVRbjr2G4RVwRwF6XL8qxnoz7v3M0RNh5HhFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=BmOCZwjY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726880807; x=1727140007;
	bh=Gm8gFcqcIlcBuxFivKrjLEwbQ1ibpVvVH6V0/6fI6Bw=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BmOCZwjYk+gvVZ46Y3EI+FQ1H2qavk62RwXybHIy/2mYbFF/34nVWPL+aYGs6idf4
	 5++TRaYXp5EklDcWtsraOaNlJqseOSlyoTg149iUwW4siL6MUZpBZ+BfLoHi/KjcC+
	 kHINXAmoW4OuGsiM37p3bqV07U3NyFIrYUFR8HdswnJF+2Rj9pIxsxMn0G9+wKUDiV
	 nl63BYVzggzrKFggfs5UCXAUPGQv+0rJLN8rvrMSRlx5//0WTNlQ3baKgxyokZxcqS
	 7XYd9PTKGQqFExAv4Jfzha4MLU0HLKNpIDQBcISShiKaj6R179g0hsrMmnYHSAE/IZ
	 uczzP4u2EbDfA==
Date: Sat, 21 Sep 2024 01:06:42 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: John Schulz <john.schulz1@protonmail.com>
Subject: [PATCH 2/2] Changing Ardreno X185 Check to X1xxx Family Check
Message-ID: <_GZ7LdBTzrPYK6bJtttu9hidDnuUoTNmXD1-ghFdF-gq24RJdrOagaXuCRYVbWFPAUE11C9PGOO-sRUS45w2DX8F6rB1xomA_dT3Blm2Dd4=@protonmail.com>
Feedback-ID: 15150580:user:proton
X-Pm-Message-ID: c2d16ba82ec405cd028fb57c6e284b4c777d76aa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

continuing off of last...

I believe the chip ID is correct but I did grab it from a msminfo32 report =
so it may not be. If someone with more internal hardware info could validat=
e or direct a better way place to get it, that'd be much appreciated.

Thanks!

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/=
adreno/adreno_gpu.h
index 58d7e7915c57..09a38aa63f01 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -526,9 +526,14 @@ static inline int adreno_is_a750(struct adreno_gpu *gp=
u)
 =09return gpu->info->chip_ids[0] =3D=3D 0x43051401;
 }
=20
-static inline int adreno_is_x185(struct adreno_gpu *gpu)
-{
-=09return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
+static inline int adreno_is_x1xx_family(struct adreno_gpu *gpu){
+    switch (gpu->info->chip_ids[0]){
+    case 0x1fc31043: // X1-45
+    case 0x43050c01: // X1-85
+        return 1;
+    default:
+        return 0;
+    }
 }
=20
 static inline int adreno_is_a740_family(struct adreno_gpu *gpu)


