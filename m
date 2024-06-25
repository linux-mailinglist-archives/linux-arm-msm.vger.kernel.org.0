Return-Path: <linux-arm-msm+bounces-24139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14561916EC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 19:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8117F1F227B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091852F56;
	Tue, 25 Jun 2024 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbclVZzy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9F172786
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719335014; cv=none; b=SEVEy/b2Ul2OAoXjKE0Ep1z3MQH4Z0NofhDPy5mnOTipNepLJpidgRP9C5qPhpwrWMU1H8Cd/JrMzEIBhLHvpWmsDxVI0L+GRQcN2ePFaq9vDUIkkPA16omQHBd8QObQuNCFLH1J7rkyrVB1x9XORdNUnsTxfmm3ftCa7y/VF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719335014; c=relaxed/simple;
	bh=SVzx7dPM+zj5mTLpINrOuLlod98o5OR3JttDI7Y5g54=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bLaOdEaNoJJb8QA1IpMCM/lyjsMHBY+NSv/NkLTdNC6A4fCUTMnpVuoeoiHvQ42BeOZZoP+LljAypITKO94xxX7M8gyf3u4+KpIQECdyACno47eqLDkFEziSxHhvArew1wmMH2WhucQjl7veBukF0hdeORn/o7F+QfUL8duK56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbclVZzy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a725282b926so347860966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719335011; x=1719939811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w5ecAzurX6IYGeYDcIsPTa6P3ILX2WujtqR+TA0/x2M=;
        b=tbclVZzybAhiWDO+vdp7re6fsEXi36+ybmnX373XpxmV1/cKqN+7GE5tSi1YVn0faF
         N+JdfAQRyk9r9pXA7713X0JIZ4KWpNGEdQYMM5QwkNBy/qPz+HJ5cGqDmmxbwTpHd7dw
         7yrMgkjlS4eBhF0wOecFY3pVf9jfdjXNzh5sN9QCcRShK8aGkaFYv/1WnBjCDA29Zmyp
         BtoSqjuAE6In4Zf8zXk865b2xhR99UnQ+U9sMI9N7nU1WN0GIK789A+vRWKMbniAFbWs
         33QTLYx8OamokrrA10vd14mGcOI755mFYrQbVzAlRZJxc5wwZa9+URR9F60W3RRffOVY
         g9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719335011; x=1719939811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5ecAzurX6IYGeYDcIsPTa6P3ILX2WujtqR+TA0/x2M=;
        b=grlz+5xHUizP+SgYNcCCutuc/CidRSDfgcqT4Z0f5strMF70L3GDqsjyXzeVJMP+I3
         FRsr66dK/oiSG9s8ii43ZB8tihMPpslhe8CbwNeKqfI49K7Y17AUPhfwwE7M03eBeDQb
         129noxaW9ktbfmAKKlEErz0005xv+VK7JPYs0TT2bE5S4dR3CAnPOVc0DM8UYeyyrfOZ
         topj3+v9JQZpcY1Y28RZimz7BJTTZwR08j0FFGFqthGaN/+KaEqMG0tm5lxzRnoPUiQT
         VtdAAx4mC7+Im+SNDiqwtvOcDXMa3E4gKic610rg6q7ZE2iUFnFvho1h97iHqTqsC+jL
         13xg==
X-Forwarded-Encrypted: i=1; AJvYcCUtcIqtkToSu7sJw5iz9SzEMNee8Aj53e7QiRb2xkf17c45zwlF9zwBtsnl+PxG5gCQZrftyvvwkQhejNlLnklVYJKY8lN7+bARD86H6Q==
X-Gm-Message-State: AOJu0YwLFZ6x1shc5fh1eZSgNnRIF5qd1bIUdYEf7hETB8p4sDQfN5wR
	tMGlVttzafYNiq9mPrFGgocJpyTc9H/y7kgq17PhNe4TcERlalSkgVlk7zJl4oI=
X-Google-Smtp-Source: AGHT+IHscyf9+UEi9wBBgYaC+ZxpUPrgpqEIcOMWpZVc2SrnmDeMBWYSMnQj4yV2fzoiGTx6eVxpSA==
X-Received: by 2002:a17:906:d001:b0:a72:44c1:a2e8 with SMTP id a640c23a62f3a-a7245cf2d6dmr423429066b.45.1719335011327;
        Tue, 25 Jun 2024 10:03:31 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725047c407sm263798166b.2.2024.06.25.10.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 10:03:30 -0700 (PDT)
Message-ID: <2391a1a1-46d3-4ced-a31f-c80194fdaf29@linaro.org>
Date: Tue, 25 Jun 2024 19:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
 nfraprado@collabora.com, u-kumar1@ti.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240625070536.3043630-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 9:05 AM, Devi Priya wrote:
> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

[...]

> +	struct regmap *regmap;
> +	struct qcom_cc_desc nsscc_ipq9574_desc = nss_cc_ipq9574_desc;

Why?

> +	struct clk *nsscc_clk;
> +	struct device_node *np = (&pdev->dev)->of_node;
> +	int ret;
> +
> +	nsscc_clk = of_clk_get(np, 11);
> +	if (IS_ERR(nsscc_clk))
> +		return PTR_ERR(nsscc_clk);
> +
> +	ret = clk_prepare_enable(nsscc_clk);

pm_clk_add()? And definitely drop the 11 literal, nobody could ever guess
or maintain magic numbers

Konrad

