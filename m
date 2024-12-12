Return-Path: <linux-arm-msm+bounces-41627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5459EDCEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 112B5166A73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E1E2B9A2;
	Thu, 12 Dec 2024 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uc9uDMOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE71CAB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 01:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733965623; cv=none; b=U6pCdNSpGIIcoZs7KSTovQF7rtQWIG7TYHBX11qOYZD3XVLV5Gh60DuBCVPw9b/vM2gVMNaG3M+47+zMXiRJqi0oyjan2TDSLintXsfXtB8UqS2pszvoweSJPpFCvyYyjSnw71Qwt3dDhT95Ak9vkm90qL/YGzccKUtpA9KtxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733965623; c=relaxed/simple;
	bh=gJ1t7jFV9t3JAZ44S7dAGAuFRDkQYiEA9nywpShlryo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3ZMyc09Gf16Fvha7jer6Z3KH7lGUrupJf/ZnMBr6366EP4EwgTwB45aL8avl0jkEbpo38nM5L88JLkKhfqy5kNGqU5AhIAqg61OADSVT6DNop1tuW3s+CvV3HPHR9dw6pAeK8zsTm+PTU9Xa6Q4hbYXcg6SeoKciwD5geDw8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uc9uDMOI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de3ba3d39so13980e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733965619; x=1734570419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+woOY8TwWcN5XSeyhfjDCS7hZ8p+Y2VZWaYuLrMvp8=;
        b=Uc9uDMOIf0vUP6Sc85rbtXLFe7SF4L8WzXyRw/Iu6d+pXwtE53Rz0U0wT/JnlWupVe
         Klrz7h16ibZsLx3E2u8wEMAszOfBiT96jWzU/Jfsi4rS37SsG12qh+ghFsiLCTXqLlx6
         83hzhGzBGvtAe9M9+BOGjg8peGvedyd+7GpRWo00GIf86WvV78M29Z2DLGaY6nD7zLFQ
         V+ehlEHRVOBTZ8ZpxmqWpsVpmmUSmbnpzgVG6PYSQGp2Y39ac30xPFpJgxF9RZf8CQX5
         JYVsr9ssh46tlYnXZi/NwaedwE3zQ7KzqpQbbAR1U79kUYARG4CrbOU5vwORbtTcnsbG
         41Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733965619; x=1734570419;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i+woOY8TwWcN5XSeyhfjDCS7hZ8p+Y2VZWaYuLrMvp8=;
        b=OrRYAu0rtutRmBo4RGlcDl2dS2Uj9es+MoPqn8hPEvVlUZ0Ruodu70dyFUm+aa6rn7
         vLziw55AJGEvZno20BP9XUrFt0VCeFBQFi18tHCFn77IM5anoyEFNbM04zS6nxJm12ao
         8clLXy5tIIbbSjwSDsVmX35ZrGdfyUAseuFZB4s+HNjs1vDnlQVKbLzjZ3PT7GpPZwOd
         6K+SvqtLnnh5NTtS69T521DaV+5lrgFGTDwjm2zDhFJ0z5STCt2rASlT1fGHdA45Lww3
         XYLh2bI2W0dvq/pUPxjGPzt/wlpd8OLlKbyBEK6hnAog/gLCssyiS7Kcc0xv5SO4G7G8
         LohA==
X-Forwarded-Encrypted: i=1; AJvYcCWpe4Dx+ZiAZSBDShDf6yI0jHGi2wB6qV4uGEB3arrdgxwaZVxqap9lLmU939saeQyYiqdnnrfPtbVGh77+@vger.kernel.org
X-Gm-Message-State: AOJu0YzZAV7bLL27uWpYiQmjj/jFu9mUnNRteHEx0v84UWSKeQaFBLYx
	jNR97R3MiK5v5KNd4ONxCXQZAnmmz5YRRxPBmCOjY14+tAhPXJVrqcpfEV9RzDN6SNDm3ef9us8
	Q
X-Gm-Gg: ASbGnct42GsOgC1p8AsPURPlfJN2dfwPw+Fw6b86kcTYQz+MV6OuImaR/ZOLF7g5QG1
	8VptM9+yF1DTh9OvAEelgHwJ2gxvND+L8R/NW06Ruf+ynOGwxS2tk856NT5a9lUksaYdwnvbycm
	GsblUkAGMl4llKTSTFDlLvMJv/th8SNZOfe1hQG13GS5KvHkqar3RTyOwFOifuVVMpO6txeMsVs
	C0mvvWgS3PsAMZUKVkNbkovOBrG3y8p8Vk8LM3PqerQkB8u66vX2e8M9zGJU4C3RqHnYVB6E4Xu
	tWebYWJ9dCM3W3BtJ7ghDC2D29EPlWRD
X-Google-Smtp-Source: AGHT+IGYDFFDuvEn3S5kjDIQpMD7AfzDjFeKfQ1ro/dx9kV4l9MhXuvGNQD+2H1a8bnVqwoSvbDeaw==
X-Received: by 2002:a05:6512:2207:b0:540:2f74:e826 with SMTP id 2adb3069b0e04-5402f74eb92mr149898e87.5.1733965618907;
        Wed, 11 Dec 2024 17:06:58 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2297441esm2191877e87.61.2024.12.11.17.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:06:57 -0800 (PST)
Message-ID: <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
Date: Thu, 12 Dec 2024 03:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: vfe: Move common code into vfe
 core
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-9-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211140738.3835588-9-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 12/11/24 16:07, Depeng Shao wrote:
> Some v4l2 buffer related logic functions can be moved to vfe core as
> common code, then the vfe driver of different hw version can reuse them,
> this also can avoid adding duplicate code for new version supporting.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-17x.c | 112 +------
>   .../media/platform/qcom/camss/camss-vfe-4-1.c |   9 -
>   .../media/platform/qcom/camss/camss-vfe-4-7.c |  11 -
>   .../media/platform/qcom/camss/camss-vfe-4-8.c |  11 -
>   .../media/platform/qcom/camss/camss-vfe-480.c | 301 +++---------------
>   drivers/media/platform/qcom/camss/camss-vfe.c | 276 +++++++++++++++-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  57 +++-
>   7 files changed, 376 insertions(+), 401 deletions(-)

I've spent some time on regression testing, and bisected that this particular
change breaks TPG on SM8250 (RB5 board and navigation mezzanine), but in
a different way than in v4 or v5, namely frames are not captured at all.

This change consists of multiple logically independent parts, it would be
good to see them split into separate changes and get the regression fixed.

This is a massive and a functional change, since it causes a regression,
it might be better to make the change non-functional.

--
Best wishes,
Vladimir

