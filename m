Return-Path: <linux-arm-msm+bounces-48503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008EA3BE6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 13:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A66CD7A6270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABEB1D6DC5;
	Wed, 19 Feb 2025 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oq0a/efE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78F12B73
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739969148; cv=none; b=krEhSsc65uDkV3r75vPCkG/+uNx2nCyNJReKEK8kzAgZRhnaIe/Fng3hBXdiLzgry5TIGjRslgmajgQDUBUA6QFwXXngQ36D+3mzuqxOebOS/kqSWaOl2o3yLJIa4tBXSUyx52h0iKai2VEQIo6ZEB55snEMHnwmDkTpCR9AJ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739969148; c=relaxed/simple;
	bh=fkexAl6M5DyJT1F89Ttgt7gmRIZVsmlf4VohxNakH4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O178D59Z+dFSCsF1oTlwCz6dge1B+OerOIaeaZtYxQNE+aTkD6BdsQlCYi3m01CADUrwnBSSsmRDMl33GZ4PdEaJ+ux7PKpveQtgQ5ablVw4xRJwZwlBsXHOmJJ9OVmHs0ipvw74tmBoWpnPCvWiqq6Z9f/QcSNa8k2dDWZAkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oq0a/efE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so35770021fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739969145; x=1740573945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPuwrJxY2WcVgAzy4da4UTcGT1UhygelXhUrEvq+Dmg=;
        b=Oq0a/efEAlGVhDJ3mwE8X9hFQrQHgu9MM9R2b+l2CQB9wVtDvzQexNm6uVi9FXQP70
         I64Pkz3Uo/S1Oq3PkP5PB3fCe/ND4XFCL48jCnm2DAqwXst723ntNbiZIrMRF/tyPBuo
         efra33d4VI9zrtsgOMlsSt+VIqYB0eLy5HhR1grhW3yLmCC86Z44VRVp8y5Th6S+6i5l
         tyEZEvfHoZ1XZml/IMJM6zgXzh6/cWEkh9INl3ynivHjoyV971HV3ehgOjUkcdc5Kj4K
         3wI0Ily8fLtFuxboWYLB7IljSHt4LhQpyrMRue5UYl+Xz/D3/L2vuJKBnbUuITkCbYyk
         yy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969145; x=1740573945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPuwrJxY2WcVgAzy4da4UTcGT1UhygelXhUrEvq+Dmg=;
        b=jhBwRBqYieND6AkNwLu1i0dBrnA63SIVwMMYWUpWB++IQzOQJk0ZDmiPgt2oIXH4/k
         BDUEmfhafEQvN0HuKS0on5K0XCE3PdH4vdQ8N40bFsztmLZ8s32k7k/CzEcm4s2Tw7wK
         iCWWpa9nz/zESvDvjLdk64AmQudBZHmFhTkGIB5HAcJLdFURyzxEZ0ugaQ1U+Lvop9VK
         KW9K+ioDlkiRx3+oWICSB9cN/jqyymOD4h9RcCTi0oizT40FJsg4GOqJtAZa7uH9zhGH
         zks5pts8iPNxcGRZl2KwobE/Q1vlHdK2hgd61Fct3Z3CTOAM3GOzQolS+4Xv7SWd13D9
         sXug==
X-Forwarded-Encrypted: i=1; AJvYcCUw/bzmqzKdDWZO+cFrBCGbNfaBZUJc5xG7T0UJi8uvhfqc8EQdZqj9p9JlhRG6sC098udaT0Lc6t527qIx@vger.kernel.org
X-Gm-Message-State: AOJu0YwlIUQCilwgg7oLjFVt4h6TJF8csLWSIUy65SgN0MqexqPU8/yw
	iN/tS5v4mYubeRWtgnGO/M1XIraAgjTquDWrWa97yhwFioxYvYZWZEXpL14uf6I=
X-Gm-Gg: ASbGncuNshtIqzHOIshVziWadlkltjYX5Nsc0Fvk19NazaQMbhm6Ha+WSsJGWBiavzo
	bjAMVMZ1cuIxfOVaw+PSd7EaouKxW8RVeOmmbD4M/66ihqAQSXzVGYVLvSQ68xuGGlwaRkUzdGA
	33glm0ipr7ledXmEpQutbOAzL3d+83ufkhVDccHDiznqOBp8oVpFY0yiggxWuuzGymq96U7lDWN
	ud0KXFEKoyqKhJoCqWFB0jivTM7J5EQQg7KGkFe27tW8Kg3vDYywzKvPPEQF+wEQFTgeQ4an0AG
	+rU7WDkxRL8FZhU/JApompyKPw3HW1F3V0rfZ0U9Vvq31CYaoky/OGqOQYF2V5FcIneeOi4=
X-Google-Smtp-Source: AGHT+IHqzXvswBBHdB6BuGTvdIaOpP/9m10nx1rxuNNktCu7rOUQ1riauWad8Yd8fM2T5tKt6/n/Ow==
X-Received: by 2002:a2e:780c:0:b0:302:40ee:4c2e with SMTP id 38308e7fff4ca-30a44dac851mr10131541fa.2.1739969145292;
        Wed, 19 Feb 2025 04:45:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3092fb236cbsm14835491fa.69.2025.02.19.04.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:45:44 -0800 (PST)
Date: Wed, 19 Feb 2025 14:45:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, jonathan@marek.ca, 
	quic_jesszhan@quicinc.com, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Message-ID: <lwtvnlt7rfmsbdgyo32fs4mx2xbcyrnjsjq53nkk5pdzrpqgox@nn27ythhg23k>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>

On Wed, Feb 19, 2025 at 12:07:12PM +0800, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> Fixes: 958d8d99ccb3 ("drm/msm/dsi: parse vsync source from device tree")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

