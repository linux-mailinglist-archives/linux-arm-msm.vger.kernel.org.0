Return-Path: <linux-arm-msm+bounces-4820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6638139ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15D832821CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23FE68B90;
	Thu, 14 Dec 2023 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vC9wRIYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2CC120
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:26:28 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ca02def690so108114851fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702578387; x=1703183187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hr8aBcNe76U8Il1/cEacG3HGI0OPPwZhV24gYNt7zEU=;
        b=vC9wRIYbgsj5qR8bpg3JL9/k6obn4iU2RJXniBs6pYDvyLMZZlc+EnFXkjmQ06Mn3d
         DogHtyY64dEGaR3N+Rg6SzPg+ufJMnYTAyVUrDJnxEE+CJTvWTBHA8kviLzirYXlLrRt
         K/6r7tEwjwQs5wo6Oxy2YqcoHae+nbFLN3S6kpLfqChxWxWLKe1VobQaa6BujqqX/j8W
         8vsJlFfBzN3TAzpx/SR7/TsFuPz9cEUZeMG8Pv9kFTUtNkrMzzuRUzkTrfPH59Q1tSb3
         ITbMNkn9WPcvgMHuOjneiLX3PPK0sizKN2KgbQtm9JXHTW7Bg5/fwFwOioE3F72Nunq2
         n5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702578387; x=1703183187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hr8aBcNe76U8Il1/cEacG3HGI0OPPwZhV24gYNt7zEU=;
        b=pn6mYzkWHEdCDSB2MEM6V1l4vhYbcXJYfxWwYceYi0htjQIhBBEnoPs2jNZYmv3Fal
         rq32jpQNLqX7qsp9s4xaKpf+GIyuBdibrv7yiqrMRXIgDGOECsohqRDfHXO4/z62N482
         o/WDXFFKlVXBwiKnaB/2TjpLhgDS/3CfZT0MWphQHB/lmMY/NrjwovSdhZsb8BL1gUyg
         Rq+IkfQDKPRegBk46dA5/Tm6Fi++6C0RUZjN5NhVG9r5h98Uo4Xi5BP4jP51oMTjWnot
         dXZjt6+F7oh9sZtUdo6C4mAK+UtfAs6iF1LMYrIwI4iMH1sMq+8om1JxsDKf40iqBflE
         Wxjw==
X-Gm-Message-State: AOJu0Yx77Wu42pL9bwE5u1FCu2t3TucVOnSndIzD64MPViSwhQvM+8EF
	U4ExY1YTF6EzdMST5gZVRL5OQA==
X-Google-Smtp-Source: AGHT+IE8FvYLdfSsTVvxxEzpSNwIOQzkUazEyMdwnd1Uk4XIfWCU9lnASlW5rvasvN8rqK3jCKhY/A==
X-Received: by 2002:a05:651c:2112:b0:2cb:2c27:57d9 with SMTP id a18-20020a05651c211200b002cb2c2757d9mr5247773ljq.16.1702578387007;
        Thu, 14 Dec 2023 10:26:27 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z6-20020a2e7e06000000b002ca25f11f56sm2084008ljc.103.2023.12.14.10.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:26:26 -0800 (PST)
Message-ID: <93bec6b7-78c3-4064-9775-b27c5ac511fb@linaro.org>
Date: Thu, 14 Dec 2023 19:26:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom_smd: Add LDO5 MP5496 regulator
Content-Language: en-US
To: Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20231214104052.3267039-1-quic_varada@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231214104052.3267039-1-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/14/23 11:40, Varadarajan Narayanan wrote:
> Add support for LDO5 regulator. This is used by IPQ9574 USB.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
Why did you remove the bindings since the last revision?

https://lore.kernel.org/linux-arm-msm/cover.1701160842.git.varada@hu-varada-blr.qualcomm.com/

Konrad

