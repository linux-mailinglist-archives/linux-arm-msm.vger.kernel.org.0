Return-Path: <linux-arm-msm+bounces-20900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6A8D2EBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8601D1C225FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAECC167DBB;
	Wed, 29 May 2024 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIgkC4Vh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E84167D97
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968689; cv=none; b=uf9TXJyuxLLf/71+llyqQIUWATJDd4ztYeY0E9W0Ve6mnxp87+UGlthCPmNqN09BerHy3z4U/S5B1r2l0YLFFpCECp2smJ1li9br7Dvi4kTNwi9tUf0CwT7/Ra1pVB8NMcX/LtxjBqHeHyVjXXIh7CEZbiDKyacjjjdNtmGj9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968689; c=relaxed/simple;
	bh=V2Tay+cwE/xAfntGJvfIlOvq+Bb4o/mzQBalXXWGSTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErELA+diZlUW3eB5k9pL3PSXyJ3bZM6nMWufovahAGVlU+ivKfrdks2MmPTUJgr2WXNHxJY6/C+yYKEKuX7YXiFWHQsOlWdBoT7aobHc3CX/xSXakV1QBiXggHkrJcDMJXj02w2xUJKqEEOMCeFKfXGKGqEEk3Q6gaHWd3/A9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIgkC4Vh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e9819a6327so20696601fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968685; x=1717573485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1XyMvug7w7dhtxZdl8ZlGvff2YgfxxUHgfNNPJEirc=;
        b=aIgkC4VhDFkGSlpcz3NPbMDKwR97q6csBvbafWQYVWhsMpCcZBRfq2SQ9IV8apsnf7
         OntV39Lu4gbqPpTyRROPtd5fMcrOl96/fBfzh8r3kt2nvzrp7k4KI/zED/TD95Ms0FIa
         9fOAaSENVgebAqO7G5PwZyvANl5jAZKvaQuBiz5MNdZdBMKW30gvDtySmihO48Y/spb1
         RiuYxG/GXf1krAtxIsVQ3ZaI9PG0BZVZWlGWK3RDuBRAuwLiEYi3L0vU//fUyMqiZpgL
         hm8uj6wYf46abh4lGNfM8HY1ONxKO3dwlOgfZVw5bdRzPDBqNuLO04g9tJoaooQ64GPG
         lJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968685; x=1717573485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1XyMvug7w7dhtxZdl8ZlGvff2YgfxxUHgfNNPJEirc=;
        b=GQo2ySZLh5wptXmZEz1wVRiVa3Vu6Qzh8j0ZMnL3HDjdWSJQ2BVkravk5ILpDJSYwG
         5f7+tuerrwdBbqTB0FBtjUWct9y5UJ8BNKcoSkXkSpcT36qZKI0D+o8S9Dcuga0w6+wZ
         OYXOWJSxu0Y3wfQsB6oJXrCqS4V2xCRBNlLH2lDyk62JMtPy/5GOPgU2II+HOALgYAvL
         +iPu8b8DGuLChWp6QiSf2wYHvPPQ8qkT6Bw9ELtpPM/75lBIV2P7GMydMtmUu5lSCl0U
         klH38cCxVDiWtjSziJzYB8Rpz9IJR7Vnv5ElcttTTWoyYoYDOucnZSAU9XnUUqw7PH16
         JNFw==
X-Forwarded-Encrypted: i=1; AJvYcCWu+aaIH1Khbnt4RbQIG95DYkw4k3OTAkeM+cThNsnB7tMyfXDMxIjen1LZ2FVXo3Sro5RWE+5etqbLoFxFGtehctve2nWRSRXIaRLXXw==
X-Gm-Message-State: AOJu0YynuQI+Jz+srUb+SiNXdd4TCOK/uNU3QTVJHkqItqawumZ9TFHp
	snSDwPYVGvISJv4RglHHUi5R/5/HD5pNWp8/1E84Kh3TNOOWwhwvRpboCZPDXVQ=
X-Google-Smtp-Source: AGHT+IHWA2lvLG0B0kntbUD/V5owakoa3EW0tQI6tq3UwCSFqELYaCxoJok/0cawUBov1/1KRXreEw==
X-Received: by 2002:a2e:b05a:0:b0:2e7:c29:dadc with SMTP id 38308e7fff4ca-2e95b24e06amr72686241fa.34.1716968684582;
        Wed, 29 May 2024 00:44:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e9816943d2sm6297271fa.61.2024.05.29.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:44:44 -0700 (PDT)
Date: Wed, 29 May 2024 10:44:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] drm/ci: generate testlist from build
Message-ID: <nsamdoevg6fhop3otikwsmu4ga6ysyrg2ogxbqhw3sqg2nbqq2@n5xbqid7ltiw>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-4-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-4-vignesh.raman@collabora.com>

On Wed, May 29, 2024 at 08:10:46AM +0530, Vignesh Raman wrote:
> Stop vendoring the testlist into the kernel. Instead, use the
> testlist from the IGT build to ensure we do not miss renamed
> or newly added tests.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Fix testlist generation for arm and arm64 builds.
> 
> v3:
>   - Rename generated testlist file to ci-testlist.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  |   35 +
>  drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>  drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>  3 files changed, 40 insertions(+), 2765 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/testlist.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

