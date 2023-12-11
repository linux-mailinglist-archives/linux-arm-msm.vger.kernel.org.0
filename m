Return-Path: <linux-arm-msm+bounces-4167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF3B80C3FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C8F2808FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96645210F6;
	Mon, 11 Dec 2023 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zzcUrgkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314D1106
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:11:02 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1db99cd1b2so519281466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702285860; x=1702890660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=16Y97N2Zs2q5DemT+pvvkP6HBQRqCQUx1elGsFbReb4=;
        b=zzcUrgkfy5fzppOdAQ+Q/D9Rsp/jrSn3j7VHUdD8qXWkahScON9aFyTmXLBxDheDPt
         WJ5Z2OzVsNlaQ/+mltGlMuevyFb3aG5B+JIMl0PZQzLWIQClW9DiiI/aT34igRoydlE9
         wqF3dnU2L++M8bKPEHQRcz0tBR6YMkUyd7J8CPB8WTBITwwlopRc0421xT5AmMRWKIaI
         K4ku8Idbs0UrhhWCLzXA/PAwXmnAFA9PAKshge9JMGW0PNG7IlKmabnxyx56FrHDWcQn
         y++vsittgnKjsVN89Lp3tyuinjFVfldSDB/pmXkaLacqTwZDYlG6bgGgMcQjJIJd++vH
         Yaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285860; x=1702890660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16Y97N2Zs2q5DemT+pvvkP6HBQRqCQUx1elGsFbReb4=;
        b=hhONSSpjrKed8LlxXons/kj1NN1W3QSQRSYORoHOxqp4KgqgupUDOYbLUzElBiEz+D
         6fjiOAMG7gcE0ofwajtx20PrKbJjMoKnm+qNz+lBSQyFUtgY+kWRK0HqkUxeh4eo+wfR
         21dIdP5S44Me9LvA8UIB8AA6GW4ouNAUtqwKTZHvQA20XTobic+T8iuLeHu/MdqVIS+a
         +qUZozssxCCsEBVJ22N5mGTkvvWQCCVSdGv3QV91j+r4iQav3dSARGOvD8fva6Mj86IY
         DT6+te7IN8qlnZxVbJ5vgKGAteiy0sKwHEV5czJt6uXLl1UtToNCqzFwRbicXl12v4zb
         l4xQ==
X-Gm-Message-State: AOJu0Yw96EF+6V/SHIkw9+A/95SoaFK5WznqHsU3nc63xHJHdAPd5wuZ
	zN1fuXHtU/oKHxsP0oOjtHMf6Q==
X-Google-Smtp-Source: AGHT+IHCiPPY2JFl1amGy8X+EJhT7H5xd0/zN/T4kqF/x2ke/2EyfmYrrngPX25VcqF9hxSaWVxCGw==
X-Received: by 2002:a17:907:d307:b0:a19:a19b:420b with SMTP id vg7-20020a170907d30700b00a19a19b420bmr1748301ejc.118.1702285860566;
        Mon, 11 Dec 2023 01:11:00 -0800 (PST)
Received: from [192.168.36.128] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709060c4f00b00a1f78a97063sm3572927ejf.153.2023.12.11.01.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:11:00 -0800 (PST)
Message-ID: <3ba4da84-a17e-47ae-8958-2484cd6cbea0@linaro.org>
Date: Mon, 11 Dec 2023 10:10:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: stats: don't crash if DDR offset contains
 invalid data
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
 <20231209215601.3543895-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231209215601.3543895-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.12.2023 22:55, Dmitry Baryshkov wrote:
> The stats ram on sm8150 platform contains invalid data at the
> DDR_DYNAMIC_OFFSET. Most likely this is because the platform didn't
> support DDR sleep stats.
Interesting. Can you read back DDR_DYNAMIC_OFFSET on 8350/8280 and
see if 8150 has correct data in there?

> However this platform uses generic
> "qcom,rpmh-stats" compatible, which implies presense of the DDR data.
> Add safety net to prevent old DTB files from crashing the
> qcom,rpmh-stats driver.
Yeah I'dve never thought there would be garbage in there..

I'd advocate for simply not doing anything wrt sleep stats if DDR
stats are unavailable though. The QMP handle can stay, as there
may (I don't know) be more data available that we want to export
through this driver.

Konrad

