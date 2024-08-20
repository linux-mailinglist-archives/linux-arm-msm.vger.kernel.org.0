Return-Path: <linux-arm-msm+bounces-29082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDE9582FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D03B284880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE69418C34C;
	Tue, 20 Aug 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM2SSEru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F993E47B;
	Tue, 20 Aug 2024 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146821; cv=none; b=I73QEJkSsyOdyEx0tQqXfNif7YVxTrNMN3NjRZQlpsQ1kJOxSDAvMRXyK3Z+NDvMx6IrWo9e++Pxq6FJkusVTdVlv5Od06kVLUzQ9nUFGK528EQoYQQGrE7eMjUNAWZf5j4h1bfBLeBBeCRhwFcN5L55zDRE/feZJMX7wqvdX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146821; c=relaxed/simple;
	bh=lXEEDwRzoFc+Xn7QACfiLEhpgAwRwq2ArplWqB3K3Zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+98VchbB/LntiHWPGrqbuD0VhgvrezBN4oE45bL4B2CJrh8DphqIIzS8kxidEDYrZBrHljrYH3hBMdzFrYs78aGl2QP/ONlOqq8Qeto5ld2wZc9rRl3rmB/OdZjF3sPLFsYut9mjjzWkrozoERH8Zty0Q3LjT2+DhldcwdbVbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM2SSEru; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so6834351fa.2;
        Tue, 20 Aug 2024 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724146818; x=1724751618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGdzoV4raGjUE/t8kSVhE9E8ZPs0EkYSUtLm853VbOc=;
        b=VM2SSEruDzWSP0G63srd0/pqQ6kaQaomIrWpUpVLO+sh+UaL/OByRnTrhHQetVvl61
         H8a5ud5s0vWpE1ho9mnd5aUqJHbz+AKRt6uJbOJMHldvYhNqGKmLg7bfyyw172/Tu732
         UNn34BdtQi5pn9fmiTmTihOnmAS5J2KhRs3KVXMW8WRl15gMNIfif+9h88JYi4cPRMaz
         YLE8YsAood8bP9YDjjt3zEBnh2lSYB6CeIgUaWHv43tGEOrLL9eMbgmMg3F+Dau2DnAC
         qq55Up1e2tU75b+6vvC1Q1gSyXDadqwPJCuSw8l+cRmVLnZvaO8hz7JQo/d5di0Am1/c
         8bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146818; x=1724751618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGdzoV4raGjUE/t8kSVhE9E8ZPs0EkYSUtLm853VbOc=;
        b=szGO8MaER4A3HqjUBqJ1La7CC4hdFEvSjgSmSTACyFNbqMjWANrMPz2k5JlOEI8QnC
         o7XMUDGx18RosaTU/UYv/k1zmnU3u9xAyDkV3jaiQeI8CsVDr6JK5Q9hHvm21OQaHwU2
         xL0yXG+ce5SVlW6vVVaNjOkKus6dphhSXVe/p4b72y9fUVBBW9NNCIzeHX2yR3lAmohu
         drv8NExqVWixdgaiClHvhdbqFosKrnhE8u23LZTcDVfT8tJ3QWuaAq8AhDSnz2QdH3ys
         DwHz43C8fC/ZHIMrttbL6PV5p+1n8vxJ8JiDrM1gR5bnhtehsHBFYaLzU6UAEdO0Ilwe
         XqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbzb1NF5aW8TS/oAUkgV9o+9FhCHuJZhNAezxVQYzSo3bx14z3qQ7KCeoGY9K5kXD4+sN4FJShbszMNvR1JQxrSs+HUqAjPCjFOESnJDnOd5wJ8mh1Uje7f7eGW6ubdDUstcbTw/F6XFdvSyKrMqgx0fPx9UZnU4QrE0YranTsg/TPewzLajEKM8yBuSPewBthe4EalP9jxCJ+4kw5zWhlarSOMQ==
X-Gm-Message-State: AOJu0Yz0hlScqt7uWC3rq0jRTUOZVq72Z2iUdzC+lqZ+NURiAAa9mz5P
	ou7MPMCUnms/+Mr34YX7dACRKiU74WltcCnFjWHYurABNKg0mRKu
X-Google-Smtp-Source: AGHT+IHYRs/auh9A6D5deXi9S3suCxwWcI02PT4Az0n5KToMYJ1uE1P/dVslk8K+8kXcBvwm0tVGsw==
X-Received: by 2002:a05:651c:1545:b0:2ef:2b05:2ab3 with SMTP id 38308e7fff4ca-2f3be574d67mr103145531fa.10.1724146817182;
        Tue, 20 Aug 2024 02:40:17 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbdfbb4asm6564664a12.52.2024.08.20.02.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:40:16 -0700 (PDT)
Message-ID: <945edee7-f1c4-42ba-b4c6-c600cbdd70cc@gmail.com>
Date: Tue, 20 Aug 2024 11:40:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
To: Adam Skladowski <a39.skl@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2024 5:25 PM, Adam Skladowski wrote:
> Introduce support for audio card on MSM8976 platform.
> While MSM8976 falls into v1 category with MSM8916, digitial codec clock
> is not available in GCC so we have to set it in machine driver.
> For that reason for V1 clocks new boolean is added to check
> if we need to enable codec clock.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3ed35beb671a..8219d4d55625 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -35,6 +35,7 @@ struct apq8016_sbc_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
>  	enum afe_clk_api q6afe_clk_ver;
> +	bool dig_cdc_mclk_en;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -242,6 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
> +	/*
> +	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
> +	 * so we have to request clock from machine driver using V1 API)
> +	 */
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
> +	    data->dig_cdc_mclk_en) {
> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);

Double space here and below

Konrad

