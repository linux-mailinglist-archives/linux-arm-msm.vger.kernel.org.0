Return-Path: <linux-arm-msm+bounces-27536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CB942FC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8E65B24D32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2A91B142B;
	Wed, 31 Jul 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PaX3JNIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C131B1414
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431447; cv=none; b=aTyNg+u6WLod2uqTmE2DLikMHnsZYOnBX2K+WCz1tfr3o8VXK6//janapF835P2CBe0hnWsv5s0GGLdG5q5hNO0QjC+m9ojgR566iYDHx5tW+QvNk9OUksR6Anf+Jwp/tvNX7VDb57a/fMnMP3ZXE+DpYX7tBEVSaiNvgq3+Inc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431447; c=relaxed/simple;
	bh=dX9kVn4xUeFUcfWVpo/tCIEzYvdt9I8uq2wPXw5+h4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yc96iSFrJ3Q52bPVXZuSOzjUVUmBkE+Tdm5Bdfo7pTWuHf0iERe3g/7b2MWLZTq/6J7cNiTtYi1lX6/FI59Bn7B7PIigyFo3a2ekGLB9CGORTYhpNX97ZC3nCEqKfrKIjV0x9tVNYoctP4tRFgvnKyj7DRcRrKnHmfQjPeDp4rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PaX3JNIz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f01e9f53e3so85155611fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722431443; x=1723036243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BtHopVaA5DnFXJsXndmzbhLYPQA3VMI9Krw2dYXiGpg=;
        b=PaX3JNIzFYbsCPDfbtmZfIW7qx9/DubdYdvDdxTxqwxogNPETLetmlgRF9pzbfd6p9
         mITEV62n3OGwGaO0xCyRQBjYTT7EaKaHUK/j+G9WIcKgdHEs07L9BSnVhV1YKOH8X+MX
         FlmCOHZ3AwVBNGoSBqB5+DhpwDnYYbr+vFPtmNUnT25mL8qUwtRAzfvLfrE6VqzU9aiH
         g5+gP5Piv1V7BcafR7OEbjP8gruO3n4KJjgpUeDLCd5fxgfleiJ+aQnSIeNQDSYGfYDi
         l9h52r20BwNGKN51j+cOASuathL35kiLaF+eP6oHtP0+8IRhMqbZbpaUCaQTVX1LUdBb
         RzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431443; x=1723036243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtHopVaA5DnFXJsXndmzbhLYPQA3VMI9Krw2dYXiGpg=;
        b=EEZ/4/wazLeYVhp3RIA9g4BolanQY4duYbhm9v8jxkVQ7ZAAS/wpv/RULApAUDha+R
         nFZ269/aMZxGqEJ+a1Czg3LgcaraxLdzxmScqUtnFGfzxfRRel7gAnvqqmNv8msvhH18
         qSpEjZP+bCwoQoLcNkFxr0TARZg2Tj18mau61Pi0EiNFk4T6Jq/GaOsATDX8tB8ZTKE/
         EOJEvUI50VZMGkttzBmwTvWaRb6AZyuJQhgw0A/eqr4sJcwP+VD1FILdv899BqUI3MUU
         vdcCBwMdDn0Nm7i4xjAVitsbQ2eBh1ZPdghbHpnw7vA3owLQBkDyz/D6Q4nPqMXrtm1o
         cxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcmk8OFqej2d+7s+2uPFqnvejG6HD+dGgXvPzGmD7FynYbjk8IiZcLV9bcieeI4kzXtYu0QN8Pkr9MYC58D14eNuexuxYm1M3pir/f0A==
X-Gm-Message-State: AOJu0Yy+TuSknLZjCejdTGC8dABFw/BUoskFFgdqTccNoMpjVuUO+uyi
	7Uq93R9/Kuo86zWnABvvVP655VyQx9MWrFpPYxyQSY5d5STQnlHMg/zUe3LTvTg=
X-Google-Smtp-Source: AGHT+IFKydn1H0rLRwTRWvuLChZ8ue/chEQn7wpdnSNhAgn3Eg7AyBP8EzlGjX88wgzpDyvecJjSEw==
X-Received: by 2002:a2e:a30e:0:b0:2ef:18ae:5cbd with SMTP id 38308e7fff4ca-2f12ee289ddmr117984021fa.27.1722431443345;
        Wed, 31 Jul 2024 06:10:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d075447sm19696621fa.121.2024.07.31.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:10:42 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:10:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: eud: switch to fallback compatible for device
 matching
Message-ID: <blagk4fkptszkmuk7qkeiptpi6uzigw4t4t6djlb3uxsu66eoz@vrt5u6ag2arg>
References: <20240731054438.9073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731054438.9073-1-krzysztof.kozlowski@linaro.org>

On Wed, Jul 31, 2024 at 07:44:38AM GMT, Krzysztof Kozlowski wrote:
> The bindings require two compatibles to be used: qcom,sc7280-eud
> followed by fallback qcom,eud.  The convention is to use fallback
> compatible in OF device ID tables, unless some device-specific quirks
> are needed.
> 
> This will also simplify matching any new devices - they will use
> existing OF device ID entry, instead of adding a new one.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/usb/misc/qcom_eud.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

