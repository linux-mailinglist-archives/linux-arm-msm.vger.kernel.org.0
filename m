Return-Path: <linux-arm-msm+bounces-54847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5960A94F53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 12:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F105616D319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 10:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4F425D8FE;
	Mon, 21 Apr 2025 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIvT1Q2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0491D54D8;
	Mon, 21 Apr 2025 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230738; cv=none; b=dUoULh0DsfcO+Deh/N9nnV/0iyjQAaq3lBrL0h1ObspXXDRb2RLJkzTjc0SFGtfLQpTMRdVNdPW7DTFxBBXQrST3Oj5gfw/QbTgf9ogy4rOFYbRu0caKQsMoaccG2rXz86hsx5566L57BYkWLMshMsoUqflSr3c0TIgo0m1PX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230738; c=relaxed/simple;
	bh=8Ffn2L/E0jE5G4k79DkPy1qxCBgnq2nUNskI3OC5VYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EW2WChxTpkmWDM42DAGGyYijBtvyKM+oy7+xNiQtR4kVy3vR6IvGEvBwpivZPrIA03fkJsnx0Mp7Kq42eHwV7vk94e19M0HcKBZqunEsLtKtCrbuGhCoxOkQkiXl+6IjUCnNb81Jkq5Yk6CTC/tQZ8aRuquL06uEPohmvu6cepk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIvT1Q2b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A7AC4CEE4;
	Mon, 21 Apr 2025 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745230738;
	bh=8Ffn2L/E0jE5G4k79DkPy1qxCBgnq2nUNskI3OC5VYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIvT1Q2b+urrArvw0pMf7nki2sOwhMimV+cTWMMxX2mdc7xoOo73naTPPmuav+9UT
	 y2v9P5elcn4StqqYSTIFW4ljb0Qn0PcVgR7WN7YMgwRDpFmTSCLZH16XKzT9tMlPgF
	 xuZF5kNkJLmBrtqgVrOgaCIiccOV5a4QZofRqKLwjJqI3R898RBLaH3mPT3Z1W5IZE
	 Ww3TlB9j04jXctgTguQFCredejFVaRGmryL4IFT08RGNrtAIkty9VWuYx4BKgRhCph
	 lcG7Pi8Q0qQWMnbUeecWd55ncbeq2fQfF5g5LhchReHmN1sSeYh52Ixq6BNTKNyuHe
	 kObt26Hr32aVw==
Date: Mon, 21 Apr 2025 15:48:48 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Message-ID: <aAYbiAOyYkYob3rU@sumit-X1>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-1-7f457073282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-1-7f457073282d@oss.qualcomm.com>

On Thu, Mar 27, 2025 at 07:47:23PM -0700, Amirreza Zarrabi wrote:
> A TEE driver doesn't always need to provide a pool if it doesn't
> support memory sharing ioctls and can allocate memory for TEE
> messages in another way. Although this is mentioned in the
> documentation for tee_device_alloc(), it is not handled correctly.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..24edce4cdbaa 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>  
>  	if (!teedesc || !teedesc->name || !teedesc->ops ||
>  	    !teedesc->ops->get_version || !teedesc->ops->open ||
> -	    !teedesc->ops->release || !pool)
> +	    !teedesc->ops->release)
>  		return ERR_PTR(-EINVAL);
>  
>  	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);
> 
> -- 
> 2.34.1
> 
> 

