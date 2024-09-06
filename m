Return-Path: <linux-arm-msm+bounces-31035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2A96E6FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 02:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 591DF1C22934
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 00:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB4E17C77;
	Fri,  6 Sep 2024 00:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AiPQSMK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C31799F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 00:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725583934; cv=none; b=Rtn0auuEuPvDcMEJuAMISdljNpeEeEU5TvY4iDlhV2GeM7EZNqMMbiKRH/XXh9siLY8ekeK02+pFb4h1YwSlrbY8p8k86+o3bP1niFUYJ28r6XDyhGFXOYNGuhXGhXJ1zezmlyEqbWZWX3EsoxeXOCwqvrQdC3jlKpiPdgEVKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725583934; c=relaxed/simple;
	bh=jIgbO35t0FjK78L3vHKAhnfNwuVwbXjQi1f3jtHTYhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LE8rP15/zdmY6WeKBmTcyfOJM37OXTj2d9gVsgmhq4frLWTirdEQMDLPI2sLJ09InBWB4nCqrg0lTPnOQUCpeW6psKOT+vuGrdeF0wbO+zFHQ9qKnL+OCDWLGzdHUGUZCmYwLH7f0umrwsxDLOA38TqMmuRO/YS6Big8b2v1gq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AiPQSMK3; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so17004371fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 17:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725583930; x=1726188730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k67V4d6U+a4ymIwtTxfSVTqPn5Mjm51cyPX5ZzN9RPQ=;
        b=AiPQSMK3q+Qb8+GD9oePIIoeDrrwLq4L7Oo2FkiQ2GIp83VASKDp0TX6rCBD8SIwii
         BzX0MrpcCzNnWF8HQCuGLhPU38CRJWpsXedX58/IbaNY5jgxXUMfePdoDNlt+L7u32ru
         L4axjuMwSvwTWnyMTZvi76aektq+K6vQNi/eQE1hpu57dduaAm5xoP7J9PkfhLntJOf4
         Fczin0R4fJt2H4CdXt41jct+RCwZ0TH76dPDtM+GtZ6ACVnCoMc8Cg1ggnoaP9VLX2ao
         WjXuEN3cPw/jxu3jpRqSndsmmXlz3sPMzsKSTCUedA+aiURaDlqhaZs/5vmeV2NClQsp
         NppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725583930; x=1726188730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k67V4d6U+a4ymIwtTxfSVTqPn5Mjm51cyPX5ZzN9RPQ=;
        b=rdh+ifmPXwTDNEx3UAkhQL7WU4BGccn//guppOx/pV2XW9+g144zuT5Ybw2li2U4KF
         6+In/JvsdN9ytBJE3wz1og0WMFrxzPmO+9vv5P/ghCNqmzB0qHlDWE04NEw3M/WqIVgC
         k/+95KoccjPqY3dDuOFAifjB08WOqRRzMoVIkMcQ65qjPb0vTaVpeNe1SapVGFb4Npj/
         nxfOwVugYkG4kONu0xzF/1lGF+C6b5gUWdbLyL/3YU7dSrJRibn23vBvvH4JJSo7yG9J
         RQc9CGEXBb+XF/xV/60B92BtIM+3R7mCHEQOqxpJR2CJdr4xK38TETx+kOpVK3rbfAXk
         F3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWx88FxxH66FmUEYEn/8l17fD4ObWRITqY+d3JYQWhxDSxQHqhRbjqKd7jj/ccVY3nXD4xHefP+DcAn+Rr6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo1OmMqQL6AbFGBtHHrvUci29Yj83rZz+l+iQPuxJdMEy0gvGS
	hZgiIHi3mXBz+Evpjg7DjeS3PHMG6ou9o38dUUchn/5b2X99KhxoKdgWmT/6yDuCu3wEw4+rSea
	t
X-Google-Smtp-Source: AGHT+IEo6pJRSCOhheQ4SHdYsdjC/ga3+gMi/ZowkV+pSmPbkIvf+DoWz4LWwxKdAClAIbRTj5eadg==
X-Received: by 2002:a05:651c:2226:b0:2f7:5239:5d9b with SMTP id 38308e7fff4ca-2f752395e50mr3013471fa.4.1725583929638;
        Thu, 05 Sep 2024 17:52:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f37dc3sm29897021fa.59.2024.09.05.17.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 17:52:09 -0700 (PDT)
Date: Fri, 6 Sep 2024 03:52:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Brian Masney <bmasney@redhat.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
	quic_omprsing@quicinc.com, neil.armstrong@linaro.org, quic_bjorande@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ernesto.mnd.fernandez@gmail.com, quic_jhugo@quicinc.com
Subject: Re: [PATCH v3 2/2] crypto: qcom-rng: rename *_of_data to *_match_data
Message-ID: <264n2b4dwknzxs6dyce5kmhxy2i6bzybuur5n6kqp7rhwy3r5g@7gcz5f2ym2au>
References: <20240906002521.1163311-1-bmasney@redhat.com>
 <20240906002521.1163311-3-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906002521.1163311-3-bmasney@redhat.com>

On Thu, Sep 05, 2024 at 08:25:21PM GMT, Brian Masney wrote:
> The qcom-rng driver supports both ACPI and device tree based systems.
> Let's rename all instances of *of_data to *match_data so that it's
> not implied that this driver only supports device tree-based systems.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/crypto/qcom-rng.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

