Return-Path: <linux-arm-msm+bounces-29936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9C963F68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36795B24383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8C9158541;
	Thu, 29 Aug 2024 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECUPFfOb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC818C036
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922173; cv=none; b=TUkGdrjjjLO2odzFaP1aKB4Y+PjdbKC1eLf477j5Pg6blu/suX+X+RIqAo45zkAgiWp1q6hn68VIZmLsNKm2ZQ2t3VYjrKeuYCNEJwH5wWBE3q/hIDwpKTXwyvsxN3wZSG1YGjbYDv4V0m/BhmOcHkXsjHjbtxJWRnDd6+jgefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922173; c=relaxed/simple;
	bh=gkKATRNNDNIPhS3Vg4S0CIL1kfKHfczkzAV/Zg7RGxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS3UEsttSkr9NgNEEgv2UslKLjvJczG6jy0kk1PonmDE0ACSwvPGJK+FaWmhcH/LwN0fzpxNbYi/sUw97znbRr7y5sqqviZUZ6NredMapeXMh+k/nBjb2OmTA/R/nVSykFU0IPnm6wkqoEASjcIPFM+c6UdtImQJKHJhQ7//QRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECUPFfOb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533521cd1c3so475149e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922169; x=1725526969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yU74Z1taMGbV+l39s12NXbpyp4bl/SLE0B6UFkVkWLE=;
        b=ECUPFfObkfdd3vRIWzXq5/8OC2z8A3/XB1q7ubc84q4yf87eotvSg6MLLF04LaDIYG
         CLS/B4HXx3AzVRmqHRD350I07tdOgIxRUjrjOZEu1phEv0/p/wHlC7LmjR/6iTOsuoHz
         50uxVqL+XCWUOQrLrDcIakXd7ywD2pRzdpV6xgxXcsGwHX/Dl/2V4VRempMvQ20l5iyu
         NjJKDsZ88C731ij/ivYjPVjsViU3k/UOKIuyj4HtCdVP6JojOg1XWb5AOg9oDfcf0n6c
         oQuXFHWUU5A2bh7cfdkt4dpzEVd+wSoMRpyttyzGeB7/2HJpjgI/PJrNAUwZh81538hX
         3eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922169; x=1725526969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU74Z1taMGbV+l39s12NXbpyp4bl/SLE0B6UFkVkWLE=;
        b=jWyH4o/9N/Kosg/nKpwT06RmX5El2zP/UGjKWlockIYCfJCWlUbP8fF4/w8ffej7yH
         XJqYjm2nqvSBQL1R1pQDr9Ljcq9/uQ41/5nLnGhKs5adxOW3DKB7sJbDKcVBF4FpP6CY
         brkfg2rje079f//n3F6zNuq+8SrRi7E+V36LeMy/b9lJ2NSOQ97Mtza21eLN/eskBiyk
         w/FMGvXBAg6WZrM5+7z87SkvMJOyhWpTxcIyFJGxZeT2CSGKhlR65MHmh5M7EFQYDPmr
         eiJv6UWS86XjZn9NMhMBT7RqPYFYen/eKAjDDtf12bAaMCqyfy9Kk0Cjlejry8zAdh6Y
         Eb8w==
X-Forwarded-Encrypted: i=1; AJvYcCVMCpZVbfFuNpDW5XyvltD2z37lxWlfEeHyGyCN061gV3NqiNnTZm1NhuhaPOf59eI7vBdhe5vh8ZZulNie@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUbHrbxehusS736fx5iK0oO4ghLUm5u8s+bif7gBQ8raeY7mD
	5pp2rI/iW0pzhDmox+umYriMzdA/lMVj4x4pr0Jw5Z51/Xev+IobGjjjpHohO5k=
X-Google-Smtp-Source: AGHT+IEOG/Fqff23S0qeqzOkwCb6zYTfMyOgmyR3JgJ5MsKUOkzSuMuafc5IyicZkjqzBwKINyngaQ==
X-Received: by 2002:a05:6512:baa:b0:52e:8071:e89d with SMTP id 2adb3069b0e04-5353e5acc6fmr1722676e87.40.1724922168807;
        Thu, 29 Aug 2024 02:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407abdb9sm99698e87.72.2024.08.29.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:02:48 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/11] phy: qcom: qmp-pcie-msm8996: Simplify with scoped
 for each OF child loop
Message-ID: <3omsbwonwputnyns5h6rq52bsafqb6is42jk6ty5pv7z2wmyvs@jeb33bmeotyh>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
 <20240826-phy-of-node-scope-v1-7-5b4d82582644@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-phy-of-node-scope-v1-7-5b4d82582644@linaro.org>

On Mon, Aug 26, 2024 at 12:07:23PM GMT, Krzysztof Kozlowski wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

