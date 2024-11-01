Return-Path: <linux-arm-msm+bounces-36781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D759B962E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63483B21D0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1FD1AA781;
	Fri,  1 Nov 2024 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV56xTkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D814A09E
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480579; cv=none; b=L3Z7NvOEQxtm32MLn2d07RhYJItnPAilKHAkUoBLwFt/J4GPQiWwYPX42nfQVT+UEDIZTVdvVnkzmR1GiN515qEljgl31OEDr9LGgNQwZVbKO2MfnSUQcZvPXh1UvKjwHLbrkQtX9JEWYvJmk0c4v2NlMt95keQoyfYzZxUkfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480579; c=relaxed/simple;
	bh=jz/1sTo7r/DlzfzZhPtdYBeVNJACI+uKBkG4JwZETCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYFeJJGAv/tCD72XpPblHpNmEkh1r5rE59393tcnwsQCHDOW0j6l4iR2uzVfPLsUnZpSFoPdrTrYFR4eguVvbouRbM7vubJi6UVMC1QEKaWOdbq6kzOsyTPlpJ0dDbDFHbDi9S7+F/n88lBWIeEY6phonQNTRKBtNAwFpyTcFnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV56xTkb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f84907caso2394227e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 10:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730480576; x=1731085376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYkXO/XDL3TpZ2crY0BjdWNlXjaLpkJj5MbF5rbI9xA=;
        b=hV56xTkb4S2JlTnDXaLwFYD4cc05YjNJLt9PCOrchpuj4LRzSGKFHrr2Qx/RDqk2ST
         nscWXa1lOi3/C8lpNMDluOxj0gvwehsq7KubRcXNHqz6Qb7XkUm5pkz6WFMWeU8jDxTQ
         /gYhAWaTkJ0Qr/pk/hJcNcIC8drkpxtbKRzYPSblbK8p5h+VlS/RX/rAStIkeItbxRfC
         /YsEIhL4ZUBWsjAK3eC2Aoo07oyUGPEKWvudBKmcrmLa2r/m2e42E1CPK/k93FruyEAZ
         ryO77FP8+/iY9WKo66Fll01XKNYcClHu+7yyASyBCZV5bNEgaCZXhPzxgL9BBf9q1/un
         zUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480576; x=1731085376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYkXO/XDL3TpZ2crY0BjdWNlXjaLpkJj5MbF5rbI9xA=;
        b=ZLMCDGSwCUkp7ad3EaBK5dP4jTfIBSSbEMyWD5a+ergqecnz6uepy7Vr1dfea2MGit
         U9saJzIexkWhEiOY/7DLLAUaUnlC7NG4qbh5H1fzMg/u0ZdbYJEw/e5eh4PjMg0wo77K
         DhhYbWzzppxiZNKc/W/bNc/+sxgk1fSDvkRPqYPL0jj6euwyfkl+1iZ46faSFcdBKLEP
         nl4Oyw155Blb1CHV90cwNvo+SdoMfEoUVs22pJxDoUDQeEn5Msh9j3z6i8Gr6C8XEu3Y
         nASKG+d8ObA5Z0DaAM2+A55Yy5w0QBfeZOyYW1Iz9j2LeqTXq5w9CVDbc8VfTPRslw7z
         1Gmg==
X-Forwarded-Encrypted: i=1; AJvYcCUsBLkIoaaxBYcQ9sHIEHgtagGqIzqcsIKp/Cx44wPc1tP92tTi2Xbdtq9XdfPDMbHH8VRb44FCzlqlL+Ss@vger.kernel.org
X-Gm-Message-State: AOJu0YxMaDeEt1XA8OTHDDZsI6XP6h8ZJ25YWDDgMJiie233ez+7WWPB
	1CuRmF9JTVFNbYAoiJ+6gkXlZVrdsw9QYotES4O7ZZUPHbs57AY0ROgOF2dTgGw=
X-Google-Smtp-Source: AGHT+IE/Ua9zx43zJk4xmbucX85KVyWCVHqEWxwm+i9JWaukQssqyuDIKYu6mu5VP4JJgT1l9NVG3g==
X-Received: by 2002:a05:6512:1304:b0:53b:1f77:e95e with SMTP id 2adb3069b0e04-53b34c5f595mr11888025e87.44.1730480575428;
        Fri, 01 Nov 2024 10:02:55 -0700 (PDT)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852c3sm67882345e9.38.2024.11.01.10.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 10:02:55 -0700 (PDT)
Message-ID: <c4479e37-4f61-42b5-b8f0-813c8a2532c7@linaro.org>
Date: Fri, 1 Nov 2024 17:02:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: qcom: camss: Add MSM8953 resources
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
 <20241101-camss-msm8953-v1-3-4012559fcbc2@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241101-camss-msm8953-v1-3-4012559fcbc2@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/11/2024 13:47, Barnabás Czémán wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> This commit describes the hardware layout for the MSM8953/SDM450/SDM632
> for the following hardware blocks:
> 
> - 2 x VFE, 3 RDI per VFE
> - 3 x CSID
> - 3 x CSI PHY
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
resend @linaro

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

