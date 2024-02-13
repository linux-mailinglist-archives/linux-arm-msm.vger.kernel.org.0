Return-Path: <linux-arm-msm+bounces-10863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78B852EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652A7281F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D019433CFC;
	Tue, 13 Feb 2024 11:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWNToN2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5EB36AEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823050; cv=none; b=p0RM23DeeK93DsMTM/JFjmWkXNAweuRDDKIajKqFZYemkx2Vy/USfk0wYI7Yzc1lP9rB5T+yUCpg+xjyiu7i/MhV6t+c6GXuwhuu2SwadiakxO/WbHVNaHS/rPtlCQPbLES2sej65TIwbPdP89d8N+6xUIRVqIv00LFgJ4OV1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823050; c=relaxed/simple;
	bh=sOp0L9276RQk5N7pDqHiW2ztghbUWpHZM7NAj/DjT0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxmO9gYfFK4RhfWJPI+CCCEAJSmjLb1zE2v09w0H/LGvn/DuF6MrUjWloy5k/EG0yvaDbSg8VVu8YrH71Go8h5JG/XcK7PvHk914gd+upc6S29L5+NsTnLkLx1qzV3pRPEFTcDCIYtpWJjgVKaIRRxskFC5UprFB7usMNGyLRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWNToN2I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-411d01eb13cso426255e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823047; x=1708427847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGfIBuUn3FP2SYLtZvcHC2lanAjFP64z2DdyMdiHEUc=;
        b=WWNToN2IcM9+AwdpOb9jc5J3KOSkf8/dzMxoUmyaEAr9ff45MxoqpQyIJcj7HX8+Q9
         VEVnY6NW634+0rsozQ84pIOyuNts7DXVJsI93EVTPmpv4/18mITOZOyApSShBdj9UNzP
         EAue7k0DHWWkKeukmV8knOmSnMIsGAUFPVLrwe/0Gx9m1AAwnjpFEIGWaT1J3U9aj5z2
         Ewi/89CokTtnV8XV5Kjwl7JaGX284RUtyI4k11p9T6xkucSIxUG1f+Jv0GiXF02EQeG/
         JIKAj8g/kmIKb9Py30mTHJmPC31kZ2KBH3Brkjf+UvsR5QrmzROGOsZ4OjCsH2qW7JVy
         /1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823047; x=1708427847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGfIBuUn3FP2SYLtZvcHC2lanAjFP64z2DdyMdiHEUc=;
        b=nTj+Ut3RSBViBKOth76ZNpcJ/pZOV6u18RbsNzxLwDw1jLPxzU91hJtRdIgbdauV/n
         7TgwszyiiRwEUmygkTmiYdbFgsOQFRCLf98ZQwxsa4pNid1MB5qggR1bTH4zend0TF6X
         srG9c4qlDTp5zkkqOGTAg1IWFlAzfFd6hGLQQsAbDp2AUVJq3CU3c8vj52AhgwmGvhBV
         5deQMuawCnufa8Vlwj19SohRaBezHggQ5KqZlOakUvEFFYu/yZGxK31gsi0/nZeRz7VH
         zlgst4XsuVWHImnvP8CagnJNqw8xi9XU8VX7zFKVcar3YNxRTX7uBn520rzXkmm+fZby
         8H2g==
X-Gm-Message-State: AOJu0YwfapQbQjglYc9KqKYS5angZJ3ZOegHEb9B4zhnhC6MkJjoJACC
	f/Ptkgi0v8Ad4qXGtJm1o8fE8M/1Qo1vXE2doJtViovBfgarrCS5Np1fWWJzS30=
X-Google-Smtp-Source: AGHT+IFhVhgzZrUzE5dtS+3hv1zdN4ToCDF8UqKtf2BVxYPLIA9hXYELbOafAjJ2irEU/AspJqpx3g==
X-Received: by 2002:adf:ed03:0:b0:33b:377f:7aa with SMTP id a3-20020adfed03000000b0033b377f07aamr5806640wro.52.1707823047180;
        Tue, 13 Feb 2024 03:17:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGG1roBGe0QPR6Tlb5UyMjnQ7AUQHE+lpY3g3RrSvXvoDHKFx1zFdghg+B/c7ezhGO6WpYVrzSzaP209+kcssGmfI+LJKd0hnnWRoBs+FtGM//eA/jkQvVYvAAq0V/uSx6oLJSTUxw9zJ1TCZWpwz2q6d3KzHi3MPep8VRgIpMiOA9exI2nt+bDTAQGngMTxS6XU+Z1TWvLapNw2Ew9iLNTANiWLUvZGksvQibFyFvwn7N7bbtVzCv8cNTo8AJXHtElidkZe2aQYMu+AEXvtNvCDN95fj/HdXvGZuHzXXafIJprcX7nsfudYptq9JYrdQzBJjq
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id cl3-20020a5d5f03000000b0033b7ce8b496sm6750413wrb.108.2024.02.13.03.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 03:17:26 -0800 (PST)
Message-ID: <7d29267a-cf88-4e97-bfde-4ee21e6d2cc2@linaro.org>
Date: Tue, 13 Feb 2024 12:17:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: qcom: Add Samsung Galaxy S5
 China (kltechn)
Content-Language: en-US
To: Rong Zhang <i@rong.moe>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
References: <20240213110137.122737-1-i@rong.moe>
 <20240213110137.122737-4-i@rong.moe>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240213110137.122737-4-i@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/02/2024 11:58, Rong Zhang wrote:
> Document Samsung Galaxy S5 China (kltechn) as a klte variant based on
> msm8974pro. Also including "samsung,klte" in the compatible chain as
> kltechn works fine with the klte DTB except for LEDs and WiFi missing.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


