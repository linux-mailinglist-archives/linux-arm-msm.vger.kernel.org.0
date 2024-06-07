Return-Path: <linux-arm-msm+bounces-22060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4629002B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78A5A282916
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7109190060;
	Fri,  7 Jun 2024 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhdKvNpu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231D15DBB6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717761216; cv=none; b=ZZ9Y1HLfntRHfxzQIT36YT3q3TOlti5tjcXA23k36cYYft+pC22LgsJTUn51ANKYV0tmT2xxa/Dd2ABIa0u633WwhkZjm/RGzhg2M8BOa9TiYV2taLrTZH38oFEkOYFukjTcAboUcF5a5NbfTH80K3n/7sGgKBZFgqoIhpIUUKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717761216; c=relaxed/simple;
	bh=9iWcHW5vlkJ5mXYvRR7eZBIJzhAQwZWdXaz1ky3WgtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICQtOsEa6U5yZHl7IVuJ30mYyX/rpX14ctGvI/98+qr/MGduoBVQEOxuABZ8mjHdP5VSMODum+pABIVD9H1WxuUAlkmR/NPbtBqUtSsq+qNQE0I1c69RUjguh+iRoPgAVPS8qQddZPjFy94JlJG+4KV46egUo1uK8UyM4WCeV0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhdKvNpu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc1261f45so399484e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717761213; x=1718366013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvegxPSdfl9xxna39T+re8E72S+AP4Tc+93oJJjNX3k=;
        b=ZhdKvNpuD/7lpXzDIbOMNd4dlY6JCadu1itwTRTEnv0hQBZFYqHzKNDxBtqXdyzeV+
         4P+DoNHmlYQJW16zEa+vyBhMhBYMnCEObZzF/Un0Gf0h1hcKH1+ugwybvj12P2bw3AzY
         flXCzqP7767QyvWyNfh7dGOywLiffpbOmF1Rq8bQOvoZUs79twQpo/q9+BmkBBFgK/G+
         6bYWmF2/VVJDXyQwT0p5v6gHBE8LaBoMtygivvSl436mJVjg+DyOR4je7V1z7ZLw/gMa
         hbyhV9a/IxDgo1hn1CZfGPCTM5gz2O/Q++5hKwSklQLAkCci77B0bMSybhP9VkiG0xDE
         ofZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717761213; x=1718366013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvegxPSdfl9xxna39T+re8E72S+AP4Tc+93oJJjNX3k=;
        b=OyDhsa0/L0oDBBX5t9OhO93En99JoT/1Lo00IOWdrKK4y5TRYF/r/4Ui8yDo5mgfbE
         dHEUcRDS6HLcyRP2lcO6DH66QKIlJnsPQhdPTqkFkDelbTlIB2caZ8wZKr9VWp4fh88F
         Q/yjC4PVO5yVmEasCHEOsPRgikB57RpteYMmYdtZRGAiVEt3ieo9JUB3C/9z33euuq6A
         1Qi19GZeeaT/StVROjqvAn0YiTFX0beErYnQHyJXADW+1kueykETD4fxOAgEsGg3NNYW
         4OfRYT/m4hJEgIDtwN6Lb6sxqGi2CBEDo7iO5uJslgZ13FY5yFlFZzOFR2Kqxab+NOf8
         YTyA==
X-Forwarded-Encrypted: i=1; AJvYcCUbkTZhlmkW+h9vMzEIAiceDlWW7ZxII0ZZU7gmQGr8En7E3jgltZP1oZKshb/28A1vFA/pMyEbID+2ngf5htvFDYDn9cuCIKqv/Vbqgg==
X-Gm-Message-State: AOJu0Yye/N4UPmoCA80Evpt152TCw11iJCZN3ajP/1FvDx7yYElbEGpC
	UlbL5sYCTbOHsGYsgnpqyH8/6qCZxxuFZm7hHvXWMmIcHeEfGXOYfNd5OubQaeI=
X-Google-Smtp-Source: AGHT+IEzo8rK5dnmaVmRy4s9tP7EFqxXB75a/nXj6f+m+NI3PDqGtQPp5mZoiYyn4SmlJ1NXZyHyTA==
X-Received: by 2002:a19:2d59:0:b0:52b:af52:d0d1 with SMTP id 2adb3069b0e04-52bb9fe2fc8mr1353269e87.64.1717761213322;
        Fri, 07 Jun 2024 04:53:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41ee260sm512079e87.68.2024.06.07.04.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:53:33 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:53:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: qcom_smd: Improve error handling for
 qcom_smd_parse_edge
Message-ID: <2r44vuuhmucgkjwdb4ji73dtkskffigie67cgj5422b23wyg7n@jfp5xs5nizwn>
References: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-apcs-mboxes-v2-1-41b9e91effb6@z3ntu.xyz>

On Thu, Jun 06, 2024 at 09:01:36PM +0200, Luca Weiss wrote:
> When the mailbox driver has not probed yet, the error message "failed to
> parse smd edge" is just going to confuse users, so improve the error
> prints a bit.
> 
> Cover the last remaining exits from qcom_smd_parse_edge with proper
> error prints, especially the one for the mbox_chan deserved
> dev_err_probe to handle EPROBE_DEFER nicely. And add one for ipc_regmap
> also to be complete.
> 
> With this done, we can remove the outer print completely.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> - Rebase on qcom for-next, drop dts patches which have been applied
> - Improve error printing situation (Bjorn)
> - Link to v1: https://lore.kernel.org/r/20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz
> ---
>  drivers/rpmsg/qcom_smd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

