Return-Path: <linux-arm-msm+bounces-83885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93AC94A24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 02:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFDC3A6124
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 01:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6013535950;
	Sun, 30 Nov 2025 01:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=veygax.dev header.i=@veygax.dev header.b="b3vQdMF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F70223702
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 01:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764466159; cv=none; b=URD6pJD9ezhD2d/2V9AhTXxzUXVUANlAJE6bciwkcrQglk+/AwOvTrUl2UgxMbWZx+8CrtJZQsoS9l/3qmwTP/cVXZ5Ux2qN5B6Gy6552hX9Ij8nzHjnvypY7yLNKHUAhexEH9yPV70+sM9KbQK+ILPZSeOmeRmXmHucHkXhw/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764466159; c=relaxed/simple;
	bh=ozUsX/bT64HY1yGl9o4Rpp0gGQHX5PlMeVLIyIxsBkU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uj2ehGYjO4CY35Ifo0NepNhMusohsh64VgVTBVYWT9aTRR/8sDBYIa7efm6u8DPJS+DuepEX13jIxr4IRyLOGmMtZ9rvGfUtMBkD/2XB7cCsKnc4uwcidZYGSMHlwC8g6J/am6xeyTT0G0+3Fa4HIPnpw38+S3bAvuj2+wUVtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veygax.dev; spf=fail smtp.mailfrom=veygax.dev; dkim=pass (2048-bit key) header.d=veygax.dev header.i=@veygax.dev header.b=b3vQdMF/; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veygax.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=veygax.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veygax.dev;
	s=protonmail; t=1764466141; x=1764725341;
	bh=ozUsX/bT64HY1yGl9o4Rpp0gGQHX5PlMeVLIyIxsBkU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=b3vQdMF/u924WT4HLmCIb7P6XrxvgsnJdHtRNfzfkTHI32Tsb39jENadWnJVPoLu7
	 LLTLbQ3TAPXAi+LOcyegMSLC1v8hM+Vw/3L1NvUPe1ZrfF1nIEtZ/i6f4EYpg8vDYR
	 1F0p1up2drNRAY0gIBgK7AvhGr4DB68KcL8S+mXXUzeB0ghUndEgb4sKhoFpO5/PBW
	 oCUsBjErYBhWun7dXsCvUo8awmOs5vMGbfgbDgGrFgg4gAXdx1HqlP0hkgrFZqnMxx
	 ArsJEuximdYjc5f6OatEE8BCi0QD8esPmffmq1BB6jUfcICcKqD5qtlWfdAMoTqDp+
	 C8c778nWV/vkw==
Date: Sun, 30 Nov 2025 01:28:54 +0000
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
From: veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, veygax <veyga@veygax.dev>
Subject: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <20251130012834.142585-2-veyga@veygax.dev>
Feedback-ID: 160365411:user:proton
X-Pm-Message-ID: e0373c99e967915a910429b8886ef243b72b1be0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The refill_buf function uses snprintf to append to a fixed-size buffer.
snprintf returns the length that would have been written, which can
exceed the remaining buffer size. If this happens, ptr advances beyond
the buffer and rem becomes negative. In the 2nd iteration, rem is
treated as a large unsigned integer, causing snprintf to write oob.

While this behavior is technically mitigated by num_perfcntrs being
locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
second source was added.

Signed-off-by: veygax <veyga@veygax.dev>
---
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



