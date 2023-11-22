Return-Path: <linux-arm-msm+bounces-1584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092227F512D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84FA4B20DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968425D8E3;
	Wed, 22 Nov 2023 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUDuD21v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C765C10DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:06:29 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50abbb23122so110938e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683588; x=1701288388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSTS/9xb+I0FspOAfgVWZyVSS2kQhyQBTwt73Qi7TDs=;
        b=JUDuD21vfzMptAc8ZAPrPVgxQsbgNLdIxu3mqrRdkT98HkoCO5/8vBsPDv4d+ZExGl
         2Qf+6sMnjIocchzDOvihUT2Itwd7CZcVzRpf+LfAQgSA7p/E8pZ5dy9Zde8zKEJvQcBc
         PKaOWgSoQgLkDmUQb8BRWoNSLPJJFAdLUlC1KuqRIWMaEx78KUd8DiHhbY96iyGuziBS
         Xiro+A9VGL5Ee/k0wuPyDzxQoFtORzc9eGl5pttCCQhKfJDaY+zaMnqkrdByq0ftKP2h
         W5Kvk3GnCUZVIDtMQKK3omIQH8qsXOXnk9Lw5d8RtcDHCi84EZK9HgrZIezPz+km9Oga
         b28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683588; x=1701288388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSTS/9xb+I0FspOAfgVWZyVSS2kQhyQBTwt73Qi7TDs=;
        b=Kzsn+rsmtqnxuWW7N5R09A2NLery0ercjcA9fxdNytMTsi51QJkmlobTi7RNMpuawa
         VJ8Lzsz2brExcbwiYxvnxWgtqLUWYxMSVItgoh8gO4de0hG+4efuHt5B89GZghKr8ho5
         FjNyJy+BgkMQLjvKgVePS9BWu+iCsmsEoBENPw3aqixRPofbQCoeuphPZxAE/0XnsucA
         jSh75WKS5VFurCnW7blvQR9PO2jdqetGM4l0ZagvW5gJO4q1goTHdg1v0+QQqvBKbqA4
         EU/QXrc+PjgcXdjJOO7YoUXS+364D8KgRz3WQjpufQIxEK6Aya31tUAxoWdq3sR9GpVA
         Dt7Q==
X-Gm-Message-State: AOJu0YzBRbKjQYO4IzU8Uw4D5THV4FYcMEMf54cJNca1gkdyzzYDZvTr
	aweZw8GvSyu/jITb6O0ypVi1LA==
X-Google-Smtp-Source: AGHT+IEui1Ib5o4jG6u00MnB2oJZ7cQuP6xzqF57vg+KnJu4CfFoi5WxYD65RNNThB0hY1kwsq1OTg==
X-Received: by 2002:a05:6512:60a:b0:503:9eb:47f0 with SMTP id b10-20020a056512060a00b0050309eb47f0mr2306037lfe.59.1700683587909;
        Wed, 22 Nov 2023 12:06:27 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z15-20020ac2418f000000b005079ff02b36sm1932808lfh.131.2023.11.22.12.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:06:27 -0800 (PST)
Message-ID: <fcf25047-0b2d-40ab-a45e-6f675cae4f11@linaro.org>
Date: Wed, 22 Nov 2023 21:06:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: Add support for Xiaomi Redmi
 Note 9S
Content-Language: en-US
To: David Wronek <davidwronek@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Joe Mason <buddyjojo06@outlook.com>,
 hexdump0815@googlemail.com
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-scsi@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20231117201720.298422-1-davidwronek@gmail.com>
 <20231117201720.298422-9-davidwronek@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231117201720.298422-9-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/17/23 21:08, David Wronek wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> Add a device tree for the Xiaomi Redmi Note 9S (curtana) phone, based on
> sm7125-xiaomi-common.dtsi.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

