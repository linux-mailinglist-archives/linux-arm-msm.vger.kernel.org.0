Return-Path: <linux-arm-msm+bounces-40079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D925C9E1D47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 899822838CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7943F1E3789;
	Tue,  3 Dec 2024 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEDfXVvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986731DE4FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231710; cv=none; b=qXdPr1Uy5CVlukrYw4a41Ze1xbc1m8HSdIwbZOdbO4q90zWca3r5Ib9ra1Vc/e6GfbXQkdcF13HxIg5mYsk4sXOgSs5NYpmFZZUe0gnKJmvVdAmV67g8hHZ33IodqVZKV7ypPMhGywmSoHrx4+h+H0NM9G6/HEqhLi1vwgYUy80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231710; c=relaxed/simple;
	bh=owTdevYxAcudamP7xRMmaN1JsUNs4wfnBZCOK8eAEQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueVOmBDBUUQT8aQ5LQBJ3wM7tyAOjCey9Mmp16wJOBTIY+UviykUAHCIZtFWMLYu6ECd+u9HsT3yQPvWR8zhdzfJlZVOBZmAcNZTEeY7B/lm08SE6um3c904ldQJz5nHmhIx0jZkcsnGlTVuIL8JyeyVeCz445sWBwne12GaL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEDfXVvx; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso66566601fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231707; x=1733836507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeNA/Lpr5Y08mM6YBqUTV889AOBT4B5h0p2YGNFMqw8=;
        b=QEDfXVvx6RjVmuE9bIuZsrO+8IQIZlfouPYtC/2IQqw6JJMvv+6jMQ9XhZG8whiCAl
         O4csQMndC3Jmcgu51MreySW2mqG95cK1foFL4Er6r5BjRdGnfOZoK48zINgCMs+/i2uO
         X5XvaBAkxZxr+k5T6qoNWXEWuAt1pTUy/omV+THx2ZXxRCvplyjWWPpLu/B83seR1NLo
         kuHzoMAjxsydSfHVNq6A0Ei2Cn1/gBLm0RVT74lUIxvmeJrgB7M/1s2ukT2Rs2eaIkoB
         QiF508eanmJ+a6DyM0YVtCt1Zz3yIQF1YpoBwNJNQ20iE04VOwmWECAVlygQKaTPben1
         YdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231707; x=1733836507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeNA/Lpr5Y08mM6YBqUTV889AOBT4B5h0p2YGNFMqw8=;
        b=HOb0oqKF/wzH3Dcog08uOElG5ypZ2KixSJj+4l/KIACczA3ddraxDnghT7aaMZmL5i
         q9SInkNe7m1otv4wGXoXk5l4zqwlVr6iXEJN8VLalo5xNyeyoVX3B6+nYzUAtq2VWVgS
         fvcYcMuU2KbwCzhUwcbchaJSRQ1b6HWJ+C20LONJD1c1TQBYr3hu9O9DP7fhHLpFqXI1
         gNwoVOUNIrE7S1PDXhb+2JO1Pyru/E47sI1g9YGrfcKnzs3DZywmyt+xGJnNbWlc7Z6E
         rKwAhcrGrNNT6dWtHajtck6G5uegbeC+B3Yvdekksdf0rQL5fJkFy1P5qZWYYdtevh2n
         0BlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwR7+dUDdxxuJL7nQz9HjCbrlKMBRtZHqUWGGB93LySB7yvurUksye/XHfYfMqCg2LTe5D1htjyVdOF5OQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxitPANnSrb8sL5OjlKu13ZT2asBPfgPNGMsB7CQurhGcVPtmbX
	GciBGSJAURl6KBKpk+ndp/le9TV1ALOHiBmRndxKgD+W3bnxb9rhld/bG1a598s=
X-Gm-Gg: ASbGnctyZGz8h/oyQ1GprTZrmvJo3wXs0KQwyz2mrlmnMa73woBSIrfBMeIMYeeC9XL
	9dEaE0vdet5vhQYBE2UvQYftgCdQkE7bn3u7JrdQoj/P6vh5CjEc6RRVn0/gItEngx/t+Puwfmv
	lBsFzHoPF1zSnhYUsGsYwqfW/8WOHKdoJHkm441X/4lzu0tPnOiCZ7KUiBmhC5/dHjXfcZZptjy
	ydi7ak9cDwR42/9EiVIHi1Hgl4eGNOWURb5oyoDYcplMjoipMo3IXYTciHDnoc7NtHRgjlrQuHo
	RWoSWmu60ESMzDw822XYbpYbrsXxrg==
X-Google-Smtp-Source: AGHT+IFM4VOdavQf7x5htmcA35f00mFlqCG9/SJ4fIIkch6bLXMhzCxhmHzzSYybmwSFt0nJpKD1UQ==
X-Received: by 2002:a2e:a815:0:b0:2fb:382e:4120 with SMTP id 38308e7fff4ca-30009cb82cemr11050501fa.38.1733231706751;
        Tue, 03 Dec 2024 05:15:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfcc9fdesm16115781fa.119.2024.12.03.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:15:05 -0800 (PST)
Date: Tue, 3 Dec 2024 15:15:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v6 1/2] misc: fastrpc: Add support for multiple PD from
 one process
Message-ID: <c6wcllahx5edgn3jkaqvbtp6agye5jwvzftldt775xi55sjmub@5msaghvdkflq>
References: <20241203053048.1690069-1-quic_ekangupt@quicinc.com>
 <20241203053048.1690069-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203053048.1690069-2-quic_ekangupt@quicinc.com>

On Tue, Dec 03, 2024 at 11:00:47AM +0530, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD init request, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Assign and pass a client ID to DSP which would be assigned during device
> open and will be dependent on the index of session allocated for the PD.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

