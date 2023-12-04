Return-Path: <linux-arm-msm+bounces-3228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DDB803124
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92F401C20A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25064208BD;
	Mon,  4 Dec 2023 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ne9EJZO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D2BD40
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 03:00:22 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a18f732dc83so734235366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 03:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701687621; x=1702292421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zMJ0dX/x7e8dMzBxocrNbXjh+xb4eJogbtARHYIGT34=;
        b=Ne9EJZO4GsfVsiKH3aTqAwueotFkkuXvUu9F2g28kvVrvIP7mWX7eEMS5+nqEKvH/X
         a3U+mXM9s1rqxYm0UP53URII58ksq7b6jDOoUTMwj0EbxhqaNkKnMMBjAUzBOHyhFlkH
         53Vgo5zvIO1i5NAnFkacaTchDFgKfChPT2WA06iibPWG2DlMOc8tF7MNZCWJwuXwtHOe
         4i2t7Ww8l+5gPKv2Dv3/5FTDuZKxlCAaaFQP99vU4DnlvTuUayu2H/cbC+Jdrt+kso/C
         wWQyunDSCvBdLwJ82ytxouD+VezMKEUBkQrlZF7DpV6Bq5cA0WVUiNJvpThOFx/nPyyv
         QWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687621; x=1702292421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMJ0dX/x7e8dMzBxocrNbXjh+xb4eJogbtARHYIGT34=;
        b=GhUK4amHlMANnDe6fdeHcv8PbfU0t3xAc2tbDES/fsU+C/curezfNnbmXDWs2vJROj
         MhSNgKWYbJR7BxIeLBGWYxzYvWgnj+iPD5d/ArEbhcZjr+BYjN20TJedv8CPbTxOksg7
         k5BS4sQ9eR935cBLuNqQ7XQya/vyiIuPm2Solit3FGhD8FzNmjBNY9xiirgpRPGh/tiz
         kKRKkHFQPrkeIfjjbrzNYG60WVicoLxwrgI1qzmqSwNnJzkJJ3M523nd148T+Ll99gvt
         BP4paFqmaVTIggvgpPtX9rNS5kXMRoTRBDzUCzJ5hqv2KIQWcOU++S+2UNjU0fjqwqus
         U1mg==
X-Gm-Message-State: AOJu0YyS1MH1bM78kK6GeNBIKKQo2NUURLc13lklipBNQM7Rt+71225J
	+e6Lzh4Hyhzaj1x9pqtf/sproQ==
X-Google-Smtp-Source: AGHT+IGr++cSCnry8v6UCnnH6JPuwxMw6hOwRdfEiM0xGHi/7wyzDr1p7SZ8wYyTjpx8aZIEJkNiJA==
X-Received: by 2002:a17:906:268e:b0:a16:7f44:25bf with SMTP id t14-20020a170906268e00b00a167f4425bfmr4621773ejc.17.1701687620957;
        Mon, 04 Dec 2023 03:00:20 -0800 (PST)
Received: from [192.168.209.83] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id w17-20020a170906481100b009fad1dfe472sm5135963ejq.153.2023.12.04.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 03:00:20 -0800 (PST)
Message-ID: <f24e9f93-bd48-4845-96cb-ae08f8b4f210@linaro.org>
Date: Mon, 4 Dec 2023 12:00:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939: Add clock-frequency for
 broadcast timer
Content-Language: en-US
To: Stephan Gerhold <stephan@gerhold.net>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Jun Nie <jun.nie@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231204-msm8939-timer-v1-1-a2486c625786@gerhold.net>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231204-msm8939-timer-v1-1-a2486c625786@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.12.2023 10:55, Stephan Gerhold wrote:
> Looks like not all firmware versions used for MSM8939 program the timer
> frequency for both broadcast/MMIO timers, causing a WARNING at runtime:
> 
> WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:38 cev_delta2ns+0x74/0x90
> pc : cev_delta2ns+0x74/0x90
> lr : clockevents_config.part.0+0x64/0x8c
> Call trace:
>  cev_delta2ns+0x74/0x90
>  clockevents_config_and_register+0x20/0x34
>  arch_timer_mem_of_init+0x374/0x534
>  timer_probe+0x88/0x110
>  time_init+0x14/0x4c
>  start_kernel+0x2c0/0x640
> 
> Unfortunately there is no way to fix the firmware on most of these
> devices since it's proprietary and signed. As a workaround, specify the
> clock-frequency explicitly in the DT to fix the warning.
> 
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Reported-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Ouch.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

