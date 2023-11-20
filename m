Return-Path: <linux-arm-msm+bounces-1132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 408457F1282
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 12:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFF3C1F213FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A4B18AE9;
	Mon, 20 Nov 2023 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ByluDlkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86E19F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 03:54:58 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9fd0059a967so205689366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 03:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700481297; x=1701086097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8AWhfE2Dwm0+sDgL8vznseiQagZPvxsot2/ITuX5H8=;
        b=ByluDlkbOBwkhYo1GxP0QM+b56eMpz+r/EIbFxjSCCLmGdeW1jLhob8FqnksXo1NyG
         58GxcVgGcYnl0JnvuAd9AGMJR0jBdyjUn40SwrHtfGeVN9yL9od99tB3OrAKQfqYf9BK
         HFZGxlQPHnicdvErJuPa9XKK89trRRqXkAmUEeDB1O0sTowYrJfXK3OTQVVlvJOeRM9l
         3aeOhCCzOF3JmHmGd1YWacKnR3/X2N/QZW8xaadvT/a+vSzTUYckesAlfYtts2/2a/Up
         I9XN7tFdulSKsZz2FWCDdtxwHOMIxiQoSdB8v08b6leyjovNE0PA52Ivbp6LWX5ZpIxA
         Jacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700481297; x=1701086097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8AWhfE2Dwm0+sDgL8vznseiQagZPvxsot2/ITuX5H8=;
        b=U9s0CggLsSyzJJMotk/FMb/4EqpLrVIoedUaUK/gA1i2eqoFzTtEYi4cSuY+btF5xO
         bn77Kvg4F/foYmpCOkAWPhxjgTcQ8OHowI+ZFb5EGXMXd07PkuJAIPiYH9Elgvg9812j
         sBkfwiIkRyjOe59dIff2ZItb03X7pHbbz2/BeBobWmFMAxUEn0F4IoguD90PyChqnQcl
         ipBKbPKoLBmh8C9aDQ/bv20frRXTm4xGKGEjzEx/1eq+iwRrHuew3I0aZNDGhq0LReOt
         3LfXVx0Y8gbmoZbjUJKjdbO+2KLfnpYs7BE9a4igOvihJ8SmKQ0COph+oo1GTBy7BDIR
         rGzA==
X-Gm-Message-State: AOJu0YxqGW/ecp3xgpdxkbhc4vbxCTHTTLqdvXtpB40k6cm+/FOHMiro
	ni6FVIHATDbkEnaQgK93ENxecg==
X-Google-Smtp-Source: AGHT+IEzLPWn2u7c9HHqsIH3EHpB9pMu/RGqFN3K+HoqrZsTn0D/IslSTkjemZgxB6Hyhsbz+7LzYw==
X-Received: by 2002:a17:906:bc4f:b0:9da:de23:738e with SMTP id s15-20020a170906bc4f00b009dade23738emr1451191ejv.37.1700481297322;
        Mon, 20 Nov 2023 03:54:57 -0800 (PST)
Received: from [192.168.201.100] (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709066d4b00b009fd1a5fe9dcsm1497900ejt.86.2023.11.20.03.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 03:54:56 -0800 (PST)
Message-ID: <ca66e0e6-2c24-4dce-9464-7d4464b6b8ef@linaro.org>
Date: Mon, 20 Nov 2023 12:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/5] arm64: dts: qcom: x1e80100: Add Compute Reference
 Device
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 catalin.marinas@arm.com, ulf.hansson@linaro.org
Cc: agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com,
 j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
 m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
 lpieralisi@kernel.org, quic_rjendra@quicinc.com, abel.vesa@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_tsoni@quicinc.com, neil.armstrong@linaro.org
References: <20231117113931.26660-1-quic_sibis@quicinc.com>
 <20231117113931.26660-5-quic_sibis@quicinc.com>
 <bded087f-6601-48d8-af7e-9120955127df@linaro.org>
 <3cb43c28-7333-936f-96d6-1c85aea46cfc@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <3cb43c28-7333-936f-96d6-1c85aea46cfc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2023 07:51, Sibi Sankar wrote:
> Hey Konrad,
> Thanks for taking time to review the series.
While it's rude to complain about somebody saying kind things, I have to
do it :D

top-posting (replying at the beginning of email) is discouraged and will
earn you grumpy replies, see the beginning of this message from GK-H:

https://lore.kernel.org/linux-nfs/YH%2FfM%2FTsbmcZzwnX@kroah.com/

Konrad

