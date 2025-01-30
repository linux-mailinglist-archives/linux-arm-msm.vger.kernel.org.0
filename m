Return-Path: <linux-arm-msm+bounces-46564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91FA22788
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 02:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8207B3A67F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 01:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E022770C;
	Thu, 30 Jan 2025 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7ghoGNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EC1119A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201411; cv=none; b=jH86YUA4/VQ4daJyXnOVVZ4uo2s687zJUzT8mrzGX3vpobkS3Ft4a0e7Ox01LCOkCVxEzp2hl+AE0SAKg0kwxML0cspcWe8KVR/M6XM8kDJM8kmTl319azurhrwyikmd9cQ6K2JFCaTToLZPkvLCDmAVWi+7Vd13MNuH2vR+Sl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201411; c=relaxed/simple;
	bh=NgYLCbpjcconoofr30077ok8R8hpV6JqPmIvLcsWVe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKGmsu30TWjQPAlGFXmr09lMJLCNJg7omGk3Zv5RwWUh3mRmBnIhH29NPMBOik+o+FXVBYTR1sRLr8ZG+A43cqXwzQcQQD9k7rG9JHJzASUWiTPYrg6nOAbAK+pZt0MAgAVW6U6AJsMJcXtaSXeZKA5jPPk1YmAonffdU8c/heQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7ghoGNb; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30613802a6bso2289411fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738201408; x=1738806208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnzIb+9wXFz5+lazKFHTW6EVZCQW0TtbqaQtm0YVUI8=;
        b=d7ghoGNbPscZDOoHeO8CR8b10YcBPUW+cU9HrAlYjYN1UXQPHva4kYw4+mB3kHRHhJ
         siiEBiiyQtCQBjo7CewrkB+BFo6p7wXJrZbZ9Tg0TXjknlb3f0VvH24+7ZZED4UmkC2G
         JIV0u6MRxcFfvAcvQSo80CkOMXTqeFVfaEHoUZwkcHdxJnnn1kIW4CyMbgRjhIznV1uI
         fRCcPjRof31V48qDDWBpuz2gbbVRAQ2kHVDM48RFXW5CnhOEaIwKjGTO3lCcTPBylgGD
         NPd185OzREK7JywMKglhAX6Rxf1V6Y6YXzu+zJP6HHjERE8REfzP4wVLSL75K/7UYZWN
         ifKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201408; x=1738806208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnzIb+9wXFz5+lazKFHTW6EVZCQW0TtbqaQtm0YVUI8=;
        b=ZN2PGkaXh+2lkEWQkA91M3WsMH0SwnKbhtrqtSpVFI3NwpIV99WSsQ2haaESkieT36
         z9RVD742czWL9vP7iPqci1k/ESvb8d8n62zha2yK58mehp/8sFi3jQ0XgVPPC8jS7odd
         6DxxqdCxCeD7ENtzU06FtI23RVv9MRNvoCyYaPFqtOR3AVXAEZqEve46vzCo4txnADGc
         FsSWp/AWxuOpmzIycfTmzamT80uu9KrvRaePlDOBrfcgfzzetNMeaHbOeFMx4rg3b6rf
         VDnd2L7BxXFex5HcRi5vnzbDFa7wamGPtUPgUva5JgrzYz+NhWqNDEq7cPxZAuXPEcCy
         CL3w==
X-Forwarded-Encrypted: i=1; AJvYcCWMF6BLGhziK1st+QnAXxVf8A7/w5fL1rFh3AGAad79VMp+5YURb7tBiJMrw7o5e5LF35dz/c/VqJA6WWWd@vger.kernel.org
X-Gm-Message-State: AOJu0YybjGuIzp+MyI7AeRV34perwbPkq4iZkKGvF3QKOtNB1scVcuO9
	RwMaqmL/y2K1zxx4csh1sAGTNDWpQYU4lg/Dnb4H1X9b/lb+G3f1wEZ9nZ/9tfk=
X-Gm-Gg: ASbGnctl8lxm2xjgY6qB6e+1GcgCxbR3iyDxTV0KBWxJ6uR6SSOKKPCuyNAW/rIZR1u
	IxnoxJcG1MuEsC4sMNlIA1sYPDEMJrm/DzGn9VvYS3+GyrKqwSC9JH75hGwNKiBtSYANHvmHR/O
	5H2CziZS2ixGEWdyF5eVgnF1Ac2/Z3v5Mnw05CENiMXDe6rD6ktrHLOCT12Fd+RHtVpFiirKrR5
	7yHvoJ9J2Mkt05F6iiieiIr7vNh5/8bqUHjkYI6vVvtjo54S5XfvcAMAatbxsaNjeom3C0XDHCr
	AKtLoeNUge1sF2CEZDxQ8JYECL5MuNA/i1clQuy73RzsjILBoFMilFDdToDEiZlpoMBZxfA=
X-Google-Smtp-Source: AGHT+IFQ4ROSqBoLumU6cps0fxCphR6LyRS4J9t+UuOgpON6XgpcsFKDCCwkSmmwVIIpI0Ne/byzGA==
X-Received: by 2002:a05:651c:2126:b0:302:1b18:2bfe with SMTP id 38308e7fff4ca-3079694dfbdmr24041561fa.25.1738201407782;
        Wed, 29 Jan 2025 17:43:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7cbcsm521981fa.87.2025.01.29.17.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:43:26 -0800 (PST)
Date: Thu, 30 Jan 2025 03:43:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-3-6464ca5360df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-3-6464ca5360df@quicinc.com>

On Tue, Jan 28, 2025 at 07:20:35PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Up to now the driver has been using encoder to allocate hardware
> resources. Switch it to use CRTC id in preparation for the next step.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v5:
> - Reordered to prevent breaking CI and upon partial application
> 
> Changes in v4 (due to rebase):
> - moved *_get_assigned_resources() changes for DSPP and LM from
>   encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  20 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
>  5 files changed, 113 insertions(+), 125 deletions(-)

This patch seems to make kms_color@ctm-max and
kms_writeback@writeback-check-output fail on sc7180-trogdor-kingoftown
(limozeen didn't start job execution for this commit at this moment).

- https://gitlab.freedesktop.org/drm/msm/-/jobs/70213449
- https://gitlab.freedesktop.org/drm/msm/-/jobs/70213446

I've restarted the jobs, but it would be nice to understand the cause.

-- 
With best wishes
Dmitry

