Return-Path: <linux-arm-msm+bounces-86579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A46CDC468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85BC30D730E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA2833A007;
	Wed, 24 Dec 2025 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=veygax.dev header.i=@veygax.dev header.b="LUBjCdzy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF6337B8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580289; cv=none; b=hHfsdJdI7xjHJwimXOQfhmJpmytx93GxARTAl8b/E0QgvaO8i6hB5KT3x/IQ7oI8poa3TNsBKZhUFMG4ksms3snaBHn26B9zHwjxZj5R33Eqn+pIPLsPZROYGSg05puwySctJSJthWTp32EfCfsbMrgAI9IT/NMOSNegwpXjo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580289; c=relaxed/simple;
	bh=2sZ7EePl0Km8ZZ6VCZeQZ8B20phYvLCN3Eb1KFitrug=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BOIfRCBDgWsv6riX2yfLckNhEp+Uw2m54qqoIxDkNm1+7hk1ziG4V/vc96wYUUEDtEeuL8k/eCZ3OWzmBkwWGm8pE5vwTGwUFTtWJZyJi5yo1Ny7MpFK4XIEdjTTXSBROGuEULvr7v9AK9jthiq2INQMUR+IaDaye++sVY1JG74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veygax.dev; spf=pass smtp.mailfrom=veygax.dev; dkim=pass (2048-bit key) header.d=veygax.dev header.i=@veygax.dev header.b=LUBjCdzy; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veygax.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=veygax.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veygax.dev;
	s=protonmail; t=1766580268; x=1766839468;
	bh=2sZ7EePl0Km8ZZ6VCZeQZ8B20phYvLCN3Eb1KFitrug=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LUBjCdzy/7AB7CGwAJEeqzQTUY0jrR572BWG16BkbiQCm6CMJEnizBx4h3AaGE0U8
	 UnDn5wl6J8/dj1hbaeF6iTK7AYUbu+1Z7lODurTfaEGGSAO5lJhYnTqqyl8M9GN45N
	 EO2CRFjJWHJHBnP63lltOv8pOiZUSwBloCmVmAzjjGG2aafVXDj4eV4DsZVnC3jIjE
	 4ljYkA/+Y31HwU6fFc6r+18XbdttHh1VsEX0SdpV9FUFKBGFnmdux1jcBuerEI74c0
	 ncpBb6IK7Gf2Zz8+BsBlA05/bczTvvaz5XClGCN1WjSW0AYn8ZSEENXbdv7GeSmKtK
	 5NXUMeVWlcDUg==
Date: Wed, 24 Dec 2025 12:44:22 +0000
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
From: veygax <veyga@veygax.dev>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Evan Lambert <veyga@veygax.dev>
Subject: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <20251224124254.17920-3-veyga@veygax.dev>
Feedback-ID: 160365411:user:proton
X-Pm-Message-ID: fb9dac0185e4df4e70d9833718ea91cf66b2ae6a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Evan Lambert <veyga@veygax.dev>

The refill_buf function uses snprintf to append to a fixed-size buffer.
snprintf returns the length that would have been written, which can
exceed the remaining buffer size. If this happens, ptr advances beyond
the buffer and rem becomes negative. In the 2nd iteration, rem is
treated as a large unsigned integer, causing snprintf to write oob.

While this behavior is technically mitigated by num_perfcntrs being
locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
second source was added.

Signed-off-by: Evan Lambert <veyga@veygax.dev>
---
v2: Use real name in Signed-off-by as requested by Dmitry Baryshkov.

 drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.=
c
index d3c7889aaf26..c369d4acc378 100644
--- a/drivers/gpu/drm/msm/msm_perf.c
+++ b/drivers/gpu/drm/msm/msm_perf.c
@@ -65,13 +65,13 @@ static int refill_buf(struct msm_perf_state *perf)
=20
 =09if ((perf->cnt++ % 32) =3D=3D 0) {
 =09=09/* Header line: */
-=09=09n =3D snprintf(ptr, rem, "%%BUSY");
+=09=09n =3D scnprintf(ptr, rem, "%%BUSY");
 =09=09ptr +=3D n;
 =09=09rem -=3D n;
=20
 =09=09for (i =3D 0; i < gpu->num_perfcntrs; i++) {
 =09=09=09const struct msm_gpu_perfcntr *perfcntr =3D &gpu->perfcntrs[i];
-=09=09=09n =3D snprintf(ptr, rem, "\t%s", perfcntr->name);
+=09=09=09n =3D scnprintf(ptr, rem, "\t%s", perfcntr->name);
 =09=09=09ptr +=3D n;
 =09=09=09rem -=3D n;
 =09=09}
@@ -93,21 +93,21 @@ static int refill_buf(struct msm_perf_state *perf)
 =09=09=09return ret;
=20
 =09=09val =3D totaltime ? 1000 * activetime / totaltime : 0;
-=09=09n =3D snprintf(ptr, rem, "%3d.%d%%", val / 10, val % 10);
+=09=09n =3D scnprintf(ptr, rem, "%3d.%d%%", val / 10, val % 10);
 =09=09ptr +=3D n;
 =09=09rem -=3D n;
=20
 =09=09for (i =3D 0; i < ret; i++) {
 =09=09=09/* cycle counters (I think).. convert to MHz.. */
 =09=09=09val =3D cntrs[i] / 10000;
-=09=09=09n =3D snprintf(ptr, rem, "\t%5d.%02d",
+=09=09=09n =3D scnprintf(ptr, rem, "\t%5d.%02d",
 =09=09=09=09=09val / 100, val % 100);
 =09=09=09ptr +=3D n;
 =09=09=09rem -=3D n;
 =09=09}
 =09}
=20
-=09n =3D snprintf(ptr, rem, "\n");
+=09n =3D scnprintf(ptr, rem, "\n");
 =09ptr +=3D n;
 =09rem -=3D n;
=20
--=20
2.52.0



