Return-Path: <linux-arm-msm+bounces-49146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40BA41A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20AD3A5C46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACA624A060;
	Mon, 24 Feb 2025 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c30knrbo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD72424A047
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391921; cv=none; b=Gv7DGN4r9WJokhsCA2rrkZ53/CGOurmo8l3chabf5HS/HOq4u8bv7W330kSQJNG+CVQy/BYop+6Ry2Fc0pdqHQjZIq/ugtIbj3xHko5BrxB0/vH97aUxDMELluG8S+1zSBurqjST0YO0DvdWUELB7UCp3nr/O9u0OOsJJIadE1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391921; c=relaxed/simple;
	bh=fKXxxp8mVUx99PTCuJ9lTvEvjgM846KcN6TPo4R/fBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGBunRQKse85XNq2Z7Awx81c1D869XXL51ZZQEGle2JliOcqfoMtonEwyWcUq7W7k1lHauDLdQ8b/4DQ7Ak3mC/e9qdEcJlPXgCkal3G0gU+blSziVLhtvcKrjSpUyPoaMi4DoWxh7zpKen8jCxh5BkqbraFhU5XVgoi/AlcS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c30knrbo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so9537782a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 02:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740391918; x=1740996718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=;
        b=c30knrbovl3LBy7d2vKl26KV58/0RgFZW4EkY+B1DWzfBl7ME2Edr/dHTXtYikfdxK
         yzWpg/oBlkywJGY5kaSLpi05rGfM5Q7zFslmflLb14NcoYDkYyno72qm2qZc5OPnhS8P
         qgNXKXwC5Yny/w8CYqdx+zWzUh92DPQHJOhktShNgeaqj+CtYc7okbURNPR9kWy6YEVa
         Qr5qUyZkN1X24XCGhvhSo6gcGk5kqawU+3TI2iVs0FXtrAEY6t1/fPugH0DQtLW3xIYd
         /3kdrWCifI12DGZpTuRYZJuNavfygRQlCuJazK4L4gh7GIT20Hz83tJQRmSUbLsJ0m9d
         j5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391918; x=1740996718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=;
        b=M9CNAlgg4us4KLC7nMGiU9YN2Y/rzvVebOE79AjfJWtMeNeRysvU9yaK4eYSb5dJZw
         h8WeWCsgj3iW2ImihpYN6VL0ei0jJizFidmqdzrP+l7pY1CLp259dn1BivnM/LNSbc1N
         bEtkA/S/pztGL/0wsEuQmh3Cj6yay6xV2klsbp0FJTSIOVCp1rL2UlPVmhWPUpKZzD9d
         rt3BJX6guDvveE/xxwTN/bif6t9ijT47S6fuQ6AjO/ZLxE5qdoT+qDizL5qAJzjDsWvk
         2Tc6T5OtM7n9ObgFOqCIhaMBHK1OPiwIf81ZXaeX0NjY0KKvQJo5kUXXf01fY5J2i6+s
         8Jrg==
X-Forwarded-Encrypted: i=1; AJvYcCXlKKbpwO9mtocynlLAWNjntDfsk9nJpxmF4FS0SmR/X/2xZnRW4PJq8ERPYRC98yAP40IyfGo+iIr00TeJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrs8YIgBTJvXu3oY3yr/3eZe/NNdDTGVffbVnYsLd/7iXxu+1U
	hH8FX1c9miFWS/BGyPGkUNi4xUs6uJDV3fOA3+mgtVDpb9QGXqzcMM5+GuLI/b8=
X-Gm-Gg: ASbGncsu41x/YH0SZJ2TmTutKGPgvhPGAzPdveAD1v+LA/U8YylfwtqPPNSlFgN25Oe
	luEJJAOw/p8rdFkgGNs/1RXehgyZx2oJPlm6VfwfiG3iP2WyCt+1/oGobaCUbK6DoebsLrmFRzB
	N3SxQjfnI+1MFk8qt4+Vwc5TCowWZHzWp0S9/N3MQ1eUT60VQu7xrzEva2YvxTWuwM2xiHWqDrI
	yhsIB5Ztmw+UwPFSo2G+s2FVyLIXEjjulmQbQFq6TfTsFG3JhvQQf3/6sUjiQOd8GCXcVyj9eVZ
	fFCQyccdG+f00/O7JOF/IzI=
X-Google-Smtp-Source: AGHT+IFBYGv39ku/WXgGCB6eZU2Nhkmme9NrVcRsypJZXftUwbVR6qfXWzvvkzePYp6cqUbaZIeE6g==
X-Received: by 2002:a05:6402:524b:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5e0a12baa86mr13103989a12.12.1740391918073;
        Mon, 24 Feb 2025 02:11:58 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2709b4sm17963793a12.57.2025.02.24.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:11:56 -0800 (PST)
Date: Mon, 24 Feb 2025 12:11:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <Z7xF66TctF2wuoGj@linaro.org>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>

On 25-02-23 14:22:24, Ivaylo Ivanov wrote:
> Some platforms initialize their eUSB2 to USB repeater in the previous
> stage bootloader and leave it in a working state for linux. Make the
> repeater optional in order to allow for reusing that state until
> proper repeater drivers are introduced.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 4e5914a76..dcc69c00a 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get regulator supplies\n");
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);

Maybe make it optional based on compatible or something?

>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");
> -- 
> 2.43.0
> 

