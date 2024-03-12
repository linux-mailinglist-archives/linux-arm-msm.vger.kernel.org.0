Return-Path: <linux-arm-msm+bounces-13878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA33878BBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388CF281D21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81BE372;
	Tue, 12 Mar 2024 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o7cJD2kI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F89468
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710201717; cv=none; b=MPhOWK75XJPK/3i2kiQgp2ZYkxyC3Ciee5Znn8AQnZO2yT1fpBu1bjumhR0tL6o1jpN8jKNclPy76JOdzMQ3xFzz7fyvs9BXnzm9u9lYyVpeImZ4Fbt437Rl1QT9kO/CI8zFh7fyN/YI9/nIJtMj7VYyP7RDtnuZcp1ELuQRHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710201717; c=relaxed/simple;
	bh=pyH0/Y2URKEgytRLvNHUUM77rWJEsFg7E7rffphV9Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5Vaq/E1zJuqMk64CsHegtVF7FFfa4ebi0cpHqZ7zdPtGPKdf1v1ehX+N7EUXPH0h8ndhZYYOxs7j/X2xagwbnTrxjVVkg0MmPrB+8CCN0GJjhaLY+ihyZbv4Z4zhK+AXya7ybE/1UFgiBtykMST5KRChX7FISwRAGbp6fss2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o7cJD2kI; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d4141c4438so76923211fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710201712; x=1710806512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bw8QHazMu9Fh3V9WPOJl1lKgsQ2oGU99VYSdMMQahiM=;
        b=o7cJD2kIvinblBh6TOu6hpSVaCrK5BDfqQOvFXYQ0vb7DS/7NQ1Y5JnkJlEUIgbyvg
         NeuNuF9zOdq8bTpjT7mJM+dLX9nP/obUgJtcOvfMKie35SaZFKo2NxT70vWmxk+DL98/
         gyJZPTr9GLEPbi7qM6Z1CdjtX00dCNGNyWaLANUT06Mdhs4/bd+zByZpojOww/gXvI88
         RFlVnUxGXeDsaN8y2Lv8HmZQrU/MU+IgAbLdVh7/hmEQLxY6AUps3uzyBg6g7lxobdde
         Tuwgs6jl1BwDTCywIL3CvSZhxelVapRlm4AkMGatsbwLwF3/P2+FQNOpmC1Yc0sDkJc1
         y+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710201712; x=1710806512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw8QHazMu9Fh3V9WPOJl1lKgsQ2oGU99VYSdMMQahiM=;
        b=XQjjzb9Pg34BFuGqE58Agirh/9NH0RtxGRbAV9TxRAhdWLs96fkq3Voke1JmCNCuLm
         MS1Vy03yvF8MS9LFTTKekfrl0nwAXS+IlZhL10jAyvSGBfu07ldU/HJqfhrIPtCank1a
         AOOCoO7Z4TXh1+1+TIGtUCEGzrtUrhrTjwrdMez6WnmJHBUvlQSdo3EjLEawnXWRe/W3
         SFzyvTuXjscPXaDlDOVkVygMjGAENduwHp0nKU1PpfmyHtlR8T8QXemZR27knIvBA+QU
         B2qv8gd/piM0VB1yV/B6svRaXqEb9lFUpkER4oJkXlaO+Sn8A7cMpwvpoIeAUq2pazJQ
         iMQQ==
X-Gm-Message-State: AOJu0YzMIpv4cVTxuGnuKtdAnmDc9iJwH80YxhAbd32EM5sv/KcrGt8u
	FnAzcsQ9SE6L/B1BgakHjFemuYnAQl3xVWpPvF+th+gxpEp8f6UP5lBsYI9Ym1Qq7/2X448YCmM
	3dBI=
X-Google-Smtp-Source: AGHT+IGO6oDQSGxWvS/usMWsU07yYwr3deOSYyML/F6uaxC6z2eXxufqaTN6dfRzKOGFFdms/xGRWw==
X-Received: by 2002:a19:5217:0:b0:513:9b96:a948 with SMTP id m23-20020a195217000000b005139b96a948mr4821569lfb.6.1710201712439;
        Mon, 11 Mar 2024 17:01:52 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n16-20020ac24910000000b00512ebe62693sm1300360lfi.255.2024.03.11.17.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:01:52 -0700 (PDT)
Message-ID: <301380ee-1c93-49b4-b4e1-3b1289e98a75@linaro.org>
Date: Tue, 12 Mar 2024 01:01:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: clk-alpha-pll: remove invalid Stromer
 register offset
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan R <quic_srichara@quicinc.com>,
 Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240311-alpha-pll-stromer-cleanup-v1-0-f7c0c5607cca@gmail.com>
 <20240311-alpha-pll-stromer-cleanup-v1-1-f7c0c5607cca@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-alpha-pll-stromer-cleanup-v1-1-f7c0c5607cca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 19:45, Gabor Juhos wrote:
> The offset of the CONFIG_CTL_U register defined for the Stromer
> PLL is wrong. It is not aligned on a 4 bytes boundary which might
> causes errors in regmap operations.
> 
> Maybe the intention behind of using the 0xff value was to indicate
> that the register is not implemented in the PLL, but this is not
> verified anywhere in the code. Moreover, this value is not used
> even in other register offset arrays despite that those PLLs also
> have unimplemented registers.
> 
> Additionally, on the Stromer PLLs the current code only touches
> the CONFIG_CTL_U register if the result of pll_has_64bit_config()
> is true which condition is not affected by the change.
> 
> Due to the reasons above, simply remove the CONFIG_CTL_U entry
> from the Stromer specific array.
> 
> Fixes: e47a4f55f240 ("clk: qcom: clk-alpha-pll: Add support for Stromer PLLs")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad> 

