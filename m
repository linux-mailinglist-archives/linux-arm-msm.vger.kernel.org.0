Return-Path: <linux-arm-msm+bounces-47956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF41A3510F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 23:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A49016DFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 22:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FE626E152;
	Thu, 13 Feb 2025 22:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kjh5NL7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432A26B0AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739484887; cv=none; b=g3+Ssa1Q13bF23mtPgFGKMnFMoFILLBjz828Ovu5UocAYv9dhFRZd0pIbKlz8Rwp3VCaksp33XNA4GooCTlt2XZY4gZc0Snz3G8xefWCky1gTwo/aSO1LvZPjsi4fLJbRc7S3MgZvB8rIi+gsAZN5dFhJl90XKJTFUzfXLsLTQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739484887; c=relaxed/simple;
	bh=SMGkvZkCZvqG2ktEbJEc7YSfHNgKF1p1/msOSxsKHwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuAXn5haP/BHYmsNDHj3cMoKQWFH4oI++78qjktv+6c12PBzhG1UsfOkGr1/GICjM0/hEIw0M1mEQJXAouPZJNkA7cwOSQj1ZHKi/XPscEclufD9ghJT4JxUgWysGSTtAdQFYyhVujpNUyQgVBXW89XTimidvoqyFN2Qyk/hKU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kjh5NL7/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450abbdce0so1395576e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 14:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739484882; x=1740089682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nbNV/3b+ye98We8N2apWnRnzXmdzQBqHfwo/QAVSKao=;
        b=Kjh5NL7/AjJU7+LbN1hLI1XntGAe3IlH6SrlDv7jRtYvVfdIUcmBOFwqurvGa3uDJC
         E48rBLD/iycQaSabxG0xg3AHu3/GKVsVKan5bRPD8RotYg0Cf6hfcqgUOWsP74kinlF2
         v5NlGXs1eqLPH+lvbLXFNO6hPBnmT1RNSWRSBqFFw7dccjmpol3CSXuU5JWXKM7+UN4c
         PIuCk1ph/Ijp9fI87VlY7D2JrhoDpEl1Uk4/aMVebEQ8AbmQZgUrr7CYZSSZC5m7VGaQ
         AM87Cmt0j/B7969/QcxH9Ky+9/az7E598M/eFGg+z+S4+R+65aFDJHe1LjmiaW4FCMk3
         CIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484882; x=1740089682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbNV/3b+ye98We8N2apWnRnzXmdzQBqHfwo/QAVSKao=;
        b=PiT6ZG1VmfsNnPLnFeALDcGHRVCJrS1d3TiNMpHLxuiSYzfSCGAcAFbo7vZz2oYzyM
         h8oITBnVV5kQNFZNUX79Cco6/9EtGjMxZWaCukkVjs9j7b87Ix4TNh788jTmPBx+HwDZ
         cmYYH7GsCkUohthKO8TP6kggLQG2y641fnzRMx7wrXf1wr/C6n1D53mu8rvW2jdPfzK5
         m+tiUq4ez9JTlvLf2mZBH/+Y9T8wOUQVko1crFy0WkZSSzgvqReZB/8GFosXCaYhbgM/
         3lt1evN3iEIhVNmPsBgwMR4EIS44WmV/49v/h7cgJJTPpp0dJ3ohc0QDRvpCudUJrXYZ
         xpug==
X-Forwarded-Encrypted: i=1; AJvYcCWMHwa8bLyreJBvKO4AiICfVljq5ik+qLxtc4Gc0bGeVKQeYXanRhW3S+o25BWsjCLn41svSZe4NJq6N4HP@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIrHbn17eH0zy52wXLLOnrKuqgsp7SS/dzXy2Lr4u0vMl6l6Y
	cXLSM033lCPfr/F+usKt97xLjYz5PrWqULDiTOcSYNyQlYIb/pBv4yY82XVfl8A=
X-Gm-Gg: ASbGncs6yhj9ZMfRfVLqyVFMUAAUGKjqPAKsALicgApPcwyqiV/O9WkW+eXF+O/NV1Z
	BoIBh48i66tkvwwsyj14G95el8j3dz+VC8diY3oFxJ3LpA9c5O1w1DdvjrbjT1LWUD990noGfku
	vpzQV+PfUOZMI0frv1yubrYmHuos48CKxHcLK4qxt9N202PMjQOzbFgRbHxH0minu06ONqs666Q
	VPt/S1qakdS4U6RHAsgfcvesFsZ8BXx/koQ3g9o+n8SzuAapro1EUckBSqjNar/zG4cH43jKumK
	8pYurvlaeCdVstZ7tytG3R+oxxMu2OgoFeNxwhHTw/lGC7GYU7v79mdm6rwZkihe8WoobE0=
X-Google-Smtp-Source: AGHT+IHncmb7iXd7qOxLGrJgwFbp8mWCOblbfNMb7p+RCa4lr5PqtVfqFBy6rnhu20ZbF5clhirijg==
X-Received: by 2002:a05:6512:3b24:b0:544:c36:3333 with SMTP id 2adb3069b0e04-545182933c1mr2974520e87.30.1739484882297;
        Thu, 13 Feb 2025 14:14:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309181d9c6esm1418661fa.40.2025.02.13.14.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:14:41 -0800 (PST)
Date: Fri, 14 Feb 2025 00:14:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan.hovold@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-pdc: Workaround hardware register bug on
 X1E80100
Message-ID: <dvo4loo63prbrjm57vu5dcre3eo3onuni7fzucobcbjdhr5wmt@mbgm2kxi6osa>
References: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>

On Thu, Feb 13, 2025 at 06:04:00PM +0100, Stephan Gerhold wrote:
> On X1E80100, there is a hardware bug in the register logic of the
> IRQ_ENABLE_BANK register. While read accesses work on the normal address,
> all write accesses must be made to a shifted address. Without a workaround
> for this, the wrong interrupt gets enabled in the PDC and it is impossible
> to wakeup from deep suspend (CX collapse).
> 
> This has not caused problems so far, because the deep suspend state was not
> enabled. We need a workaround now since work is ongoing to fix this.
> 
> Introduce a workaround for the problem by matching the qcom,x1e80100-pdc
> compatible and shift the write address by the necessary offset.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 51 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 3 deletions(-)
> 
> @@ -324,10 +357,21 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>  	if (res_size > resource_size(&res))
>  		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
>  
> +	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
> +		pdc_drv1 = ioremap(res.start - PDC_DRV_OFFSET, IRQ_ENABLE_BANK_MAX);

Please mention it in the commit message that you are mapping the memory
outside of the defined device's region.

> +		if (!pdc_drv1) {
> +			pr_err("%pOF: unable to map PDC DRV1 region\n", node);
> +			return -ENXIO;
> +		}
> +
> +		pdc_x1e_quirk = true;
> +	}
> +
>  	pdc_base = ioremap(res.start, res_size);
>  	if (!pdc_base) {
>  		pr_err("%pOF: unable to map PDC registers\n", node);
> -		return -ENXIO;
> +		ret = -ENXIO;
> +		goto fail;
>  	}
>  
>  	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
> @@ -363,6 +407,7 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>  fail:
>  	kfree(pdc_region);
>  	iounmap(pdc_base);
> +	iounmap(pdc_drv1);
>  	return ret;
>  }
>  
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250211-x1e80100-pdc-hw-wa-b738d99ef459
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 

-- 
With best wishes
Dmitry

