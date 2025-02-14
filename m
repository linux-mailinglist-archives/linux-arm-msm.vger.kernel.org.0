Return-Path: <linux-arm-msm+bounces-48014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC5A35BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31DDE3AE940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7C122F388;
	Fri, 14 Feb 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NldGM2FG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF59245002
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 10:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530340; cv=none; b=gXQDv2K1Q+Z9HHZNjdw+KLt00k+ew8S+fATLVzf14A6qXLatlj1jDP7xc97AmKEPNSE1iVdeXHFLfDxGJ+LACXAO8JOjUF3RQPDp1dzUaWVglLWFTLZY+malg61avYrGgSiO+ZiAKbfzgSSIzco8CphTWFe6qfTfraggT7c8TLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530340; c=relaxed/simple;
	bh=J5HA6Fc3Lo2RruuRfHsCnq0thUBjGr5Kx3+i7xfa+Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu4iHJ/y/p9RqbLRG9K5QaAmMbkKc+oe2hz4UYFt684KEXUL2a7v/G4wv/HMog5lski8isKq74zEqlYJzHnsARe6z4Pqm0JdqVXBMGh5NH+TmNBpx/0ReKOU5RUAoZ832nt+gBi42/f1FmxGk9VbK6vUC1XxKFZDWYFdFp0yUFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NldGM2FG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4396590c614so1665565e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 02:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739530337; x=1740135137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D1E3shrmqji3p4SiOZzcDMZ6w2eLRKPdrleu9Kc2MMQ=;
        b=NldGM2FGbqNKqY0gnPhoPwKPPuNvOCj77QMwxu0qjssUeOgqmwRSMPQ9N8axQx2QhC
         6qFxBifhVPyFK40xBRZ/UJTc9JkwPqeqNAhcfQ9Mb3yDYbLTMzzLfn8Us28+GffpSWfe
         YHdzg2phnW2kCoU6l3JNDPIs5rSCuVVCdAnO1NekBuYKY97CGRMPXIZECa1Wrjhhh8XI
         DqwAuLc6UYquNEcqTeOVSZvn2BXhbaxgyGOois16jcyzbta6cdNWG/hEF7MAtLtvYsvw
         OcgZjnLDA7t1pqA6PLRR85SCPsrG1JYKTp571DwrNaXp1dZURWGjvVmEWKOBlAXkP/jt
         GD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530337; x=1740135137;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1E3shrmqji3p4SiOZzcDMZ6w2eLRKPdrleu9Kc2MMQ=;
        b=mF5xQwWQuFmaMcyHIH1p7FnVHZUZJZ/ReRAIx8TFCh0zJQaVhun0bueVl5FzF/PD+m
         VNKrIpWkW/LHLum1zVYbbDLGarq/Fb9r28vQl+4wTuuHo3rmr5kvuQBll1y+i6UkGAgT
         dP1PujVofrHVoGv6rkB84p29dPy1cBYXASNrwZGXtmE+pY/K9c24VSMiw7ukoAQ1owju
         m9yJNqbx1E1475zTYqw/wh2Wd17su6mP6vE13vUKNXz5Sn7KxJyEtTA9/fQGdnL1brc2
         EBbMY6c+r8Yq5Fa4PjaW0KvCvrirWtf4c+2NeAsBhQ3L7wdkrlSj5rcm7zTohTYd0hah
         A7qg==
X-Gm-Message-State: AOJu0YwGtKUTg5QNFacsP+ut7UM7nxy1DM+c9oessGI2+Sz5w2Vs9NP8
	nsG02q0cg5ylLPXzXRWRgaI08PGaFwYbW7Hm/cLJq66AVZBlKPDRpuTui3m7TSU=
X-Gm-Gg: ASbGncth0ddLYTMkJ9epIdqVd8a4ZmSl8n5LTrs8cfOjTuMeYrQcWj774sKhv5crgM8
	wh+llwStz+wjblWdhEjHCv+SJkbT+Pu266c1p5XSmmc5VhOYQepwcHcFvF7d5Jji+a/enayojlC
	rlLEXsdXZ8Uainmdu0gXhghjrGXLGV1qLhHBQnGNAzbQbWC/i3tRSTlNt27YXWON/C34O8vg1Dp
	NplGHMU++BLHcSoTp6K0f1DOYLqcU7YloScYVA3sVGweqCqiYSdwBRHtuuabiqvHVRUudR4mpYd
	48gsQcWazIUccpXsNIaEX16g8mu5jnK6xqY=
X-Google-Smtp-Source: AGHT+IElbdA1TctbgcOQxOJNbBvE2aiJ5mWn0ZJu/ogZAqW3AeynhVle2H+4Tay7CqBnSPs/pB2euA==
X-Received: by 2002:a05:6000:4012:b0:38d:e33d:d0e2 with SMTP id ffacd0b85a97d-38f2c7657d0mr1047399f8f.5.1739530337167;
        Fri, 14 Feb 2025 02:52:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fa38sm4359920f8f.98.2025.02.14.02.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:52:16 -0800 (PST)
Message-ID: <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
Date: Fri, 14 Feb 2025 11:52:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> Few minor improvements/cleanups why browsing the code.
> 
> Best regards,
> Krzysztof
> 

5 weeks on the list. Any more comments from DRM side? Can it be merged?

Best regards,
Krzysztof

