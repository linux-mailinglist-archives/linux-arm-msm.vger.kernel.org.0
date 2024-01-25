Return-Path: <linux-arm-msm+bounces-8330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737983CE87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44E92931A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2819913A255;
	Thu, 25 Jan 2024 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFKusoWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DD13A261
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217981; cv=none; b=InE9h53Q+krBLw1xdUY5sx7FCDgLSkP3tRYbHILPoYabcj0ANlwtmdTLZ+ZqQR0cTqz2yehFFicl2hqJS59rFN3T0TSHinzmapSm67VYZ4wkJIktZenkFTUVcRAv60KB43AlCA9ldfx06cjKAeBqhHZeF0XPdpoXRadkbiDr2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217981; c=relaxed/simple;
	bh=bDjZnDYd3CB2sa727hdBo8AdhZb19/UqDBQe7Y9BQzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ph1SLSVao4IHHvJ2juSgOH5y0YRMnOovIlnkeuTFNDek2FbdSp3yvdQ2/96lLMoVvlufXlziBTkXuO499rhqH5gbFnkpQ7P4i4ssWOHVguLEinkVceIBEREhkT0TBu2rzdq7PMiPQ79UqEXj6rnuQon9O2lmIj0+Pyk45AOxbJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFKusoWR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so199196e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217977; x=1706822777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opr0EZwZFRd7qWwZr6ONiP97uq3gqlCbm0L08Nd9OHI=;
        b=kFKusoWRgbioPuXvN8cz+0yovjdLpxJv6p2pR7Rbyt3k/fk2QO4kzE1r4sqYezRJN8
         oVKH57WvGfhmRKGyO5K1XMFWjXd9gTmp2UBsO/Gcd19wFXTlVFMb2JEw4o4M+m+eMxLP
         9i+31VO1/nsWyAN9fIY2UJEZRlxy3MFrZlSAel8IxhFhjxyCXtN1u3AZU/NTxawCxSYn
         4R89wmVzs0qhVPJVzoOHjieCQwr39XCqR5J6A0E6LZ6g1xfUBQSzBkaX15NJseWu66fd
         ISizsikMTAjs2+IzMlGG0+rBRsxgdTS6XmWgiKQpa37b8Oer2hoWaXuGJD9HfMGhvjq7
         9xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217977; x=1706822777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opr0EZwZFRd7qWwZr6ONiP97uq3gqlCbm0L08Nd9OHI=;
        b=KUHahpmJbRE2JX7HeWGaUKYtdYBkj5yeacIlDzbzkpVWUQR3l8c7hpIc078pjcDyer
         jEJKmI+HIp+I7v3jeDF56Qi46BG+ZMUhWMscWDY0fCyV+0mbFfM4NUJronbbphPvtUBG
         j3gxARgT+URqvgszW3K9SzH1pJDdbBNkXRX9+sqyViWpyr9Yljb6cuhDx6/u5yo9JkTu
         y5RWRNaroUgYgVuCnUXFEgeQdTgWES1oGmlFASoOAeCH1SWdl3VYavT9IxfA/o+egR1k
         SKbzNgO47nSKCF9ov+WIKH25Esk0RW/Rr2ic4MvaFbLmRnuGoqeMb72Idvkegfih3kqS
         p7QQ==
X-Gm-Message-State: AOJu0YzDy27aR1/13Ab6RBMFZ2DQmQoXtXLCjqB8jJhbaebssq9esZSw
	PFeC/7uV++dY894q3pHRq5pq2evTeIYIViEl97rjyJYlwXvdG1ikLtIUyjh19DM=
X-Google-Smtp-Source: AGHT+IEthVdS3oiU5SgGOGVij7Tqs27ox5N9f6J9OaKXHHoWrkKuT8IDlQFxTjG3KOLJhwasDUGdWQ==
X-Received: by 2002:a05:6512:2208:b0:510:ce9:b2d5 with SMTP id h8-20020a056512220800b005100ce9b2d5mr227864lfu.126.1706217977446;
        Thu, 25 Jan 2024 13:26:17 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e22-20020a196916000000b005102196b586sm131568lfc.152.2024.01.25.13.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:26:17 -0800 (PST)
Message-ID: <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
Date: Thu, 25 Jan 2024 23:26:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-8-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> YUV420. Therefore, program the INTF to send 1 ppc.

I think this is handled in the DP driver, where we disallow wide bus for 
YUV 4:2:0 modes.

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6bba531d6dc41..bfb93f02fe7c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,7 +168,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	 * video timing. It is recommended to enable it for all cases, except
>   	 * if compression is enabled in 1 pixel per clock mode
>   	 */
> -	if (p->wide_bus_en)
> +	if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> +		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> +	else if (p->wide_bus_en)
>   		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>   
>   	data_width = p->width;

-- 
With best wishes
Dmitry


