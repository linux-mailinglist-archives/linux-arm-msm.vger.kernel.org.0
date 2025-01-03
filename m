Return-Path: <linux-arm-msm+bounces-43856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35879A007F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE95163988
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 10:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9011CEE82;
	Fri,  3 Jan 2025 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMf4gPNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082D1C9DF0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735900690; cv=none; b=G7wriyrctNTPmj6/VnahQ8zKv/Ntb3tfpHJcTDof1+w6baeofBg9V2AR+WsvCxmvOqmLHO/1wNWX9bGwvz5MN52tDM8neD/LaAb3TT1Ytib4jrgWxcJ31If9hPUTBLTIkfATCSc/rubgJpXp1ngB4eP5AEGifyGTzcGUdteh/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735900690; c=relaxed/simple;
	bh=zf1Qd/rdFgcCeMiMrMD2D9UGtnejpU6H0F32as4UNFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hemPd5zC2eCXeO4IrsjqoWxhqMQTBv3r5cQ7slrs44IHHqvMXMQGQAoHimqKepNNGZ9uwOTNc5Ln/kp1aty9GQHCy7eVmzfVtSMzNvKLX/iBsGaf+KqxSaTlc2gxORit+3EgeAMEVqb/Iy6cf60B7JWCWcr1LvOA04vOh6B/Hvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMf4gPNg; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-304d757a9c1so10948141fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735900686; x=1736505486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=;
        b=HMf4gPNgx0Cq94s/Dk5BIMs1CdnRWFpSuniHd3O/+guTSmjnHbNba5v2nP3nny4hHs
         3UbFvUIXDkCZptJGaIysiECqjUJeOqI+PwrCy09Blbxj/Q7fcBbNM+lzMfvAZ5JZB2/l
         HG43sXLBstz4nhuI7qhMPfyMWbizLtk6J15gH3TOIrWeRmYEY6isx3FJROuVOtaRzXWD
         VxB6IDQAGIT2rZXVgu0xc7np3ztRFPz1auQX/72xEaSBE6uSDyF47YRYjKOAXMNhX1Hx
         tTuEj0V1TDIhDJS+h7SQ3yQt2Ond9t9zGLI/sLQdIeZ5eovOMn1/+nnMjUw9VWFGgfFm
         O/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735900686; x=1736505486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=;
        b=QkBkXi5AHOtpLdHGjGaCIXGa1xYKdMusutBuyC3S1PdJUyxL5MZM243Lb/MJkAQ88p
         tlwQcl167XDe4DS/nI/6yRleSrj4P+FSFTwlfJ76apPP8mwgUIhB0bEiYBLrJrm4EK8r
         Kyvp3BD45IljAQm5rCKpETmx5tkKQv4Xx1VBq+TSw2SSpJrUaQPrMUSjW+wDzni61vDz
         1gn+Gf0NHklenLvNk8Yd2PA9e9y/c4mAii5wfvrM9apRGV2AfDuanPq1kwCJvJ+dTZq9
         rRpMh/0rPAKV4IIsZ+/2hd2DkpDTQ7FE5+gySix04Z00soIe0T3OJFSju/IYVisKuYcA
         gu5A==
X-Forwarded-Encrypted: i=1; AJvYcCWxUyCWK32nuCeCsWgRmGO3VQXeZj1zaP+B4CX1/G7Femzr2y2x9pdv75A0BN1sYXJY+uq/YvEIR+N4EvbY@vger.kernel.org
X-Gm-Message-State: AOJu0YxBRJRKxGlqxox9RE2H+0H4COYZRD16WSPskqyMA8jY6z3gcmjw
	32uSj1hGUtmBcXOxaVbf2uEGZw9OayW3D2H7Fn4dfkQbgffzTgLBN9St5dYAHu0=
X-Gm-Gg: ASbGncvxbj1WAD8tKu5htJacaxK2DlWvm+C3rV2v3/lRWFSIjf7zsvOBPFs7qFwj05L
	8NReMWZ806TBzKRClLQM9vbM90l8A+Eza/ryJTBurXOpb7qVPRYUbAffGyi0n29jjEODsa/WaGt
	o453yefqrREvDO8x62n7b35X/rDFJpg3skjkG4q2BnEkhMTvtqCdcNTxw0MmoEbMZU0ZD1wihrI
	uK6CWSq5YXHViU4rlV22NkSFXu+SCCOsgK4G6FMacqwEcNgNZtDVlFO02zbsTtd2q8tDWwKMFRi
	B7Sb1drJ8/Et7Yoc8PFrBjdo2uHABzhYrsej
X-Google-Smtp-Source: AGHT+IHqyYKM0jK9B76DdsBNsu1ksVUKqjrNzWi2li/1a+VHxpUAgfWN/haMqHCMVuXOoMkqVNCF/Q==
X-Received: by 2002:a2e:bc1b:0:b0:302:215f:94ee with SMTP id 38308e7fff4ca-30458337550mr161864691fa.4.1735900686412;
        Fri, 03 Jan 2025 02:38:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096cafsm45400051fa.123.2025.01.03.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:38:05 -0800 (PST)
Date: Fri, 3 Jan 2025 12:38:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <gxrc6hqlmjl2pdylvi33wdukxgz6wqbhzgwk4ptyx3i55jshic@uu45kcjailxa>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  21 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   5 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  20 +-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  14 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  22 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  31 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   7 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 298 ++++++++++
>  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  18 +-
>  drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  15 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 112 ++++
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  55 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |  13 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  15 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   7 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   5 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  12 +-
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   5 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   3 +
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 -
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  14 +
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 -
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   5 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   2 -
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   5 +
>  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   5 -
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  26 +-
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  13 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  56 ++
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 +
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   5 +
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   8 -
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 543 +++++++++++++++++-
>  42 files changed, 1202 insertions(+), 211 deletions(-)
> 


> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 066d24ee3e08..7752adff05c1 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,4 +1,7 @@
>  kms_3d,Fail
> +kms_cursor_legacy@forked-bo,Fail
> +kms_cursor_legacy@forked-move,Fail
> +kms_cursor_legacy@single-bo,Fail
>  kms_cursor_legacy@torture-bo,Fail
>  kms_force_connector_basic@force-edid,Fail
>  kms_hdmi_inject@inject-4k,Fail

Interesting. Though this might by the platform legacy cursor code (it
doesn't use a plane for cursors).

Anyway,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

-- 
With best wishes
Dmitry

