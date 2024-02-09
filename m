Return-Path: <linux-arm-msm+bounces-10312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CA84F0E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 08:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7FD41C223A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 07:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975D7657CD;
	Fri,  9 Feb 2024 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vt1bnbxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3F657B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707464284; cv=none; b=CgvwKOX9+tjTzJ87zIlve9PqhsoiSKdRDE1mdulpo+m1wUh4aykmefrp3emrUoBBAdiE8yJcnv7S3q4ybBAI1cyW/MCYo1Fh215XCqfBG4l18TPFDx94AU/9qQiHpuectAKPzj8nPWelAcGjETE9PTnL5En1u8cltQGtbDPCS24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707464284; c=relaxed/simple;
	bh=AbzGlTRbnN2Yj9iijQwgm3747t1INp9W1GBbAouKSLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WObJ6E72GRKY1vCKOsUVXzqGAJEBE9BsrbCbaPseJY04aOXyKvWXPePO7gRzg5uft4aH9Iu/Xu6Gc7SvBrLhgzFKKcYjBv6REr3U8RfKDJO9nBVeI7s/ewMGsgA0rycU9jNHYzNVscp/upj8MJqV4dA2FPgcpKPOzb9SCLKhj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vt1bnbxy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso5224695e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 23:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707464281; x=1708069081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGj8lniF7y1kB7M+jeT1hWXXuSmgx61DIvb+nsqPmKU=;
        b=vt1bnbxyViGo647ffgj2vXnRUFfcGuht5aJIqyOoIqBhugN0dhTX6RIRsFHwHOzy2h
         ugP0RvpMs1qZyBBdpSGz+eK6pbq5xvzBvd4TEAAVK16wi5nq/86uehqBvJkbUwroTLcT
         Rv8BP4dbKU8QCFEyHTplbv/EHeXUHXh+iVcFFAJVBdY5s4T2efylcsWLPAz9oVOwt/aC
         qVSVwxbgQzQqvgMYPjrbdBciPj4hZ+rGkGvgtdIGzH6jC3++ayfuqi7VoxxbrU9NTc4o
         7NvQ0Ri70yN4SQ5+FmrVPjiK36utZh1TIzTtuQenSmgf4K9y8aF9PbYvb9B3RFa/dYKk
         nBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707464281; x=1708069081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGj8lniF7y1kB7M+jeT1hWXXuSmgx61DIvb+nsqPmKU=;
        b=PbFIAV5U7NqtXdxVs9cjqTWcaC7nGSpDDv/gcHaRaOVd/HHGrcAV74nNG9Pgwlzy/D
         uP45OFqxEwPsuQ+2jibB4HN54c32LBZENvXRJhEKUhn4KNldA18CDoYAxkMWCeo0FAoL
         ArAz39Lxp2AFJzf7uAHH1ER4wbBRLZ0Aj5WCk1zl7u/ADt4gfRwZTkE3vJbaGvKQtOZn
         dF/Fft5YfDsAUP5pXO49hFj8h3AI6JdjDJwpBZF24KQ0+85TzvAfP+meR5MN5m5STqHR
         NSDl+cxWgE+3TLjrQvoTdw/fSNRKWQsUuq7c2h/xDQW0Ti43vkHAu3sYe9T02asc33HJ
         RmMg==
X-Forwarded-Encrypted: i=1; AJvYcCUDTmzzyXcZ57PnoWE4FwP4eGa/T5Sg2eZFXo97UJPOPJ0Ll5wFxmkT3bXBZjlOxVs5c1YoKWDRLOFnz6Jj+aPrFD4AZxzHcRoF+Z7Fqw==
X-Gm-Message-State: AOJu0YzDEIEkYH3dam6Qo2ANfdhkQxOCxxlwUgQhdjYyzcxc0+qFA7m4
	eGOHAvZ3dO24Dq6uM7fHgFpSs+ErMzEVhQdEiY7vD4Ne3XDmt2CwUkBsLN24A4Y=
X-Google-Smtp-Source: AGHT+IGQP3xvMYZS0UtEKaCQT/ZtEFqKS+97HteKlVP638IrPWDJVIRaF6fx9AWzx8+Ww4lRFAQNCQ==
X-Received: by 2002:a05:600c:4f04:b0:40f:dc4e:69e8 with SMTP id l4-20020a05600c4f0400b0040fdc4e69e8mr586519wmq.27.1707464281087;
        Thu, 08 Feb 2024 23:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb8GClKLtNAplNPGLLDcr7QlxDexdrKvvFP9M/GkqwmNpCsqFB2egNk9+NE26Q/0jBOhuvE/mxLqyQCAjRqIbvRpprWpSeU0JsEfyhLzSJAwSiZrJ1GSEFg8ldRR64jOOKV7/hgNU0F2PmN76vgd0SSsYD/wTGGXTNBRs08y1A0Gh8s0DHTUvoBhZC5L0fMUfEVj+fCKiCrXaLkuv1X1tZKimukCYRAbYkQljPeqyxDneEiuPIzSQpytB4Rgr/pTaPl17vJ28QdYS/UFqvBW+yAT/rQXMUE5/2c2KbObjCJrkJk+vKxdplpuM1M/nI2gf89hMW79h8MMvNZk+FaZYqCKSAjrVEAAffMzWdybnDErrtaiVmDoLOzXANBLcjmwN6Wz37VXeVnsHFJk/BVrtu3Wtxe8q4c/vMxdcKlsMmD5NzM5q6PMRnGV0B7gm8nNiYf8b/pBg2nfF/+oHXEgmo/u/7O1GP5EmwhGvbZckbqNqvoYNXxTYzdi/1dq6Py4bxlcJgFjBVIPhowcQWSCwRQVhIQtIBPl5cAsiJFlrsUbSF4RwyNn5cPGWFo2GpG3qyrqgQd7RFGf1yLWKEtcvh7SS2/wbcmyTO2j13nNHc6ERxO7CY
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id bg10-20020a05600c3c8a00b0041061f094a2sm1432961wmb.11.2024.02.08.23.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:38:00 -0800 (PST)
Message-ID: <0e94dbbe-698d-43e2-8b27-1e0a2017f9ba@linaro.org>
Date: Fri, 9 Feb 2024 08:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: panel-simple-dsi: add s6e3fa7
 ams559nk06 compat
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240209001639.387374-6-mailingradian@gmail.com>
 <20240209001639.387374-7-mailingradian@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240209001639.387374-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2024 01:16, Richard Acayan wrote:
> The Samsung S6E3FA7 display controller and AMS559NK06 panel are used for
> the display in Pixel 3a devices. Add the compatible for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


