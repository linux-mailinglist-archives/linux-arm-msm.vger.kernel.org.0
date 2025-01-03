Return-Path: <linux-arm-msm+bounces-43820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8DA003D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DD0B1883BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347E6186294;
	Fri,  3 Jan 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWzBEu59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C113B293
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 05:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883942; cv=none; b=rA8Sy3uEe2AAmRkoBlTGXld6/tOWCWw8fVFevg53LeKZYGT605cclnMIJ0+E+GbbomSSi62zv6OFpUk5kgvoMrLlVyD5qL9e72Z3QXllO4JFSupAAtvtUFoGHCMcXMX6/0hES/Z6YcQ3JaDR/mdtpYeaJBr3w40jYIaMnpvie2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883942; c=relaxed/simple;
	bh=jq8zaIr86J5t9dGa4kCtGLabIIcRGn7o2639WehuCrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9mmmmrFtRfbHiX8uw/liUqxAufsI8OkfCErniliobhBTIcz4tn89eE31ImdfYNWez8Z7NrG8NXcKUgcIILJZ08l1CHNcARgwOLsJ3zctLzjX+PgqKfNvMgPW0ChjuBJ00yZHKg/QfoRRf6LfagiwRqVZ9sPoWCv7TC4o1Vcb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWzBEu59; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30227c56b11so139408521fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 21:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883938; x=1736488738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
        b=QWzBEu59654yBv/ArlZeO+1B6WN/oaYPk6ld7c8qIhZOSuLXr6WZSrp6UtRMwQ2klD
         0AxMbDeV3JZOz+6ADWb5udiXxCapWChKeYWRZ9PAO9M0gu6PP8w2zBm1O64o4UDYvBHn
         VT007XfKBiTAyMwFpomMhNuC8MON/FIcvCHI4wQjMIzMEql0VY4dvdGrFaa/wyWB9ede
         sIIIQfZUXyp2VJ0XfkCYXaH1DBJLhhQCD73OaOJvYlrfZg1Dd3y+E4CJ/Xh9F0KSUaCj
         6ce3nn9iu4vhKHpPn85MLBHB/G2dGBw56ywe1CsCjavaH5gAjb6hzxi6WMnRkY+5R0f9
         dkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883938; x=1736488738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
        b=NdZWaI5eOKs3rNcc3UGp81AyHhMqIbzj3e3KJG7vem4caZo6OnsK2uKvaq/Z73WATd
         8eiM1IJ/JJ5BujIAH9xrVO9NqeqvgMV1KQGaYcMHWs8XqtqXOvjolPIYRp2zDueDgtq4
         ICPOkzZcc7jmV8VvLmzV52nXHmrdw1uc5dlfB7S7VKRGI/vf3HHOOWc9B3c2lYLgrb3M
         PKwNry8yAnu18L0UaHU3pG7wix+eIkebO6DpM/k1OIsHcF3rq6gNYJuejDajN9TDXl79
         3CuFVrSDJ3T/RFd0eq8xi0yvU/z3/MmKzxK8bWi/vFBPfibcUO3S3WG1Lie3bKEhWPhk
         KEQA==
X-Forwarded-Encrypted: i=1; AJvYcCWuCzXNDOOA/1eSLLKu4PCUiNbGPsIVNauY51J2VrciTxcJjtTI/fK83uE/Bzk3jO6pANG+W0TsxiJqDmf2@vger.kernel.org
X-Gm-Message-State: AOJu0YwE48z0nVzLt/73qy4CHi5B+RjQITLkl/GPMai29Eb+/Ik4fXpl
	0y8FcvfzxClfpgQZdeknLnmibxQyzBliyorC4S7p4ZnfflgHB+N8IUPie+Xb5yo=
X-Gm-Gg: ASbGncv0PSOhSPT6KNxoUG4iZKqVVcWSzgec/qvCmrseCniUsZbBr73NbQTqb4oz4CC
	e5a4SiwlcT750j2TIfqm9ffzAkZqdqWl+3dCfEQk8hgpLz2G0OyQoaw6GWD+1YKjc1B0TAw0rtv
	AYc0mESMgAsO9ATUOquPeoI+WTjKShWOjJHzhgaa6XwZCg80ueYFBgYqTGGLWWfzMx/qRyyH2SL
	E1/zwc3B/HLyL08cMc5vfcEO/VCqj6A0rYhjKA40LyJND+3ivH4pQdL3BRLLx5BDuKlIO663nIW
	7l+E0G6ZS0y4zX1ULf06gavUQBtThAPQn3uO
X-Google-Smtp-Source: AGHT+IE6y4JdTtlzcbrnGGg7v7FjSgwU7e/vWxQ7TgNE5uhhWt7BpBzFop0XHrbVtbgwiv0CXbLJOQ==
X-Received: by 2002:a2e:bc1a:0:b0:302:3a46:10a7 with SMTP id 38308e7fff4ca-3046851f9cemr129431821fa.5.1735883938405;
        Thu, 02 Jan 2025 21:58:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3049ec4ca6bsm26165151fa.56.2025.01.02.21.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:58:57 -0800 (PST)
Date: Fri, 3 Jan 2025 07:58:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <dj2r22upxnj2aicjnsvoqnhd4n73tyfgm36jtvixxp4vphocev@gggcjakm3xge>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 

What is the current state of this patch? It would have been really nice
to get it in, we have patches depending on updated IGT.

-- 
With best wishes
Dmitry

