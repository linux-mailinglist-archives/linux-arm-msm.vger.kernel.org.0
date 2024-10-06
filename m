Return-Path: <linux-arm-msm+bounces-33285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96C99214C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 517B3281B13
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6B31482E2;
	Sun,  6 Oct 2024 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YSbYV45l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED318A6C3
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247484; cv=none; b=fu1mfvO3TF87HE1X+XOmvTNFA7xBACgxlwD2y92wt9KUoupEDh/e0NcYJNf87VY8PkHEyt9FSpxC0V0emRnKW16+NTAhbRA5vAZMjxfiz6D8aniGsiv1FMifE6859CCmLUE31FSahCBdcZC1FNgx6gnB3POsIwEOKaUK7P0foTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247484; c=relaxed/simple;
	bh=MSMm4GU14bTXwk/jnHsTnUk5BETz1PWVtSoClOusTNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6uwgp5gxc9Ei04eYRCDrq38a7ssqMnHRK6ERUGZaMDbZOLE5FBNlm3+IxK8W7oTwi2jBdM5P2PWkWHSFWfHK/SH4ehpLG8sr5DesalGIwKoWmGu9O+SgcVgMvsWdvXt3yYoxu7lhpmLhsCGAmlu/43fhuLz7C+IlQAw9fv8Spc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YSbYV45l; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53997328633so4624562e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247481; x=1728852281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dzk3WntIySvLJWusveHPZhNWnaINtIPBE/POIj9sa4=;
        b=YSbYV45lE9i97FPdyJhPp92lPBv65hEsZw1BF8cEbTfTol/bmwI1vL2n2J+ls7owMB
         0UQtRYGARBOtwtT4ZKAXUdBPeenxXUjDbAYmFeb0OPD5S8hoJZuzcmE3WblEyN6yyktw
         xc/kQ9JvxayahtIAqTGmWP1NYJfEzRwxYQxsaVSxG+KkpFHAc73gC26ZYbAVK028/DjX
         Ro6fwyrHkqCn7686KoBtbyi3aTev78NUPHFxH3dJ3Zv6i2FkA8o9q5P8pM1EnKQnE1RJ
         UqicclXjjEQmIemiHBycUVVLYhRWDbKB41naZAvF16SG9jlGxmOZSXwRUNd0HjJrYLtb
         uZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247481; x=1728852281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dzk3WntIySvLJWusveHPZhNWnaINtIPBE/POIj9sa4=;
        b=KJNHx4FUJEHI+S3XV35TZGrxzEjPxCmyp0yO3GescKTeaRDbiEt/vuNOBqBAMBLwyf
         MyOG/0yUY1TQq1sp+MRiBbvjkD+sb+Ntx+126n9K1YJIN9d9TmO++iWCj558cS/gy2TZ
         VN8e/gpK7epKcfXbpzVLx/5/oiPL8oQkqOv8kgffBrTGgQfYCrvYVYN4SAH9v4urv/GU
         4ecUkN49+Ty44B0j28xPM4rTlVUWaDQ02JZ1qJ7Tf07IcXROs6sktxiaPnlmBEuVdIAj
         Br8CDsNLTCH6gTIppJZbAYWv3MG6+QUdn2JDwkztAYnqDgtBmFcOe193+uQalI+xztSg
         4dRw==
X-Forwarded-Encrypted: i=1; AJvYcCXvI1N/Yegu7ID2B1dwYlyNYKTFIFodC3+i7Gr7HfTrd8SwCLKMl+yRjbxOa1r7wg1uxudkRXkZB0pRu1GL@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmd8uSiwVpS2V0rPUc+uAkB90x+xjDRTMZiNIB5jaMzZdZlA2
	1dg8w+N4LeV/FDZFHLAwj3c56rbkg1gPZUbvjhLjfChcaXB/Eydu3CqOvDcNl3A=
X-Google-Smtp-Source: AGHT+IGSACiI3kw3knol095Cbq7pCc2Lxyw8CUsV9n35GwTxUyFJ2etK1ySJVEoir2VRZFMDNMgfeA==
X-Received: by 2002:a05:6512:b98:b0:536:55cc:963e with SMTP id 2adb3069b0e04-539ab9cf28bmr6424748e87.44.1728247480760;
        Sun, 06 Oct 2024 13:44:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec852esm615479e87.93.2024.10.06.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:44:39 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:44:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_mahap@quicinc.com
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <dg73wfucbacsalh6eaxuk5u2lhoavvlp3euh3zhb7tlkvnhcvq@2x55r35znc3w>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-3-d23284f45977@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-3-d23284f45977@quicinc.com>

On Tue, Oct 01, 2024 at 12:11:38PM GMT, Mahadevan via B4 Relay wrote:
> From: Mahadevan <quic_mahap@quicinc.com>
> 
> Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

