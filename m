Return-Path: <linux-arm-msm+bounces-45859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277EA198BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0E173A4B9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74D5215784;
	Wed, 22 Jan 2025 18:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mltIgI/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21CC21576C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571451; cv=none; b=uqJsI+TNeVFle30gQROXUqTAI/zp+46bsmdBv1xtGUmHDvm6dUZlCAXjrP1tq4cafsgjLPaQ1Luq2vPc52DRy7DGoMuQjlfgUsGuc9aPcc8NUsfWULVGg7jBrn2oftX5/lxe0XL8KFsy5d9GXeUOHflkr/6IkwKEdCilyC5fhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571451; c=relaxed/simple;
	bh=7Nfz/OPxCsSUiDumZaHDt5vPDTSqrGHGGjvs79CZB2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+u5LDyem80aB4hmfgxjU/poacwbYgIruXtMkhNaYT0XXfPS7L97dEyUQtguIzKgg0cNyIEWvC9gmgEOLyBWroelyomKj4m4PbTi+PZm6PR9m8eat3EtUx3j2WeJFtmWceSfGs7UkRr0IXwd6NYCRnI2/jplyi3El2Qdz2Wd26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mltIgI/R; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401e6efffcso105649e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 10:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737571448; x=1738176248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUgHEQvD1kwE2u4wD1OjgHGNz901+pm9SiPReBHmq0k=;
        b=mltIgI/RYhY5YXMTZi/fop3qme1sCBH3SeZxFba8tVLfBht8/4I3POPHOSWYSARu1L
         /NefKoLiJ0RgeaE7UjW/tvw4PiW20JBME0l5JeGUc3xRnKb/PKVh0iCaR4gXuyq4BpTj
         Xt5aYfzmpLBZzZ9zjG7N19jwTbVOpCetogkdHVCS3L2yPXfaOiC/UzaS6dzXXzT7ZP1N
         tT1ycQUSvG8nHMJGVdRuCvizjpbXVVOObzyKdzn2oUKKQMgHzuDof4kkYxFVhQStXBMx
         xbMaTcVXBMZoSHyazEw+rWKJ+eJcLDwxxHR2nCRkN+n2tamx+BFwbr0tjrdXyrq1eMR3
         AhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571448; x=1738176248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUgHEQvD1kwE2u4wD1OjgHGNz901+pm9SiPReBHmq0k=;
        b=d8v5TU+ZviBE6PLEFbAPvtfU+GW7Y7jtudCKJmTqVNfAgiD7VwBrwbXyDo48b++/wT
         bemIY3jl6bdDPaDE72BPWofmyDk3Vj0vRBGi7c92iHHDjdFMchs8/SO1MWaDJ9R35hL0
         gLRRKqlc0nU2LosmSCYWO0n073MFFdPi5lWw1ja+Bs5exDvRhBuo+PuCtRYoxavKjPXh
         G7CmZe+k5hdKl+vpQ680ULzfgAd3/q+PVpMJeR+O95vXrdsd02Y6vNHdcH5lrqSvabfw
         cdL9coKlAPB/4SQh39HadS9zkez+2XtJjI1I44m+7ZKk5NZqF+4EeDaWMPM0y8qvqiUa
         rzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa7Jz8Td/IBEPWWMof7DTaFcsqM4knW/RfrdVp0PqD9QRysfKDQAiBK8EoN7KNwMGe9q01SYXdvZCOoqGL@vger.kernel.org
X-Gm-Message-State: AOJu0YweogbsktWk7waU3cM9m4RIeZy8+x2ifhUul+1LUvJB/DUkTbwL
	aFlXtpSmIXitOGi4EGlTZCms8h0j9f7zST6O3neA0ecCmpDi+fwy8/B78m7mqk0PKwLNivRm2UX
	XLDU=
X-Gm-Gg: ASbGncvl3HSriFmkw/jsPE1HnTsb2GnmafKYVDj/2rQ0QYo7BGNEI6y8IhYI+ZT0Xim
	uUuzGn+iBLJrOCcgENE1Xd4MRalRywnETdr4nmONVEX5s7lcW+1ZkmjXHZAtKioevsxpUsa5zgs
	v1o0Gl6fAv8xhb7js8VSmh5H3XlTCGgESCm3wytSbnSMMPQ2k5a7mi/sRxmkyM2pGX+TfZoEmUb
	L3OVG1Td8EmyJlFAsiqyMGpHwi/GLRx9e2TLGtD4yKz5B6S2+lZ+z/1YJZMaTYMqJQVXJ/IW6Lu
	ILHGAI9/6XkDUjRFpxOTKXILhV+a3GuABViCPNNuxhIUANY8sQ==
X-Google-Smtp-Source: AGHT+IHMuKyIPqrIK1IC1oXzTkFTwuVuxFfR+V2buzAGSQuYz6439CoiOvQ3yyfJTt2r4jUPkmIBJw==
X-Received: by 2002:ac2:5611:0:b0:53f:f074:801c with SMTP id 2adb3069b0e04-5439c2830e9mr7436905e87.41.1737571447759;
        Wed, 22 Jan 2025 10:44:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bb0e6feasm452237e87.12.2025.01.22.10.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:44:06 -0800 (PST)
Date: Wed, 22 Jan 2025 20:44:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <kzmxf6r5kiyh2pr6hdzlwi3gwrlh3g257zlrpk4p5s66rhofio@qm2lbenuc2gw>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>

On Wed, Jan 22, 2025 at 05:23:44PM +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
> Changes in v2:
> - Fairphone is one word, lowercase the P from phone (Luca);
> - Skip unnecessary if (dpu_enc->dsc) check and always count the number
>   of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
> - Revert irrelevant whitespace cleanup in DSC comment, even if
>   worthless enough to send separately (Dmitry);
> - Drop dsc_common_mode=0 initialization and move existing 0-assignment
>   from a random place in the function down to where this variable is
>   actually being updated (Dmitry);
> - Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

