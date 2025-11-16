Return-Path: <linux-arm-msm+bounces-81977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC02C6165E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 14:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB1124EC1FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802D730BB8C;
	Sun, 16 Nov 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyybtAKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38730AD13
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301341; cv=none; b=F0VWyXKAnGLxjynyPGaNq5v1LdnWEfBuozSHa3Gem6q/ecv585e0tzaGiTN/+LmdhAVFEk67oCA0jHdChbQmGUJn06JjIliWP8M1tYkNTQco4TIayn2m88BgJUlW0ESE7YFLMs2pFx1256AuYiMWzXn5ttsWb+uOwMzo7Z7FhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301341; c=relaxed/simple;
	bh=FMGplgNJzN/pBx0afIYEUB+527NtkSI5GGeIgMmBILg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqVFNPWgwIXDB/lnY1k8CmFiMQEXjoVy+XbIzmCeLSUdyDe+iAz+T6SVA/Vc+yQaBzqJI5rXyJftLe8KoTJ/r5EbjyLEDpA6oI21DOj6cceN52dBE4ni3BmTBq/+w1Za7vWkBbKwS4nzqeIDUtKGHvQEGjIqaPhfqQIJWTJuVqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyybtAKY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775638d819so19524545e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301331; x=1763906131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqaGRJ1GY2x6l8dXoAfBLP7/ee6T2P1cW9IpZWUq/iA=;
        b=dyybtAKYugn55tSdk0ejJ5x/CPbkHH0TpHuUIMeesN2v01un2BHFcRRcpt/KfQCuu/
         xJL68JC5nQc8fkOIP5TQ3n38Vj5Md5usePN5bSF4yc+FNJxwxXakH59yQW9B40EMQweq
         KwwOK7r8Z4bNn8BbWUEpw1YvcDvH2SdSp/tLvjWclv5ZUjGDRW5mGIDakS57YT72hPTC
         lzqODhASxpVxaAF/Z58A0hVZGBoSwu4tvItt7vFxrQo2+p3S0wNqkX349MC82reXZQwJ
         AA4nLPYLj3r0JhyDj0BkyYrp2lTkh+i1DXyb+8018UTsJWzfu4DueV2WJD8A7nxk22Hr
         Dl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301331; x=1763906131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqaGRJ1GY2x6l8dXoAfBLP7/ee6T2P1cW9IpZWUq/iA=;
        b=pw0+GeAcx657+jNoOgkQG/bfCf7PpV4blDYWgIPqAp0xG1Gr7uKCOrcTO6aPBn6oSR
         8g83DC+MFmubFsXkdta0IxQhTpC7L+nUPI+ljecTxGo0nuQRTQ2EZykQ44B51PtqWr1u
         Rqy9E5O4qtAK1rQLH07HNUAjLLMXARkkwEbgtIL3PHz2lhzGxbmTbpKbfyTfjPdC5u0b
         zKRkaQqpojhULnqBTo+7PMteoG5G7MbvBb4IE6WmsdiiDhVX9KE8iXGe/OTj1Hihfv/K
         lS9F6MmnRQ4SX4a5Y+7YTdURG4w3lg8nIPv+ODub6CnpHiphmj9o4PBNW9OTxoqznq7P
         KCqw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9dhJWkYy7y1iuoJh7ZA/zt7Ut/vzRCxfcruVKEMBbfTIm8sWAf0UM7f+VvdWwClhGMpZmv5IbZBt0WAs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8sRC9VZOtbtYmTi5trgH2ufU024yWgUwfZVxla2mIiO5Z2Z6/
	vBpPr/wqCWPOxMlhx5taxG15bUCmJLVuuK01Wdpf4KGCWi8sUGYDEIdjbaRaOyferac=
X-Gm-Gg: ASbGnctZVTW8wirCw5uVDUbnZWq97ajeVvZhdJ1vlG2Xt6pO4411WqMYH7pLOMPN+SK
	1IsYgtC+uVQO7FfT8TlJL53gcOH0pPqbJbI7aDBON28Rg8YDdhWgDlRd41FEa/onfrCmEM+fHw+
	5MT6Z1fMU9/XMkJ2iMzW9seNpTAmBCGdZJNtQUFtmzwAInm9nqr9XX8/BYRKYMnbLP8p8WpSEHj
	LWtDckHPT/g4S7eJmBo62NgfRVt7IQffmPHn0BJ0Y2BJedHeZd7XaRuGPMJgtvw/21tG2zczrbl
	RyyIw+6p/VPfPkm4Z8C0juF8gELOisasRRPGleiQ4pUyFyG/InCGRGWfZD4LZ8IPHpiF8EiKOBZ
	93q2xy0owFbSwdhc5BKvemzHueAUUd6g+wtmAbppAdPEGK1AjOYRAW2A+jWte9jnesTBtoIeTl6
	4qZKIZLCF1g3XkACO0b3ltt4rm9pfFQXd73fW1MBTWf0ds
X-Google-Smtp-Source: AGHT+IEUk3DdqvvTuoPw2svj7P8n3jQB7qQ0jl0BLgq51a3AoZNXsza4PugKS3KBfdWLmwJrvek4kA==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr84649915e9.29.1763301331148;
        Sun, 16 Nov 2025 05:55:31 -0800 (PST)
Received: from [192.168.1.160] (p4fc3ddd7.dip0.t-ipconnect.de. [79.195.221.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm94835955e9.13.2025.11.16.05.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 05:55:30 -0800 (PST)
Message-ID: <9ef0e4f9-7594-4c26-ab45-38e62a7d0e37@linaro.org>
Date: Sun, 16 Nov 2025 14:55:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC
 into standalone yaml
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

I may not have added myself to MAINTAINERS when I submitted this driver, 
but a heads-up would have been appreciated before just taking it over!

On 11/13/25 18:57, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>

[...]> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e015dcbac732..a4b16812d5a0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8117,6 +8117,12 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
>   F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>   
> +DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> +M:	David Heidelberg <david@ixit.cz>

M:	Casey Connolly <casey.connolly@linaro.org>

Please and thanks!
Casey (she/they)

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +
>   DRM DRIVER FOR SHARP MEMORY LCD
>   M:	Alex Lanzano <lanzano.alex@gmail.com>
>   S:	Maintained
> 


