Return-Path: <linux-arm-msm+bounces-19889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C195F8C68E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 16:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3610EB20D54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970FE155727;
	Wed, 15 May 2024 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kF8J7O1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC56E1553BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783892; cv=none; b=FVyy9kdIhlj3KF7kK731sE0CNu2kABPkx3feIRGXkXD6TwHvSPb/QUvtnUzKcs7G3RasemjObA1hEAI1Tcmrlf24gVznoPrzDOHm7EqdOaCxNS+6Xiqhecps/tyZex/JlGp030YZcqIfBHfEW0EgF1vysOBPGQ1ctI6beIsYtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783892; c=relaxed/simple;
	bh=D3bo3eFEXDx6Q6IPuHBXwh5wFQ3NwBgyHAbV2Am4IMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QS7MfN0RbdnALinEg75ppZfPcBl4vD2WZTNX6XVD+ks+K01OE//ABWsZu2fPixsLBwUys7Ej7PErqE2yHNwCwBurV5SFPaHNbAxVSjCYhiMRXbvyZpXMG1yllT2/CVN3yhR13KXVWKztkVo7DuFSPv6DPu1IHBkIt99YAgmNMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kF8J7O1X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41fd5dc03easo42962285e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715783888; x=1716388688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hlSLdUf8tcBX0sk8Ej3vLqr58sX8vF3AEeJfibRPI8E=;
        b=kF8J7O1XuHpIyT5BipnJmjhnyn3oxEAxfwIPIMQYqailirHFQIvP2kOpKprn4Emled
         UST9+9wxIKr/25TjsoZBGgFq/4a1NgbEjYE+vHE2ry024vjA401hRKFPC/9JuWqXvE6U
         oFahJbtMcF8kPC7KPD/JOAsg8fYu1SP79+/b6m9RvSjnKf4rueaTewpbvqEuMMm8iMdu
         1WnEO1e3AmSdoCr8Os61vYKcfKAFlQH35wzoY360Zlj+hPbX8Jo5is3rkhU5y/jmI9eX
         klKgeGoQRmpdTie5kK+Ai7HR3qbEhp91H+5QF6l4txlpMa01JKlIMOVYoNp6mZE0ZVvP
         1SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783888; x=1716388688;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlSLdUf8tcBX0sk8Ej3vLqr58sX8vF3AEeJfibRPI8E=;
        b=LRZgIaTNyXgu0IsYoSPRk225cPRqG3ySbCGDDn1FP05qFC033L0hZZocQpsQSJKN3o
         u8UitU97x1TG+mrAtGIo00AA7JkJZUK94wfflhtcZF43f5jSh6X2qP/iuJ6qgG22OCrK
         R2GgPhO1XwMlTRFycMDJniTJOc2atTgYGCA4Hl/jIAJGHm6s4I1c8oMUUsAOvB5DLvHP
         W24G5C6QeAvKz+ZWzm32u986IglUxVrjNq6iXtUf1RwX9nNVXO1MZDCMlvnJM8FJ5l53
         YXGqPbWlW6QYzIgAFO/jFsBcj5CVGv8w2x4IM3vm94oMgzyH15aJ8jpZotqAB5NALuqs
         C6eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqhIHFiWoV0Op7oZ+nY4wE/+ZhQHt3qLCoTAAKIgNUdIhmgNV5eSNuzD4vXyoZQ9bjb3BJl3aVSEmankzMtzm1yEyB8pKK8/Je1LsFSw==
X-Gm-Message-State: AOJu0Yxf64tegaTQxsOCJ26PoXdNKZKPg0Z0y+fE2vxrPfinbjlbNavv
	pxTenVUSlxDazZfbYzNjdT9mI5x0bGpzw728AXgaLjb5LMYXEJCIP8wVzX4q98Y=
X-Google-Smtp-Source: AGHT+IEDm0H4Jwy6ovrGE6DnzO1nWBLSDMPIyXWFt6YU7Wo5NZFqW1+ZGYPt4U5H8enm8zIrf0QwHg==
X-Received: by 2002:a05:600c:1914:b0:420:112e:6c1 with SMTP id 5b1f17b1804b1-420112e06d1mr88062785e9.13.1715783888234;
        Wed, 15 May 2024 07:38:08 -0700 (PDT)
Received: from [10.91.0.75] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41ff063d8cesm202347645e9.46.2024.05.15.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 07:38:07 -0700 (PDT)
Message-ID: <131345e4-7920-428c-85c8-0fc4f56ca84e@linaro.org>
Date: Wed, 15 May 2024 16:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/3] dt-bindings: vendor-prefixes: Add Schneider
 Electric
To: Sumit Garg <sumit.garg@linaro.org>, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, stephan@gerhold.net, caleb.connolly@linaro.org,
 neil.armstrong@linaro.org, dmitry.baryshkov@linaro.org,
 laetitia.mariottini@se.com, pascal.eberhard@se.com, abdou.saker@se.com,
 jimmy.lalande@se.com, benjamin.missey@non.se.com,
 daniel.thompson@linaro.org, linux-kernel@vger.kernel.org
References: <20240515105446.3944629-1-sumit.garg@linaro.org>
 <20240515105446.3944629-2-sumit.garg@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240515105446.3944629-2-sumit.garg@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/05/2024 12:54, Sumit Garg wrote:
> Add vendor prefix for Schneider Electric (https://www.se.com/).
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---

Please do not resend regular patches during merge window. Nothing can
happen now, no one will pick it up, so probably you will need another
resend later. This just creates really unnecessary traffic on the
mailing lists.

Best regards,
Krzysztof


