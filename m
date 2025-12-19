Return-Path: <linux-arm-msm+bounces-85850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA34CCF9C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A160F30601AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9352FF178;
	Fri, 19 Dec 2025 11:34:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747172BDC03;
	Fri, 19 Dec 2025 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144044; cv=none; b=hWLYyGmF5BLQXRpbpR+lO10T2G5BmYxWmcIF6udyO0rBa/rrvrlnfaSYgNnHWq/StauuyX/YzUJLCRWVy+rnTkVxd141f4L/0PaYzAlPFL/q7kzB/G5ZqXF1CUY/gOjIWVRz+6XhVJKF8/0Cdk66GpyIojDM1vyeSNcLYrZZb4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144044; c=relaxed/simple;
	bh=ezDdyzUXKqL+g+WOAbXAv5JH7cUJQ74kADkOcoDrosk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GTHJY4dL5A7Lt5StYQHtkid6rEb1gY8y3Su2zAt0Fuj956OayETaKEyj8OX9SqwUG/l3qdEkFVDsNsjxfb+J11tjLBs7N+HWFhnQ0xGSddbsSD+jDQDqzkZCORrQjUWA0UMqPtE18xPVUg8HRn4MAhb9u5k+TXCSu+8G4zFXWQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from ehlo.thunderbird.net (161-51-78-170.static.ef-service.nl [161.51.78.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 88F811F548;
	Fri, 19 Dec 2025 12:33:59 +0100 (CET)
Date: Fri, 19 Dec 2025 12:34:00 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
User-Agent: Thunderbird for Android
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-2-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com> <20251218-mdp5-drop-dpu3-v2-2-11299f1999d2@oss.qualcomm.com>
Message-ID: <8895EC9F-E1E3-487D-A8E5-F9909BEE0CCF@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18 December 2025 15:38:24 CET, Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=
=2Equalcomm=2Ecom> wrote:
>DPU units before 4=2Ex don't have a separate CTL_START IRQ to mark the
>begin of the data transfer=2E In such a case, wait for the

Unfinished sentence=2E And would it make sense to note this down in a code=
-comment as well?

E=2Eg=2E

=2E=2E=2Ewait for the "transfer complete" IRQ if there's no CTL_START IRQ =
(or the ctl is already started)=2E

Is there a significant timing difference on the two irqs, or does it not m=
atter?

- Marijn

>
>Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode pan=
els")
>Reported-by: Alexey Minnekhanov <alexeymin@postmarketos=2Eorg>
>Closes: https://lore=2Ekernel=2Eorg/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d=
1@postmarketos=2Eorg
>Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=2Equalcomm=2Ecom>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec
>index 0ec6d67c7c70=2E=2Ee6f55902e355 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec
>@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
> 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
> 		return 0;
>=20
>-	if (phys_enc->hw_ctl->ops=2Eis_started(phys_enc->hw_ctl))
>+	if (phys_enc->hw_ctl->ops=2Eis_started(phys_enc->hw_ctl) ||
>+	    !phys_enc->irq[INTR_IDX_CTL_START])
> 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
>=20
> 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
>


