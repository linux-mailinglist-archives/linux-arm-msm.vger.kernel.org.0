Return-Path: <linux-arm-msm+bounces-21180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B603E8D5680
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555811F27855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9739817B418;
	Thu, 30 May 2024 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+YwX7Jw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B295674D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113034; cv=none; b=F3v3SOSeIAIadYQ+7KP4zSnOVJ/iGwE1tUxlGNA1awhKyewrE58tZ9X85Ey58nWrUzNL39skpExSYvIdm3IplFCIgran+cnQMwfHHFwru1nk29Kquy+knslmbbq1faipGIxWfw9wWG5/9Roo3xoSvShWxePHtqbsRgfn24ySo4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113034; c=relaxed/simple;
	bh=D15m+MyXTHrsVXJPkTMbFZ1Yyx/Tcx3EMn8BItHzm9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smtoI9J8JPUuPZuJ/8zwQK7X6jy+DJ/rYqUyUpkNmF2VXFXs1EAOYDtgBoLrMn9IkOBVzRhop+kPvoho/84zQEpflZZFeLW47oRHwUuIjM/LirnnnKVBoWme7r/tHiqxElyLdCdEkU4mAkpCR3LHLcT4Hc/TSIdsz3l7DX2SIV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+YwX7Jw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b86cfcbcaso530073e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717113031; x=1717717831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTw3xrgpK+XczV4V02obwDdH8Sb5LloBfx/h6NiR1nU=;
        b=n+YwX7JwlvMyOt+tAndUEB/jN5wf4ZvRdmTLAYE46TsQPDtJZckInlKqlGXSVs2nYd
         jfoYt9Zxl2EX5zAyD+h/6zjYZaFykiJtvwYnytPTjfT6SMmZCXldyszep2wWmuw/EvMW
         294sy9c/gh4v9fV4uxHRofut/RytV1oN4S/a5DbBbYCU+6xO/+8n3ACNzSwb0vMZlddI
         F7WtGiWGPWJ9QHdjtfTuwHPR4soY1YwKN2/fu3HBLWrpcVNhuQLANUspE1FqtWqJPRnk
         uEEb1nlzNRLep2R8pA8vGx1A5HlXPnZUl7lMbpTS9JZmtNEuv5tKpO7JOvURU6MIKtS9
         zvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113031; x=1717717831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTw3xrgpK+XczV4V02obwDdH8Sb5LloBfx/h6NiR1nU=;
        b=aRrYZ7C4rqVO3fCrKIyv95X5cAh9gMJxdQnb7sqifrqvKD/kZ6b1bIZqB0faTmn6Er
         1x/uLJYEiwhup9fKijW1Oq4NgSoLyI0JpgYHoA8XbsF4tRDLjpWx0RHonWbUj7SWLDyh
         eI7EIstua+rMMNK8TnV0+lvJDFfnTziguigFc4SsvBpVRHe4uTjP51WpL2l1dm1ajAK2
         fHh/dViFsgh7Qon6RQHQ3wz9FylXJNWoLKi5f2w3TZdJPpceKx3ytdZpZXV6gLXWwdcr
         9D7kHjYbczZfYH0wgcrhKf9CgXVwzZiP8O7leLZvFaWo0Rh7GClJThaw1gRmFXeoIJMg
         mjzw==
X-Forwarded-Encrypted: i=1; AJvYcCVstp7c4uCHvBGPNFnvclT8ZzBmzDgz1VmmkaTRUgsDQIhuLr/3a8KUeO/NnVQj5QQHHkNpWvXChaUjcGnJyMH6h4kn2u1CqQGHuGFOqw==
X-Gm-Message-State: AOJu0Yy11drTEq/QDD9r+SMSQznzxcqek1zxeq/9qF2bSMcQPwsqftYn
	4K5PIik/eMu63ufHkf4aMVuo0el1XesJuw48dudeAca/5eHmXvzc2VDztmi9dr/fX1PyViHIU2p
	k
X-Google-Smtp-Source: AGHT+IGCCzPDvqFA0Lhgq9CgIu8tVKPJgqDh6Uuo5pB2UeImhGAIS5xT4O/KxoaBAbe19P+UkCz3sw==
X-Received: by 2002:a19:6a0b:0:b0:521:7846:69d3 with SMTP id 2adb3069b0e04-52b896af22fmr93823e87.55.1717113030884;
        Thu, 30 May 2024 16:50:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d76217sm127052e87.121.2024.05.30.16.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:50:30 -0700 (PDT)
Date: Fri, 31 May 2024 02:50:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v3 9/9] misc: fastrpc: Add system unsigned PD support
Message-ID: <kxd3jdjzz7lz4a5c4jcmtqvgiq6mz2ryunzhlyfuik73p3wj5z@5qtdfguopnjn>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-10-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530102032.27179-10-quic_ekangupt@quicinc.com>

On Thu, May 30, 2024 at 03:50:27PM +0530, Ekansh Gupta wrote:
> Trusted CPU applications currently offload to signed PDs on CDSP to
> gain some additional services provided by root PD. Unsigned PDs have
> access to limited root PD services that may not be sufficient for
> all use-cases. Signed PDs have a higher dynamic loading latency
> which impacts the performance of applications. Limited root PD
> services could be opened up for unsigned PDs but that should be
> restricted for untrusted processes. For this requirement, System
> unsigned PD is introduced which will be same as Unsigned PD for
> most part but will have access to more root PD services. Add
> changes to offload trusted applications to System unsigned PD
> when unsigned offload is requested.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 27 +++++++++++++++++++++------
>  include/uapi/misc/fastrpc.h |  2 ++
>  2 files changed, 23 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

