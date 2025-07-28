Return-Path: <linux-arm-msm+bounces-66940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C4CB143AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 23:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06596189D11D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 21:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38586230BFD;
	Mon, 28 Jul 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHRDZMbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD52227E83;
	Mon, 28 Jul 2025 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753736653; cv=none; b=hvw4oJ3ltFeaV4de+y6keK8BwOcYqGd7H/f7QkmAfvNUfDrbkH0rwqCo6lj02j6e9UA2w8XhoQVSI3eh4IYTQa+Rf7OEG0/ntHuZzodRnsaWIKdUtV2ejXTYUrbbxhxqzoGszQRXNPVhjmbwpS+w652a3SNcq9+T8gS9Opxkszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753736653; c=relaxed/simple;
	bh=Oy2QtA3L0mw9Oxz8vg5WindVtsK0mDimZtQF3T4ZTjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=az1IFMIT6j4iSqJc4AUYDgu927S+xKeBD0NgEEVnBxcdZsTXdlm2Q4a7bDOPH+D7z16GnwTyY7LWlpZi9TDuv3dkIS64i025mCHRXZqsuMueezJRvS62pJno1vmChYG9MDGOzO2ZoNSn/5CEBx1m849P8RMNBUxNIYbKWl+aEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHRDZMbC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31305ee3281so846871a91.0;
        Mon, 28 Jul 2025 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753736651; x=1754341451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQOZsxNcIwMWPzO0eYphZcFK2aSCHhJ8B+H+YjA4cbQ=;
        b=LHRDZMbCVkGUXxWvV7TKa7q2BvquP+3svM7ZGQT+Y0oOxZvmZBhDpezMPa/jwe3iFh
         JjJsyw4f6tJEqI1jcdTiMpO91UuasCcVCs+nHaRlgxKkJ4b/pvflSShCMy09vjaA7CPM
         Z6nEaLjUP3vm3Fq6INm+RSr7sMPnHml6KpIu5sydSrEYfP/aaed3Bq5vpfTsB6kMkiZ2
         0h1p0THHgUNlQndBxIfqCKh/RAcsg1QravfxEXCO+di1AwUeM0CAG7rZWvHxYY1QL4hO
         amw4c+YXxdHLocUQda/KRq55eVyoSOsLkud3/RNr4giH0IoOk+HhEPRIM6c58TaWJBXI
         FotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753736651; x=1754341451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQOZsxNcIwMWPzO0eYphZcFK2aSCHhJ8B+H+YjA4cbQ=;
        b=FsKNb7mjXMkQzkNA9vuKwq5vKyI64rok84rkSxv0hlJ+tYhr+bBwseDYcC+prBsGUO
         Yw0N3r1qJTUj1Ncvmoq1tz5Xw7+W9qCixSb10h8DILAjIakG4xhuz8IRxaG79PD6yX42
         GeCoBI71cgtLP65HKR9YjB7waoitvIYyLC0zkrddvWemrU80IyfnPv6nz+ZTGqr2jBzq
         PkPuGAZP8LnBFceLRq+syh/XOWJKMGQhrz9a+1R9ZJr2fnzXFlrs4ypkBECTayeJSTMh
         G98swgMo5jEkL4cPAesfQpHda5Mth99+cSnpEyphrE+TMJPckpqVLpxD50kTxaeODYcN
         uqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbH2iBQNjY+MxdZeCbr6ywJ9peu3ro9xFLcGCvQvsLIo+2iYquUA6d57tQqrGh5hzRxd/XffgrBQNicGmg@vger.kernel.org, AJvYcCV8N6gGiWyPn8v4OpXr3+3rho0WkLZM6qXhMvaHDnDi74yfdTCjvCfoyd5dEIUgWlHBTd5C4clovREZ5EFo@vger.kernel.org
X-Gm-Message-State: AOJu0YynTqVu5eDN0wWDStOzc/xNMAmWIOe2GKArW58bMIhVa242RiuN
	aDQUba6xdGa4808umshX9/hUA0rgWf5gyyfWqMzh0SW6M5eoFfEQPjpff/kWaWPQUvd41j4KBgV
	SaGCgtc7NkvNpJWG7vszpkWpjRPpSlqZNQQ==
X-Gm-Gg: ASbGnctKWxDIkCEBQZO70FXwdnXmtygYwSoD+MHLeBAahGSA4z6Za9YHtrQqJJ0v8lg
	FVfd4n1t+L7sv5GuHf6HiZIgn8D+jDAfUERxbT7WQjvEHhhfr4M+FM8ysiD0vOPX5UN5ELX9loo
	t4t6rxfhJv1z7ZeMulMKADjLaghKzfl9mnM1b8wxBftS6n/1h4Ks7EV7Cf2DW+7ijFRZC0PWB87
	FBRakW8auSm8TE2fA==
X-Google-Smtp-Source: AGHT+IHXV4AozNz1QhmqR3N4z/5+NI9Qmws9ZNXiu9ZBNY4JEZhI6MM87EguI/j4COGgXvJ2GC/HeH+W5+DXY6EfEJo=
X-Received: by 2002:a17:90b:4a81:b0:31e:cdc1:999e with SMTP id
 98e67ed59e1d1-31ecdc19b15mr3744592a91.1.1753736650794; Mon, 28 Jul 2025
 14:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com> <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 28 Jul 2025 17:03:59 -0400
X-Gm-Features: Ac12FXxL-grY8XpxM4b1WvaHOSNhuOp0PxeaB_JShxxPOJcM1Ma0s4Hr5Qf_lsc
Message-ID: <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qualcomm=
.com> wrote:
>
> This is needed to properly interpret some of the sections.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.c
> index faca2a0243ab..e586577e90de 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_=
obj *obj,
>
>         print_name(p, "  - type: ", a7xx_statetype_names[block->statetype=
]);
>         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
> +       drm_printf(p, "    - location: %d", block->location);

We should probably at least try to keep it proper YAML by indenting
everything after another level...

>
>         for (i =3D 0; i < block->num_sps; i++) {
>                 drm_printf(p, "      - sp: %d\n", i);
> @@ -1873,6 +1874,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gp=
u_state_obj *obj,
>                 print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_=
id]);
>                 print_name(p, "    - cluster-name: ", a7xx_cluster_names[=
dbgahb->cluster_id]);
>                 drm_printf(p, "      - context: %d\n", dbgahb->context_id=
);
> +               drm_printf(p, "      - location: %d\n", dbgahb->location_=
id);
>                 a7xx_show_registers_indented(dbgahb->regs, obj->data, p, =
4);
>         }
>  }
> --
> 2.50.1
>

