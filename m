Return-Path: <linux-arm-msm+bounces-59246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B566BAC2928
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2E44A75FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE805298CB1;
	Fri, 23 May 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="C8N9LT75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B80297A45
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023170; cv=none; b=bVwEAyJv5lD32nivayRlu89mTrfpuWR3JYcFR5a8l55anshq5NLfniMp6+8GXiwOp+fSeGpEMWOHgUUPGKMrS7RId8rPYF5AB8DxCCrCVhhsWya0k1Ks65uRTpMgf4fhZRoqBIivC1x+OBfq4smJ3CsaRL2A1zL4E+AstCtqORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023170; c=relaxed/simple;
	bh=xLtmQ0TWKB+NkLXhdkRYKl8da1Hyt1mfZQezqD35yEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbYumN2N+KewT0j3JPymqVMP3XS3VYQjb2nH7ogl6xU5GkP/AoLH2T0m+WCIdW/w6xZiidqjl/GHh2nrhgf3a5aPb0aUELF+TRTvecKPAIedBc2kzp8CvpU2rfwgbZLNjeYHn3YifDD7bzvPTB3ghLSy5O/C94pvB+IxDFv0YL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=C8N9LT75; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85e751cffbeso8198339f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1748023167; x=1748627967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGtEFmZ2rVp0Bhcu1O5oY42icjo5BCFEnZcJ+QVCi5k=;
        b=C8N9LT75+cLuq9p0NKlfwoqcK2L0qV4LlVGpw4e+WxnSPyUezwE8GlWCZgm9bqcXTM
         ckisH+OgjZMQcmh1GS3A3piIuoyHnt5QWCQNRQwnh/BPWTReT8wDzXK0rXaHqX5u8hhN
         2N3x/NvQKLYWfQxd/km41ADGnFffl8teWi0l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023167; x=1748627967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGtEFmZ2rVp0Bhcu1O5oY42icjo5BCFEnZcJ+QVCi5k=;
        b=xGDIuvmJAXqdJTA/Gfw4fUuJvCXTjqf5J9j8clJQF4WKv5mM3tWP8PM1sAyMAywS8+
         IRDwl1dnuBho/3YX3/zaZ+7QKmjfT8/sKZbjOGxXuS8+TjBy9bdBGGknmr2jzckVQIjW
         3i7w1l+7nWUv7fwagLeJoIGD6ntEMzs9ZsD0fMPsc1n7fIByCC3oOuq1avFD5FHNja4R
         hZGIlEFFBrzow1cApm/EgG/sGz1fiWBiubYqwUxCTBqcovLtBGWztxlbz82wBZo17Y+E
         Y8bZsgFU8/LKk+hYAe5BZX4rWxxKFRA9IRpYNL/FBCxU1HDFcxPu4k4LvbztHVxp7R0K
         5mbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgh0sMEUnFndDJIm+u0FEX69379xxETxBfU/VmYoVLNEPcD62LYkl8wEnxefplhPwiJZvn0YjymMrFqJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YztMK/bmr8KWCh3YBPosHR4ehDGv2JLjkI52HEpjCFFPv1dlvm5
	EOfWRDVwbbCEjhg8jdNcHwS9emHyl9XYBlmekT3XqEQzLeCmIOgmhTUzcnfMWwL72w==
X-Gm-Gg: ASbGnctLoDgVuQI9lgfCUWyzxX5gpyxjUrBdONL9vujm/eii4nCDuXA1SlkdUx4WCp/
	v8d1IOjhmQQvZlSA3EfA1DpQkL70xmrrFynO9mKx32WOxHfmGn0SpJO5EoBZti3vWrktpHnQIeR
	xzVeAG1FxzLeS4NmDH4Hb9SnLS9lqYEOBQQGXvVZVb0obhNdpp4iqZ2P9iVtShRt0ptoDYs0Vra
	ocJbKaLiU/VbDWB09t7BxslPADFdt5eDdgGcmbc+NV3LH0vNOGhra4Ojz3YREYORpMiEgxU4+5D
	4GgnkW5zrgOZQkc8RgF5ijj/f5TVNrvTWe3AqHOaIjETeAnwDFV/Lsgnp4DkBMT48OL5CvRPxst
	LtWYwg3lihNOWf309hipF
X-Google-Smtp-Source: AGHT+IEpb1IcvOHrK/fzMraPZSR5ZnUsdHuhgqtnR1Igx7QRkPEVOT3iAbQKQTTUDJaVKlOxTZqGag==
X-Received: by 2002:a05:6e02:3308:b0:3d8:2023:d057 with SMTP id e9e14a558f8ab-3dc9b6cc069mr1052295ab.11.1748023166709;
        Fri, 23 May 2025 10:59:26 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3dc7f126188sm18218695ab.65.2025.05.23.10.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:59:26 -0700 (PDT)
Message-ID: <7707b574-6fcf-487d-909a-d24874f9d686@ieee.org>
Date: Fri, 23 May 2025 12:59:24 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: sram: qcom,imem: Allow modem-tables
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 6:08 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The IP Accelerator hardware/firmware owns a sizeable region within the
> IMEM, ominously named 'modem-tables', presumably having to do with some
> internal IPA-modem specifics.
> 
> It's not actually accessed by the OS, although we have to IOMMU-map it
> with the IPA device, so that presumably the firmware can act upon it.
> 
> Allow it as a subnode of IMEM.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

So this will just show up as a subnode of an sram@... node,
the way "qcom,pil-reloc-info" does.  This is great.

Is it called "modem-tables" in internal documentation?  Or
did you choose this ominous name?

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..7c882819222dc04190db357ac6f9a3a35137cc9e 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -51,6 +51,9 @@ properties:
>       $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
>   
>   patternProperties:
> +  "^modem-tables@[0-9a-f]+$":
> +    description: Region reserved for the IP Accelerator
> +
>     "^pil-reloc@[0-9a-f]+$":
>       $ref: /schemas/remoteproc/qcom,pil-info.yaml#
>       description: Peripheral image loader relocation region
> 


