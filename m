Return-Path: <linux-arm-msm+bounces-8325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8F83CE54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBBB01C20ED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9189143AAD;
	Thu, 25 Jan 2024 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1PpcPQA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7971F60A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217467; cv=none; b=Wpn4dc57DnjLuza3ZdSgJ5fgNU23egrRoiBCkUGfnCmtqVZhOJE4ci0kM2o7RmHpaKNFv3sBKwVvYEzTwxbdwJEpmk6tMigKAomXh6I+2NBN1rvKkK7kA6/KXmBuBtmh0HwAqtZwTQRXnWq1tb0pWKb9DzOkXKy8pFUOw9pGj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217467; c=relaxed/simple;
	bh=Mtd2w7xXT6XIkZ/+W3EO3lHtQLTDtOu1ql71iDUy4Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpRkqUWmcojQ3dgBDjBOJ/9PRnNsTLF64Fli3HOnkdMyfagTueN/7HNRdb4gOEIDYUNeqMhEPcIvcuib7OM5n7lecQZdwphxAmQ0ZxMBhKq+u00UULS9XGvzqSr8RH2eRTpI5Ar/Q3aZtRf0H+o7wsOoX9EXezP8W5sm+lkQ8eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1PpcPQA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51020e061b5so869168e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217464; x=1706822264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD2QJEJnWPU8h0oM7MFrjmiG6AeNavMG7PZRxfY95OU=;
        b=T1PpcPQAcjS+XNyQ2VJzCWvQR3hls2QKNK2f2ZPfR7EvrPxsCjRA6ZGifFipODHQWL
         QoNAbSm64AHyYt73fVI8CAJ5l9YTa+fiv5M1MFD7aDUyhWVlUq6p0Ov8cEa11zdUw9Ye
         5kEdzg0g/YfdXrQoUyfAyLUqaF8sHvMLlZFOz5VKC/xk0WI8wHvFw8AXnclGN2/hfqCT
         Qfx8sPXgSIgQJlkskAu5jpTN7EF3Jpb9SOp5kymxjxFWCdDwKO8w2T+RFVm9JoPzq1GC
         ct5wqMkJJa8nJrXprglbhaw2Q/a5ynmNR7HZvW2C4f8H0O9uO5zkIkIcALFGW0q05TSt
         ltkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217464; x=1706822264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qD2QJEJnWPU8h0oM7MFrjmiG6AeNavMG7PZRxfY95OU=;
        b=F6vIbOc5pza5tEWgwpBLu4TEGnRwlWWnWEPnPoxFp6w/pCEDM+1oeXlbGnkIR8NE3C
         Xh//UwdoCbCmGFumccaq1aDaMdXnTVXLKU8/LBxXuYx2j7REODz2LBAKNWqftdqzgjP5
         MAfW6RANxBBU/qY5ifrt1U2f2KoGl0HyHJaPzBe+1v7wby4qAimP8IVImHzxKqvZ/jjv
         6bxZgdvGGKb2IUjKwuvNMPuU/0qKwxfLjxY9+fSkcnlFexdAplbHsODV/9w1mdPUXGsw
         5S+46OiLaH1LZ28KcFLBbhpzeu1oucYOzmXUNcr02oGG3PUSjmGY7/Vfjq98YHz49stc
         Ag7w==
X-Gm-Message-State: AOJu0YzI/8Vc7sybrBkMCwvp7fsgdjguaNJ1y3JER1QiSqcQ8X/ntmzE
	odxwuzEwwqHaj35qQE0/qBx8sKIF8NSPMdtN49T2l+NURw98iq1afCnnUswUMIGcmh1ecILBAG4
	Z
X-Google-Smtp-Source: AGHT+IGBDmA781f4oxbUXw2/D3G0P4WiuvTPBTFitCuStyuMCh9gM98JpGODRI1WnCOPGe6iLFGUEg==
X-Received: by 2002:a05:6512:401f:b0:50e:4d3c:c4dd with SMTP id br31-20020a056512401f00b0050e4d3cc4ddmr233121lfb.105.1706217463847;
        Thu, 25 Jan 2024 13:17:43 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r9-20020a19ac49000000b0051021c54018sm113397lfc.251.2024.01.25.13.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:17:43 -0800 (PST)
Message-ID: <56b38e28-09e5-427b-920b-5e724824c258@linaro.org>
Date: Thu, 25 Jan 2024 23:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm/dp: rename wide_bus_en to
 wide_bus_supported
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-4-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-4-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Rename wide_bus_en to wide_bus_supported in dp_display_private to
> correctly establish that the parameter is referencing if wide bus is
> supported instead of enabled.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++---------------
>   1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


