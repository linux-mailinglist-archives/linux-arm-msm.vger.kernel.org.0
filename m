Return-Path: <linux-arm-msm+bounces-49079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F83A4124C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 00:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1610F1721E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 23:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B968F23A9B7;
	Sun, 23 Feb 2025 23:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7W5rXcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E416C69F
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 23:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740354238; cv=none; b=iJdjDWZjF+O4u4/SpkYag2eKrdTyuuCbZnI4CQSs7DrdiIvE5EqR0gHKHbc2r4vRtUQtVP7okpk+LetutNwDj3TxtS/97UVFUUhAFt3TQO/xw+h/5doDTUYXWSWCSRWrWp3V0+Dx05rzY6bg+V0RbkUNrA9G7YqSd+bIVVl5F5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740354238; c=relaxed/simple;
	bh=deTx+omgnbLOs8r75CSTqyV8OyfmK0sMG1fGy+1WAXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4O2By1Erln0xY/UcQ3h5nTOwcXgVvevM19wIkQA//taKZTv0cWkuVXjqJOKHkBJnl+qcKZ4bUV1T/DwTE8MgN83OuJ2mVEk5KMtdkXVofya7WQKzmQ3sfgd0aqKKSbQ/UaPT0KrHLUZjsBG/0BFOtcsr7UjPqLtu9LauOTMa+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7W5rXcZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso4548711e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354233; x=1740959033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=;
        b=f7W5rXcZfjbLnPu9d2Fjv268Mx56fiFxIf7KMch/7XYFz5jSR8G6VpdD5oxO6TSti9
         ZgLPrEdkKf/2JBZMhBv5BHOrjyvIJu/pNsEr+wS7t1ujiDfvJlNEaXJkNEhbTxX2AmvU
         rQhc657cnWk/CH4/Qie0Vk4zZFHb5F3QdHhX/nOpjlkVkstIRXLcPryCBD+ONifqrpN2
         YZH3dPrWnt4R/Z9SD4yh2wFoV+1vJRRw5mmBgP3kuw0Ej9Dp2AFyUJRpeitI1PCOYRac
         IHO31DPVQImRqq3/jEt8OkWGH3CdKhuMp4mnco9zXXwD75m4U1hu7NUon02d3SKAOcZJ
         5tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354233; x=1740959033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=;
        b=nh6zYAtxUah31DIEoFBxcypVh/D8a2RJogRzLCHx0vAY4XEthdlVwb7ijKxiqMy39K
         BXKcW/GR3uTgt9/P/qlwczDd6XXlVSSszBsIpkTyLH5OueffPKUzXIYmoLo4I/sS1M18
         YZDbt9YTR6aIqH14QjbSWZ9AAQ7RAC3BI6hxb5xYvTxmO/QX6ZzNctQX7Ls8maIwRckK
         AQkx6kFeRqJvsbvemehvirspTJZ7V+MZQ9gum4gG/O6tLtP/6/gDNbaDDIujFbH5chv5
         p8SwPndpTk02cnK/qNcJQZLQ0dlu+hFIJAAfk0nrPcor1jdn9b82aZB2onUf6FiR63z9
         c3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYvuTbWOiFI7e5t2/9OTxig3BcYZaB3R1+uUU7nIvC1KuaO7D874WEiIwGvFsiGOsEaBTPrLYdMsRLvtss@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQYCJcgS/nkYOd93ycMCaPq5bXgHJqQ9SiBPBC8+/6zK8KiCS
	/7vCeTj75dVz4/8VtW7KmSjznJ6NJ2UYFcxz0avCuQNEqF7ywjk+gJyUImF3/l0=
X-Gm-Gg: ASbGncvhJgq9XAo/jG+KT6WcxWleyRAWVdYwr3ZEbsH//aOhQ4qAlFWxFFxA9mzzNFW
	PDvDjHp29FEH6ic9oaxOakwFFBhChbL3CGBfRVZ8HRvyHB7PAtvcIYtcFyx74PtvUSHVAHVFWnP
	abFAxAvFr8/h6SusVflJRzoNGuuK24ZbOsQPmoXXG4gwSBXPNexvO83VlGOErS/mJT3jbwSZBYZ
	Qys05EdjIQcSUpkR5tybuF/NVGVDgZ8BJfAABUI9JpP+u1CLmjY97b3YGpgtxk73M7KpkuVJFQU
	HXNi5aX7Pqa6l4IeWP9OHUzEY5HfMiXPRFr34XChJvAVmlL+AYi2DwzgZvbYlcchG5mL1O5kLMt
	vSwLMDg==
X-Google-Smtp-Source: AGHT+IHqDyDmO/r2yjSG30eHo/aZTvnzBBS3IoH2SUfydcMTabalwcojF162vAWAlTXJ3voBa2nsQQ==
X-Received: by 2002:a05:6512:308a:b0:545:296e:ac28 with SMTP id 2adb3069b0e04-54839144ee2mr4857016e87.24.1740354232909;
        Sun, 23 Feb 2025 15:43:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54526741fe5sm3065509e87.90.2025.02.23.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:43:51 -0800 (PST)
Date: Mon, 24 Feb 2025 01:43:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200
 support
Message-ID: <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:21PM +0200, Ivaylo Ivanov wrote:
> Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
> binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
> reset lines for reset control and uses more clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
> ---
>  .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
>  1 file changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> index 22c77968f..f4164db71 100644
> --- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy
>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: samsung,exynos2200-snps-eusb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -31,12 +32,12 @@ properties:
>      const: 0
>  
>    clocks:
> -    items:
> -      - description: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    resets:
>      maxItems: 1
> @@ -58,11 +59,60 @@ required:
>    - compatible
>    - reg
>    - "#phy-cells"
> -  - clocks
> -  - clock-names

Why? Clocks are required in both if clauses.

>    - vdd-supply
>    - vdda12-supply
> -  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        clocks:
> +          items:
> +            - description: ref
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +
> +      required:
> +        - clocks
> +        - clock-names
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +
> +        clocks:
> +          items:
> +            - description: Reference clock
> +            - description: Bus (APB) clock
> +            - description: Control clock
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: bus
> +            - const: ctrl
> +
> +      required:
> +        - clocks
> +        - clock-names
>  
>  additionalProperties: false
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

