Return-Path: <linux-arm-msm+bounces-73819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D1B7C855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A721D4E1339
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 00:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CFB72628;
	Wed, 17 Sep 2025 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuSCX40v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E56F06B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 00:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758068338; cv=none; b=tyaqhXA4llDWY/Nqx3eQHjrgHH7SZfnSeLfTV+Ly6/tMPROtyBTnUd2iC2RI1m7Xlm3W98TLd91JL9sxYxqJA5fcwxeB3jqXy4EKxM+Ns30r1IrOgtq50BGNacjmQpmzh48NTrsiNFGgE8Uu6750hkph6ccMNPH/PgzdXsWdG9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758068338; c=relaxed/simple;
	bh=CxqjHjLrh/KCjUDYzJs5mJdfq3Mc14cqDpsMz5KWez0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQ0KG3JdR8WtpvkblLluoaDUKcAAsz8TasmJeTERbZGPs4gVsFi9OGNs/+72RhZJ3yRhPr/60hqIsTBfYx4Kl89C8wXTu+TxTSIKguB3tjTt/2gBsVRitJS0I8c6ZOztzzWsntKZjlPagiC/QHQPjjBBsVBZQIdc4wHIZjF52WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuSCX40v; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26808b24a00so280455ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758068336; x=1758673136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CxqjHjLrh/KCjUDYzJs5mJdfq3Mc14cqDpsMz5KWez0=;
        b=HuSCX40vfHUYs7KGwiozM2qaKe1ZHJ1SIYIcWLPXr+If13ud9BAeZunb3Ah210D/5Z
         l2h4Fug9TFKyTeUvuhTl+exZFfT4INhNrLdHBXsz8x/PtLjPc8cHDbcSZy/qiRpvJ2WJ
         v+Kkin/sJ7uwRExKep3C//9GYenHBwGETKr6SwEh1ZDqJee3iR+rcYXvU4tO2+BoJVVy
         V3OPnkFQuSl59zpOBnT4+EXX15rq+/cybEJ1Pwa8KQlwY2HYB6gG8IVC4cVVacFbK0QX
         Rn9BzQLZqXpyeOqzV7OPEaiahC3c5h2/zu21r+WzhIXhQKKAicrbtahgutMtNlo048GX
         X0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758068336; x=1758673136;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxqjHjLrh/KCjUDYzJs5mJdfq3Mc14cqDpsMz5KWez0=;
        b=M2EwQzhNbEIx2ww+y0QUOe1mKRErGNAQykZ746tZlmIHRlEDoJt2lTWW/AR2471GgG
         TipvXtzlISdKKtFZjEjVL/gOYqZWUdufIm+awCOwAe93LgZs0xoMm53+H1TVka63G1PM
         iT5kcFkLJwRAKV15UBshjYd73XDoj0BRqQMGmAAgCXvrDo2ebLaMbkW96GbyttieiHK/
         aM/P717kmZVrjWI9fcuS0FwkPIj5jkMd63yXnQRtJq5iNzQO9k8HmNQXxnXFTPuKsTwx
         MBvzgBlv0bPl1ng7fAwcrsTy0SZOrI1A5HLhjkMyUWLJ8TXl93xSmJxRgqWCTTUGZ6if
         0UeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm4t6NnHOzIFX3cYlQMMGnDTG4K48g/gL5FZglgfrT4XM+8Gwj6rJYayCDIn2jHK843YnIzZnqxZjJB3dk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0yeY8Rld+TnYOISGI33YYHNdi03AC+zd5UxlpkpAC1Xva/egW
	DpfhrJwtWPoK1V+Hg+YSQWiVKjMcB7WNyIKVu+Q70hoHFtFUM7fI98G9YC7kAEg7lXs=
X-Gm-Gg: ASbGncvZossdBK80sFgZf8cgI3Yr5SfLPHhtLXQQ/91jFot9huWtuvPdtMWfl/avvPA
	Vd6hdkmLaOzA3JCCoCmmQMHiFKVADiEhovoi01vDfFiA0TMgtzX+OAOzqxWqC1F50jQhO/g0zQ2
	PaH7pIylk00lJ/S6eLBdYpURzjhKFc/E53UYziB6iPhoK9CVd5oQcIGH9iP386KsoXBNx+ZiRSo
	lA5GBNlaxUCQpQL+ZXXptdWK59LQIHI+Xv2sdFi49Yphl0nRsLHz/4YFkCuwO95kcH6uNo186pd
	iQEZw3QYW9NAIr+4WeoFuBGp+sxCLwd5OFImFuv4wwyOEy413Vwmcw9yyxKUG7+1k4ygMpwKB+P
	gHhkQOcb8yPT1K4Z5ELQRf2ZCg7fi0Eg9HrA8ieoQ5L4=
X-Google-Smtp-Source: AGHT+IFFqYZkweXILKMVWn4DitkTIzN2YAOaJW/Vo23ECOhIdvxuHImT56SfunoBnsQTCArbl9BX9g==
X-Received: by 2002:a17:902:e5cf:b0:267:c4fa:e269 with SMTP id d9443c01a7336-268119b8a90mr1236795ad.1.1758068336468;
        Tue, 16 Sep 2025 17:18:56 -0700 (PDT)
Received: from [192.168.35.228] ([218.51.42.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-264885eda79sm88209845ad.6.2025.09.16.17.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 17:18:56 -0700 (PDT)
Message-ID: <6848aafb-ce93-473a-94a8-57d691446304@linaro.org>
Date: Wed, 17 Sep 2025 09:18:52 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: Fix blocked task
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Praveen Talari <quic_ptalari@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>
References: <20250917001645.19263-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250917001645.19263-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/09/2025 02:16, Krzysztof Kozlowski wrote:
> Revert commit 86fa39dd6fb7 ("serial: qcom-geni: Enable Serial on SA8255p
> Qualcomm platforms") and its dependent commit 1afa70632c39 ("serial:
> qcom-geni: Enable PM runtime for serial driver") because the first one

These commit should be mentioned the other way (I blame really weak
coffee...)


Best regards,
Krzysztof

