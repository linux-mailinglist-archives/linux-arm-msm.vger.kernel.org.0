Return-Path: <linux-arm-msm+bounces-50583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E4A55F1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C4FF3B32C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D57183CA6;
	Fri,  7 Mar 2025 04:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scdHHOoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A532940D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 04:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741320237; cv=none; b=qw/04A0iwJgTJJAZmJ4zW3q7rUyJtqgNGbhP+UfnUq02Tu6H3nuu2duhJC2ExBWeF7aSkk3N3PeRKdNXQbvZAn7tOs2Y+zYPh6sPeejn9jSuqgvH7fAx06qAgtCKX15CYt1zIuh2Jtr3EN0jhwjKyfYO40fgMCxbAnfSTOA5acw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741320237; c=relaxed/simple;
	bh=IB0b27UAz8bwJMlHSb6ikfeP9mwsthfyQDSwmR3e5BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0By+wQ3sVEDMiQ6GwpTlIorQsfPmPsROuyxuw/uc+1nr/vP2wgAe4fKRS0jw+pgcqQ9eQBpS5T/AttnqD/0a0Q/qTzt599LJ0TGAfw38nCaa9f6szd9ULhf5lkJcpxeuNY/jgE2LbTYydm+jSKHw1ioaJK7zsXXDdHZn5RyYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scdHHOoO; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bef9b04adso10352591fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 20:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741320233; x=1741925033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q559lQVO0eqbcaMdE1cepZ7h+gw822oPb1VcWyT+D3k=;
        b=scdHHOoOTnqIusmPxjXSEq/TEvuK2fKlP88lP9wMgyu3IhKLApALt+kfhgypJOub6f
         VynUcRSwJ9UfXXXLWLTexIOOQkV7craFixtEskid2ZgibB6VlA+nRRrzsZCbbT8QVXn8
         teUlEk5A4yKkIXMxkNO8vor3jeWhKQtf9qqVFO2e0pHziugWcMYIW0HZMy9tY6xSkXfN
         7qJHkS2BK9fcBHHcQjJDN658KZOa6lEayXtLvQ+9DQjD/R9YDZuHYu1JphIdK0Kx8lR4
         BWc1Tcy9ol/Mv5lA1HGrdpwNxtryJejwWfzvSlpxY+yFVoaja5jgl6+ZszJjRmp0Qi7u
         sEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741320233; x=1741925033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q559lQVO0eqbcaMdE1cepZ7h+gw822oPb1VcWyT+D3k=;
        b=EZhRQq24rSlMKZuoXj3h29MYcQcTgNLmmLqk7Zj00GTKZwkUPRAHvIhoyhGWZTf7H4
         RHcyHUlhpy4oEuig4Y7IhL6VWKvEtNruYdFISBmOJbYQHNaDscdZ+6gs2j1wgmF/Ozcm
         klNpp5zXRa+5OuPac2RK7XoWyinATtb4DctbVV6uyV4mOww63Bk1M5t0KFdWGZbzt4dl
         R2EtaSRiD8Pm6PahaPD2mDxIYI/NYV2LQyrGbfgum9j5QlAUAeE28ZmeLAZMoGawzwEp
         wgtAvmwPrFr+fLZMNgak0reC4QAUF7fGLE43Ohwsi1zK9PSCnQw1lk/MuImPm/ikf9F4
         Eb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCWWhm8TNpnAojTs/uINWinCNZT5mzCTQhQ3NSarczC4u7Ko1FdCoG9L8dFO2TwvktVHi5tkO9uju6NhTR@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOnRUA1sc2/cMhY2pkLHMolZjVbKHxyWnersx7BscbtMozbXi
	DfcTtm1HdG23YmxV3zfZBXUxk6UJCk59K+J3w1iwoht5rM0uc1gsCpQIgGrsZV4=
X-Gm-Gg: ASbGnctXrOXyjiHuuQS7VH+bOnzguTb/4FzeLQNHZIzjMvsb62RHfXvsV80mUiMntNc
	pGSNdt1bRlchBcUVEN8Gg9aOrtllVtJu0izqiij3fKJA2l0rx7DOLX00s6jJUbifnw3wWXvhw0o
	CzhbtsKgTo2Zl7YmzuleXC8GyVKgkH49/c5zjQqWpqpNKWw6vottV57xATNJ07J7vv+mQeyTqSr
	p1vNlDeKvvCIt2ZECodl9aYfeJsLyvkoLQ9n38EHmzRIBLVDoiqnGreOiYp9mo34pmJY8cjTr1s
	v81FnSA/whiJrQGw7dHcT375yq9CgnDmUiVk6PkEJui05llNYdIN2rW714xiQhfy5eXLrm2cGbO
	hn0v36VaMs4AwpH4+DBcEcZfi
X-Google-Smtp-Source: AGHT+IFkU/H2JgQ+KzgwwZXcDnVmGrvz6WNb4Dvni6Bmcn4jgovRKWXORNDJCk42rS/+awsQtmG+NA==
X-Received: by 2002:a05:6512:3b14:b0:545:2c2c:5802 with SMTP id 2adb3069b0e04-54990ec1da0mr569205e87.48.1741320233311;
        Thu, 06 Mar 2025 20:03:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae461edsm362946e87.38.2025.03.06.20.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 20:03:52 -0800 (PST)
Date: Fri, 7 Mar 2025 06:03:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Message-ID: <gs6zemh276kxuphyedsv445ujroazok6jq66mdljkrkd2f5fzf@zjumlvcebaix>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>

On Fri, Mar 07, 2025 at 09:50:30AM +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19239
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Also

Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")


-- 
With best wishes
Dmitry

