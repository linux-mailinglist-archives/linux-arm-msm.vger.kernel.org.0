Return-Path: <linux-arm-msm+bounces-12006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF985D1DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 08:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19B51C249DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 07:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0633BB20;
	Wed, 21 Feb 2024 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQZxuh7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6F73B2BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708502132; cv=none; b=lZfDt6a2aADcRvJ/s3iOY+hBQpSt4EHMlhNmmJ1NVp4JUiQLvRkNjqqosxtee8ks5YtRAe+oLgDrD4R6jcSHSMYLIcjLNJV26hSX9HujaHziTcSqr0l8r3Jo26L6qqup1R2F95z1c+TU4NVb8WRmW4AyrFbFD6f23jQ7vfFCx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708502132; c=relaxed/simple;
	bh=5TsEUpn7l9kXZs8eqHcte+uejCFYBZDt8tvEWvA0gds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOnvcBWpJmNSd1fI7L9KGxvX2+KsP6jZaCm7izpqINnvAhnMknxJ3tiyLqeal7oXwx1pq98OPnWGbKJwrAazC7bf3M0dYVrlmogS4Oy0KCx8vX7XkOsVLd1pyIU3wEvMrb2fYVSd3SdOseRe8GkgbyS+Wal/f3dJ+/PV9/IM+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQZxuh7L; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so436071a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708502128; x=1709106928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeuXLgXuiJwfDx45aERme9WbYsuIUi7glOshXn+zDIo=;
        b=cQZxuh7L35HzEMEXDIlS2n0J0WolX/p27aAsP3urEr6Ac6NN81mbP72RmU7RGJafgI
         mPCL3Zb+7d7E499Nj5eh0ARGaMDNpXInjj0PPZKwtP/lqZA/501Bxk+4ogQXJ14grRHb
         EmR5BQ1TY8JvuE4h2zdJfgrSVXnEWHXmiejyC+n1zKrTWsV2KX1/h5s6vPhy5RdNLbwo
         eSZR3kDOyg4KxzxnTSUIDGsr+JvFvy9yhPbXjqe8e5l2ELDEeH/A7CEDeC7kw1umJvuN
         Qho4uV5SwRSIKC9egyAMh4TOfjVw7ccaUCCMa200DE9CzS0zQz3djJ0cu3+byPNWWpSn
         y23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708502128; x=1709106928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eeuXLgXuiJwfDx45aERme9WbYsuIUi7glOshXn+zDIo=;
        b=CBIn+6S3EdvpPgLzKmI344Ns9NokgfWxLwlKq2ih6tCpnLWk4IO+CgkZnbyP3kgopV
         LUEBqXPyNbt4ZvYPQNG4f7KKcsFgX3sEYBS+uCiGqw9O/w60jS04Ap1ZXXJeRM8Batbu
         GYGPqKoEN8TZP/nJlZZ7NQaY2Ncg+lPon0UEpPtO6yuxBnhLB28+f4S+Z36Y8TUpyVYM
         U9tr89oWMWvXuQuc0efJCd522nlvQRNWBalawN1mP6G7x74rfG3veNahfEAo3ppgTJIh
         6yQQ3GwhdycTe/a3zNw2AfG+rSx4MkKMYt2XX2jI1l/gcVCVDooXwXYurXX5DQHbGmDk
         N8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYfD5l9lhVR6hjMYkR5zdrbhLqDd2YaxTl0vZLXB//y85EXW3xl0i/qfow4ZuD4SmwL7X2Yi9pFOEIqOjIBaO1ZJvj64KbGoM7BqdE7w==
X-Gm-Message-State: AOJu0Yy2UB4eBiwj9JMbCARBpWlZp8fLRR+QkXq7kQMnBpP7Qpc9vByB
	RygyFScc14YCQ8xHiCp3rpaxDG/eKd6WIE8udOYnYJUZKVWyjjTZ5/R4CwWbTR8=
X-Google-Smtp-Source: AGHT+IFeH6piIUO8xZU7x01K7W1nHRNGmZ4FCrY57KfBJjFgcbK5bI9oItXwHP6GIuOuy5VWZ/XCvw==
X-Received: by 2002:aa7:d658:0:b0:564:652f:e767 with SMTP id v24-20020aa7d658000000b00564652fe767mr5826149edr.0.1708502127915;
        Tue, 20 Feb 2024 23:55:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id h18-20020aa7c952000000b00564ed2dc990sm559604edt.87.2024.02.20.23.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 23:55:27 -0800 (PST)
Message-ID: <6664c942-bc5d-40dd-9e2f-c0e297ba88c1@linaro.org>
Date: Wed, 21 Feb 2024 08:55:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: fix USB PHY configuration
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
 <c87d715a-d6fe-4ccd-adc5-d98d4837a120@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c87d715a-d6fe-4ccd-adc5-d98d4837a120@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 22:23, Konrad Dybcio wrote:
> On 20.02.2024 18:31, Dmitry Baryshkov wrote:
>> The patch adding Type-C support for sm6115 was misapplied. All the
>> orientation switch configuration ended up at the UFS PHY node instead of
>> the USB PHY node. Move the data bits to the correct place.
>>
>> Fixes: a06a2f12f9e2 ("arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> So that's why UFS stopped working and I couldn't for the life of
> me guess why..

We discussed such cases in the past, because it is not the first (it's
3rd or 4th within last 1 - 1.5 years). I believe Bjorn should reject
patches which do not apply cleanly and ask to resubmit.

Mis-applied patch might cause issues which are tricky to debug.

Best regards,
Krzysztof


