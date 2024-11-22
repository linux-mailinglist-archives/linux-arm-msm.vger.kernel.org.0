Return-Path: <linux-arm-msm+bounces-38774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D63519D5A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A171F232CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64861170854;
	Fri, 22 Nov 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQ7G8SYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF8E165EE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261073; cv=none; b=U21kCapFdU5y3aqlzNM7UGxGS5aiKfKuGlCMRZOx03aNduTtnFn/mWGdTmisdd/Kch/XsEwR928twpL1qnFCuD8vfrCx2nQMZogapgs2CqP42tJYwWbYFzlIkwKoEsiRT5wuXxibP8zNX9jfyKGGQhM1xd2w5XBfPKa43hv1tAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261073; c=relaxed/simple;
	bh=/jZiFBcnKDbVUwsYZ8hk49yCmPvTPuKhLMbGU0n+h5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0qpfKBKZZEqQ6KYy0HBrzm5C+P7kfcgksK2Ew6TRO/II8UoW3es/0Bs3B9q9pqpgATGRAjYmDTTvSFFXl+eVx/aSrwR98OtauZuTMXl6CrOXUVJDERNMB+XRXo4C0AhnAReNAJ9eE8vVMlUTyt69xYGndWko6PjuPl2ZvFH0Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQ7G8SYB; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e388186edbfso1707171276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 23:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732261070; x=1732865870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HhgnPsxbtAGKA3xmOET2t3BpGHgSby8uS41dAwaa5Yk=;
        b=GQ7G8SYBmvIZrWsO6ReyTCoyKI9RYpTUTTe4r9Erej9W1VGcp1kN8I9aiYUAD+jmbf
         iW5nhy+wj3AyWAj3zgvot3+B0+qGwfHTwAFu+iFzbeINU+TeEKIO9XvsEG4uVX201c6J
         t41DFMgEBcrafO4vU4o8r7mPxYRTh035iESZlUJrdtBTkLhACqcIAwNznXUU372JvZDs
         wvIKNiLKCYpp5hUjqDZem5HO8B07x27z5TW1519c+2k1mLQd1BIcikvIWajNmDn/pjr0
         leptcvdihcUibrpe3Vcc4Kht4eLzKl3f8mdZN3z1ajpyErgKleRmS8vP8KtQKLl3Tmm9
         Qj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732261070; x=1732865870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhgnPsxbtAGKA3xmOET2t3BpGHgSby8uS41dAwaa5Yk=;
        b=Srlcd+Z1PoXxPD1D8uTmZ0JxgfDGq07u3WgoDjJQk4oASc2SRo6VUG3avP8R9y8jXx
         XSce5VzHEkEPeVKAaPt+cYKYlvr1tbN2Z6+sJ4leGFkoRXMaeSfDgvQCVXteW2/S+JYd
         xNHsCpgzeexPL5NQLAgO+keQPNkQcdJcteBJkpGfSxuF70nom0oCKizxM9/TlCqB+kuS
         ZgDqnIwxvgKM+5A69vZi5iNzRG4GYdyVAXkqgxb6k0T/4+mrVVoYHTEy/tAyK8L41ISO
         +LOpnFFPmNsvJDWSmG85W2gtVVsNeOA8DR8I6jrKV3Yn4JGhZtNHFABbeZbu13+zfOM9
         AdLw==
X-Forwarded-Encrypted: i=1; AJvYcCVCl2xfrkx3jcpb7zQnnPlRFvZxfarxzZC9YbdEp5ZORiSGRkmqyfbbDlW58t7cs5N5whWJb2ONlr67iEgx@vger.kernel.org
X-Gm-Message-State: AOJu0YytSRobYl6oK77ea3bfmOtKE5buHONxwEp94pAuw5E4+poaGnD+
	WuQ0N2afgnAECIG8MTENeCdl8KIsE0HG4EKbhnywr86zWxVoA1/mXUaorVuEH2yqd8w8HkWJbXX
	pVwyyM9eSf/uT3nf3iKWDTUq/fL6VjE9takpG+tSWU5h5FnW7
X-Gm-Gg: ASbGncsu/px+iDiHlTlOu3l8Bv+PRJSZdYR8UH172vQuzLKnG9VuB1JSPlLbFDrQe8p
	QB0FRF69emV6xASSYyWF4ozPzjD6ybxwUObUaefK0F3MOdA==
X-Google-Smtp-Source: AGHT+IHxbVeNEOjCPpaz5ctyGYzfTth6KUxxy+qBm4+c6kjiY/WbSJUyW0LX539Otigf8TYzH9gfwiirERnyKSHZEUA=
X-Received: by 2002:a05:6902:2084:b0:e38:ea81:d01e with SMTP id
 3f1490d57ef6-e38f8aca119mr1679783276.8.1732261070505; Thu, 21 Nov 2024
 23:37:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-3-4efa191dbdd4@quicinc.com>
 <ezatn7e5sm74dd4xs4r4qnkcwouu3cu72vlvbbsrj42eca3dyo@xfmga7rpzspl>
 <ccfed778-6257-4da1-90af-c5d8ca5a98f7@quicinc.com> <CAA8EJpotZ8giXYY=1EjyKa1oHz=aEHecZPi4G4CfNNqSQ8jW4g@mail.gmail.com>
 <dd3ef5e3-ba93-4ffa-976a-52492832487e@quicinc.com>
In-Reply-To: <dd3ef5e3-ba93-4ffa-976a-52492832487e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 09:37:39 +0200
Message-ID: <CAA8EJpqV6QUpW7oiWxhQta_4Qm7r6j+uJMw3f-ZPFQf6Jsn8Gw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: Add QCS615 support
To: fange zhang <quic_fangez@quicinc.com>
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Nov 2024 at 09:36, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/11/18 18:55, Dmitry Baryshkov wrote:
> > On Mon, 18 Nov 2024 at 10:52, fange zhang <quic_fangez@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2024/10/14 18:47, Dmitry Baryshkov wrote:
> >>> On Mon, Oct 14, 2024 at 05:47:29PM +0800, fangez via B4 Relay wrote:
> >>>> From: lliu6 <quic_lliu6@quicinc.com>
> >>>>
> >>>> Add support for the display hardware used on the Qualcomm QCS615 platform.
> >>>
> >>> Not all hardware is described here, comment regarding the DP, etc.
> Fixed in v2
> for DPU part, commit message would be:
>
> Author: Li Liu <quic_lliu6@quicinc.com>
> Date:   Tue Oct 15 12:50:26 2024 +0800
>
>      drm/msm/dpu: Add SM6150 support
>
>      Add definitions for the display hardware
>      used on the Qualcomm SM6150 platform.

Please wrap the lines in the commit message according to the
established recommendations rather than doing it at some other point.

>
>      Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>      Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>
> with these file changes:
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>
> >>>
> >>>>
> >>>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> >>>> ---
> >>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 +++++++++++++++++++++
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >>>
> >>>>    drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
> >>>>    drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
> >>>
> >>> These changes are not related to the DPU, which you listed as a prefix
> >>> in the commit message
> >> ok will split it to these four parts.
> >> 1. dpu hw catalog
> >> 2. mdss
> >> 3. dsi phy
> >> 4. dsi
> >> sorry, one more question about it.
> >> is the driver patch order correct?
> >
> > Usually MDSS comes before DPU
> Got it, will fix in next patch.
> New driver patch order as follows:
> drm/msm: mdss: Add SM6150 support
> drm/msm/dpu: Add SM6150 support
> drm/msm/dsi: Add support for SM6150
> drm/msm/dsi: Add dsi phy support for SM6150
>
> >
> >>>
> >>>>    drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
> >>>>    drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
> >>>>    drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
> >>>
> >>> These changes are not related to the DPU
> >>>
> >>>>    drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
> >>>
> >>> These changes are not related to the DPU
> >>>
> >>> For the whole patch: s/qcs615/sm6150/g
> >>>
> >>>>    10 files changed, 320 insertions(+)
> >>>>
> >
> >
>


-- 
With best wishes
Dmitry

