Return-Path: <linux-arm-msm+bounces-33832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798859982A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE7A1F22889
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A861BCA04;
	Thu, 10 Oct 2024 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcm1tPcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20A1BC07B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553399; cv=none; b=NlZdXZZ1ahuHksaqFFOUkfqhR8XqQuRhvs6RDXCXwf9nBxYenJQJpdHHWRrC+8hkWgdiftYSib0a4hw/jee96E8Lbv+oBGB3KD417X0eGSQvwj1fSECeJOaj/klohstScQNI7hejRNHbDRonl+9FDa6peFbpFsPzo+G4uuaYFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553399; c=relaxed/simple;
	bh=elWr+mwVd6CkzzyfYaNrNJXReGKDX69I0EyQe95hjNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRis4s7VYIDA4bEx4ewzrUz7kW/NVqICCNDmryRdXLNLIyoUiwpnZRFs8vTAD6eBZGm9KIgm9mC5GsuEHXZ9cfgJXaKOX6RcKTjmFkjiBhh5Vj4TwFBmJV3ZdGbx01h4zUQvJ90NqNCLYO4w4dNnaX8uOSr2QTqXg98YA6nYGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcm1tPcF; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e330a7b120so4864357b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728553395; x=1729158195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1CATrtMWn6F5QT6eZk/r0oyiPtlYTjTAFuFuazZn49I=;
        b=zcm1tPcFhNbPRyjBETgidGqkgeU7dCb5xHc6ETN8hr6cN3tNy+rNNNDhpFLAJowRJf
         FgvpjxPFPce7Q9WNpevKPyjMVK2eLDqVG32PvS4yP/m88BykYddjkeu1hdYlzXawf2tl
         jiemOa9AtdfX+edncu0HrHRUeFby6vYIe8OoGoCHvhyxqtM204cGehpGYQIEJcBrnKJc
         z4tk5XxCPPIzHLz7jboFPcXwF2HENDmL7eJq+wWHyw7H22BpdurQC03M1J3dhU00tic2
         y7Yfq8zbO8TRq3KLC87aGMoJqSV7DrS10iM5HpcOgjN+UQanelmGurvUBeZDW/2gQ+M+
         q+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553395; x=1729158195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CATrtMWn6F5QT6eZk/r0oyiPtlYTjTAFuFuazZn49I=;
        b=WFKWhYriALTMMXNax8BPqKKou0RNP7M3f2Y9wBw7oHaMe4ukCiAIWWTOCW0O7qluj/
         zhTq5BIu/pTqYiF+r6Br3hCJ5wur+XBmOWthBpcSn26DGJWp0pLy5y8ms3qLqbFHniWz
         3N7GM4eSvRCsQGkRGPZJk+JP/yAvMf4mccfd5vAaXjMWn7Ddz8qRSQfa95RDLk9E9JYw
         2NpBBzjwzV0T9M21dRqikqutjXO7+Vljg00Ko02v4k3pVD8Z324ZwAQMrflAWKgNe196
         wPi3jAgirJKVSbjgJ1EFab921as2cqEYNWpDxxi0LFLYuGC2n2ft0g2G2EzpDbo0YGn3
         S1jA==
X-Forwarded-Encrypted: i=1; AJvYcCWISx6pF1OwZELtdQ3WoyOX+qZn/PoTndLe6inh7+FkVLw8fH+8EUSSSbIVgW+goOjRUU3Iji809bNIHZ0P@vger.kernel.org
X-Gm-Message-State: AOJu0YwbksNaBWpsyLJUpNvIC6tK5GTUd+cqBataTYRUJ2THXaJAP0Ik
	uOtpqmZWWVC6wxIY/+MuHCNlZhZZyaFWxgcnoz1v0bWk3VCzjrx9lcWFhfSwL59FijXwnjqYEkm
	IwDxMDpw8hpQsYi+Zy0xNezq2ZpBSLzER2aOuXw==
X-Google-Smtp-Source: AGHT+IGQsfLmiQXBMuj7PPXTmXpl+pQHwqsX8qRdNSbosQyMcl6gJbMDDqLIOVBG7FvEH8rByhIg4jNfV7DhdN8whp8=
X-Received: by 2002:a05:690c:6507:b0:6dc:c105:6d84 with SMTP id
 00721157ae682-6e3221d4ec1mr58123967b3.12.1728553395610; Thu, 10 Oct 2024
 02:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com>
In-Reply-To: <20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 12:43:04 +0300
Message-ID: <CAA8EJprWLOX+TcByO_UFx77HxBX2Gi5y5QComvdRb_Jcyyv_pA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: don't always program merge_3d block
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, 
	Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 06:46, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Only program the merge_3d block for the video phys encoder when the 3d
> blend mode is not NONE

Please describe why, not what.

>
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>         intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>         intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> -       if (phys_enc->hw_pp->merge_3d)
> +       if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
>                 intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>
>         spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>
> ---
> base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
> change-id: 20240828-merge3d-fix-1a8d005e3277
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>


-- 
With best wishes
Dmitry

