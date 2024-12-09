Return-Path: <linux-arm-msm+bounces-41031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296BD9E92A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5090E1884186
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01D32206B9;
	Mon,  9 Dec 2024 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+KeJB1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5921B8F2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744562; cv=none; b=Rl8CS16cFtpKPZgEfTYoipLyrqBIuqjRecuXoOly9H5BeAnFoJ9gyMhRo8iunNYl5muaUxPWzx67dKRehHX8enTzNt8tnev2dyjrHUr3ANX2uz9GElX0R98SDGew2i+Dt0xSZ1/pLViiak3AQ+L/O1gtuA+oZGV59Kw84F0H16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744562; c=relaxed/simple;
	bh=IK6FGWxcat9ec7DwdOXaucjjIx7nIWIyPdA4xF3OYr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S4YKy1y0XDDEIcZORfv+bYc8vr27Zf+Qtkv+CI5lZ0J425FXWdqMarmGLd2VANPM6fp/b4DpT5Z7bYYqMVOj708ofuTWNnnBAd9RoDGtnxQZzEYRN2WK0Y5idgNEX9rIg1S65t/sx95rFYCHCxN45YgcHudrTZPE5CZl4iZl+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+KeJB1g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434e406a547so13550675e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733744559; x=1734349359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=h+KeJB1gWZdA0O+YbfYnqu6t/91chujbV4h5r0f9p23mFbZxGx9LYr7R66e4dHQhxH
         IwJHEvNhcw1B6UOoqno3SqgF8b3T+7lar07e6unVNQ9CtMSKe5TLqL3IGsyH6wuaoiKT
         AlqVzMnH5suHl54M8nLjsqZ5VJwhIWTqe/N9FtVE5eDdzD8/f91qHjVBIcYdmy94LSnf
         lA67k5kPTJ1b4Pn4jECvfbW4MlKOaCrGXJhX+4XJMJZYkt9HKmyEidSDdUo6EPitZaDv
         jEZzOCmihztbi0vonrZqV8DCjZTlGCY1oF2Spj2JXEtEyjzzRTXmtCjQQNfHprxjF8Rg
         EM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733744559; x=1734349359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=BEBJE6GEafM4w3bPZjJnGABPaKm2F+mXnuH/5rbnV0kpDKK7I3FxcWNe2YfcX/SKPe
         zdLtDDa2ZCJmJJ1fz7clble3c/qbUPNRCZiZur3Zx+P/GUeN+JVqNGPswL+ptj5c7N1b
         HxH/QlpAwxfxRRLwossl7fUIA3U1fArHZ2I/1IG+ZRITiKHObVw3nnwExzZtG6Ml6Fh2
         8KepYabSwJO+kqi58Uo9pOY4xl+7sLUHJOFYj/0j0I47yG72HFr56i6yvf6kGVM26EIr
         KqWU8dThBOU6dRotXU50TMRrfH0DwGi+ShkRP07FJQLKJcAkFzn4uEfL9Nkeqy6CL+p2
         VdpA==
X-Forwarded-Encrypted: i=1; AJvYcCUjxhkLPpFRCmCyjyYLJC5dO6WNktL/rMrpjnug81f+ZV6kzEd/QWdI3vjbSs6JkZEf6xq5s4LIqkjpfyZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YySCTP4yIgYVJNrZai50o1mHMzgyr7EJLBa3JE1rWLP1W0CKF8A
	nJgGn5ZuSK54dS8KP+j/PgzJafNcM5eSi08LOJuzv3XSEUlXRxn0FirjEtddYN0=
X-Gm-Gg: ASbGncsdn3N/crrUSc1VyLejSr18Lx5uAvv2+SHhzXQ2/e4cr6MA2RvEsaPFz0HcP9T
	zX+kQB2cKjf0U3U+MpGDSMayTwSKxlWUO3WTGD6xAtftVqu8CXj8qtV4HkgjeWqZEYremtN17PJ
	OyH9KIORMv13yw1CBowZSBHzczVNaY7saiRMYfnNEVBTfj+BGJcYchU30n8zDCUzFilix24127W
	l2xn15bTdPAfJYU4H/4jGU9IeoDVTlKNcdrBNR0smQqUJZl3NY9YutUGeyTdZw=
X-Google-Smtp-Source: AGHT+IEbIQYg8EnIUDUPigKjpDEo3nHZn5oUqp1eGUTq6LEGGzSr1WjwD8bOZqQ7VZz3k53CLChrPw==
X-Received: by 2002:a05:600c:1da7:b0:434:f871:1b97 with SMTP id 5b1f17b1804b1-434fffca42dmr648225e9.33.1733744559181;
        Mon, 09 Dec 2024 03:42:39 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f2b08972sm60014355e9.27.2024.12.09.03.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:42:38 -0800 (PST)
Message-ID: <c8f42175-3501-4d65-92ba-5878fe5ea5f4@linaro.org>
Date: Mon, 9 Dec 2024 11:42:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 11:34, Krzysztof Kozlowski wrote:
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

