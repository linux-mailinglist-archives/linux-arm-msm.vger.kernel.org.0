Return-Path: <linux-arm-msm+bounces-11626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F96859CF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 08:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E95842810B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 07:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA3120DC9;
	Mon, 19 Feb 2024 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="agmGWt0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987622324
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328042; cv=none; b=SRdNKaOb6nLbCUy8OFcIpFM3hhCSYuY61NQN6Qxf418IAKe3ZTNFzfi5sJdfdDS20twIWqHvyvFtcjf4hiRBV9uo6rGmAmxZrMnS4HF/A4+KF2wFI5VzQnbceLtYNLLDGvBxvZZflBwtwAYgUQCzFktAuAPkhPnvbSfVqIpIVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328042; c=relaxed/simple;
	bh=pSGqYWEkgA5r9fvAZaRNq9VpI+rNE64hzozwKd0Iv60=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=otiYnVJlM/gviJLTEf9CT2+JZ0neTTfoq1sFvdtqX5vvn/wGdVt2yOOnAtwVnMFTZ6wNqZ3HLz9hugnUccZ+sJKwcPtJm2KclUm7aznqo0MuW/EqqxbmwdCCJ4yNATKegscBLHGs0uPANbcuxPIfVDY1+EbpudCID5NcJ+KC3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=agmGWt0G; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-511ac32fe38so5938811e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328037; x=1708932837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=agmGWt0GYXvSMZ5nFELoKzr7zFdgt7JzmtUYPeiiRxQlJxcBoGgOylwgHzarSE/PTY
         tMd1EuXOdLZH4pZ8dLddHn4tpz7r87EivJpJpv7W8qXRIGa+l+1YC4QUnpmh/0NFxJ93
         Z509cUXTYLax9/aNTu/CbDLPUv3IJWLNWt4qGTK0MrcK4Vhge74X77GVWFKZtZ8IiB7R
         N3lR7s/ZNj27Ps77ra8wHKaAswIaatdghJZ3rdc7diLlfN+MT16abFK4lnB4flsJ+bbe
         JZuGw2fYSioAVUQtJihYeokp3zbnUK3y5CHrMKBVALcXAWqrNyuQIKui8Jn1Vr1jOkKR
         hCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328037; x=1708932837;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=RoHKCpiHpXwUD1qNO7jFD6bNj44RlFMNOUhh1KuYzAoyv0g9FDCnpQJpvVJTCId8bi
         GyGFTuSslDgdq9a3PTDNZV0AyjpY+EiUx0z/3iX13lLbjYJ/Q2GBHSJvCjI+ED412iHM
         9J9Pwc93AREz+cc48hTTkPLZVu/Z4S7xHW/KXPc7eEafoDnjsZklak+3SZD8lcl0IPQ3
         uRofAdDK+U38fQ2eKLqlIH96BIv5xMWU2jmUS5/RVQlY0s00sIsi0JEG+F639uZP4H7/
         yOntJPotxBACMEh80fJChVmiEHvp0QHFXwlpRKDF26QNbWzuctCEDg/gnRoSSbc90qvM
         uwbw==
X-Forwarded-Encrypted: i=1; AJvYcCXnkXREUGaU7SCzLw3VJ1ViGriHGTqxULU3md1LSM+F/L70Ve6C1sh6IqDH3pMdfv4M1fxJw2T+H80Wl7UTgRcdvT76dE+g9D2r9mk3xQ==
X-Gm-Message-State: AOJu0Yxuezk/iVuZn2lYEZ5/5KPF1RIRtUPyyAlnnMViKEhgxO+F041I
	nhKvvJct//cn1t+SPzCthBtAzo+rcBe1JZtb7WJZiZBWGQ9Fh0NtHGu5ZP+L36U=
X-Google-Smtp-Source: AGHT+IH7t2S3UJLlE+g5RosWguA6ACJo1jYaUo0HRFcgzCtXQeK6rSIGLys7KhAWV1PTPsrhu0txhw==
X-Received: by 2002:a05:6512:3144:b0:511:84fe:8dcd with SMTP id s4-20020a056512314400b0051184fe8dcdmr7786108lfi.1.1708328036943;
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm7611582wms.26.2024.02.18.23.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Message-ID: <e6c6e825-42dd-4f2d-8329-f7b3e09bb8a9@tuxon.dev>
Date: Mon, 19 Feb 2024 09:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
 <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
 <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19.02.2024 08:59, Krzysztof Kozlowski wrote:
> On 19/02/2024 07:25, claudiu beznea wrote:
>>
>>
>> On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
>>> None of the implementations of the get() and get_hw() callbacks of
>>> "struct of_clk_provider" modify the contents of received of_phandle_args
>>> pointer.  They treat it as read-only variable used to find the clock to
>>> return.  Make obvious that implementations are not supposed to modify
>>> the of_phandle_args, by making it a pointer to const.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/clk/at91/pmc.c                        |  3 +-
>>>  drivers/clk/at91/pmc.h                        |  3 +-
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> You understand there is no review for "part of patch"? You probably
> meant Acked-by.

Sure... Here it is:
Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> 
> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/process/submitting-patches.rst#L544
> 
> Best regards,
> Krzysztof
> 

