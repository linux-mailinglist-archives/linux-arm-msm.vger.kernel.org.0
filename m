Return-Path: <linux-arm-msm+bounces-33373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D081D992D33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD471F2354B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AD31D31A0;
	Mon,  7 Oct 2024 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="paTGwcYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD914AD17
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307642; cv=none; b=e31h36ucgZ95t/zkvMlZ4Dm9ObexyG1cuW+EcFwkZha0U0s+gkDaG/8kC1uvHQiEk1IMZvLaGikQ8KLLpL2h+F4UFGK+opFNN1XfOL7qKbh7ojdmZzVwEUUkQP/7PtSJ6JgxA0qUGpNS99WhJhMRVYcN76RzypoI8fgZPM9E9qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307642; c=relaxed/simple;
	bh=/H07fizqd8f9Un958oTh+xHyU1oyuvblBrcmK3PLaGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEKlLBNRnH1GlcL/CWts3gvf/JmcCfgdMbg7BD31zVdHz9k1cL2oyYwrtIIgb+ByQj8uo6WbIG7glRSlm4IaObpaaBbJT5y7nZg+rpGhRxYPftfCc6JwPDIJX19hvWvK81+BJLEU9ody1MaOmskZ6/FgOALST8Foeu0CWS8c8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=paTGwcYj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5389917ef34so4985493e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728307639; x=1728912439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNxLoRSbZI0k7IXFvf75H791GvPIK6wndlWEPKIZrUY=;
        b=paTGwcYjPUfOcTFxYfx9dq1RuBUfE2kNk3p74qZZ90QVi6kYq5gtM43XOvU5rKzM6Y
         Go9SmWdGrWsQ9/imWu5HgWozdxX5gvRQHT6u6bvp194/rgiAVru65+ajaCDh7n7cZfsC
         5WPGVjwAorDd4wMIaPGr+vXS9aJO/MMXzt1xxO9hS3AhvFz58E8q25WV3MwItI8LOVzd
         3nxNFou0rDcZlKai2PSDoXWK1a9B2D855TXzRy4PQ/TKOLFl0ZLC8jHeSkh1qT4/JfDK
         ppOXKv4M1Z/uEJxJ6V9TuhL8iNvPIuKsJofwbc7Bfrr1cvc8grwNqKUJSyidmIAPeDmC
         swog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307639; x=1728912439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNxLoRSbZI0k7IXFvf75H791GvPIK6wndlWEPKIZrUY=;
        b=UuegC6JFsmYF8LJeHXWeOUkA7u7pJUormbZCcJ7D87f2dYRnXZSAGo2Zqp2FoG2LtB
         LJxWAuX5ooABpr5SuNhpXa0s7c9Hu3htRwir//TtD5WScno+ZKgsSXFYwpWatOgZEuRE
         Dk5GLsgcz49xdlh7el02dIfjJwmmagTy0Lh6lvj/ZkNL0Yt0JVB/N49YsJfEFthutZqJ
         S/YZc/nTBFw97zDi2oBfWxDFYD3ZIXiBPIUweiZrdDANQTSS5QFZuiGOH/eDObOBIwT1
         qJWnebivCY2Uc19RpcKIXvDc7k8BAWzRVURGQg9xtuRHBdZr64HsMelW34oM4lBcCQlZ
         +DtA==
X-Forwarded-Encrypted: i=1; AJvYcCX56VLmGGiuRxPD+4PCuHB+4YVpQUPzcV9ndyoqj3HkRSWph3yVGSXWOS9REd/9ZrIZERGTj/03slmm5LJg@vger.kernel.org
X-Gm-Message-State: AOJu0YxURG5BjguItSVkzc7qTsPwfwGAENFfIy1sfGUTDjO/6UNjnXGY
	iklyaVxCY68DZS5bEKTtmSYarLhCs0qc+NHUN4+iSUcmXtN0gwQbgelI4OOOdbw=
X-Google-Smtp-Source: AGHT+IGl3vWdg5PH3ZdDeOZUmYnJZIlfXksyhP6LqocHQQkxY1Zwp9M/DFEYLfPwa5CHI2U89NDQ3Q==
X-Received: by 2002:a05:6512:3087:b0:535:6bb6:e7bd with SMTP id 2adb3069b0e04-539ab88a58bmr5319560e87.28.1728307638864;
        Mon, 07 Oct 2024 06:27:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d3cdsm846024e87.166.2024.10.07.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:27:17 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:27:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 0/4] Add invokeV2 to support new features
Message-ID: <ferdfqahe2s5a33l5bbswzx2ufrttmmleobthwqoogalx45iz4@z3fhono6eio4>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>

On Mon, Oct 07, 2024 at 02:15:14PM GMT, Ekansh Gupta wrote:
> This patch series adds the listed features that have been missing
> in upstream fastRPC driver.

please use sensible subject for the cover letter too. Ideally it should
start with the corresponding subsys name or otherwise point out the
target.

> 
> - Add changes to support new enhanced invocation ioctl request.
> - Add support for CRC check.
> - Add support for DSP and kernel performance counters.
> - Add polling mode support.
> 
> Userspace change: https://github.com/quic/fastrpc/pull/73

Up to now we have been using [1].  There is no way to switch to the
mentioned repo with no changelog information between them.

And anyway, as pointed out earlier, please steer your activities towards
implementation at [2]. Both "fastrpc" implementation are ugly,
AOSP-centric and must be dropped as soon as possible.

[1] https://git.codelinaro.org/linaro/qcomlt/fastrpc.git
[2] https://github.com/linux-msm/hexagonrpc

> 
> Ekansh Gupta (4):
>   misc: fastrpc: Add CRC support using invokeV2 request
>   misc: fastrpc: Capture kernel and DSP performance counters
>   misc: fastrpc: Modify context id calculation for poll mode
>   misc: fastrpc: Add polling mode support for fastRPC driver
> 
>  drivers/misc/fastrpc.c      | 435 ++++++++++++++++++++++++++++++------
>  include/uapi/misc/fastrpc.h |  10 +
>  2 files changed, 376 insertions(+), 69 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

