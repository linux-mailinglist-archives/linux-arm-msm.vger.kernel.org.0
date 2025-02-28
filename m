Return-Path: <linux-arm-msm+bounces-49835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FB8A49501
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 10:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35D291895941
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 09:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AD02561B4;
	Fri, 28 Feb 2025 09:27:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A486E1F30A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734874; cv=none; b=nryn1HELJz6GrkgNCXLZWUkU6en+g1qJ5Y6LwUQY8310X1OJuzx09VYLcxezIuifXDDo+LbApottftRnPUvWjl/ujDUspZOh9XrNY/mkUillwA2Aj1J1R1t+lByp6MFVAq5zDrBMImVCi3v+wLuHNY8H/2l9Q+XsRR6qM08Cl3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734874; c=relaxed/simple;
	bh=UWrasMPhZgBN8iz+xsk13yZ0dRriDkIlfknmsEWbDn8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YHEe9+OqGew+Ocw3LEJKGEiVpRxON5qk6HR4Wnm/1JBYAICqFe3/GZ0GVaC+zdaDQvrKiM1ESxKnHpe1pBFMzKV5AfCFM/qWFF1UDr8QwZf/sfW8b3BvZ8EYxiOOAYxrkOQmU/DRU7rpjWsh63cuvezqHmKwY8CsXOnYH5UgiyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from [127.0.0.1] (161-51-78-170.static.ef-service.nl [161.51.78.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 13C6D3EE67;
	Fri, 28 Feb 2025 10:08:48 +0100 (CET)
Date: Fri, 28 Feb 2025 10:08:47 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_8/8=5D_drm/msm/dpu=3A_drop_n?=
 =?US-ASCII?Q?ow-unused_condition_for_has=5Flegacy=5Fctls?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250228-dpu-active-ctl-v2-8-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org> <20250228-dpu-active-ctl-v2-8-9a9df2ee5193@linaro.org>
Message-ID: <CA752964-870A-4DB9-A6F7-0E701EA24AB2@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28 February 2025 05:14:12 CET, Dmitry Baryshkov <dmitry=2Ebaryshkov@lina=
ro=2Eorg> wrote:
>Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >=3D 5=2E0
>configuration, drop the rm->has_legacy_ctl condition which short-cutted
>the check for those platforms=2E
>
>Suggested-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>---
>
>Note, it is imposible to reoder commits in any other sensible way=2E The

Reorder :)

>DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
>single-CTL support=2E

Maybe I expected this note on patch 4/6 introducing it, but it disappears =
after merging anyway so that's a mega-nit=2E Thanks for sending this!

Reviewed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>

>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm=2Ec
>index 4dbc9bc7eb4f151f83055220665ee5fd238ae7ba=2E=2E2557effe639b5360bc948=
a49b0cccdb59ee35dab 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec
>@@ -410,8 +410,7 @@ static int _dpu_rm_reserve_ctls(
>=20
> 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
>=20
>-		if (rm->has_legacy_ctls &&
>-		    needs_split_display !=3D has_split_display)
>+		if (needs_split_display !=3D has_split_display)
> 			continue;
>=20
> 		ctl_idx[i] =3D j;
>


