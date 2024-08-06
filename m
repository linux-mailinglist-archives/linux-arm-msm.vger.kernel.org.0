Return-Path: <linux-arm-msm+bounces-28042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226B949BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 01:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18890B25F1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A9317839C;
	Tue,  6 Aug 2024 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMV/XFXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7417625B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 23:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985783; cv=none; b=K70vBuDi4Q3+buiQiqDxe/toeghMgLxRmFvuGlUY/BiCUSyCrY4NCAq++XqW1M4k7OKZT1evTN55aM7VLumVNwZjh7EJIIxFFvJHgUHtRaLQYfUjvqomgS1AKFf4Y7Rs5dY2oafj1UuxGBJyuG2OviTnVMRnIVx/eeB+DYqq9+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985783; c=relaxed/simple;
	bh=IT835fC2v1rDjmdocs/e2w/fHqOQ9+vjIdY5l1/ug1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwqygD4VSYrZyjAxQgLPDzBl4RtAc/2sXXOCV6UyTREhza/nktdDU3oG92FMzqKmhjOyutBY/QxPjHELdtig6uFLZ321DSf2jZcBH/zFzV90Exddy82Zfv3kzK5khvczYVWznbDQVCXA4EZDfQbxhL9UKus0iFjI6SoqMeYBjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMV/XFXX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428119da952so8107045e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 16:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985779; x=1723590579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NT0zhPaW9fTODX07IxdKjoCwQu7dHgMY3DM7e+O1NSk=;
        b=gMV/XFXXIrDPANUozALGodB8wo+ZbaJLwYvg2Td96R5oMLB3uxgHOls66u+GT7JSDY
         iszUfq/ZFAC53rsmj3E6N58NRMfTskXy8eor2gYRPrT85wcriL1bjJGeqRahkb1MfuPU
         QXmisV4kAtP3qrv0ib+iqK5VJcnVCIksu/TT7D5f9seSI2PA8AYrphkfBXkshWGqr8sI
         FHMnUqufnAh/qTkDqNfcMuc/8rkl1s4Wf8/VUkR2WbaM2p+/q/rqmh+MLsHoMZLFaVOk
         x0+E5vlEdKDckBmyt7WkpUSOB8U4x3EbFdwPhZagNlE+/7MQTJR4zwu/sWCfIgS0L19Q
         uWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985779; x=1723590579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NT0zhPaW9fTODX07IxdKjoCwQu7dHgMY3DM7e+O1NSk=;
        b=QerTQuPQggRGI5wWWkMHd6xxJ19sIzMIuW5bB4TgMwH+PZNeSfnPYs5skU6jIrHCtS
         rKukJHto2ii0fsrMCR7DkD79keD8/vflB4QD6sDRwqdQbwEzcfE3Qsvyrj7B/ABWm6SA
         6Nx9IJwmFV10kZibLKPDU3nXRuzukpyEBlLdwI9NValZHfEAjyaEhvBvro5ivXIiU/Kj
         LVOCv6u/CiaSVH4zbGvovO3IqUxu1nWq4MJsOk5KsSE3lERKsLizDRldNGAYHHNX/gBU
         p0vlCgbKKMTlcz/MEbcRTF0J5ChaJJL6gitAgp+rZCizSMfjTuZgaPlrxKYxiqzM4izw
         PeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoZpgOO0hhEc8EIexbU6w6A3YsIDFcLsHU1bcH5+9b85PW0W6LggfjWP1woMcPoqM00kvNYE3t+fcC1agE4/D5YVLbMgQHHaV0p7HDbA==
X-Gm-Message-State: AOJu0Yy+lLpqrytRJMuxixKJ2UWjPez0aymkb0Op6TA/yPqPufYngFzU
	u7Ld5PmitII8leiOMSEC2whBlOlL2GVuocfF1OZbi9CXA/AkGffjcjBDq2SlW0s=
X-Google-Smtp-Source: AGHT+IEJpAvUfIIvozxN0dMfVpp9KmKIUpvC4vij6YYiTxq9+3sa50E2lR8HX0TuIM9NppQUwq6ANA==
X-Received: by 2002:adf:e58d:0:b0:368:75:2702 with SMTP id ffacd0b85a97d-36bbc0f7aa1mr12450334f8f.13.1722985778635;
        Tue, 06 Aug 2024 16:09:38 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd02200asm14180706f8f.54.2024.08.06.16.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:09:38 -0700 (PDT)
Message-ID: <021856e4-f48a-4cde-884a-0eaa42fcf82b@linaro.org>
Date: Wed, 7 Aug 2024 00:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: camss: Increase the maximum frame size
To: Jordan Crouse <jorcrous@amazon.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240802152435.35796-1-jorcrous@amazon.com>
 <20240802152435.35796-2-jorcrous@amazon.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240802152435.35796-2-jorcrous@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2024 16:24, Jordan Crouse wrote:
> Commit 35493d653a2d
> ("media: camss: add support for vidioc_enum_framesizes ioctl") added a
> maximum frame width and height but the values selected seemed to have
> been arbitrary. In reality the cam hardware doesn't seem to have a maximum
> size restriction so double up the maximum reported width and height to
> allow for larger frames.
> 
> Also increase the maximum size checks at each point in the pipeline so
> the increased sizes are allowed all the way down to the sensor.

So, I think this should be a Fixes: also.

> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
>   drivers/media/platform/qcom/camss/camss-csid.c   | 8 ++++----
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++--
>   drivers/media/platform/qcom/camss/camss-ispif.c  | 4 ++--
>   drivers/media/platform/qcom/camss/camss-vfe.c    | 4 ++--
>   drivers/media/platform/qcom/camss/camss-video.c  | 6 +++---
>   5 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 858db5d4ca75..886c42c82612 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -752,8 +752,8 @@ static void csid_try_format(struct csid_device *csid,
>   		if (i >= csid->res->formats->nformats)
>   			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>   
> -		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
> -		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
> +		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
> +		fmt->height = clamp_t(u32, fmt->height, 1, 16383);

Feels like we should have a define instead of hard coded values repeated 
constantly.

---
bod

