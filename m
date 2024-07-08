Return-Path: <linux-arm-msm+bounces-25479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DE92A076
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B194B232A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 10:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B6F77F12;
	Mon,  8 Jul 2024 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9Bq4SoT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1DD770F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720435489; cv=none; b=OzfaquWJX+vwR96g6G7UmOaV4KsBOZol3dt/Z5S6ipD7diwKGkcbXesVPR5l9ZCf0Trb+JxWmXHJC2RZCr5lTjjgdyPoMSwltsDygGgKqM1xVbAx6ihZ8nB3vab9WBo58aHN2pRv7r4AYi82Rv66Y+lgF5aLbsKRAujOJnylLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720435489; c=relaxed/simple;
	bh=qrguO9XYxn1AsUNTBJzMiGlMcI948CMxVWhaabMNExo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6oa/3KTz1HkLdsHiXv0tKjGtbWPwl3/1xzE+KvwuAM5h/IVfAgwaKDEssPstcXgAcZledcKnScAmUMEQt87g/M+cT/NHP7oqsGws5u7LPTfT+vb7CQdyMKHsvUdxp4Oi70K/MFBlAzMXiidPSC6McxZUBnTLN5rAnKwFiyPdtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9Bq4SoT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42579b60af1so27010295e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720435486; x=1721040286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a37xqtAhqBn6RFQufMqGlI4wV85VoVHD0Umy9Ckc/Lc=;
        b=u9Bq4SoTmS4AbOsUz/JhD8lWwMWURPP24fNQwkaCElNRzke2BVhdyhpfSjLp+2gaSk
         WOm+AVqyAqCHAdubQSu9Nl3jYyNvhHcKULwqR6v+MkiJOXRsxaj3StZSotaIct67yydY
         q2OjsdxBLX6oMyE+9hSHgZ7eQufP2aM/WjGJWyengf+AMb2WZ4RXGqQraxJIzRkmtCf3
         ohu/bGPwKlW6EJCLbujDUc7KyQsqGIeW9QCpmYI57HPtN/yCO5xvCu6wDGTsLhN24YaE
         Dzx8HmoSsjDU4yfFAaBXIzpMuuEJJ24VyCwrcD0UOVIIJZfE1zdMNeDkd4jw7CnRl8eR
         tJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720435486; x=1721040286;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a37xqtAhqBn6RFQufMqGlI4wV85VoVHD0Umy9Ckc/Lc=;
        b=R9TPpnEoc2+76mJexp+x0JFOYCcR5B9lzj0lbS7+yNC5HsNF34kZrO5V+tla01Xck/
         XfqZ1nOyMzKyzCmZMVeUsS5fAF35Lf00CFObEsH3huVkPeAC4ruIp4Aybu0XhkP0b/c+
         tHKdjOysDcUe7OlgkMRTgswIW7T6XLPBK5Oyovla3QNq4ENheRIFNmDirgy9OzRUBAJV
         yah7pJAxoFJVXTj6LkzVsT6qHhRDzk/UzTY35LWtFCL2ItzSDv7t2ZT14duc5xiRpoXk
         GuF97wzP08l2+8Bh0A2Ivx+UNh/Q44nr78YmMIIlhAuC3AuxIdKhXRQn2Cb/NNq+b+t3
         zqCw==
X-Forwarded-Encrypted: i=1; AJvYcCVVCQZPHx2hmKa7k5UGZX2Ae+JUrA0+B80sZcMb+itd4Ojnf2aU9kauB8ASgNq4x3DWt7xocZgsCxhY/qSbqsl9HvVZ2M0IJdDj0IG2Xw==
X-Gm-Message-State: AOJu0Yyd5Ig54DHAYa8Apb8IrszMUUSGbqVwPR7si6EP8qXtnRFQOK4J
	ybAH+NS+ZmXjTPJI61teEwzCzBaQxl2gox4GfiBYqak1ZTzRXJCd/NlZdwjdoRE=
X-Google-Smtp-Source: AGHT+IEX4+Ix+R9k1DiSQE1LFtm+JaPwNJfxzl5UgCb/G8Xy6bP/f5Oerfl19+46U34y0fv2YfKoww==
X-Received: by 2002:a05:6000:4023:b0:367:8e53:7fe5 with SMTP id ffacd0b85a97d-3679dd353b8mr8685700f8f.40.1720435486564;
        Mon, 08 Jul 2024 03:44:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36798e435c3sm11479442f8f.72.2024.07.08.03.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 03:44:46 -0700 (PDT)
Message-ID: <afd3c7b3-9d12-4ece-a938-c99bf9c5bb7b@linaro.org>
Date: Mon, 8 Jul 2024 12:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] Coresight: Add Coresight Control Unit driver
To: JieGan <quic_jiegan@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Clark <james.clark@arm.com>, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 Song Chai <quic_songchai@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-4-quic_jiegan@quicinc.com>
 <9b502ba5-7042-424e-b0a2-5659e4064462@linaro.org>
 <ZotaBxRpv29crRHV@jiegan-gv.ap.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZotaBxRpv29crRHV@jiegan-gv.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2024 05:16, JieGan wrote:
> 
>>
>>> +
>>> +	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));
>>
>> Use proper wrapper for this two.
> Replaced by:
> res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> drvdata->base = devm_ioremap_resource(dev, res);

Why?

Use the wrapper.


...

>>> +
>>> +static struct platform_driver ccu_driver = {
>>> +	.probe          = ccu_probe,
>>> +	.remove         = ccu_remove,
>>> +	.driver         = {
>>> +		.name   = "coresight-ccu",
>>> +		.of_match_table = ccu_match,
>>> +		.suppress_bind_attrs = true,
>>
>> Why?
> Sorry, I dont get the point here.

You do not get the point why I am asking "why?"?

Why do you need it?

> We dont need automatic bind/unbind, so the suppress_bind_attrs sets to true.

But I need it...

> We need configure some settings before we register the device.

Hm, is this expected for coresight devices?

Best regards,
Krzysztof


