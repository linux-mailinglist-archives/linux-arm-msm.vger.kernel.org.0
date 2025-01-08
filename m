Return-Path: <linux-arm-msm+bounces-44436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4700A06334
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 18:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F65F188A2F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD811FF1C0;
	Wed,  8 Jan 2025 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLDBL5po"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB31FA163
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736356912; cv=none; b=NPlim3DV5NQEaASJtdm2WnQ3chpWPbeo87TOJChgXEFtLv86bOjS9d5S4mZ9gm6Ua9qreta5R0zsLIX11MhBkP8jnCBlVvoU61DnFzPbCWg8HtE2ZJhMN8+tMM1uH6LjcGeTKg4ssht8pamAkhkuZrRWjNn+YDYsDD35bX5+kFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736356912; c=relaxed/simple;
	bh=bBtlESOrwSq/zlgHChS9VnkzArAlqbgTXlvXI4GdC4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQQzY7Dkts3vV+vxdMy1zoSxlf9uhqBHihJheHvry9B4Tetnt8rBqVZL2E93uHFiXvy4l2Mxk/gVBtjfbz6K/rl4oRROVNkSXQrKGslFTSdK4bQxNProta1et4LPxAmp3FoL3Dk5jd6uc3W8ZzL0PTvv1c+J2sya24ov6/nqpRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLDBL5po; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2164b1f05caso250529165ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736356909; x=1736961709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QhlLvY/LJFPsKd0vZK8f+ntXmApUkmDSgWg3tI8gkOY=;
        b=uLDBL5poDu+hNPbf4flgAPMAQ9TNVQ326KkPt0WsbSKOZUCCnH0Vhr0iWau/fq4ajH
         j8RSCJtN3bxLiwcplCu3jNUFNJPsQUZ1jrE81YytHSfxc5hclSxx8qDfnoQ4HBw0xFnS
         kOG2cqlc9kqX1gpcpMIQIpOtbdbSKfXI0r+kumO3oMDrOEShcF5oWy5eUbvTnpd/w5aU
         srROEEc7esgmteRP7vSEXovAq7tAoeqZ6x5UkDUR4PDdllOnWqdeQugl8dZpJtjbzRKQ
         OapVNwup8dmbxpphhadOhqQa8k7Ld6NOGB7a+/F1Ir54hk+dwze7MhAtijpCJyR1yehK
         ZBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356909; x=1736961709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhlLvY/LJFPsKd0vZK8f+ntXmApUkmDSgWg3tI8gkOY=;
        b=A20rUii/yIpq4wENRFCF/snYng1dBSEM4IAKmUhnNgOkZ1BVScYWTG5uvIj1U+R9lE
         amfe/NeO85RoIIfLpevd7PJGhj5YPDkbWYmKyFlIZbGaH7dLU3VF4OiRkAEWfvJ9BcUH
         PATVhBVgwiIEiLbgJG9Mzc5CBK1BdnZCpC0gewfg8ApKVz9Mi+567BE8hd8LLd3Yvbg4
         aSnqfB63prTz7kkSUlGJfmO11qdY3km6mFs1GzKpAZiDP+e6d2vZpGJnEu2TyG/z0qRj
         5qOM3V6M8t1KJj0m+lBA0Rbe93nAsPbAlUrndMIREIT6VN1lk0Zez3dh6Y5TgpqAnsx8
         8zRg==
X-Forwarded-Encrypted: i=1; AJvYcCXobB4SAk3IDEisxHODMs5k/zaZIj6mBRYsgvdQFw8NK08MeAWJY0ZCb48Bzlq8VeVnY13uaeBoZuA++tEp@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQwzrPx6zonM/ns1WTS/6pE7KN1pu5hjPYshwmkK0ogxGndkU
	o8bwk1ZipR2Qb0ij3G9WAdIBVID3jWOywKXJGUEzudrjIIiCEAdh01DikKZWyQ==
X-Gm-Gg: ASbGncv6nHwhylvt/JIkfxk7sQud9Hbp2+MaShxoHb0iCJjWGwNKCUIN1twN2/4680l
	l6OFsZ9oNiY34S6mtuvC4ldPqHRo8DfrtAIEi5q+ci0R8xeBLZCQeptvuDMqjYtzPUDvZ3mUW92
	WqU/XmiyfbiI2aK2msBkc/1kZgq3+hXx+B5gfDYI49B1NviLCAwKEHq3KA2zz6SPrzJn9DWbpnz
	bKhFc8ks21Bib7Sp7U3skgYCX9jRYJyj68Z9QmHTFMxS9RrH/Q+vGEUxX25osh1XOl5
X-Google-Smtp-Source: AGHT+IFljXVpvzQRAJ50/FIKhBnt62pZLnBANrFqHk/UT1k0QKO94GXBwdjA1EjgYjW3r8Th4loC5g==
X-Received: by 2002:a05:6a20:c792:b0:1e1:b35b:5132 with SMTP id adf61e73a8af0-1e88cfd2470mr7055029637.20.1736356909503;
        Wed, 08 Jan 2025 09:21:49 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb919sm36768138b3a.149.2025.01.08.09.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:21:49 -0800 (PST)
Date: Wed, 8 Jan 2025 22:51:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Enable MSI-X if the endpoint supports
Message-ID: <20250108172144.73nuhop2ypbfgyxv@thinkpad>
References: <20250108-msix-v2-1-dc4466922350@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108-msix-v2-1-dc4466922350@quicinc.com>

On Wed, Jan 08, 2025 at 09:52:07PM +0530, Vivek Pernamitta wrote:
> Enable MSI-X if the endpoint supports.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Applied to mhi-next!

- Mani

> ---
> Changes in v2:
> - Updated commit text.
> - Link to v1: https://lore.kernel.org/r/20250106-msix-v1-1-91d7b7143118@quicinc.com
> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 56ba4192c89c16b4882d2e7c95f0dc689fd1e267..af1380220904a7e6232ff1b374da0a4ea49cb470 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -949,7 +949,7 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	 */
>  	mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
>  
> -	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> +	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSIX | PCI_IRQ_MSI);
>  	if (nr_vectors < 0) {
>  		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
>  			nr_vectors);
> 
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250106-msix-a4c5488ecafe
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

