Return-Path: <linux-arm-msm+bounces-17694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C9A8A82A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA20E1F212E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0485D13CF88;
	Wed, 17 Apr 2024 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggQP+mbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFAB13C8FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713355131; cv=none; b=LwA5OgsYyz/blPBSpdP7cA4CqDeLL8pp4HKCjpn4npKbY1yuEzL3GGa5634i9OTYaFx8FfQExO+kBQ+XfMtqxwlpobWZLGc1vJ4ohhV8eglznkrTd3wj5uGpecgmKK1n6vZ39f0S5dzEr/mZtHf+n+PNioBHRnvUZP1UndT8IlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713355131; c=relaxed/simple;
	bh=Z17/MC6Fv2pd536Z3BjzeHPao04MS0TnqDelEF/QRdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOchhSSJd0gieQW3Jyz3S1u2XXAYenPWsvbrt2dT3D/hdrt0eSFQ3Zlm9S/RF3yHhZfbNerOZQlbGiLGIalGOSPBHPyAi6iy0VohL011pBjTKg9VVH/fw8u+MnIeLp0cNUS7nMsUrDanM8Cjetp8iRGCV4Tt+mKpKXuCY9qwzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggQP+mbx; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc73148611so6126028276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713355129; x=1713959929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XOPPymOpNWV4lEvf0/qp/BaWhSNyYN4sXc1brxkavt8=;
        b=ggQP+mbxdG3Ff6vyyhZnj5ajWlGQ2Rw8ejmvuXriReR8IdHW37w0InVZOH5iK0gZlU
         T9i7qQjl1jMb8cHzKDDE+0p9CFGShV9BFebdq9Jf+FTRCa0L/eHFMnrKysUBzUGOggxJ
         5QEavAyZ8O74AZ0InL4kwTZYwsWtmy40XXOmQ/+ujx+ZHDImAwMIRvnNZs0vlc+kMyUP
         j2Zd8nHrET+3wwIs6RPqzXvqQTYxDgEDxbRYebO4DO90r9iNybhBmZNVsJFeAKiqqdaD
         rDdIQjbK4nHoTgxveazbdg508+6quCwBVGEaCkiy5NR/C3ksNi1sdAqLZKDkXI1zo/kB
         MTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355129; x=1713959929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOPPymOpNWV4lEvf0/qp/BaWhSNyYN4sXc1brxkavt8=;
        b=TtwP0j65IvK24JwcOyPOwxR24n4sc7w9eG+nqyVqD5jBPgRsmLIQEMhtHvwNDlZTKk
         BFpQjCRQM7i2jyhpSfnZsVNwssajIjMzggbM8CJSLZTHig+Yl1REwx4YXWhLG0accmBt
         l4fLCFBFw5yLOm0NexTV1e7MjHbB493N6hLo08Yg3GWBNbq1kD0023iLCMcmRsp2suHF
         F/267hrsP6/hlNYoqAI+WCTyws3LEPqOlrfaRMdAZ1IpcE8nXsJf89r8abm7p9ar+I4Z
         qVi+jZqz7z7DSAdkXUTNOhKiSCEY5Nj9ZofCxAgQzZKg6jL24Tic1TdOB4U79BphE4tf
         VgOA==
X-Forwarded-Encrypted: i=1; AJvYcCUH46IBdsGnu7Bm8qisXOCk78ZHFVPk9jHwoT143OTnNF2ZvrTd0nj+2YVWOtssqavAYJ5r7WRjmHzg02v63RmUtIpU/Ph2pf5lzRPSBA==
X-Gm-Message-State: AOJu0YxOawS702sxO7T4CMFW9Sh3VGGXuwoDZjJXk2/Q4VIUawwox4dF
	k6hM56Zj+SIIG7ElFKs0mS6Ev7iDRrSv1TzyQedyWdm/uRPWH3eyYq4+uyXENeXsoll5IDMbg6N
	vWdcV7AEXASf1doSpQ4peawdMQynXyNJ3SAdQ3w==
X-Google-Smtp-Source: AGHT+IGWuoBVMJIXjsmFPRcV8rj/qKuosgGA9fD35ftEBu5XLin6FbbgQbGoS5rFLXogGwGfuH4+cF7K3SUTk2qEnlk=
X-Received: by 2002:a05:6902:1345:b0:dcd:aee6:fa9 with SMTP id
 g5-20020a056902134500b00dcdaee60fa9mr15751750ybu.53.1713355129449; Wed, 17
 Apr 2024 04:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:58:38 +0300
Message-ID: <CAA8EJpoOMUbhqX2hcfCmU9+qr313naYi1d-rsUOqRuwaRC=3kQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/dpu: Always flush the slave INTF on the CTL
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Archit Taneja <architt@codeaurora.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> As we can clearly see in a downstream kernel [1], flushing the slave INTF
> is skipped /only if/ the PPSPLIT topology is active.
>
> However, when DPU was originally submitted to mainline PPSPLIT was no
> longer part of it (seems to have been ripped out before submission), but
> this clause was incorrectly ported from the original SDE driver.  Given
> that there is no support for PPSPLIT (currently), flushing the slave
> INTF should /never/ be skipped (as the `if (ppsplit && !master) goto
> skip;` clause downstream never becomes true).
>
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_cmd.c?ref_type=heads#L1131-1139
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ---
>  1 file changed, 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

