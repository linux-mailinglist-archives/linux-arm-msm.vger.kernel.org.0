Return-Path: <linux-arm-msm+bounces-24416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB22891A3BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6D31C21389
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351B213D8B6;
	Thu, 27 Jun 2024 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ag5L9Z+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C91BF24
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719484122; cv=none; b=t4ifQ0LfwjvkyiXnY6itpZ7GnW+pnYV1EtzkQVTuAc4dmXekK0WGhAfUQ5J/UnMJ4jBV7LKs5qa+DhRCC2c57/vOUSaiqbjQ5vcNo/mOHTByQlDt8GefC++Pw0JtGd1vrljWHIFQib3FzkWNMNf484/QugK3a343T+rz8dZK5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719484122; c=relaxed/simple;
	bh=BRoEnDNLMGfgwmz/D3lIxdbFxaFE0Rva7NuUJrNHIUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEcrR/3GgMt1amdTHdrNct+PV7ok1VCeQjNayeuVaY4Sa8QZmOG6VDQmTCs0BpY7pHHC/b2DmT9yyMR7inqJ2VjAXtYNFBzpGaUrPmwirUZrObDaOQDCnfQ/2mMX+/g34Xj+UFrewXg4b3uRs1EYLXB1bnR/yECy4ChvlkhXtZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ag5L9Z+I; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdb9526e2so1517295e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 03:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484117; x=1720088917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CSObqPp2o1ZiYQ9QL2aHPTL2pT8TeTrCT9cgEet+VS0=;
        b=Ag5L9Z+I592aqHXctVkLrZJ9h/DUblkid9UEZiBEVmJQ+7sj5l3j87WUN0V9Bm1AyJ
         vYiYKaDUGHKBQmTusJ5o7C7/teErxYAIm5R43Z0fcwJHo5gtBTLnLCN7t0dHEMg0Xd1Z
         cdOWFBXhCwpnS4lR64bJ8MnIYnL5RdSw3F7Bfb7yLOCuNbMqhHk+jGsIi+X/g3kiCM2X
         wqSEZ4tStZQa4g8pCfOIJW74wkcJHtgvsIpd/2kFqxjz6GwDciKLzlHccMr2c8TAN7fj
         Sr6/VNfBZAzmP/fbxhGRKDZIto1yYRGQCYBNT5//fXTNqvrXmygrrnWM+4E6d1nbJuBF
         6SuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484117; x=1720088917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSObqPp2o1ZiYQ9QL2aHPTL2pT8TeTrCT9cgEet+VS0=;
        b=FTXvtPCzJouIDHArScLoCNe5JemBVq1fzAHeAH+SPWpdKxwF77TNwwp//VGGwLzY7u
         m/Mex9rk5FFL5g1U2ekPtijgMH8j7GM5NXsaKXhsiEjUO1oCUvxxXQgMNaL24Dh+aNeQ
         IghLITEGyUrgbPfMsU33qtnjgD4d94Si6GW0wRFPImTU0nw94NnRl5GO6jQFQkh0gjAG
         HEMhfXfcHc/jLuqEzEhbXIzIlzBiWHCe9dkiAN6vcK1rbLz+HRgV8OsVPNRAQogGpdNH
         RZizf1eEMAJ/0lO75qqxt03KIjbEJUru/h/9mUuy1zZ6RqmVkURseJjpRSt5rg85V3X3
         VH6g==
X-Forwarded-Encrypted: i=1; AJvYcCVjU9W6TYXI3Eg+B7wia52G867NDjhh1i8JhssAmNTDSKN6nhMLcrih8BOWsHKmBIGzgGNbWKp9OZ268d6qxZg2Avogm4ZUyznPb+vMLg==
X-Gm-Message-State: AOJu0YyDMLUoSGVDO2PgyVfCaS8LNbgWdG6ItPJPDmAsa67wXtyL+Rb9
	gY1vQrIHlBRMGYo/mTXoRwXzZMRVsgSQCrwWGMJpyPk4gSxE3cZ/YIbLKElJ2zk=
X-Google-Smtp-Source: AGHT+IFKQsbMqpoVnTPZEnzGX8hY6FDAKEvfJirsH2ST3SdWpnd2QjBxD18elzS2fRWAkQeb/uWTSQ==
X-Received: by 2002:a05:6512:158b:b0:52c:dbdd:92e with SMTP id 2adb3069b0e04-52e703a40cbmr471883e87.26.1719484115347;
        Thu, 27 Jun 2024 03:28:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e71305ebbsm154630e87.126.2024.06.27.03.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:28:34 -0700 (PDT)
Date: Thu, 27 Jun 2024 13:28:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <jxfdfponl5eo42imhsut7rckqafolnqooifpn77fgsn26elkwi@rsvxfjzvkjxp>
References: <20240627084628.1590453-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627084628.1590453-1-quic_ekangupt@quicinc.com>

On Thu, Jun 27, 2024 at 02:16:27PM GMT, Ekansh Gupta wrote:
> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> to be added for PD notifications and other missing features. Adding
> and maintaining new files from within fastrpc directory would be easy.
> 
> Example of feature that is being planned to be introduced in a new C
> file:
> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Updated Kconfig.
> 
>  MAINTAINERS                          |  2 +-
>  drivers/misc/Kconfig                 | 13 +------------
>  drivers/misc/Makefile                |  2 +-
>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>  drivers/misc/fastrpc/Makefile        |  2 ++
>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
>  6 files changed, 21 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/misc/fastrpc/Kconfig
>  create mode 100644 drivers/misc/fastrpc/Makefile
>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)

> diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
> new file mode 100644
> index 000000000000..7179a44eda84
> --- /dev/null
> +++ b/drivers/misc/fastrpc/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Qualcomm FastRPC devices
> +#
> +
> +config QCOM_FASTRPC
> +	tristate "Qualcomm FastRPC"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on RPMSG
> +	select DMA_SHARED_BUFFER
> +	select QCOM_SCM
> +	help
> +	  Provides a communication mechanism that facilitate high-speed
> +	  Remote Procedure Call (RPC) mechanisms between the host CPU and
> +	  offload processors Qualcomm Digital Signal Processors (DSPs).
> +	  Say M if you want to enable this module.
> \ No newline at end of file

Nit: ^^

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

