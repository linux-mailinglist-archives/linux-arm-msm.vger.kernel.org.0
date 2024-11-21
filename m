Return-Path: <linux-arm-msm+bounces-38720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D69D5558
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 228751F232D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D67E1CEAB8;
	Thu, 21 Nov 2024 22:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOqVzfvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC51BD031
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227752; cv=none; b=YuhSmBZQQyn4U+fGPw3FDdL0nzXuAPdRpQmjRX4K4VCFOv7mrxaJ5p1kCI5Cv5o6FjSIZm9RTtGtQ2dMfckBxbjECo1FZfyCOva13euFxrP0dwyblJAPYMoH7ghFcYWchK3agKXP+xGfu7z1+PaE1CODbtdt2On8QpUz6msxgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227752; c=relaxed/simple;
	bh=nVCXXLshd4gwOqlB2npfNg6YomsSuRLIGjj+1pL84Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/GxxBIOa2oFbUdDNDP9VelHNwywdlOfv9675B9m6aGx6MCnYYKgo1r0A4k/gO7ge0j2t/OfNbidnabfGqdNlmIJNKWeDznX1RGystv8H0l94rcmNtKj1qw9gGvtbnK/hXx+b6RhC5kb2cgVAgWBQpWnqCL/uZYtR/3nKl5Qm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOqVzfvS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ff57619835so23003311fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732227749; x=1732832549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej8S3vTqvmhNIveEQbgfSoDst8pJaJNYhopo+ceKPlc=;
        b=MOqVzfvSh7ZZ2+/B83neC3p+Qtlchkw0fMzb9IHoV9e5oxTpQLcS/8wVWWcqEq+ir1
         c1BpA7gkwdWxPElsZI1TnMjsR8IuWJBHOTjX18AFO9s1Rhm/EU8VeRoBqxm3NUyykdQU
         8JjSdGCP6rerlDnWJEcXZJNwM7+DSAAGuehjT74A65aN/4rPiW98xJm9ELlkiqxNXInN
         SHT0nK95QgM8UEnpHOzx8Ntrs3p/1xTb3NUWUZAjE1ylXoKbqsytr2yPsmvAw0hxkgij
         W+6JCeYyQvh8xhAeffIKZBu7cnKes1LK1xAurVdi0Vx86cDTxCmizjbZlEzVbvf9h2v9
         k18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732227749; x=1732832549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej8S3vTqvmhNIveEQbgfSoDst8pJaJNYhopo+ceKPlc=;
        b=gwIJLOdqle+mocCn4/0Q4Pyw4EQPII4+IJ0WOrsdPD5Ze5c+91fl2rUWGbKoI7l68P
         8DZ9MWISuc76LmVsliZR7MDHJ9se5N6FUafKOGNDR/qynHKZmmAJvmI7b5YkxND3nLa3
         PDNcFf6u5+pmOszUmrjsjHDlWCuhfFdyyno84ye8Lf/S3K0iE4ou/mEFhM7xQh0nVWOu
         WsdyBoLTzlvQcor0Pd3kfdmnyV/2uqe5ubD220iBnL6d8kUQGKkHJdSoMtGR+ck0goXy
         H6HU8+r0GbDkGmUWfye4XoepyZt/svNshKDB4nTfq2vB5G1BxuXnJsXrFjpupn3r8gnC
         MLfw==
X-Forwarded-Encrypted: i=1; AJvYcCXuF1a68TOzAyzwHVmyV9CdcQMVK45i+HD78vzJcfF/05GnJ89VKPDVoe/kDZl/l/u2hLEsAKgTukNTjW08@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrHFL5Vi4902f5qog26l32Ehk5V9dbcPLolQVd0+CUhsVQpo9
	uIyW1CJ34/nFkFYZg482bVYsqZxZ4+/0iWCuLqtYWzwXD1WNH+qE/LPEZgAVt3NUGGMtfCP8fSF
	3
X-Gm-Gg: ASbGncuQkH0Bq2fzswPVWFr3O7pQ0Nv6/nwfRvTU7J1HxwseWsJTNc13tnH+WoiuV6K
	6P1L59hqVA2pJPvZp5Yopc3MDOHTcM4mFpFDjrkLWtYhU6esgUnRL3aUF9MGbFvgfIQs2MRiFtq
	34OcBe4TKkqBsqFP4k0gdqJ5xuuUeFsPgk4i1GrExSlnIKtaxA5md4wgDMgoSUvl0+Cko8WEFER
	GmIFT+NQcxWeSGobX0x7F03jtCUZE9ZckxKrwR7wHPQeTe4NIYTNChcv4+JAu+b/ZSyhJdRnHw+
	uGfKTPs4iIPRW/Lw/vEmrDdRv0sdVg==
X-Google-Smtp-Source: AGHT+IE4DmJhxMe9nKX/xPXS6QUj2KIG9OcMLvY6lKA9hzUZEqv+8puapbezE/MYq4KUI/+HEGfV8A==
X-Received: by 2002:a2e:9a11:0:b0:2ff:6204:951f with SMTP id 38308e7fff4ca-2ff9697ce7fmr14354211fa.8.1732227749517;
        Thu, 21 Nov 2024 14:22:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d3f7f2sm645911fa.44.2024.11.21.14.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 14:22:28 -0800 (PST)
Date: Fri, 22 Nov 2024 00:22:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v4 2/2] misc: fastrpc: Rename tgid and pid to client_id
Message-ID: <i5aii3fcha3yasqhuiww4rzkfvr4th47lkog4lm5xhnhh3ygac@euhofylhilih>
References: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
 <20241121084713.2599904-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121084713.2599904-3-quic_ekangupt@quicinc.com>

On Thu, Nov 21, 2024 at 02:17:13PM +0530, Ekansh Gupta wrote:
> The information passed as request tgid and pid is actually the
> client id of the process. This client id is used as an
> identifier by DSP to identify the DSP PD corresponding to the
> process. Currently process tgid is getting passed as the
> identifier which is getting replaced by a custom client id.
> Rename the data which uses this client id.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 48 +++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

