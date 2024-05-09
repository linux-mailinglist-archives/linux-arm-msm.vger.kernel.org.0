Return-Path: <linux-arm-msm+bounces-19596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E388C133A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 18:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8AA4282939
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 16:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6B3539A;
	Thu,  9 May 2024 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IhnoF1G3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76B1A2C0C;
	Thu,  9 May 2024 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715273295; cv=none; b=AbsWeuIdL5Ph3YtKoHa8gcvF7apwozB0ADIyn4r34T+j2N0eEPFLuxvDOYrwg/Y1lgnJNzeERjt2p4EGKxmwSR3Feo1CcsXJkripLuHS8uLLIViPeqKTAigoe2/aFbM4EtNsSVcB1MlK2kFdML7nU8z1pygYZgdHz4DaSAFlgZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715273295; c=relaxed/simple;
	bh=mUKF2aJhMC99EJP+R0ST6AsaHjTRCUxCk2H1sUYA7bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qgQe/xlnBqodUC+JtZmIZtn1RoNWrujnJGGml7Tf5zj3ZMt52OCZRe9ZsqW9glGjy3xMDOKMCc+pBltfpJx9CqpqjeEZPMBJSN43tsTu9R8USisqZcNIfPIlJfv5tbdcAabA6tADfQY8gB2D4JLd3g/CAi/hxuP3kFkZwnnKy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IhnoF1G3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8EC1647C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1715273286; bh=3qFwjzw8Vw1OvsBGlcfK09vFEBAUZplKcKp8nfsKqto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IhnoF1G3IdGk/iRQpZeEEkmumlwkGNvlLtO+iLFf3hoa1dJeJkfNaGcLsrwDXhiQK
	 IzZ6Zi2kGNxPjVur1GEQZ66yUX2mNQ455AmvJIaFHzndC3i7+dpCrBia2hoImT9x9Y
	 FNsbSsmRDNrosuTPSxUsN9CoaRLw77uqv4mUHeXNNK1kB5/AKpln+jnBSJH8O/tkHn
	 nWm4vYRiuVkE2mOQaG75amaRFrd0dadaM4GGwOkCYMzSHW77PN0/L32sf0USMaOp/z
	 tqXqIsmN25QlME069Pd0UNXoAdH0of3wGRYO1kzF8NbCxjs0uHM6EX7OB0V3fzTyNG
	 6zC6BGxZwtM0w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8EC1647C39;
	Thu,  9 May 2024 16:48:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
In-Reply-To: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
Date: Thu, 09 May 2024 10:48:05 -0600
Message-ID: <87o79faq4a.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> The drm/msm driver had adopted using Python3 script to generate register
> header files instead of shipping pre-generated header files. Document
> the minimal Python version supported by the script.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/process/changes.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 5685d7bfe4d0..8d225a9f65a2 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>  GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
> +Python (optional)      3.5.x            python3 --version
>  ====================== ===============  ========================================

Is it really optional - can you build the driver without it?

This document needs some help... I'm missing a number of things that are
*not* marked as "optional" (jfsutils, reiserfsprogs, pcmciautils, ppp,
...) and somehow my system works fine :)  It would be nice to document
*why* users might need a specific tool.

But I guess we aren't going to do that now.  I can apply this, but I do
wonder about the "optional" marking.

Thanks,

jon

