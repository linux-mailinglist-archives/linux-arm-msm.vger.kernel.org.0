Return-Path: <linux-arm-msm+bounces-48021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961DA35CBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 12:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E22E18802C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5440263C69;
	Fri, 14 Feb 2025 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQP2Ujme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B16263C67
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533175; cv=none; b=PpbU7Gx4rumcK1EYQ77nxwMoFJypWXNoPRTHIq45y5tdBCpi2FC9RISaWn03sBjW/aN/syrpEh1iF0XlmGGTppsYN5x7LYpVFK99wC44EeUNEjPj+3lMF13CIMS0vxnYicvqC87waEcaemTFKMIPjX8BNQP/frNUJb5FBgve0Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533175; c=relaxed/simple;
	bh=cMdC2u0sYCDpH+7JIa951sOELZ0qrwszLq6UjErMXTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAjfnEsbmZwgMlridhxGluYRlV8xGfhfV6xsdlhCd6ZieKltk7fTBpqpo0z8IOJo8zil7GWtodF5r2H3H9xCrcDKgFg2Olj5/BGquVV2MXuzzKZRKB18KnrJ/a/v5yFEHgexgQihTesYwYxbKi6jMDUYzzW5tUGBKolXwjmBAg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQP2Ujme; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4395b5c703aso2947385e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739533172; x=1740137972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QKPjWMWOypyOUk7EnTRWQCS2Ziv/LCwKjGqYZlUhh+U=;
        b=TQP2UjmegXdQ2V5hylHw9XTuFlOLWn7cfE3QRl5JH2s0bgtmRfOUnB3oswoFa9gJ5Q
         kEy/+vZf9Yp8klrVOewCek0r1OIGIdgul+2gm6JyKPsnkbis0UXGTOXNDpojQFmx3lyZ
         5VSghbKycDOukVwt5JsizymDoCDnEVqhdogeUA134evC3dRqSSOSPTeVrtV5kn3Bmy9+
         RRee5kfyvNqD+DE27pPCd6X3Tsq3vCwORbpkl3Wk0u1xt2cmvRciyF2lgF/ZVEKi3FVp
         A2bTK0KQXKDjEHzIO9iyzEpJDJPWjMbxrZiEp8aH2Uy7RXvC05mR5Uuvx5hPelb1G4uI
         8sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533172; x=1740137972;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKPjWMWOypyOUk7EnTRWQCS2Ziv/LCwKjGqYZlUhh+U=;
        b=tWJrpTCmEdm1oNh1KmykHSLrFiq55DckJsQ8FX16uWDXa/z9qI01PBOJbvmYuSfwnz
         ncIwzcfanB5HkN0KvLjDskLNfVmsnPIG85Api+qtdjhJkVeFIwAAMxOGBCRKx+RxGBLC
         GqSiWhyJRHIX18LUTfFoJmKss+JJ0OBlsEVVfj9HnM4NgsZucnPyXustZW9nvCml1YIv
         8vOV0xVd39GdOszr+EqB56G9pfgYzfBlRfu5FYc5WnvzzjPkA/XpST3DjGbCp7w0/Y3O
         Nv7ne+vGlss3NRON1mvPww0SeGPIz8w5ZE0dKyWv63GU+gUlMlFw2nUMgKlzks+Yepr+
         yTyg==
X-Forwarded-Encrypted: i=1; AJvYcCWHIMQ6Rvel0gXFn5MBI89VUELTbF/CujYDFsp9N7QvVjDDau8eKZKr+P6lghiAfIPadxRCyTyWlaeaKH3i@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7IvfQvZvEfRLBWrNu1iXP4wZLt5gkKEw/26BtCUmGAIYhLtW
	xFsOseuFZ69Sk2n5Qp1AbqoxG7sAKPubZTQf+fx3WqenDZfY7VzDQTsEhh/Mq/M=
X-Gm-Gg: ASbGncvoj7Ff7r1EbeMkE8/vQUlbR2tTKH/dqmNKiS3ELfX2o9VRMlQWcP7qjfYoWCl
	5BNMlP1Za0ojtQVokDtzMtPPCCsZpT6KUocqJ4gxqgaYJUOYsJoE/khNtOe54yVPzFqTpRsWLC6
	6QJO3gKJvXME7oMmG0IKPGy6AOP4h+RD0JnSNZ7tJWofwPUF0E53kSNbHi8gBSfKLAFl3B16c+c
	LOBW1zDXdSb5FM/Nk00rDpoG1iTSqod3JQq7YK3q5Tn7JIyLdhg5Stw1Lwe0wYuMsDrtrTKS0M5
	3vYyCkctvS8yGLfAYJzoPbwi92I25BZmF4o=
X-Google-Smtp-Source: AGHT+IGEmXDUEMfbZCKGcEHBw6n4npRZYFXR54+yFK5o7XH3akuhLP6A28R5QUPFgaGjYpdOnpjD7g==
X-Received: by 2002:a05:600c:3ba7:b0:439:4756:ad31 with SMTP id 5b1f17b1804b1-4396711c797mr13207145e9.8.1739533172390;
        Fri, 14 Feb 2025 03:39:32 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06da56sm73529435e9.23.2025.02.14.03.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:39:31 -0800 (PST)
Message-ID: <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>
Date: Fri, 14 Feb 2025 12:39:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
 <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2025 12:30, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
>> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
>>> Few minor improvements/cleanups why browsing the code.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> 5 weeks on the list. Any more comments from DRM side? Can it be merged?
> 
> Are you going to repost for the patch #2 commit message update?

I did not plan, but I can send v2 with that update.

Best regards,
Krzysztof

