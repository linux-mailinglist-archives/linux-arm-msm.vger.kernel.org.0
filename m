Return-Path: <linux-arm-msm+bounces-30904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB996D8D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297FA1F27DE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08AA19AD48;
	Thu,  5 Sep 2024 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxbC/NB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC983CC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540029; cv=none; b=IfEO6O6H6BnzpWBBOoN1GQRQcftBB6/RDOhW61vgHCOvFq2uQKJC3sGZABKeiqXEJpvGwoQKmiz3/R67Mqd4cDsCql1ind4IDO+8roRWoiSXrKEkhcuiqNyP4CrMNDj4Nd9J5Zux3vgiGYsNeln8gWf2XrFc9f+u+LvMjZPfyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540029; c=relaxed/simple;
	bh=fzA2hdbSwtF6yNj/lg3pCMgfy9iVOOCh6iuP0KhmpcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTz3TP0hzDtg2kBMnQHrjjDt4fyJGnCo9+Rb+QhlMssrA+n6l+papYkEyJDoz+YpckMAs2OsFGlT+KyDYl0OfDiHrvJkYbWHv+axfOVgjsXzORB7sFC0VDkwPOnV2RQxoF1LhfB8HghpR6TRBBU69DGrby67wVcb2yc86PM3KDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QxbC/NB5; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6c91f9fb0acso5861767b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725540027; x=1726144827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
        b=QxbC/NB5B7kx9KoMYzo3Cgxr48xfdHA1le7nE5iAut9AEcFqI2UcRcfpM60mnoNs3Z
         384JCx7fdsT2eqf+BGdZbClF7kcdh+SjeufTlgHWoW0PJRCrPsmZ10CffE1Z3v/lJeqB
         7Gydk2V0NB7m7IFgtGqvyaqA9WRnM3v6ytkLf2PguL97MxRFevR8ZyURN8VGcsKDVyRS
         zs+bDXB/aeEcxhvApv6n9s0zTjA6tmVMBoXSEa+LHc+jwJBylKPf5+Vt58/NDEL8fyXz
         pPEs4onJhCXIhc45/zBfBvXVymWdnN2ppMb8mIs5UOBA0XLlil034rscXq1MDPJqTTez
         6Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540027; x=1726144827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
        b=QrUskGscknhuuQW0BnASRtvce6pj7cr1nDuNOkKI0zATLOzDh/ugqigPscxV1Scyb4
         3X6Z4eh/OCUDTSDt9WXuXKs4TJX0RSYOeguxENQd4veQCPnp3iSoarwzDo5fCc1jNG5N
         FIuk4PmTsRp3LXG/ABGZxjHThymtIWDgywDcBcBVCIF2SnCbuY5rLJ2VTfdtg4UNnuyJ
         p/vrkaiOfKHLCJdDeDoIoNDxA7Z8X4JdgrE1fkDfcPShcWGCRyMsw0l9yR0utZdZPJk8
         jD+0nfyo4ILTH3q7E5oZdNsBUJjQyUglgqZIKE3wPqHES7Y2Iy1o2LNi3f4P4k190NRv
         akJA==
X-Forwarded-Encrypted: i=1; AJvYcCWSRaK9fHfUvN1YXj1zMahkNTK5+F0YbVztjuSUjb34QReIxao/9xwFuk+t1IgwEtGtL8bgYb41RODOd4Fr@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3jZQ1XleEA1rfJD2dHFbitJUfqAD+RKjtSdRLPxoL8Adovy5
	3afH+X2s0ackB2ExDyQE3Y8RokXPBVIN5zkGcbxjtub2voRyzBbaDp7aCifdJBWVPsGbQmdGjDM
	/GpdNAjUG6+IGKjhnoHJFdT5gb3BSh6vSYMBCoQ==
X-Google-Smtp-Source: AGHT+IFIWLL0YlxXEHzETETRS/4fXk/TAU6J/4Fvm95WECnhr++irvMb/d6wkqFe1PbO8tUu5xvRXYLr+luqmfEBPLA=
X-Received: by 2002:a05:690c:6481:b0:6d5:7b2f:60a0 with SMTP id
 00721157ae682-6d57b2f64f8mr207770997b3.34.1725540026953; Thu, 05 Sep 2024
 05:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org> <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
In-Reply-To: <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Sep 2024 15:40:15 +0300
Message-ID: <CAA8EJprBwTH8R9-b68g-U6yA-FN6z_pt4YComNCj-xvXwvzcCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
To: Maxime Ripard <mripard@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Sept 2024 at 10:48, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, 05 Sep 2024 06:08:20 +0300, Dmitry Baryshkov wrote:
> > Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
> > original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
> > helpers") and were later reported by LKP.
> >
> >
>
> Applied to misc/kernel.git (drm-misc-next).

Thanks!


-- 
With best wishes
Dmitry

