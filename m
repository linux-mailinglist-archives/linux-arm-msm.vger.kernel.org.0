Return-Path: <linux-arm-msm+bounces-44433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C29A06262
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCB007A1A53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 16:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98A7201264;
	Wed,  8 Jan 2025 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpyMPneK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E713201268
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354605; cv=none; b=s/Iz7yia9WFg1lbisdY+JJ6wcV8mA9k1XB9pPXVfZj7QGzhgQFjmfz+aE/ywaiSiyumorQoXxlHMv7K6Y7bP6XFZ5BtLwq6A08oMN7LhqDz05sQJo0wLXgNSOOQDt2C9Y5f0oi13K6vBkgS+ISxP8i7pNVsdJ73SCGRpKKmmuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354605; c=relaxed/simple;
	bh=0478WuDY931iD281gVufADAtkeNwWNFOd6enKgB1W2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5JnCD5JEimq/pQhm5DpbCA48PigqZe8q0x92TYsHV6ahWjSNvK2kYEI1AD1sf0oBnMQSmg8IHQrbUiRzdpgMdRRXDeXuRrcNyYvWN7rtU/5xXp99ny4Ib2BjqY9SYHhxkodp70GwdfHYDWCV8N/K8Px7afCsOpmSTGrtAEaXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpyMPneK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163dc5155fso251001255ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736354603; x=1736959403; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ielvvOsJJuv+B+zm9cCFALy5/4YtBfaSGBUjPImt/oA=;
        b=KpyMPneKIRbTnqjqWE1zn2NEejyhQQVC1CoB0Rp4okVTkNGwZEGzpA/7NhBkolvOgb
         jLecfY4vT3Gqu2E1nQ4JMJgQTh1lDkYAn11JADh5vW54zsvKz8214792vzRTnZG/JVp3
         FRtWaqOnv5eBQ5gCiwzRLduH309xu49SUJ2JGpu4Pbj0GWTmENkJwOFo991WOLMpv4jo
         CCcibRY7th+N3pkR0GPC+AySAZGwd/6iJQRNVrXQ+g9qECihhZ6rGzJwslgySKQd2Pyl
         +c/4btUocJm5TCvcWV3/ISp0p0uOTVD5R/yZpSycsSINgwMGMdvDHn53GXPhZH1RNxvZ
         vISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354603; x=1736959403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ielvvOsJJuv+B+zm9cCFALy5/4YtBfaSGBUjPImt/oA=;
        b=c2zSiaQgUOCE967+QgTzuvNmUuwtMT+eeL3h139U3Tky3MXBzNc156J6eyquY2gFY/
         9jmosQV8crijaFYt3h42XUr/3s7ZqGvF9ZXxlGvNPkdV4r+ufHnqAySVlmQvy9XRrPWF
         4PafzqCJYO2BzKvku7qJ9r45ddBaoFkXhb5XOph9Mgp8WruicNcHFhCCD0QQR/mct1EX
         f6QBjktnAl6QunRXyuZpp8BaqRRxj9YCK1bobPgW60A5Cqm1e6FnTBZ7DIAM7LKtNbl5
         Y1xrhXB5jTCsi1eJlt17wO9S8SHC+eCXeND6f8aKWYpW6W+Q7Zfl/kn/r9PoFhri9PSk
         m8xA==
X-Forwarded-Encrypted: i=1; AJvYcCU7shduyMMbDlzpq6zcV7PD2zmxMkR//5n7j9uyQmnBBRLFCnbv48Z8N+WX03PHN8Q1I4RS6TVJ9dMFllYU@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaE/nHOgWCnGYXbv+5t2ESeX3T75aXLL0JG4mSYunS70ziaq+
	DHLhIWc5OUG+WzntpUJvHYubQfoK8EKa98CghRqOovZvY+3t7O8WMp6EmvDbkA==
X-Gm-Gg: ASbGncuDKol+Tb3qhxCzP1xoZrhxoRGm5nUmgORorOruLsBqJsoYMuSUHW8GPdvDsXG
	S9lvdLwxzAK8/dGU9RFhcqzRph87TZsFahqL5VA/jOLFnr2ux9NZefasrn0P0qDv03hMb22zWum
	XcP3s26N0Nj7g8TL49n6dSc3NPzEX6+ByViQpXw7aqUSX3uVJEU9kmwojaS02DXTbDKUDpJ7bUN
	WHrSuBetcWMDjiTve7XrTEFOYElWX8HVSivDXholH/Fr41VM0cCh/zUR8LS7bdiNNuZ
X-Google-Smtp-Source: AGHT+IHUlJVV0ETi6YHAJf67U1NYr5OaJs5QKqwANyBQBecRQuA+OvrWnA8jU8UJnYeS9b0488q21A==
X-Received: by 2002:a05:6a21:329d:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1e88d043d3amr5050798637.27.1736354603479;
        Wed, 08 Jan 2025 08:43:23 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83616asm35476897b3a.76.2025.01.08.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:43:23 -0800 (PST)
Date: Wed, 8 Jan 2025 22:13:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Enable MSI-X if the endpoint supports
Message-ID: <20250108164317.3oz3gaesdryfygnk@thinkpad>
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

Subject should have 'pci_generic'. I'll add it while applying.

> Enable MSI-X if the endpoint supports.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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

