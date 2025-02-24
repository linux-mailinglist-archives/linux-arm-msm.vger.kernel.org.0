Return-Path: <linux-arm-msm+bounces-49172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96FA42048
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1661D163D56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1721D540;
	Mon, 24 Feb 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G8L62jcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE29195
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403025; cv=none; b=fO6bSQruH309zvr9DudYm1YMymBTOMsXcODH0yjmk1jBMPMjsbkGlJ3eRjP+YjyLgtltcIYO9hgRUDE0BQeq/ZdEFxzycEdKZEhiZCtV9HLifIfUbarfiG5SZ5QsZTxVeJDvUQ626yr6oK3v3yfgXvH20sNeH7W6xkPsUE1JflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403025; c=relaxed/simple;
	bh=/o0z0o/jJMawJLWYT+yyPjqkggfzFhp24Ib2CtQ+8kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs0gvnFpVO+Nnpw3iTPSF+WZlUw6Wz0O6SWJnD/efR9h32gQjEFhblbxScaTLiK3C9U7eNF8NeDnwngXsy53j7505qtZ8t3/POod7G+E2528uvMNb9z2u4cUiUPLa7+NU5Y2uEOX0uR8H8FGZxSm8JwJpBEYmC/e3PxasQW+HsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8L62jcL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-221050f3f00so96432865ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740403023; x=1741007823; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHKzy5jxIIGtFQydpMOMFSOT3O+WM05RHdhGmalCcDM=;
        b=G8L62jcL4HS1NmnCuulteI9aHVnP2ZOOy4wgQs5jZM+dixJvr6vxXYH3qJtTObE4XU
         eaXEv4Ua+gNGaUJOkCq6DwZ3s1wZwc5EaLY2/qbkFXa+nB9xQcPm9JsRbOh6fjmZfT3O
         WIoCHR+I1vMiqHa4jfxtABT6XgwAY9kUJv1THDqnIuyXiXVAcn0IdOivP+aZKfRXEeED
         ZYDCxCKhnT1NGFkHcFu93SDIWlpucp3M+hIcCGfAX9H7isPZpjoIVz3NMcxMQhXKGiJr
         A9S//pxAKiEJqw+5kUHgUxcCjI5b+vr5iWzxZv98sL8KFmZ1gOIp85efToKQkAw1XpE3
         s3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403023; x=1741007823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHKzy5jxIIGtFQydpMOMFSOT3O+WM05RHdhGmalCcDM=;
        b=JL1We00Ug3J7b1MVKOlE5P5jHxQXYPHnKDvxDqf7QvOZjGQp5fy5n9iGjxNbgu0GE3
         nWlYz8USI8lTsnMLQLGggkUKsaaInPKnMcE2ZwNjILORlg/et/jXVGqvsSZCXdOuKYTA
         canDBT1q4Nmwkc2XgoZYH/aVVxjnnWrNqWOPrR8BzoH+plwfIkyWjYPyzGnwPKTMIvtV
         L6b0vyM+7ZBA/8BGuHowtiArHcmAOAbi2o6Qabhyw8TyLNA2N/lsSTJL/1Xen86m1dsZ
         4Js8Gb4+iVJl7RxLQOQjNYZsMqLsl1HliyNFcBY+n3DwWhBN3wKS5vFVhREkKilfUYug
         yWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjrejuYQ6BtKko/kiRNtT+d/oJGHnrghSkw1QAwNfj0q4HAZ0gzRKjk7JHLSScUIUWHqGtryA61EAKlth5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7N+hPdJLKSzdXI1h3DuHk+Fhac+lCykQbjPrNYT/UYfvT2Iug
	8CLMXaEbPBjHAwDhFrYQ4PkvtIE8vHOeZaXPUR0I++pE/D5N03cmie+dcjQi5A==
X-Gm-Gg: ASbGncv+CmeXE9g16IYtZ7u0tcHbs8jDp+sdVmSAqlberiXBod/iEnbjoIrAgiLhChX
	FT+iyxVKtnPoqfhxchAGMtKLBp7jAJSPYZtDlYDlZlh3agiLsua9cQcH5jteLmpLcO5ahkFDmW1
	U04OIQxfyThZL0rOH6xy7AclGe6nt60zB/HX7FwwtuP75M2A3DBU3+RSzX46GHHL7I/3wPYXEhg
	WW7zFJ4z3WaaX73/BPLB1ubk+15M8cLrpmTZl1dlCl7DfA2AgfKdZdOPB/EEFSrzamhdJapLZAi
	8QVb1RCEncBFdCUGLYK2Uq34a15luDfRZvwj
X-Google-Smtp-Source: AGHT+IGLDCqvqAt9bNV68xhjYSFFvvogp+EGJDMdLBWrE73S0LLBD0lWN6kshGInNq4Wrl5chFF9Bw==
X-Received: by 2002:a05:6a00:2ea9:b0:730:8d25:4c24 with SMTP id d2e1a72fcca58-73426cb1d46mr20792500b3a.10.1740403023417;
        Mon, 24 Feb 2025 05:17:03 -0800 (PST)
Received: from thinkpad ([36.255.17.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265a589ebsm17521348b3a.143.2025.02.24.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:17:03 -0800 (PST)
Date: Mon, 24 Feb 2025 18:46:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Amit Vadhavana <av2082000@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <kees@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Robin Murphy <robin.murphy@arm.com>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "dmaengine: qcom: bam_dma: Avoid writing
 unavailable register"
Message-ID: <20250224131657.5gfgssppyg23rwwd@thinkpad>
References: <20250208223112.142567-1-caleb.connolly@linaro.org>
 <mjyavvk5jymhfdn4czffihi55nvlxea5ldgchsmkyd6lomrlbr@7224az7nsnsa>
 <Z6nSyNz91IIzrVuv@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6nSyNz91IIzrVuv@vaman>

On Mon, Feb 10, 2025 at 03:49:52PM +0530, Vinod Koul wrote:
> On 08-02-25, 20:03, Bjorn Andersson wrote:
> > On Sat, Feb 08, 2025 at 10:30:54PM +0000, Caleb Connolly wrote:
> > > This commit causes a hard crash on sdm845 and likely other platforms.
> > > Revert it until a proper fix is found.
> > > 
> > > This reverts commit 57a7138d0627309d469719f1845d2778c251f358.
> > > 
> > 
> > I posted below patch yesterday, which reverts the change for
> > bdev->num_ees != 0 (i.e. SDM845), while still retaining the introduced
> > NDP vs Lite logic.
> 
> Bjorn,
> 
> Given the issues reported by Stephan, do you this we should revert
> and then patch it up..?
> 

Vinod, please apply this revert patch as there doesn't seem to be a proper fix.
The offending commit causes hang in multiple platforms.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

