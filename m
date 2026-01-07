Return-Path: <linux-arm-msm+bounces-87865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B47CFD774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6746E3064D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6674238166;
	Wed,  7 Jan 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Zcu5foUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6281530AD10
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786341; cv=none; b=llJTe1AFnsaljH8ZQOT3XtrDxAvspb6KqZt5GtyDtCEQHmWvlVcwnUh8Km3ZXCH1ctJUPXOiIF+x0Jdnju+J9gwUZM8H8H8MGhkTFeza7IQBSKoHy+ZuNqgB5vrxDZXA+BZ77MLh77g1qF1BwqSJqxocax5tvlyuVH23trXqGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786341; c=relaxed/simple;
	bh=XITZCtSRKvRZYv1vfYHqWD2cWdlJH8jfh7yoZWFbXVw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uAwID1c5YmZY9yuOn6IzSlJgin+fYETt2XnklMLAPbrnbkgVW7+v8pzn2WTRF5MnKynBqyL6mkVCSA27kI+Nv+lim5Z+/O5hxnVBObPYN+tkUCI2TKL+qn+VjEdCLSEWwxsJZRTw/RhAzZOQFr37zPPvCVaF5Oa5y5hZanVtw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Zcu5foUb; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so1094859a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767786338; x=1768391138; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob3g5q5jWnPVuY+nnqbiqZRINNocwJ2SJ68hLxsq1uU=;
        b=Zcu5foUbjgdPaUQDYc5+/SllehXppG/lkUWAvteV20Lv3wry+ikStyxVwZ2tho9lnn
         Zcobi0znWwhKJ1fHCdLh4w4/yulf/dh06tmESm1vH1oItwygNs54NM/7idCgn6B61qea
         +4fhb2CHOapjhAVsU6u3Vx7wf7eQHkt4IYkmjV5oBdkkAyLAClMA46BZXNrjnsJyXUF2
         eoPdqV7DrC+TVGYvZH2/DQ137S7jCiE35x0s5M0YqP5isnSuqxZekYoT5gtqoowhH1JZ
         klc+N3W/Rz9DqK8qJgA5NMshkkCPoy13TAOlNJfhHKmflEpdHHmaZbwhhWbjN5ZpDCDe
         akBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786338; x=1768391138;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ob3g5q5jWnPVuY+nnqbiqZRINNocwJ2SJ68hLxsq1uU=;
        b=BmEFmcz5R0CVcBtTH/nxPiqa4xQ5VoJdf9QjVkeTMKhQhenRwsYIOv5xN4qVWOINrS
         awMqWRXWwyj4EQ34rHIxooO+rDHpadAk3qma4YD4JA0MKC+QJx0WUkyVLyVth3l1BwE4
         9xJetmx45wzzM5Sw7yUFud81vW2k/uPk5ykIRgtbgZscIypZrhMYkXjB6Xt+RhSlncJ0
         wWkFZg2m0hVDgAE/vsQKcZRa8ikwQUddyAE3Mc1YzCxF0Fmi3l8lA7V2wWdO/OARKt2f
         v65TbSX8YapflypV6+KPO9o/kK3+PnT1QUBSQPSI9q5rHKBWeQOOMRsRkdwW3cU21Pb9
         4Eow==
X-Gm-Message-State: AOJu0YyYQKU6+mnddQqirj5/y5ma1KvBvDagLU4ZkLTfsfvEJMmDZG05
	vAGIwNfttRtIvneuoXhpEFHievtwQeo5l47XntaTZyYVaRnRyC8qqrZrpuV2LGrw+fQ=
X-Gm-Gg: AY/fxX73mfDiBbcb3WvfmUm59qRw+RP14I6SCVdXL5vw/c/j8dE3n5b6cp1cdmMi058
	08Db9X4RlBKrzMu8EQNIck5sSo+o2Rg0NoZQ1bPXUjgwvc6altVKH3uSLRWgUuVFjJ/ahRrvhg3
	55iNBWBK2H/Xt97uYg4uynoeISpx2TUQhyh7BkexuzxWTKV3W2rxrTw7dg3FAOEjUzbq2N15C5+
	AtKyOO46EqhbK2g5MDv8WuqiA4Aj5vkve5uv17Wo413bw8fVnNRqY02KodCmvM44fLMQNEpvu2X
	nhjchfYYgU88GYIN2BJhs6SVyNjdZtOAhXlCtfIAZip7zGKR4MbHYgQwbBqPgmQeFSyYCX0/Egj
	fkP1mG/PhHZAHXUl8YnLjcXdEuHDVlxj0OvtvLu/KEiBelP2E3rGqXuEnyTWkYE8tPEMrK1iBJI
	hsuCNg7FKGAPW7Lg==
X-Google-Smtp-Source: AGHT+IF+cPqxULnBUelcUpCMFoIf2W5SbdC3yAUiVTr+97+8pbT8Xepe9yvm6GNT+o8qSLb+2Lu6+w==
X-Received: by 2002:a17:906:ef0c:b0:b79:eba9:83b4 with SMTP id a640c23a62f3a-b8444c5a60bmr291635566b.6.1767786337696;
        Wed, 07 Jan 2026 03:45:37 -0800 (PST)
Received: from localhost ([195.169.149.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d0290sm483752666b.32.2026.01.07.03.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:45:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 12:45:37 +0100
Message-Id: <DFIBYFY6L63Q.1A8WFXEQ7DYUT@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Jessica
 Zhang" <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Sean Paul" <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jordan Crouse"
 <jordan@cosmicpenguin.net>, "Jessica Zhang" <jesszhan0024@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>

On Fri Nov 14, 2025 at 4:43 AM CET, Dmitry Baryshkov wrote:
> - Rework mdp_format.c in order to make format table manageable
> - Rework layout population for UBWC formats in DPU driver
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v3:
> - Readded disappeared YUV flag to PSEUDO_YUV_FMT_TILED
> - Link to v2: https://lore.kernel.org/r/20250905-dpu-formats-v2-0-7a67402=
8c048@oss.qualcomm.com
>
> Changes in v2:
> - Dropped DX flag from the tiled NV12 format structure (Jessica)
> - Changed round_up(foo, 192) to the roundup() as the former one is
>   supposed to be used with power of 2 argument (Jessica)
> - Fixed undefined varuables warning in
>   _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
>   condition (LKP)
> - Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb3=
1b8c8@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (12):
>       drm/msm/disp: set num_planes to 1 for interleaved YUV formats
>       drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
>       drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLE=
AVED_RGB_FMT_TILED
>       drm/msm/disp: simplify RGB{,A,X} formats definitions
>       drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
>       drm/msm/disp: pull in common YUV format parameters
>       drm/msm/disp: pull in common tiled YUV format parameters
>       drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
>       drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
>       drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_po=
pulate_plane_sizes*()
>       drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
>       drm/msm/dpu: use standard functions in _dpu_format_populate_plane_s=
izes_ubwc()

Seems to work as expected according to our messages in IRC, no issues
seen booting up Phosh or SuperTuxKart.

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
>  drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------=
------
>  drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
>  3 files changed, 391 insertions(+), 1552 deletions(-)
> ---
> base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
> change-id: 20250705-dpu-formats-0d5ae4d1a1b9
>
> Best regards,


