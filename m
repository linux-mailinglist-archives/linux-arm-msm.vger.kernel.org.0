Return-Path: <linux-arm-msm+bounces-73064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6DB528AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FD517BB217
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F37201278;
	Thu, 11 Sep 2025 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFa9Qw0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F8258EC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757571806; cv=none; b=crtKbDbrWx9FeMciiQniBnC0nfy/+zw1iIry01t4OALwTmXjAJw2GJaenZi86Xc/lUnsn/J0GUFwQemhIj51eyA/pXvVVPXsCTUBIWznL5RonRM6MznsZQskK510t5DVEH50TaFQZkEC76EWvH0GgPg/jfT7KhAjq+sps880Qgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757571806; c=relaxed/simple;
	bh=rHr7FvJMHid/017FiYHUBGprb/Lqg7Kg3w8M/8S4xTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O3wYxA6jNXW4+Bs7InYkO8k8mW2ta97qAlnetWbvUWCEaaAz3KjcVBPMv0r56xjptfMshZEbNd2zKj6NaEe4L1mKjSgZXgEni5ASxfjUVdAp+nwnIR9SowkZXmTFBQxDUc7PgWC50eNGiTe52jdLfNb6is2VzIs5+nafPsf0sxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFa9Qw0+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de5246dc4so510335e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757571803; x=1758176603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wg4ExbZFlSVxsqzRRKRc3ecOdjgPd8wu5LFpbr1o7eg=;
        b=OFa9Qw0+nUDn/AmP+noVeoDJBbqXFpfG3raaK3BEVciRyuDcnlRF83lx/QOvPJnWVh
         vHIVCeTR6zw2ZONJ5UcCIiL6g5wBrJAwganK+HmW4h9LkdDmSDMzjsziXxavKsBlFuVL
         qO0UDmcYQTrDZ1DR+VmvfNNlqtRB0453GCwjjj6w1N70GddSCCMJMR0Bv58M1GvixZq2
         y0XsUA/BQ/+LXG4a/4QvKRN1nJQmjhdF4Fr+Yn2ByIOFz5hXrjFmGw/jnDB/OO8klYpJ
         NMkuKcS3xMeKpU+GJjLQ7Z9Fz57DWNWQSNr/v9DJd7ERpwRddAjJ7ZjYqI7z77XGeVi9
         2gcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757571803; x=1758176603;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wg4ExbZFlSVxsqzRRKRc3ecOdjgPd8wu5LFpbr1o7eg=;
        b=rHzVygDTwiuLAxDish0MzXqaEir+gt+opn+EmcLsKS8+q94nGoga0vqxrMLSbNBGAM
         4TBc0ROt0KuUpco0YoNpzW0ALumip6a+gsQziJLB/sgXI3ZmKfd1P/A/AVpgq2EEo9C9
         2rovzmjZQ/l9Ofh9qFB+/y1U/2yJHLK/lygTwFtImvfT9HbV5xuhBG3yabH3D2tz0p+z
         F2dPWJutSisWHl1SAVOOsqYxeRLidZ7CLDAMtNxHcz85faQ3ToeK9TFcn4SmO5+4Yr8n
         IdaVe6lT93ll5hoeoM5gbJ1DKjGEX9kIaOgRiSGnnGPOaqWqDbQN8Nj032H/7QDxEpEH
         sC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMoPtKfefdE4vPRFUzqNM//fcGdyokbYp2sDIQ7D/1PyLA2akKxNLuvUoNimwNvvq5MSHrD6Jz17JtAClS@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsrjO6AtVC1sKqHLxYBj9XbQtS9FQ9cf26cj80BPm8RyuUB0V
	eDmjowZcVirLLwQW78tSZlfaVnf1thtYkgCbskle2sC0oxXeEjrwO33qgQfAf0RvX68=
X-Gm-Gg: ASbGncu0+nhPuRy4ux5sFgveo4KFALF1gZTKNPdLZIZZ2rW5pGresX4iDOGzNN/hzir
	Ouj3UPNH1422md6mOMOuSnQHBmG5WHfsciYqCLQmFmz6HUde9KtxlQXPaK3bGhZmhW9s1kaQDqk
	n9jj88hzCjhhN2HNjzgNasUlxi7wY7J8/qp3SRA0F9jMcF0zPRos3tcNU7DdeKYGZkxkSR9VT2R
	kAClRBZKvADG9VcEW6BZzsMn/1AMxM6gQuZehjtH/OPZWmDC4/9YkjPO1C4gkKk/tzblY8Spczs
	V1cSh9+XVNdOc9Bmt4p+5nhawUocCQ4o7eOatq1ZHgKmKOEmeS4vbt/7/a9GrUkdNE51QsQ9qgk
	HMk0zSFoWYotsxXsabBi7nePo8csrClR4dY92LnW2Iqc=
X-Google-Smtp-Source: AGHT+IHzBt5hdqBctHz4x9S5F/NdBCGMXBgK0ytEDf+klfhGJCbW7H8wptMemYdfhxTy5YEqDCSS8g==
X-Received: by 2002:a05:600c:37c4:b0:45d:da63:cb09 with SMTP id 5b1f17b1804b1-45ddde81392mr91200965e9.2.1757571802617;
        Wed, 10 Sep 2025 23:23:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d822fsm1140443f8f.53.2025.09.10.23.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 23:23:22 -0700 (PDT)
Message-ID: <a52f809d-c8ae-411a-b305-46fd4233e2a0@linaro.org>
Date: Thu, 11 Sep 2025 08:23:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: Fix speaker quality
 distortion
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250831151401.30897-2-krzysztof.kozlowski@linaro.org>
 <DCPKY2GED44G.I2DSV6ZBXYAQ@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <DCPKY2GED44G.I2DSV6ZBXYAQ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2025 03:29, Alexey Klimov wrote:
> On Sun Aug 31, 2025 at 4:14 PM BST, Krzysztof Kozlowski wrote:
>> After removal of first AIF_INVALID DAI identifier, this kcontrol was
>> updating wrong entries in active channel count and mask arrays which was
>> visible in reduced quality (distortions) during speaker playback on
>> several boards like Lenovo T14s laptop and Qualcomm SM8550-based boards.
>>
>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Fixes: bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI identifier")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Reported via IRC.
>> Fix for current v6.17-RC cycle.
>>
>> I will be investigating rest of lpass macro codecs a bit later.
> 
> Any updates on other lpass macro codecs? Is something still broken there
> or are they fine? So I guess the changes for wsa and rx macro were applied.
> va, tx?


The remaining two - VA and TX - are fine, I checked them.


Best regards,
Krzysztof

