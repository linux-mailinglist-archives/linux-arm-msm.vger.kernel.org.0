Return-Path: <linux-arm-msm+bounces-26108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3105A930DE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7931F215CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 06:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B182318309D;
	Mon, 15 Jul 2024 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xk/Vnsko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807131E89C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721024483; cv=none; b=Aacgg0KOdH/aAkdQWQmb0QgMmDE6xDYW8vAb8iHbQcWdI23bzCMgG6xbAAXSJLzxfmK71K/tL8WjTV7MWBl31wdYniAQgxno8PMjPfDrGgzBCzJUAwKDY70Kl0eUyXPlXuBzB3LM98mcYH+NDxwQiJMfhDXWJX58DJFU8hdYu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721024483; c=relaxed/simple;
	bh=D6XqNP7Ocjw2YrA4F9ERC7JrymvGT0zCRzd7DfHQb5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNtpdEF3J1FSjUaIUVZ0FGtrrgb695LoYp6DssVWA/09PDH7ODc59ge5AfojmbIqqlAA/bxuPsbmztv+yRYfVQM9XDBaB6h1dbHVgwDj8G89b2Z2jz9WR++wQCcw86srKt2hHeyi+c4kY1kwzXWLm/FsdSqhBh6Qhboj6njeOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xk/Vnsko; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so4085258e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 23:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721024480; x=1721629280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10h7AorBoHJscK+IMdAvqhx2IYEBB33opsawba3ThY8=;
        b=xk/VnskoLU+N7UdRakjSZHFNKtad10E5suLJPEKNs8prCCQoJYJ+W0MTa9eaUrO4aO
         C8iBqAOD7QZVoO+Qg41FMkl3f0Oz2IxQBPqOQe+2wOzjV6h9vN0uZ0dAxiWs/yMdDcKH
         jm7nZ+IkMFufAQguEgQzvqnHH0K3t8w5/xJj8q7H7bp9yfNZiLnnzG0JPRVKgyDLQWN8
         abC1HXqBxHNbR88CyExHu/vYsmwGfc3goqNV1VYu+yUIMRQGAq5zR2Jo0MqkmZG0agcJ
         E1p9hCgfgk4xIwaw6dwNpgY/50CB8z59YG2yaDzmfNR2n5DO17cpm+daBP64O5BFr3ct
         HECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721024480; x=1721629280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10h7AorBoHJscK+IMdAvqhx2IYEBB33opsawba3ThY8=;
        b=j7mTC5nuIZUjdJHtEtPUiKQu6jn2kI8PVDj/iCJ862mXPoCVqkEsg+DpTL0PQwmCSO
         kviTUVMLY+CdCDUQEU4MDgJTnEHFNdAbp/FNh8vrFCVPRjDlDHFc0aKweVLyO2IulYsE
         JAjuIgtyZ+x/10R9IF223CZr7LJ1AZRw5M3EFGrJCTgL1fL0fxCriW2wKQMsBh4e38gz
         7Fd7bO5Go008D9ai7O3gcaSK5vb9vK76XUbYXZ6vIiZTfNp3slMe456Yp0zV0RmrPY2W
         9lWSN12V/AB8Xf3MTIcWBTraHeK5CbpSoeApxlVGSISZoPnxciD/bH2SfB/T16CdapAm
         Kvrg==
X-Forwarded-Encrypted: i=1; AJvYcCUrYKNwcIKguIbAxCP+Uxwqq778bqT9o5yibWUoOlYSphJ2M9b0pP9zRApSL29E6yR57HlHZXodD6NHVMwLwzU4wjk88S3qXVGqwHpzYw==
X-Gm-Message-State: AOJu0Yxs1WXT25BnwDk+vvVlxFoT/ZVFbiTl8vct9zOWO0xYH5T8Ut3H
	YSdGA7gixgr+1s8oNAy1E3pnlsYiyJ+y5I4/PskFX61p8xuem/v4mooQ2aj7y3donfAmVggknMT
	1ORQ9JQ==
X-Google-Smtp-Source: AGHT+IGIypb/Qu3E+HlICgtenyNPJ1eoKnIT5Y8g4jzQcW7TIRmsNUzmEcdGrxNLhSAXxoKHuhmA1A==
X-Received: by 2002:a05:6512:3b82:b0:52c:e084:bb1e with SMTP id 2adb3069b0e04-52eb999126bmr12945618e87.13.1721024479558;
        Sun, 14 Jul 2024 23:21:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d7b4sm739852e87.127.2024.07.14.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:21:19 -0700 (PDT)
Date: Mon, 15 Jul 2024 09:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify struct freq_tbl
Message-ID: <ixuyjg5os4huflsjbizfvde5kytvg6ekccjq72mpkiiiunin6y@pqkhiu6xoznk>
References: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>

On Sun, Jul 14, 2024 at 03:01:58PM GMT, Christophe JAILLET wrote:
> 'struct freq_tbl' are not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7595	  43696	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    9867	  41424	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> I hope that it can be applied with this single patch because all files are
> in drivers/clk/qcom/.
> ---
>  drivers/clk/qcom/gcc-ipq6018.c  |  2 +-
>  drivers/clk/qcom/gcc-ipq806x.c  |  4 +--
>  drivers/clk/qcom/gcc-ipq8074.c  |  4 +--
>  drivers/clk/qcom/gcc-mdm9615.c  |  4 +--
>  drivers/clk/qcom/gcc-msm8660.c  |  4 +--
>  drivers/clk/qcom/gcc-msm8960.c  |  6 ++--
>  drivers/clk/qcom/gcc-msm8994.c  | 54 ++++++++++++++++-----------------
>  drivers/clk/qcom/gcc-msm8996.c  |  2 +-
>  drivers/clk/qcom/gcc-msm8998.c  |  2 +-
>  drivers/clk/qcom/lcc-ipq806x.c  |  8 ++---
>  drivers/clk/qcom/lcc-msm8960.c  |  8 ++---
>  drivers/clk/qcom/mmcc-apq8084.c | 50 +++++++++++++++---------------
>  drivers/clk/qcom/mmcc-msm8960.c | 30 +++++++++---------
>  drivers/clk/qcom/mmcc-msm8974.c | 52 +++++++++++++++----------------
>  drivers/clk/qcom/mmcc-msm8994.c |  8 ++---
>  drivers/clk/qcom/mmcc-msm8996.c |  8 ++---
>  16 files changed, 123 insertions(+), 123 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

