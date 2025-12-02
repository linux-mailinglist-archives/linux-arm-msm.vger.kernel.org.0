Return-Path: <linux-arm-msm+bounces-84087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3433C9BB4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E45F0344CA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BC2214228;
	Tue,  2 Dec 2025 14:04:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73948315D27
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684284; cv=none; b=RP4rFg97GqPYSVFWj1NhdHu6lJMtSnntYKEupmHj2TXghzU7YGhuobGPG4TfgIPEe8edt32K1vP7oOE6/1g5Zf7l6ZmlsoBxd4KBAw79/UtMpnJemTbVcDvVhYsnwaoEyDVmxMUHMGF7yhdJ7mrxUlHuHaeh4xAYKjp4toeuOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684284; c=relaxed/simple;
	bh=ak/Rt6uWiX+MT4pBJfZ+PD2Fezju7a0RibofMkxgxGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmv9vYZiE3oUhr6YL2JP6wpVSxtpfzyU4/YSqwuCrEJzBcw0pg209BBCG0YvTsLaqicsFPWqu85P3ZRAOcIgxjpAI7KMyiNRXQXJgH8XKUOfbYsPpuTUpH9rqSPL5AkCNlPscRTtsuea0JNAyUyvxK9j2HKP3xHY/wvwAaxvj4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso6545992b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684283; x=1765289083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=;
        b=aLgYVGwTTEqnW+sWiOzjSYUfKKKAbUbZHguJkotW6uweQkgBR5E4mD8Aix8C86DowJ
         LKn0dLmDF4jUWbBbvUBVL0DbJFyUwDvwdb9JXHMD/uv0/rVETHsK4OV8eqaRdGR/332S
         M/UCBe2UOk4XyNWMYBO3V12YM91Yy9/vjif705SN9tVG4BSsGecNWBEJfgrBZLTfCpUd
         wqpKcg+S/wViOQEa9a5z1aANaAdYGDXq6FjNPPEEsegTLkS6pmK7eE6kDsQ3htlYatwE
         h3+0gVmqToYj+9mSvJ1F2U/zycxFftcNx56nxEUSxiyLCf5MtcG0vVxPxNTtTOnBcr+r
         tUcw==
X-Forwarded-Encrypted: i=1; AJvYcCUY5lUFLxqZDW4TR0XvPq9y+v9KAz2TVETU7SLY6bmRgsE+m8cX8Ks2J/aNTOtjNtxVIbNynmvPQLNUVNtM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/KSLLDXP3L7HlFjkYMzaoZeb/5cCNm03M4s/z6UueSE3lTA3L
	Bvl5r1GSclWG7b7Y/HGUZ/NGkAJC/nnxxGKd1DWmdNNp/sfTv2topH7HYv5O3sXN
X-Gm-Gg: ASbGncvzmOO5+Okz0x7l+GgqoQlw34noBEvgn+Q3QuNBOsCXNpSw1mamJOqneTb2OkK
	wMCPqIU+tJtrvYp4F8kCbQkDGGwaSDETEtSu6gi0uyFFgRkleNB2rBXbjotUr05KmIrETy1NiO/
	AEmmuehxCCNOTHiPy04jbO6FPDw5KnYiw/4nX8ucEBoRPTov4X3OyMyIKCzM7WcU1YXSWpGHBjn
	3Pw7SYWVlNc46uBg7HLqL8cpZgorPzxfULYs40jxkv9zC0/ACnSpHzZF6/MKWp4N616q5i70lYy
	EQpYXtOKh/74Fm4MHgEHZIa9ysEoJOXFFs3lOUnkIFY08cv/wJEcoQhMicMHolxgDU02go94W1w
	XO4faYVQy9JW3/vXviv4288eAxiiW8E/E0BVpYQEjFhjP1EMH9pnKHM1iS4Mnp8PrBO66VPFS6S
	sCxGrbD050v2wk1oeKZXsgFr90TNR7TLIPcPfJVuapOJxpiTkSyAXiqzYxUrus9CE=
X-Google-Smtp-Source: AGHT+IE5NbJ+QqpN8xUIm2eIJYfU4UFCYT3vDs5liqdtA6FTK6/T+qYfRyo29rojHxg8Y5qxmpOhhw==
X-Received: by 2002:a05:6a20:2443:b0:34a:59ba:30dd with SMTP id adf61e73a8af0-3614eb7a125mr50990203637.20.1764684282443;
        Tue, 02 Dec 2025 06:04:42 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fc5a0957sm15659175a12.16.2025.12.02.06.04.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:04:42 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bdb6f9561f9so4990058a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9rBNa7R5KvUP61HfuaRZkLUpCqx30mYgdd/r9F165tFGguJUd4NScPEU99aAGz904cIEx8sWvfvmLOcKa@vger.kernel.org
X-Received: by 2002:a05:6102:26c9:b0:5dd:89c1:eb77 with SMTP id
 ada2fe7eead31-5e1de39d9cemr17004298137.29.1764683823416; Tue, 02 Dec 2025
 05:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 14:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnP_BfEGwKLqJN8UevZeVXg10-IsXC-lVqCY3H9e2HFkqZ11liOD_Kw768
Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Wed, 12 Nov 2025 at 11:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch, which is now commit 6ea891a6dd370ab2
("cpufreq: dt-platdev: Simplify with of_machine_get_match_data()")
in dt-rh/for-next.

> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>
>  static int __init cpufreq_dt_platdev_init(void)
>  {
> -       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> -       const void *data = NULL;
> +       const void *data;
>
> -       if (!np)
> -               return -ENODEV;
> -
> -       match = of_match_node(allowlist, np);
> -       if (match) {
> -               data = match->data;
> +       data = of_machine_get_match_data(allowlist);
> +       if (data)
>                 goto create_pdev;
> -       }

I think this is a change in behavior:
Before, the pdev was created immediately if the node's compatible
value is found in allowlist, regardless of the value of data (which
is always NULL, except on RK3399),
After, the pdev is created immediately if the node's compatible value
is found in allowlist, AND data is non-NULL.

>
> -       if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
> +       if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
>                 goto create_pdev;
>
>         return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

