Return-Path: <linux-arm-msm+bounces-20899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB908D2EA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A665A280FF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D82315B0E5;
	Wed, 29 May 2024 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKCcpFy9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612816729D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968639; cv=none; b=rmQeaLEboER+LsQrUui2pV4S++g0TLV1bsy5QoUfOWtByMFGhdeh34jtyLtvplfmiUZJyOLU3/DlmtM9/bEtiuZEP6HHyamPdT5N5OV4AT+EJRPAAFTeZx6Z1QqifxAv7ORfRRyI+D7x0FWF+JPEbPJzQ8p1nrOXdDcnyyE/cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968639; c=relaxed/simple;
	bh=+QUSnP/ngwbPQEWBZkzfhpGYUxEWZhbTwbH0REe7wBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8WcrDs4dym/wR7MAmZpuh04aCvsG4lzDoakqH5JXfIYglWOQXQEC4uNO0f6Lntod1mK3NGHshEuQATiYqPEmqyMFpk4Tt8BrhTWyofSwjJmXe6+QeQHlIISUs4Wk4I14ZtWDX5BRRIzdOvg6GCl/I5vV8/Z+DMmsYrhc4odNQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKCcpFy9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52965199234so1974475e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968636; x=1717573436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=;
        b=YKCcpFy9OLhD3ykiha37ntqiOinXhwfbb+L3n+JNNIAINNliTIqZC3SLZo6yFOUK8f
         uVCq3UUficore1l2+t2Dx9eg9U+kdBDkOftunUnE4614+wVe75vkEGZJhWfarjZQrieV
         dt+FGqoEAcEb0pZAh4LTWFEkDmrIsYn+vfZp0Otk5/ZuGT81m2Y9m0uNcD8bA/tx6+aw
         Bygc0BdiX+EgqYnfKgV9l1sNOKeAOXstJIUO26ixx+4PdcTIlUFNeJ1reDouiiuKTb28
         9b77ylNzFUp0Qk34+SjUlfCKYkcx+6nTKnTaoWZQCeUwSFkozYCaZkbjbJf9sEbXA5eg
         JqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968636; x=1717573436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=;
        b=Fnk1dgqBPL0IVJnZR99V9dNfpItAyY1HFktR7bWnDROI3+5O5MbjW9K+e1hcr9yBFS
         JVUZJqDiQjoEQ16XarpJeBgUc1etroK+4YLUUfk6OjRPbROQsXRkkGESbyYoe3SpYxh6
         wpJOWuJatzgvPrTyPDxbfY4/gk2ekP/3N8LQe8zoDraLVzxDOAvC6y1zxQedTVuwSZ2U
         OaexqnOVmAeDSPXXGHxEmWL1dF4Nsivlam6uPg/JvuArM08nFZdmIvE9QYJUX5305+N6
         sPWDmsR6b8oN+ELvNssBTbd+p32HrnIK4cMp1VEZHQJ42voh3zDZae6wmMw/xI/cEdHT
         qLSA==
X-Forwarded-Encrypted: i=1; AJvYcCWfDiB2bkZEYH8MdXz459/7zdWYRyYe0oaWoYSu3Hi48/zLAKbFYXOu7SIgzsbbouvPCXH/yKqEYXtjcFX5OCb11aoHIwD65CbcWrchng==
X-Gm-Message-State: AOJu0Yxu0CwH1RQQU+sH5ZhKEIuXteuQIzQsZuwkAsegBfKKnZ41fJG5
	xhRLx+4lYGdO5qYdJ2zqb9ySPGLDwyBXGpzX2T+SwXfP0AODdIQQ5TRCPM+w71gPGCVPrtEgxKK
	/
X-Google-Smtp-Source: AGHT+IEpKoJxeYMMRmRHKz19pKO8ijGaGc5T6KYCnRuUNFgdev3K9Yfz0P6oPUoZ1/TYqG8Ww0hnig==
X-Received: by 2002:a05:6512:3241:b0:51c:df1f:2edc with SMTP id 2adb3069b0e04-529644ebe8cmr7988541e87.2.1716968635950;
        Wed, 29 May 2024 00:43:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a50b1d85sm978336e87.113.2024.05.29.00.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:43:55 -0700 (PDT)
Date: Wed, 29 May 2024 10:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] drm/ci: add farm variable
Message-ID: <xhdcswueynlctjznqnxo663v2k6q2lrk55jjdodrkd7ojijaiw@lg3e2e5qcnny>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-3-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-3-vignesh.raman@collabora.com>

On Wed, May 29, 2024 at 08:10:45AM +0530, Vignesh Raman wrote:
> Mesa uses structured logs for logging and debug purpose,
> https://mesa.pages.freedesktop.org/-/mesa/-/jobs/59165650/artifacts/results/job_detail.json
> 
> Since drm-ci uses the mesa scripts, add the farm variable
> and update the device type for missing jobs.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v3:
>   - New commit to add farm variable and update device type variable.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

