Return-Path: <linux-arm-msm+bounces-24580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F591B8FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95C8287A9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4D714386F;
	Fri, 28 Jun 2024 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guuanbPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA06143745
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561120; cv=none; b=N4fJfVS9UHE1116qbGiFgiBBUrMwtD8hxDnXRUpD0iUXQyzghvY3juaHZzR1eEvow3Njz+CqbR8+Aoxf3kNssfraiL1NLMNrTJsJ5XCuLuztNonfPoaTKOQCHbnt3Ff8r0z0itvrsm8D1Im3xxj/5pnV8Kgu8nsKnIpatyw2P6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561120; c=relaxed/simple;
	bh=+zNoKDZQ/xkNOYt+gvFW7KoW2kO58MHXV4zEnjjIi4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbd5h3P8Jq+X/sk2zpkuhgHAmsPt5yBxRPZkmk0kcuLQdtB2N2iACmiLMF62T8nE2oJXIMDIvtqGDUXoBTLgmYg3GPiPqw+urqqvi7r5BNdV4WB+qE1oVsiEKv98a9tUM9ezDCuTLJ47quZIM557trpuIa9Cb2c4oFudqw6oL0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guuanbPN; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so3356771fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719561116; x=1720165916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0Lhq2VrmyZAPS9Zt2InQGHVgI0lvcCDAnX2v0350pI=;
        b=guuanbPNR6J5WDWsdVzl8oOjsY6WLCKit3kGz2fkU68Izj9qG913KpRsHfIK1gr21K
         GScGLeVZW+GwJGNIMBd3r1N9uBwzr7gPzGvmRT1K70Y65b1KaZkPFM4uTzT4B8xcML5O
         NL+Ju+k/PCZSdifUC32RQqeo2Xa5aro1LJyY2IvqqU/cfbgnXEzIO6IYv+ftStfNG8d4
         /ISNuLpghPxQZEhbQnbvkeoxgOQMExIUIgWGKFfAqzwa7ytIu4StdVxRD5hbwfzJvBkB
         EFQWUyqxryVdy+VfouXAMUoRASo1aZrE+LEqnABpdo1X8RPezE4R/Gz33+xOHMapPegv
         Hazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561116; x=1720165916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0Lhq2VrmyZAPS9Zt2InQGHVgI0lvcCDAnX2v0350pI=;
        b=ljsgd6wKtu+R27rb/WSisfmN/yQGpYYO7viMhaoXSacVw+fwpCpQ0tuXR5tjKaTYAV
         wuJwPEhwnde13U9/i+5Kyza60Ehj4XkIgOML0lPv6TsDECSpR7JxyT/jxM5x4QdH4mPI
         ipY/yn++g5xlPT01ngebUDXMVbGNMmiCE5eD+EZ8mtjhUPpVdeeoIFWLakIsGBTt3KSr
         qazStcTwHbWSzSPhX8MsIRBIu6QYN14LN0cNg8Pm/i/qSvlRJdSNPLK8sw9/DfgSmUAg
         Iarok2PGjxvBVNwm9pTikujiC0V9q2toKBD81pixkHAdQczeB8m979rL68kXxViIVPru
         4F9g==
X-Forwarded-Encrypted: i=1; AJvYcCWGxpOCXjsAXCAJF8373RKACIU3YHj3E5X3KF2/7t9G0Xng6Oyv0d0+W+axyt2KCgnTjdnuVYHZGJ2lLjcqoa0EMtS5E4gKJRDFlSRGEw==
X-Gm-Message-State: AOJu0YzBlKm2O80VHmpaZBSYpYGPQIkDbo/tDO1NPUNprUuHhr00IZn6
	I4ZwqO1on+b9oTh3Art3+6TeliZTjA30LTzWePmBd+Hy6ALar5lo+iUqTA1DeXs=
X-Google-Smtp-Source: AGHT+IH+g2S686TRu2qwo6Fx8tMGYY1LUnHUqaOm29KoLuznrr5f/PC/tBh0PHvmbSQVGbLqGcVTKQ==
X-Received: by 2002:a05:651c:1988:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2ec637ac2b5mr108100831fa.39.1719561116558;
        Fri, 28 Jun 2024 00:51:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5160d26dsm2123151fa.25.2024.06.28.00.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:51:56 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:51:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, quic_jhugo@quicinc.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
References: <20240628073605.1447218-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628073605.1447218-1-slark_xiao@163.com>

On Fri, Jun 28, 2024 at 03:36:05PM GMT, Slark Xiao wrote:
> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> And also, add firehose support since SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: (1). Update the edl file path and name (2). Set SDX72 support
> trigger edl mode by default
> v3: Divide into 2 parts for Foxconn sdx72 platform

Generic comment: please send all the patches using a single
git-send-email command. This way it will thread them properly, so that
they form a single patchseries in developers's mail clients. Or you can
just use 'b4' tool to manage and send the patchset.

> ---
>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 


-- 
With best wishes
Dmitry

