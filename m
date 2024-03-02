Return-Path: <linux-arm-msm+bounces-13138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E125786EDF4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 02:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2021C21D06
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 01:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D596FC7;
	Sat,  2 Mar 2024 01:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6Y8/Xdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BBD6D39
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Mar 2024 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709344127; cv=none; b=a4pZ9JsxztVTiCNBRo2bubSnuFiPFAS5+07iU18nJyi9Gf3Qp1zszCm59kiE39gUezDvn4g+p5DD+fxRLAtWmBAIEOQkqUYPuNDr+qjjA9U3NTu40Hj7CAyMW9Q9l5B1LFWGrmo72JSJhaPX8HW28vPj3U8OSm83pa9+Eeh12Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709344127; c=relaxed/simple;
	bh=Sg/6g8ZAlnZflN6/FYpenyWmZ4MpvQH4n5WdWFbjVzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+KqXXOGQAPEPfSWKE4X8Q803vP/AmB6VZHY2akWUHU/5fz7LGI3LvaVE9vnGx/V5zzAX5VzxXxKq7lbPy2VK5DYa9KlGRuUph9n0jFjdmUlchx8gTEAav97gtkdJ+s9bg8HvsPXMncEFSxzzdTFYg2L9V/o3m5tCkIIn888eDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W6Y8/Xdn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso4061793a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709344124; x=1709948924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4HPzpSbL1TAC4vIZwN2w2Iqh6PjKkzBN+P8dwyU9WU=;
        b=W6Y8/Xdnk1tBcbmz4Dpxl+xY+yccCkbEeC7vgKFNrtOmHNCSsXyjONHDnkbqkxwbBC
         2+41hrm2Uth48fb2VcmyacdqXY2Ju1hml0uozN0tpKIIjL0RkfQCT7yn/2K/UaUnOrRX
         Rq7gQQ/NbZMxH/xk0fVvT3f4pvkspY4kCqDKnAoJP0zFCwUNO5lAwptEsZW0lGorCPWW
         X3BOEQHmqNYB8MjerS842YzaKieljAFNVWtGCUYu7IUnS8MzokCuKlfvj4MszUhXi2A7
         cHmRSFxYNbwxTMkkVbxTETCaBbnfJcg7hco/mVVy6YCxk4wgn59RIHMDDaEOPY4eCjHD
         IjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709344124; x=1709948924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4HPzpSbL1TAC4vIZwN2w2Iqh6PjKkzBN+P8dwyU9WU=;
        b=YJuabt9AOEF0t+WixENBBexojA/LNINU5b7yeDX/KKXGnuQbKosXTF1h6nU/hkDXfC
         whfCkS2unq/3KF/4+Hvjzvg4DuSS71F7e3IeFh6mfL23EpzrmDgh0aqJnJ32wFNuuZfN
         5WC0V85LJJoqnGmJPpm1MzM2IUEa7WVhaEhFrQfzmCZDK+QRUd6vPSUruQY7j1TRNk7q
         i7SUo9uFgN3u1Xc+tehbhH3HRQv6PmXhtfDyo6vaBH4QxjGeUoS/CdA4cBqXBV54kPn8
         z0e24gYimpCts7SvHnDjXQcwO7AQwZMtev2jydIRSTR42EeNR5ww89aONEAcgze0dCVK
         9dRw==
X-Forwarded-Encrypted: i=1; AJvYcCVUl6jPSk6LAxGz1crf8w/CplOhz75v99ROMox1uTIzhNh3SsDQ6LxStfWCvEDRXlJThrTOYSP3Y1NhNXt39MeVjrjywfWhEQW2qUSFlg==
X-Gm-Message-State: AOJu0Yxo8c6YZoKcu57oi27fccT8eCTO64bjUy8vpt9ypc2rxSbsqhH3
	zC+gBto8v3MKIFAsmXsVOHTY8q72UWFfTkaRRif/jo+aNt98V8eayKwst1wzgiw=
X-Google-Smtp-Source: AGHT+IHANpmKTjiyEbU6aHUxrYK9elzDltg0UAnc8S1bmYjp/ZJAXpW0mgWCGOJ1tVIPpBrAz9tv/w==
X-Received: by 2002:a17:906:6bc7:b0:a44:d3b3:5e4d with SMTP id t7-20020a1709066bc700b00a44d3b35e4dmr321220ejs.45.1709344123831;
        Fri, 01 Mar 2024 17:48:43 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a21-20020a170906245500b00a442299199esm2212510ejb.86.2024.03.01.17.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 17:48:43 -0800 (PST)
Message-ID: <7bb415c2-987a-40d6-9716-cde2144b6cda@linaro.org>
Date: Sat, 2 Mar 2024 02:48:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc-x1e80100: Fix missing DT_IFACE enum
 in x1e80100 camcc
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240302-linux-next-24-03-01-simple-clock-fixes-v1-0-25f348a5982b@linaro.org>
 <20240302-linux-next-24-03-01-simple-clock-fixes-v1-2-25f348a5982b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240302-linux-next-24-03-01-simple-clock-fixes-v1-2-25f348a5982b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2.03.2024 01:52, Bryan O'Donoghue wrote:
> The desired DT pattern for clock indexing is the following:
> 
> clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>          <&bi_tcxo_div2>,
>          <&bi_tcxo_ao_div2>,
>          <&sleep_clk>;
> 
> In order to facilitate that indexing structure we need to have DT_IFACE
> enum defined.
> 
> Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

