Return-Path: <linux-arm-msm+bounces-30339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB196701D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 09:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D4891F23273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 07:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CD913B787;
	Sat, 31 Aug 2024 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYxFf9Wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F4A1E52D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725089572; cv=none; b=NIAZNPbRwq1etMKNEKf4QzaujJX02z5/LuWU8+61onO5tPOXp1IvBp9VF0kPQ+enqn1JW0YCVzpD+s/Nb5SCE1p2LYW2sVjgm/dcIpNvxq7C7K+NkqAc7/wfa0lfRxoTfNAizW0idVRrLTnawGVU9n7ktCaITk32CopWGHWAIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725089572; c=relaxed/simple;
	bh=HZ0ybC8pX2XgQuC0gj0GbmtuX/ZZdUeCFQ1FnNhn0vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYMsBS5VHfrayGAraEsQUb6MZkxHD3kdoUJdPBWagpkJI2co37KPkT6O/b1ELiPy8VTnHKO2ADHlL+F0DsBMtDFFX33bfurm+NgQhgyxX/hqZwA/ssbUfv3L8kZijgj+a31SLBi3Qpg1lGkIVppxb/CN6PwuI80GYXjo7zF4ku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qYxFf9Wc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so3097237e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 00:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725089569; x=1725694369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OS8ULx5Wy3Uin8uMU+jA2lsKZWXO0jfHJrS2BmvfGak=;
        b=qYxFf9WcNWTZfbf+QTzd49Mb2tR7NS12ya/QTReoJm4v/HZ5+gTLzBtff64kHqFIMy
         cUKPrsDPpC7YwnB24dNsDhghkKycuXtgRlO8Q7ls7rYCTP4ngPkAP8HVgJoXhwQOP9xe
         FiAR0DAqBgCD3EZkDTfu/bJFMbyE7xY5tbjQEd8OMm8Z+ftyLJIcRltoYYO2A0uBAm8U
         0N1fWKC8EM+keNtcUSJFC3NFivxpNoCm+Fm7Ot677xCtkrF05YlD3p+P/hIk+27Vy/FO
         aMqiT5mXIJyMDj9DYRmPjAPDvIT26zSgYIVu+6kleUbuKaaG35zWB1PHUA9Qn8A3n6YN
         8BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725089569; x=1725694369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS8ULx5Wy3Uin8uMU+jA2lsKZWXO0jfHJrS2BmvfGak=;
        b=Xw3lTZkBcHOMy2yGS/6DllHiGzJByYzqz7p3eFr8wrZO5CRGcpR0RkGKWPG3LyTSz6
         +1zE8GVev+xBZwOdb7q9DDO4GKJ354BQDForP35trKUrv68hn4eV9/L4vjp4NF911Bx2
         1jC7l8wRg+lj7WBdrS+GxrDSMkTmUYP4xqOsruIfO723Byk9wLYlbkOi0/j5cRg/yZb6
         /grzjsBXBK9ywgyt/xHSRVYKZKFgJIregLNOOwzEKbtOvscJh64pzhDGyP9PH4HoFTR2
         /DA68/TCxYjjdQFGBNaiJWyWd6QghWiujb8yeCOUJ3quuMWjgRXH3ikEx6sqxth22CS0
         pIdA==
X-Forwarded-Encrypted: i=1; AJvYcCXHsDlsCpiSdAoaNLnM1idJOCcIsCHQxoYiIb3HP2HE41BhUf0+Tq+7i2VN+jgMNGvjuZ+hfqaBnynzdACa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyok+8WLEpO4YT7VXkpsQPW4Vx1UhfdE2mZYzfet+ikDRX1lL7w
	K8yrvoyA+2mOOWdJhTgRQee6oZMDX0hzmLK6bPNJ8rRjW2lMbgfN8mDYGIm4aEY=
X-Google-Smtp-Source: AGHT+IHSwIZuGkOF6avHB4MdTpBlMLY/846/wnZaz9dipDFZweWYq6Dgrc9xbu2b5L3gvviZCMkIRQ==
X-Received: by 2002:a05:6512:b26:b0:530:ab68:25e6 with SMTP id 2adb3069b0e04-53546ba080amr3149891e87.48.1725089568293;
        Sat, 31 Aug 2024 00:32:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540840badsm881573e87.185.2024.08.31.00.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 00:32:47 -0700 (PDT)
Date: Sat, 31 Aug 2024 10:32:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm: register a fault handler for display mmu
 faults
Message-ID: <4nryt4ujiefvf4xikundjlynt7bpv76qffobczm7j3s6u5qrwz@7p5gqnhy37kz>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-2-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628214848.4075651-2-quic_abhinavk@quicinc.com>

On Fri, Jun 28, 2024 at 02:48:43PM GMT, Abhinav Kumar wrote:
> In preparation to register a iommu fault handler for display
> related modules, register a fault handler for the backing
> mmu object of msm_kms.
> 
> Currently, the fault handler only captures the display snapshot
> but we can expand this later if more information needs to be
> added to debug display mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

