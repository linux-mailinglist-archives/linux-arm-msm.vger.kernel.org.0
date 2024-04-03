Return-Path: <linux-arm-msm+bounces-16237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0B896ADF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59CDC1C21975
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E2C134751;
	Wed,  3 Apr 2024 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLQNtr7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E2141C7A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712137297; cv=none; b=aZODiUvu53QptNGNn0KBx5W7HVR+rldtkN6l7QnUzfBSG3t/vs2tjEuIKixQ4Y937hU9DpAMyUJVOfQdxRz/WYErRebNLvL4J7i9Gg1dzbXiny9ipUWRJ6xcHQrOVZGL3134axtJinzSZG5/HM+19aEqRzvIB3VbTk7y2XkAyaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712137297; c=relaxed/simple;
	bh=2n0SI0PCJNLsmym3XpRftN0ZKee56xcXmb8IjevYUO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bs78pYTvAbdXEKyLzbIx+zPMl+7nh+OyXKHumJTDCsKsPfsNYQcmYhx2NBvZHVrS2Czs9Ozv6mz1+JdZl4+zfnAXtR1P7ZqTgrgtPGjaZc3AGYLCwB8tpR6+qkuybvok3dGVYKpiqADPettrE8l6j/jwzJLtOyT8WE9jD8n9r4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLQNtr7e; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc742543119so6041519276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712137294; x=1712742094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyO+QBQa0l1KyC9aVtB+Tynj7pN+XlIzE4CNhhsDWik=;
        b=bLQNtr7eq/ajw87TAJ5A+2zfCvJtvMBFmttaab7jPLeq6CIKGypXhZ2hcMCgebFe/3
         wKK1Yee2FGDGxZ+KJred1ZuZX92P14uVZwlVQVXb4VRkslH3ygOPgJKCZQjFyxiNLGuu
         +7kK1IPRvhkkrx9qVGE+9aVh7L0gixdDmeoaTk17gG8dFzntzDkvcF3d2TqVSLo1U3q2
         z6LaF8GhYQfNk2htHTp/yQ2XfGZfHP/yGn011v0dZgk87x47X+BdvPoW/cXeXt1zy02Y
         xEKPP2em70BaWYPM8P0wmMh4r/EQeHNL7DaPNUEM0e4s/WU8gAXwceQTgs3EAFaiWpU9
         sXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712137294; x=1712742094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyO+QBQa0l1KyC9aVtB+Tynj7pN+XlIzE4CNhhsDWik=;
        b=bejd0tk5F2594kBp39jvMygsafd8/USZuT6jSoKbV+0QnNl9/T/o+k5Z3+AN288rv1
         VZihvo6D+D3kg/pbOOrI6108IesSca+Cn9X25k9F+51vreX20ixQ7i83wB0YMwacNIeE
         WsPs7SyD3JNPvuxGgZgwvL8lQOWBJfCa8myepMVvaBuZsyCrrF07ubTinhHriYw7sEFe
         d5cUCa5S0f9BQm63vnMrZ0k5E0jM8BIACDdoKRRvtlrrmz0B+SHHy4PxXDLU1q9YmPx9
         Iol/lVCYczvcVA4vuCh6DNvfMGNQI/NH2P8dZb22try+mMNEm6aMFNvQSSqgLSisJCVM
         GSIg==
X-Forwarded-Encrypted: i=1; AJvYcCWGGLzxHkPpjBw06YXBmFp+jRf8+35PJVyntJt/DDdljoz10JRuimGUOU4GtntMPqMSWfMsMiUzu1iurcYKSgZxkCGu82I/6ib/XglHBA==
X-Gm-Message-State: AOJu0YxwzyuWrsGKpE4bEu21NRdWPb1sBwvY8+eFHx9MwRJrrr+1RdBq
	734AyI9kpprLsIXklzd563L859oa59VlXvY/FdsJChBeaMevgaQCmY5BZksgVX4q6qX7oVgHbDz
	vatDE79fmVYEIcH+G4JW/4+oOY9jqZwnJlZWonA==
X-Google-Smtp-Source: AGHT+IHo7Vge0DzQtT3KcHX8RHK0g2XNH+Jxl5Eel4VaYYgoWl8Iyz2W7DVZ0oNcZ76UL25OVO7Ocj0cWKDlGl95sZI=
X-Received: by 2002:a25:d606:0:b0:dcb:e82c:f7d with SMTP id
 n6-20020a25d606000000b00dcbe82c0f7dmr653359ybg.41.1712137294567; Wed, 03 Apr
 2024 02:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:41:23 +0300
Message-ID: <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add variable for slice number of a DSC compression bit stream packet.
> Its value shall be specified in panel driver, or default value can be set
> in display controller driver if panel driver does not set it.

This is not a part of the standard. Please justify it.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/display/drm_dsc.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> index bc90273d06a6..4fac0a2746ae 100644
> --- a/include/drm/display/drm_dsc.h
> +++ b/include/drm/display/drm_dsc.h
> @@ -82,6 +82,10 @@ struct drm_dsc_config {
>          * @bits_per_component: Bits per component to code (8/10/12)
>          */
>         u8 bits_per_component;
> +       /**
> +        * @slice_per_pkt: slice number per DSC bit stream packet
> +        */
> +       u8 slice_per_pkt;
>         /**
>          * @convert_rgb:
>          * Flag to indicate if RGB - YCoCg conversion is needed
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

