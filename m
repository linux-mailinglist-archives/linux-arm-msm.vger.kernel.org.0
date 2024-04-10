Return-Path: <linux-arm-msm+bounces-17096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511C89FF1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB80A1F2107F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20FA17994F;
	Wed, 10 Apr 2024 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwvKEMZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF4317F375
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771515; cv=none; b=lqWMvqpnurO4ftjlbr/oFAOQeVKgQPN1aaT5AhWR3RQCYOO0wJtEZrgHNXhXXEo7hMJzZ+LpYb69gb1d+HmRotyQ4JTJy2JuCEyZdzZzTD72AnDUT/8J6Xj07EpC0C0Im1j4cmJ8pLNmIN3ZHm7//mGER3HdqY8g5JT+1nq8QxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771515; c=relaxed/simple;
	bh=GNGxTomVe9SYi6ouodd8VfUTWpqqNdcbzrmwqYTTm0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gEIfsAQVo8ZUMGlh9I+FahLZWm+AveRgFdpX1AaoHKLxkCWs3RmnhdbCwqsUz6z/ngrSU7FQdKE+/hP38nj++eTJXoekYoYwyPD76wjv2Yy4MrO2/6XhvDBNe4bNOBXY8fQCZdW5paMuelRlDw8Yv2szF0wAOSgCP4jl6lGe9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwvKEMZz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso8128332e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771512; x=1713376312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=;
        b=TwvKEMZzvaej4/7dArmY+TRR7tNwYYqBIaRp05CW+n1xIxIOqui6lNhZzKoEktymrM
         4iarcIuKo1dl1dtmroiK4L5P73E1tPVEaN3mCNBD7mXOpXHT8cHzYKUAOuV7/DA1VIWP
         1N+OZSqq3WsxnAlIcGOlZeFE2qNQLOo5r7iYFP+MBBWDH6aapxlSZPwVG+YSipUyHAmo
         h6wcarnlpgPJfzy9zanZDrOQ94mNou3Ae43FQ6jGdZMLg+PUtM+qEbSgtbZ5B6A2zvAV
         zQ6Ual/O4kPwBs4ifG0N3LtjRwh9qN++i0tXKZs+yasiBElrWDVvtZRsCIaC+ueMHQb6
         zC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771512; x=1713376312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EH9Pxm+MZUB9uIJB2EAX8UISWeLkvrbIq4NwMfK/no=;
        b=NcCdKOvdxAl8KCp03ECVAfhxeB0qjpHz083TpJns8xKb+3N5SK16DGD8LBuEb6wopW
         loWGT0dWy64KpnOSEdC8Z9DtMVY/py1Jm3v+5AXm0a6oHdDTKhybIDELSskRBPOlqciu
         /X+AI/jtXnESWfFQOz+m3WuF2mllnonJMRUaIYUry80g8jAyhjQaQY7Wpkl/kCiATrKJ
         M3fbTw0fHVD2OZhDd124osDhmoTPYM0ZACVN00lLMpN6ENxLD6D8uSLjehLvVr2h931I
         gtESNw49udrYEBqMB41fgh3sSQQhNmAwMW5liSyZLyhKSZgR9EFWQRtj49gPF3ls1IC0
         jgig==
X-Forwarded-Encrypted: i=1; AJvYcCV03wSNWVaVn3fDGuJcPfYel2wH9suuSTohFq+0CZxRTF/cadv1HV0a6fo9tIcmD4m4Ehiuffrnd+t+VKA87XVBHD4JNjzRppedZ4qFQw==
X-Gm-Message-State: AOJu0YwW+L0ZQtpf+ryJQfBc/V9nWUhekEs+PKwwQRBaZYZRSi7sKFH1
	58QeoxWFcXiZwlSqrnlHesns3aXCSUikeFl3Wb/ZH1qpLBhmSrRgGsBAAChTsiI=
X-Google-Smtp-Source: AGHT+IFEmuU/yIHrAY8NuucyCaQFKu+VnZxGulNdN7KpD4j1m+7zPUv7hS0ZitZBToM3exxMIntetw==
X-Received: by 2002:a05:6512:2c95:b0:516:c600:64e8 with SMTP id dw21-20020a0565122c9500b00516c60064e8mr2674529lfb.1.1712771512162;
        Wed, 10 Apr 2024 10:51:52 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x26-20020a19e01a000000b00515a87668a1sm1905343lfg.77.2024.04.10.10.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:51:51 -0700 (PDT)
Message-ID: <3ae3891c-32cf-450c-a68d-0f80f9192bea@linaro.org>
Date: Wed, 10 Apr 2024 19:51:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: qcom: sm7150: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240410170150.248428-1-krzk@kernel.org>
 <20240410170150.248428-4-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410170150.248428-4-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 19:01, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

