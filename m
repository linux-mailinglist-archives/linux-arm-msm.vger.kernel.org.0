Return-Path: <linux-arm-msm+bounces-26541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B89349BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 10:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9D51F23488
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AA877F2C;
	Thu, 18 Jul 2024 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3xCVbKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD425B1E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721290869; cv=none; b=NIFEjc4ck3xNb4EHJz8wBjgXZQ13bZz+D1YWCWfm1ldwdfxtYKZSU9fwso36IGIbZcakxkB0kWmsB4FfDBFpLLYjVja7eqTsUdGj+E2jEAU0uT2nsgRYGUq/N725AXNhbks4Z1e2TydJIbx0bHXXdjXhK/n5Lmvtygch3GkRATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721290869; c=relaxed/simple;
	bh=oa0m6yThXGQ911PcbJ+ff14fmk4CMRPv6VV9IxaSOZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbkO+eMjq4PNhexDpkKeSmdDIhO9iJ1HisNKvxOj62vRX1DeQ4q1VSKQD41YcGRCOVdY/P3QUNj3aH9s6Rc97p8NBV9x1z4093ZJH7arJF0oJJO/cS0/40m61ZbITN257Kr0jXjEhsraNDTw9iI77TV/feV5+84fyukphPoXe8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3xCVbKh; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e98087e32so40452e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721290865; x=1721895665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zl6jXF9vUY+221IiV2cNHnzlLOPgz+WxOotVNYIA9xg=;
        b=v3xCVbKha8TFy4vU5AySPOE0Kb+g6c3Xf73+Nztug/PBZ81juwuqsgP1ZFKUc/AiBc
         WwgGGfJdcy9bcxEPiBBvSF0G11vdoTSRHlrmk2QF8zuAZYzY1NRchL0AkAQIqFJ+c4pZ
         eEJjPeYRP7tnUVjbD/wg9PF2TxOCzl2/nU8bBxy6FZh3Qg+McftWqBkyke7PwlIvVwp1
         LZtyHqArT4sY6MdZ94NTMk7Hzp1KT5bL89QnpnjY170gP5XXwxUhJc/JCgk186IzKR6R
         2BEigv3SbUFezwHSyaQsDAHj5Roc6hfH54rqoW4iQLCiRiNMfsz9ovWLykUrt1eictLk
         1iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721290865; x=1721895665;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zl6jXF9vUY+221IiV2cNHnzlLOPgz+WxOotVNYIA9xg=;
        b=dIsYGnxusWVGfDvD4FVXiGubJpq2Loct1ycZH/tOA9u+X9f0VKyzmRV8sxg1cbVale
         QIbfFIRZfPN8UFgl0gPISC2dXafIwPj5CHElpZfdrwt13A7B1U36O2uh+zT1otaW6k/O
         8GWWjfMcCV7fayeDaC711+DJV1fyA5MLiKvVl4wlpvttru/5fqzM5R/LdaMxP4H1A5Oz
         mEip5dpF50kD7N2faszv9OzSmIikmaqGAFt4X7GGxoYIGoZBoz1Xj26UNvgPuR0m16SL
         fv6J0ljqXoLMDhU8AlkLr5kfmZZRRPF4hDxy/XapU+hb7yoTPzA+T1F9jh1Zmwlvf9QP
         zBSw==
X-Forwarded-Encrypted: i=1; AJvYcCVOtgUC8/kK0Dv9BM6nRFItxfLM4JBQd7ifRYFb66RtkIaTv1pPaFggApDMdxq8zNuakp9Hr0bv+RvX/l5wGzy5tTt+HxLKxg95WX0whg==
X-Gm-Message-State: AOJu0YyjFP7YGQWj3+/Ed2RH/cNm548ZJxfrjMpWVa836Ms/Cp6P6EXA
	e9++6fpFVQeu/7Nf1Ud2QUGDaaQg9Srx0uYUmvymdzzmPbd3+RKq6U7krkn52mw=
X-Google-Smtp-Source: AGHT+IEoswLHX2k0Z49eenqCik3qFRXvr2xbi8WR+OFeKaNzU2vHMZ/gExUN5aJguTEpLBgqWz1zQA==
X-Received: by 2002:a05:6512:1296:b0:52c:d753:2829 with SMTP id 2adb3069b0e04-52ee53b2456mr3173284e87.19.1721290865321;
        Thu, 18 Jul 2024 01:21:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2911486sm1058055e9.0.2024.07.18.01.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 01:21:04 -0700 (PDT)
Message-ID: <baf62dd9-2dca-4757-b95d-7842d83c3007@linaro.org>
Date: Thu, 18 Jul 2024 10:21:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH V4 0/8] Add support for videocc and camcc on
 SM8650
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <171937625567.44413.15298354540853135885.b4-ty@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <171937625567.44413.15298354540853135885.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 06:30, Bjorn Andersson wrote:
> 
> On Sun, 02 Jun 2024 17:14:31 +0530, Jagadeesh Kona wrote:
>> Add support for video and camera clock controllers on Qualcomm SM8650
>> platform.
>>
>> Changes in V4:
>> [PATCH 1/8]: Updated commit text. Replaced :: with : in SM8450 videocc
>>              YAML file as Krzysztof's comment in V3
>> [PATCH 5/8]: Replaced :: with : in SM8450 camcc YAML file. Updated commit
>>              text and dropped Fixes tag as per Johan's comments in V3
>> Added R-By tags received till V3
>>
>> [...]
> 
> Applied, thanks!
> 
> [8/8] arm64: dts: qcom: sm8650: Add video and camera clock controllers
>       commit: 0bdb730e63f6628b0f8deb3f11991b1d10f9bca5

That's the only message I have that something here was applied, but it
seems entire patchset was applied.

Patchset ended on your branch on 25th of June with HEAD 09ea421652a8
("clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver")
and it does not compile.

Really, this HEAD does not compile.

This means:
1. This branch has code which was never built by you,
2. This branch has code which was never built by robots,
3. Or none above - so it was built - but reports were ignored.

In case of 1 and 2, can we please check if your tree receives proper LKP
emails about build failures and successes? Or do you build (or anyone
else) your branches?

Later this branch (or head) was sent to arm-soc, so basically for 2-3
weeks this had build failure, which went to upstream maintainer.


Best regards,
Krzysztof


