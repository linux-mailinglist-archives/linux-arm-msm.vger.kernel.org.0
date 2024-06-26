Return-Path: <linux-arm-msm+bounces-24221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819C9178CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168641F23CFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292BD14D29D;
	Wed, 26 Jun 2024 06:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezL9/2kB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B913A869
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719382764; cv=none; b=p2KCvpv996mWYTqswXtBEqlgSTFwwFLTVq5/B9OChXQ3oeCdk83YryM7FQcA63Gdws/BhFIMrlVn3YQI3aF4a4MnG2erO/LTHYht/tu56gtW31OsjNWGKXcEJTGwaKGtzV2bHdHWrP2b8J/4RM1dfZr9+lKP54yzIi/flE4F5AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719382764; c=relaxed/simple;
	bh=Y5tvUfeqevdUMslOnrPXG/cMoLwyEDj1VgETNAkMWzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPhojZp5spi3NqnO78U47iS3XK57t7GBXsUigb8sOEdXII1oNmXjMQ/aLTZtd1q9zPnjKk4ukkPjSonBP28Q/s0dgdd6h09epaV3cFKqvK8RRKL22c+znft+QBTHPpGV1oBv/YvQtB365BEr4DqgV0ODEENIb9h7x+PACwOXlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezL9/2kB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4247f36f689so43926575e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719382761; x=1719987561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bhtVPHB5KkOkziFfcpRhPwNgTeadqpsKJJFAP/JzOSU=;
        b=ezL9/2kB/etJgHWqXP6aFx4YpdyVEp2jNbBieKy2XHDh21jUCVVJS5yt4xRG3h5ddQ
         Co7W+1336u1K6pBPEUSL1vRzbDkFFsDaECdLo7k28A85tGQzJcilJWifJzxH1dHr11Kd
         gfpXZJ9h/RpCDVC4zGpI+pldRK1YW/qaF3RLLSKr+ShqbKSgkW/mCO0LMUm0Ji76Muol
         eJStOKI7MI4mFCw1PEO3nMY7KtyU/fhGgZlXKRuGbiWYr1sHOF1aptZ52wsu6iG/XkCl
         W2ZraGoizCpYNznQkTkvX8DSxYGOI8YhuRlytx6j1w/0+HSb7sezZxwzvpujksxUvWIx
         tYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719382761; x=1719987561;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhtVPHB5KkOkziFfcpRhPwNgTeadqpsKJJFAP/JzOSU=;
        b=sM3+Ktd6FlhWKYCHq9cTC6/SRm/DFxEwJh+Fcm8UYBat2OCntn6YTAOeJ0vsl9aSId
         bRa49PXWPOPE45vhLuRepsSsr0y9Fr3Erx3Fu1Be2qOg+m1Vjf434tBQU7F79dgvXola
         bd71A9grTsksiMVFT/oUxftzLZQ6hZ9B8s8bdPc9q0fejZaVUYtaJoO7zRd0gZk7OUJV
         BralVkVjGX9UjClbP0N3EADbbPuevKTKxirR8ER0m+IEZDZrkTkf4Qe2ye6oBa/iKCl0
         +AItBMSa4H/XYWCWdpshPXVV4gHfuD5TL/7Xzt+fpEqDAVoxKibG64ON1schPdrGMyLa
         dcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7BkRgd+Q024CoI2blO5w4K6Fw0JvEf0YiynPItHVGr+alHqSbWy+8IP84WRdjhD/qQNJ0XM6bteTo7khwwgaPCZzCCjq1mSaXQ51w3w==
X-Gm-Message-State: AOJu0YxdnpppUqenisua/WVhVNoVovFatCCI44BYv7YFEZYaouaGLNEJ
	A+xfAAhJXUy0l1ge8hvkDKPXGrqBGcw6Dv6eE7wCgvwpqQTOdZ/FihYmdafrIB8=
X-Google-Smtp-Source: AGHT+IENxJhpbbFu9/yGToRh8VrmBbGgunkoZ6vdeC/70X3+61qzrvsV/Z0/P5Y9FKf9jUkuR/tLIw==
X-Received: by 2002:a05:600c:6a94:b0:418:fe93:22d0 with SMTP id 5b1f17b1804b1-4248b95dd64mr81487375e9.11.1719382760802;
        Tue, 25 Jun 2024 23:19:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c827507bsm12462075e9.22.2024.06.25.23.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 23:19:20 -0700 (PDT)
Message-ID: <e5a2dc2f-1028-416e-b6bc-dd47e00f996c@linaro.org>
Date: Wed, 26 Jun 2024 08:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm/gmu: fix the schema being not
 applied
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
 <20240625225127.GA361957-robh@kernel.org>
 <vuzzs5xd2zacpamln7apyhnxebg3xadkagzheg5cz2fnuj2ggc@lancgcviktpy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <vuzzs5xd2zacpamln7apyhnxebg3xadkagzheg5cz2fnuj2ggc@lancgcviktpy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 06:31, Dmitry Baryshkov wrote:
> On Tue, Jun 25, 2024 at 04:51:27PM GMT, Rob Herring wrote:
>> On Sun, Jun 23, 2024 at 02:59:30PM +0200, Krzysztof Kozlowski wrote:
>>> dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for
>>
>> That should be just since db9c05a08709 ("validator: Rework selecting 
>> schemas for validation") AKA the 6x speed up in v2024.04.
>>
>>> given binding validation if the schema contains compatible list with
>>> pattern and a const fallback.  This leads to binding being a no-op - not
>>> being applied at all.  Issue should be fixed in the dtschema but for now
>>> add a work-around do the binding can be used against DTS validation.
>>
>> The issue is we only look at the first compatible. I'm testing out a fix 
>> and will apply it tomorrow assuming no issues. With that, I don't think 
>> we should apply this patch.
> 
> I think we ended up picking up the next iteration of the patch, but we
> can probably land a revert later.

gpu patch was applied. This is gmu, so can be just ignored/skipped.
Anyway the code here should not have negative effect, so we can revert
it anytime later, e.g. when users upgrade to fixed dtschema.

Best regards,
Krzysztof


