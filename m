Return-Path: <linux-arm-msm+bounces-35850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D39B0095
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2931C22A5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9847B1F80A3;
	Fri, 25 Oct 2024 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z17N4hI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B04B1F81AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853640; cv=none; b=cHkmKBzAWr35ssotsnIBnO4baRyVwipxT5FiXqAfjTKNvyFhI7Jz4Y2vk4h5zdQRC9VbBxwhbQ/aXVrx2i9jAU0NsVpQEWyByC5/bty20beGf5AknHhGgmMWG8+WJnGRG40dRLGj8vp8TXBHZUebN6snKE01X5IjQa1Fbex2rkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853640; c=relaxed/simple;
	bh=LEOouHjz3xgbZqxKkGMbEVqRkjVE6m+mBqZncj7UWWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfb+C1alhtZHGr6cdVOcdofl+F+J7KFy4AoB7JuDiQSEhLUb7BmxhLI0Q0p1k4qCFCv1M5+ZeK5fHOtbAkrae0yC/ULi6hwjwO9GB/T/LdWR3g9LM3b0ofqbO2dl1V+6WiwpEso9KHsvryAbFqrnJvKDSOLoklXdG74EFExPvnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z17N4hI6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e690479cso1979229e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729853636; x=1730458436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmKXZIf8Ec7f1tVnIx5TT9jHdGRyQWK0W1K6HaVuKu0=;
        b=z17N4hI64ixekqKAug+6uGm29hrprobIpgQxSI0uwMMNsIocm6XLZCo7zeYpyphAl6
         RZE/nf9hdF1md6gPteM97XqptYCseWX4oRkfBq/ypn9jMEe3Vf4z7DgrNCgcd4oRfhxt
         JjmiQNqXahpz9wrh9X/9BeoNcsnj3TTDedGoGT5a3co2wSPicFAQRaSlAmtcxNFnCXdO
         khjpqsf7jMyZNgVV6CGn/gy0a17DU7axSMy1P8TePsBi+3Iaxq2NXfbdKxjPY0y5fQWR
         Q6URyO2tDZlWAzb0qyJ53myQTrJ+H+V6PIv+aEtC++JGJBoFkIQP5m0qoMHKzDErPRPN
         i0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853636; x=1730458436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmKXZIf8Ec7f1tVnIx5TT9jHdGRyQWK0W1K6HaVuKu0=;
        b=o+BkAITlTglurhao/9WR3zKohs0OfGhrHZK+Webxzp8zwfGqQ7Em7fLIiCGQdVERBK
         BzOT3p2MrL8+CkJCvjK43xoLlNFTjwRZzKsZ1DeqQVFzaucqb/Tch8LlMzHlEW38G6R+
         F8xMl458Dj/C4xS31V1III095mmEoNiPYsv47tnsMA5e88G18Ea2HQv6GLYdhy76c8FW
         KgeH5ro5N2UihwBCebPKOqk5wk22Vrsbs8F9uk9/Xrd3mfG114KW+EZZkXEWSZB1Gud4
         KwtXFE5wJWEbSsD7/KdVGgvwLA8aCbfX58jMkjUPyD7jlrZxut50S2FQkGFtKIpvsDdB
         Vqrg==
X-Forwarded-Encrypted: i=1; AJvYcCXRDBWC+7Q5MwSCeMQQdoc9i23iObEBP3TIdRMZnQRsI0A35n2P1B6jWT1tJcNH78qkR6NCMVlLBgaquwoo@vger.kernel.org
X-Gm-Message-State: AOJu0YzvdYOi43N+9a9hYLUc/ONufCPa/gpmWo8hbMPmbH9KBu+ztiWj
	iXhv0+uDuompV7d3ayXzXAX3C8fxQfKS/Z5zKFRHuM+V/mgNoq9ceTTB8K+La+g=
X-Google-Smtp-Source: AGHT+IEG/HWpZ0M54se6Xct+kh2GChQAVmq4mfyhxQS4HKSlZc/4tTJQommgTh0ryS0ELWVi8q7ApQ==
X-Received: by 2002:a05:6512:2820:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-53b1a23cf0emr5001815e87.0.1729853636123;
        Fri, 25 Oct 2024 03:53:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e124620sm135774e87.76.2024.10.25.03.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:53:55 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:53:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH] mmc: sdhci-msm: Slot indexing for distinguishing
 multiple SDCC instances
Message-ID: <i67dn7yopqu3szooas7tnlftbba6ad4h2324axsgu6g6htmo7f@gbwqohqmixz5>
References: <20241022141828.618-1-quic_sachgupt@quicinc.com>
 <3e2f8132-af87-40c0-9c31-c0103078fe39@intel.com>
 <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>

On Fri, Oct 25, 2024 at 04:07:52PM +0530, Sachin Gupta wrote:
> 
> 
> On 10/24/2024 4:38 PM, Adrian Hunter wrote:
> > On 22/10/24 17:18, Sachin Gupta wrote:
> > > This update addresses the requirement for accurate slot indexing
> > > in the sdhci-msm driver to differentiate between multiple SDCC
> > > (Secure Digital Card Controller) instances, such as eMMC, SD card,
> > > and SDIO.
> > > 
> > > Additionally, it revises the slot indexing logic to comply with
> > > the new device tree (DT) specifications.
> > 
> > This patch seems incomplete because all it does is assign a global
> > variable which is never used again.
> > 
> 
> Qualcomm internal debugging tools utilize this global variable to
> access and differentiate between all the instance's sdhci_msm_host
> data structure (eMMC, SD card, and SDIO).

"Internal debugging tool". Thank you. NAK from my point of view. It's
upstream kernel, so none of the behind-the-closed-doors tools exist from
its point of view. If you'd consider making it public and open-source,
then we can discuss a best way for it to work.

> > > Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > > Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> > > Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
> > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> > > ---
> > >   drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index e113b99a3eab..3cb79117916f 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -292,6 +292,8 @@ struct sdhci_msm_host {
> > >   	bool vqmmc_enabled;
> > >   };
> > > +static struct sdhci_msm_host *sdhci_slot[3];
> > > +
> > >   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> > >   {
> > >   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > @@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto pltfm_free;
> > > +	if (node) {
> > > +		ret = of_alias_get_id(pdev->dev.of_node, "mmc");
> > > +		if (ret < 0)
> > > +			dev_err(&pdev->dev, "get slot index failed %d\n", ret);
> > > +		else
> > > +			sdhci_slot[ret] = msm_host;
> > > +	}
> > > +
> > >   	/*
> > >   	 * Based on the compatible string, load the required msm host info from
> > >   	 * the data associated with the version info.
> > 
> 

-- 
With best wishes
Dmitry

