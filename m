Return-Path: <linux-arm-msm+bounces-15517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2988FA46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 09:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF06E1C28FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBF0524BD;
	Thu, 28 Mar 2024 08:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXaf481e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4551C3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711615822; cv=none; b=LIKAOOYYV7nsUbw7yH9l58pQCGYGkCZavOzxRGC3OOLwkZm4u+BA9PQJTv4PwqSS9bwjMJAhZ7v0YciiUDy7gWZ0853p0O99AZPpLMKlFGIm7I0Irvx6UR82JRv2sKi1Vryw9YpSQY8EXOd8FeW2wydOw4JJvsROpeGI2nZPJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711615822; c=relaxed/simple;
	bh=A0R6lmR1m+yAfOyrg4Hmzgx1/lM9XoICSF/GiNOEEd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3sb0l1S0zV2J/4ENR9Eg6U47IKZ8rz29lewPbGWkRrcJzJWiHQ/zsJ58wO5ygLSOABmxHVmvfX+CfkZFa8Tl1cIcZGFa3JcwVqQfLIdN88Mo4il38JmnFBrlUxp4CI4aHvYThozNsKjxEfbm+j5Ke6j0sh/OrUPJDpFh9lTma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXaf481e; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ddd1624beso423993f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711615819; x=1712220619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ+YBLkNV6VEF2rUgGOJxYuEYM/uMvvAYGZ9fwfCJXw=;
        b=KXaf481ejzp4bbnckOJKMGotwe5DDEoy6qxFqc4RbWO105c8Dv6y1WHLI1foQIGmpV
         Y2JsQFfxkRwS6aQzenBfm7xSvzR8FM+IFp+mZoiN7C/pQ853MUdlqdwL5b1km9LEPVkC
         1kU0weqyYdnbRxD+BLLskEWgqmhhx8yPoEVGxt7SzIMeAMdW4kpBYvOxxhkgrOGduCLw
         DOmrYgb5noKDACmYRymLkdGaX3Z/xSq3dDE8MGzukYVvwH17WN0CnKbrTRIvTh3r4j+g
         ryiNViGtSyD1aBUxPy3jR2fb8EdTnT4uCqpcMuSKfMor9jDm0C0Fd9qUKNp/SACA9P8A
         Nl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711615819; x=1712220619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ+YBLkNV6VEF2rUgGOJxYuEYM/uMvvAYGZ9fwfCJXw=;
        b=crvEt120epV1pc5A0uh1L7P+70a4d9fIADeWiFy7HP0xAjXAEEhcN9sjC7qgyUXNub
         GDUh2NiiRgPFIuBqxsp31QlRnsVAQaR3Fx8rzSj1MjRtc5cvYatZ0iHoq1HxE8C8zSB8
         TKKwj9iv3fjnw1kA/Qi3qF5D53KOOFxOxhXPfRn1bFv5uNVCp8o9gP9n9cp6xu+TYzJP
         0KKNxdeg3LrjlaQWbVtY5agAl0D0jT8pVHvyImQNhAAmCIW1/9YRengi9np3siJWcfHJ
         OY5RqmGzqfuRz0jT4XaD2/06Diswqm28/E8zrw+Namj/7Zv3Jtpf5+5NdmuBD36be0Ta
         0xmw==
X-Forwarded-Encrypted: i=1; AJvYcCWN5Clo/SXRYeASO1JMdfE/tzoxpAlGPbu2t6JzFMpYZFJFQ1rNSfZU0ZbJNGyu8mz6Ef23BKAm7zjmU6tsRCV02HEoldnERIOmPl2VGw==
X-Gm-Message-State: AOJu0Yzx1RU9oMXd11I80N5WtQ+bL59AbiYiJDuAGi4MK9cSf1IwOwih
	+2hgd1bFDyl+JUavfBYPj1EdUCcodw5/QWPGpTM47OZtccL5Miq5ANCMTotrG1w=
X-Google-Smtp-Source: AGHT+IHtezabxk0LaPOL3zQ45H75rf+nCNsKrfQeSAmSXeRy5hUrXy9WJyMTcEop3ixcKCztrypIPg==
X-Received: by 2002:a5d:540b:0:b0:341:a63c:58bc with SMTP id g11-20020a5d540b000000b00341a63c58bcmr1177900wrv.2.1711615818960;
        Thu, 28 Mar 2024 01:50:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.148])
        by smtp.gmail.com with ESMTPSA id dv10-20020a0560000d8a00b00341ce1b64f0sm1156645wrb.17.2024.03.28.01.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:50:18 -0700 (PDT)
Message-ID: <ace20109-fc4e-43f6-b82b-2ae7c2905b99@linaro.org>
Date: Thu, 28 Mar 2024 09:50:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add board-id support for multiple DT selection
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 caleb.connolly@linaro.org, linux-riscv@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2024 13:11, Amrit Anand wrote:
> The software packages are shipped with multiple device tree blobs supporting
> multiple boards. For instance, suppose we have 3 SoC, each with 4 boards supported,
> along with 2 PMIC support for each case which would lead to total of 24 DTB files.
> Along with these configurations, OEMs may also add certain additional board variants.
> Hence, a mechanism is required to pick the correct DTB for the board on which the
> software package is deployed. Introduce a unique property for adding board identifiers
> to device trees. Here, board-id property provides a mechanism for Qualcomm based
> bootloaders to select the appropriate DTB.
> 
> Isn't that what the compatible property is for?
> -----------------------------------------------
> The compatible property can be used for board matching, but requires
> bootloaders and/or firmware to maintain a database of possible strings
> to match against or have complex compatible string parsing and matching.
> Compatible string matching becomes complicated when there are multiple
> versions of the same board. It becomes difficult for the device tree
> selection mechanism to recognize the right DTB to pick, with minor
> differences in compatible strings.
> 
> The solution proposed here is simpler to implement and doesn't require the need
> to update bootloader for every new board.

One of the concerns you got in v1 was: show us second user, so I believe
in your interest is to Cc other platform maintainers which could support
this idea.

Best regards,
Krzysztof


