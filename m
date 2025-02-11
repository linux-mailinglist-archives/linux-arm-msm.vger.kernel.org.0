Return-Path: <linux-arm-msm+bounces-47507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8AA3023D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 04:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81A61888FC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 03:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF471D514A;
	Tue, 11 Feb 2025 03:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZB3zQ6Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB8257D
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245259; cv=none; b=Ppi0UIo5ycq7HbduqkK//62SFP5aswuECCfCj/IfHXbVpEaNvEXmwe/LLcssvgWS6iNG1tzXuV961e1S4kaT6MWQY89OOUA4625mg+QtGMKyutOu5z8eXkwT0AG3TWb1ImbE9SE3Ewb/2acbKpG5EClIPgZicbuneAziO8ubecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245259; c=relaxed/simple;
	bh=m9JqgufdqQaa8IPvLWZeQy4BIn0ONuHz99VCtUR8O18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRnbTODZP96oyVZ63tSXJDUpQXwsJSJxUG3gTF1FxeO1ULrSmJIkPCko7NO+DHrZNrvFtSZsoHt+fRMqBTpmCgXaCf6BUeMkOl+S0MRQHMptXgu8xlIpO1yoky+hKw7JdJDLXBTPaZ7Rlnyv9ZAwAhXUgzW6x7e5mpB8OoEgjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZB3zQ6Z; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-543e49a10f5so5372647e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739245255; x=1739850055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5vAtkbKujewPgE+URJArLsNmDebMF+/Ud9vX6A3NATY=;
        b=GZB3zQ6Z5rSZpKtXwfGC16gPoVjk/gtAEqoz6Ril9occ9IKeU/whfMtpg2f8lsGYay
         gknU7VrfM/ajcfIcup8izrSe3GB7fhzmElcbZ21/OTn7DJxG0tdM97DUdgCEIs23s5g/
         f6Y2q/qBXZ51X+eowAmYgQLVW/rMO7PH7ua8oLLLTHtNlWnHLuliI+vBKHroIJ0TxIRI
         tC7/KMhRAW8AuI6gD/QUMcYw26Jr7jAVabXxafKCIOgnCjwsOsmiKR2VeNR8ImKf5wC8
         thb2+YiURQq4Cqrt6eOWzCC617/KACsF8U/gWCZD6S4JcaCgvDKBT+KVjZ7YSEu2wGhS
         5zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739245255; x=1739850055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vAtkbKujewPgE+URJArLsNmDebMF+/Ud9vX6A3NATY=;
        b=lodkJ994C8qidemF9FlFuc8zP9n2/4FM6Od93AKXXoGE1JTuWq1wcQ7Q0/kT7QjQg+
         hv698Ida6/A480qEZqo0XxTdW4meQxzULvh4eyS0p4wfN3Wwv2mACrM8kDNxc7I6mu6d
         jY2TRGzZfwlY416QZM9Jw5kye44DJFut9Nzl3c2WijTqfPT9x/9eltkbDRDEfvcPQ357
         PhDzlai1Ta5lOzt+YcR4OVErESrnsL5yWitc0ylmoONWOSarz11ZxUI2bBmkh/5me+cy
         wQK81LFFItm/7p16m+PW/NQMPyfeGxOoIy+dnxQxUyDUWd2sCP4d70RvcQIyxyBzFLho
         OYrg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ692gHU82K2PTUEshbUJ/nHyivTL6y5ntJ827BqvAfDz/SpBZ1U7MyX9QdF1djpLjAe0Z8++AfHNKRnmh@vger.kernel.org
X-Gm-Message-State: AOJu0YziWnvDtYFX4w22PLz66cxGQhduYf0nY8Q3nOmjaWEETvrwDRHZ
	sKgZnlo8dgaSj5rQz8+W/mZIMOBBF/nzCSFQtORmhKHYMAJnygJ19qnEDL7bXTQ=
X-Gm-Gg: ASbGncuF1rd7JibXTau/QmjCK5GRO3qbEIbwRL/IHNSGwo13tfqMEyP0JzaYPuLp5F9
	StkjqP2/9ACpFMr9P65DrCK19A81/O4T5MKdg2ofccJAWBvAzzhpVNK5Dvo44kblSIeBY4HhGdm
	ISGTRtYdxaOoQsw/A+2UrMHqehzWUuQqEWKw9sMprMMqcBpoVI9djP3Y68rmWpRYaDOtZrSZ3AW
	r7QPl9nc3E8/9o6U4bfdfwr7XzJ1T1LLJDGOcQNMee/Mltq6zavS2NtZxEN1+awSbWxPIF14lkw
	3hr8jHi1njaoLK2ucDnnZISreCHSuTn2Thq7Gk3dpjZGwYwn+3i7oJ3CeV5mcMa1erOHT2Q=
X-Google-Smtp-Source: AGHT+IESIZIApI82KNped+F8rDYKVVEqRChUa6PLhZuvZfiXsjK12HtxB4DBhx1h10YT3mchL9bAYA==
X-Received: by 2002:a05:6512:a96:b0:545:10cf:3468 with SMTP id 2adb3069b0e04-54510cf366emr965052e87.37.1739245255377;
        Mon, 10 Feb 2025 19:40:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54501e3fa93sm957117e87.17.2025.02.10.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 19:40:54 -0800 (PST)
Date: Tue, 11 Feb 2025 05:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
Message-ID: <x6e3j2fbf7hjos7uel6b4kk5h5q7lwtqkacqxj43sntheguysg@k5weigzww6ac>
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>

On Tue, Feb 11, 2025 at 12:19:32AM +0100, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

