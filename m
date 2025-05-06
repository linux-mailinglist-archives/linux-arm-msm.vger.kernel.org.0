Return-Path: <linux-arm-msm+bounces-56914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D969AABDB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 10:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5BC5204E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 08:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C2C2609F7;
	Tue,  6 May 2025 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWg5RX3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B322617F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521379; cv=none; b=rC/ajLssM6B6J0Nu8/l38Udv1vf8C9a2M+Dlw2ZK/UIkQB2o68Ez0zaTL1TiGCsv6YpoWXp9bi9tt0j1VaJkabYz3SpFBBt0sYRTUhBhS3FnIwTJ9x0yyNb7Truh++AoP26xv89OwYyla9tyD1TIgZqyKKRnUj1FOAujQHQzfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521379; c=relaxed/simple;
	bh=lapmL4XXkzLQwfKJEVQM/oIUTraZNom4wMSXP3hH9uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8mczPPP0JRTQz5Os4ot/tnce58FvTCEbtJFbZ5MQ+cRMEY1N/Z597H6dv+plGIhsgu+q4rW+8U0TG2l9HvRvVRuyGE20CPgFxTXrY7fMwacJXwM1cMdL92DMs4uOaRJgdtbRT/XD+n8qkX/cw31I2SMxxI0O+DD+r3P4Gm+Lak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWg5RX3+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3595484f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746521376; x=1747126176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzGxTtDXLvBAN5ePbGP8uftxdGujZZRHKT0sgRE5gW0=;
        b=UWg5RX3+/ofjzPe82pF+tInZ9rE7olINfnxUmIlR5V/6RsWFFy/xKYyscCBcrvIxY/
         vClYJhrQLXELlU9c5I4zgDT14zUQA/TO4ucA1UQfM/H27BRdf1dE3K1+DVc0EbDN6dHg
         whgDNRTufVGn2eAEwUkD5H6L+S95MdzJuNi4DYP+5Y9PHZJshdadoQSkkT8acc415KQh
         A4qdc6mXlj4zodltO8fDMRUb9aBS9NuYpiy/tqw+pFOjRgJtNIz9585jErPpOnp6ct/o
         +nSuaAIA3YHYjP4uyl5qG5V+0aHua40RuptfTgU++ju0DrhZ4r53Niloa+ZaU70dY1+l
         qGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521376; x=1747126176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzGxTtDXLvBAN5ePbGP8uftxdGujZZRHKT0sgRE5gW0=;
        b=DEcT1jkhcirhbM8bv51pCyJdeECs2lX25QCZqu+Ik0XRguhXj0eKoU8S2A+CXH7DRe
         yL8bZ4IFkT3/+bl2ESlxe9529ot2NwAgWXXaaJEw55UzXGY7soZ2z2hNEQpSCe1RsvDG
         Ok70NvUmX24kTTuJ7CQKRWwGAvkvRvJ5zUtaWj8nNkA526+9y2A32EN3uSsRiVN3g/I1
         SyOWki+Sywk/H4+McuEy3TkO/nP/Wgr7mKAR2H4v8WNixjGmj2t6PaCU1IZuT/2WWkqo
         nHrVuPNsY7uQ5P9ba4jQixo32mmvnkIcOUJkUiE4aYSpx2mB8Fm9QnYZORxjtKk1t57J
         dLGw==
X-Gm-Message-State: AOJu0YwBo+s/PEJmMpBZrmmmcgAPBluDkALvl5EMxKD4Oh6Jmgh7JaQp
	GyIG1tJWn+CIaD9jiU4xYcAKPdBJmErMEFybuNFf1vDH4b76V/ZfSxUJC8oFnVY=
X-Gm-Gg: ASbGncs04OUFqvq3ZNnYoY26QM2uJx0N/9v1k4fD1OG77boy+GVFdkgKZndRNS96dYX
	hqsWEJQGoJ1HqyP4baqgA1TJv3gQ2WYWeVkhgRLdfnV5DwWm+oqpdYUqbU3ZaBfDB+8gMayxxVg
	TUKRi5apzDNGhapMeg5/HnnXfJBiunb3WLlB75x7m/Vto2g9ePfUQ0o35M2tmfu9HZU3fPoDnba
	wS9tR3LHHSwUl/BD//mmstaQOzYKnMlE2llE9E4SnjTH3eFOxQQc/anztY8z6AfiycogRWBH5oy
	TcXHieIVa5AqchILEzTSasmhsfddtzdB/f44rb6EhxNo3QicpQzW12KYBzpZhmzCZ/FNsw6+WeU
	2SHZxpw==
X-Google-Smtp-Source: AGHT+IHarR+7EjkTMAiam6eveCDdf5OEEIkCQCGW6Awa5AYCZ7FsFMiuBPIymOFLGLSvzGdXLPnzMQ==
X-Received: by 2002:a05:6000:40c9:b0:3a0:8ac0:bbbb with SMTP id ffacd0b85a97d-3a0ac1ff350mr1718113f8f.46.1746521376087;
        Tue, 06 May 2025 01:49:36 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d15sm13183115f8f.13.2025.05.06.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:49:35 -0700 (PDT)
Message-ID: <3bd7e192-a8cc-4f64-b11e-d07499ba4696@linaro.org>
Date: Tue, 6 May 2025 09:49:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: media: qcom,x1e80100-camss: Remove
 clock-lanes port property
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
 <20250502204142.2064496-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502204142.2064496-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 21:41, Vladimir Zapolskiy wrote:
> Since clock lanes under CSIPHY are hard-wired and non-selectable,
> it makes sense to remove this port property.
> 
> The change follows the same logic as found in commit 336136e197e2
> ("media: dt-bindings: media: camss: Remove clock-lane property").
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2e7455bd75ec..c101e42f22ac 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -146,9 +146,6 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
> @@ -159,7 +156,6 @@ properties:
>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>   required:
> @@ -362,7 +358,6 @@ examples:
>                   port@0 {
>                       reg = <0>;
>                       csiphy_ep0: endpoint {
> -                        clock-lanes = <7>;
>                           data-lanes = <0 1>;
>                           remote-endpoint = <&sensor_ep>;
>                       };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

