Return-Path: <linux-arm-msm+bounces-43011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5099F9970
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63441196135D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C5E2206BB;
	Fri, 20 Dec 2024 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbgEylPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209E225793
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717911; cv=none; b=PvrGVu+GbSGMLC9iyMN5R8CgB4zDiN+SVe/Fd9S/izTWUlz0yLKVajVWDhEtwNK4TUXFGvreZPvbHA2KJSGHnmBMZfWcUIfDkSVwrrhuaCu6v+4zsT3FM6IxzmzVO1p6tbiqHslFvAIIJf7BLJXcwQ3oQU5xmH26oyVwnGn0cbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717911; c=relaxed/simple;
	bh=e93gnd+HNMY37U/5lpNe4iPYbXAu8F+qckDxbB7DMSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlzUUqe/IeaDX4qYWRdYqUlEzxaEYW1H4N8oAake/WxFgdD75wqCxmha625CAoAVqnxK+Tv/iZgoXsAcs+VqLMSEcfMK++IjQkrQfXsvTfRDuzMbIFLS9oap34wtDdMenfS9aQCH+2tNzBrYCT8gTNT53bxex49UDdLIDQjU/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbgEylPG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso3297966a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734717907; x=1735322707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ha8GqgZXmMH7R06nfVWYy2HAs9IqUsEUGcLXeArf4II=;
        b=bbgEylPG6Mj2BxXzZc2aG9jJjRn/tM0JeJEeWeIvRecOd9/mhRJKPRneykFk/v+uOk
         69AGceNQZQ5EczregpkByl7UyM2LaIoyLaAIdxIHcwomN2xcW86RNF+E252gFXEzYr5v
         YGpQkbdq2CMX2/KTfsPyRoohwIl14T4NTyfyan3W4tBN7TqUmmH3VRn5COWEkhYUSrE1
         vBvxo1+3WsY7xvDa68MNd2YotQ6rBe1I3O3nwMHvIkIWW4jD9RfKksgf0FebCeE1ox0P
         SWzw8AwwDrEhfAq+IYEXxph1YxshjZ5Ee5bFPgj/6yPH2m8jT/WD0v6qgirmAknE1ah/
         Wjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734717907; x=1735322707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha8GqgZXmMH7R06nfVWYy2HAs9IqUsEUGcLXeArf4II=;
        b=CU7VGGd7y1gG7qQi3D4Il3l4Q4rqm2lMi77EzReFqp/ClLo0vK3Qyh+kcbT++SEShc
         wzHEOl1VH3UoFXtTxP1MEIhtgY0O8GNeWdWWOBScpI3X8fbhtyObRvDb4Tt+ipakmKkL
         dN4UL+ZTuvAXgb/VeI9VEHOIcyI2jWEip6K746Ns1heijJLbvp9lExnUI33d4pJjWrNR
         n0+a1jEah8vQFUGR0sbemCHxlmt+nzo76wqqPpk5PMjFwJvB2fJ1frd2kU8bIhygCwLq
         MfedrUqHakzHIyc+KnFIYRLOcxwpXcEz1Tk+9lNRURzhccfVhJEnrjrTl7e5b/mzFe88
         dKgw==
X-Forwarded-Encrypted: i=1; AJvYcCXQMFI3CqKcuUnCac8V7zFCc6MnpjknJnjnsGiVwIyXM400yeBETEd2uwd1zs/jU3f4Z1QCuTh8fiGu6Cgq@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsvaCDJ02yCV/188mdNiz9Fw37tASV9gggIB7hCSnM6D98etU
	8yFJ8P8aQAiKHyUI/Dl6XVj+jYokzsmG5cMH9Uyx2g006fE2JK3Td/VqD6++TwE=
X-Gm-Gg: ASbGncvyc7gDwHyPtgcZJjhiSmAbjj7zxyuqveMc9SLhB+N//4QiwDWffn5aabFerSN
	spLSdWOVSnMwIyem1iGXLtFk6B2IqrB2fgfhAHywt5OqKQaPzSOyGn8Vrrti3zS2DwMgd+tIk+o
	IUXB8jWZzwGFXP0xuDFfgIZzZLgfHr7Swq+fLVhros3rh0bKt+FvKcjEWqiTxRtuiHZFkiO9fBY
	DGMzHt+mYSYAbzT+zSvNcfAXC7JdFs84vRyRQTOyKQmgzA502/7OhOKu3otMjlMBG47
X-Google-Smtp-Source: AGHT+IFUqR7T4/3vVfrawc/1bS3gPuhZ4shoLWlGJR8JJ6/HT2ykKjWMqBNHlAHudkeEgxEbBlSprw==
X-Received: by 2002:a05:6402:5255:b0:5d3:cfd0:8d4b with SMTP id 4fb4d7f45d1cf-5d81de38c45mr3212851a12.33.1734717907246;
        Fri, 20 Dec 2024 10:05:07 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:6d2c:6f87:64ef:2237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c8dbsm1935723a12.40.2024.12.20.10.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:05:06 -0800 (PST)
Date: Fri, 20 Dec 2024 19:05:02 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
Message-ID: <Z2WxzvKRVcOz5d2V@linaro.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219200821.8328-1-maccraft123mc@gmail.com>

On Thu, Dec 19, 2024 at 09:08:18PM +0100, Maya Matuszczyk wrote:
> This patch adds bindings for the EC firmware running on IT8987 present
> on most of X1E80100 devices
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> new file mode 100644
> index 000000000000..4a4f6eb63072
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/platform/qcom,x1e-it8987-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Embedded Controller on IT8987 chip.
> +
> +maintainers:
> +  - Maya Matuszczyk <maccraft123mc@gmail.com>
> +
> +description:
> +  Most x1e80100 laptops have an EC running on IT8987 MCU chip. The EC controls
> +  minor functions, like fans, power LED, and on some laptops it also handles
> +  keyboard hotkeys.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,x1e-it8987-ec

Given that ECs tend to be somewhat device-specific and many vendors
might have slightly customized the EC firmware(?), I think it would be
better to disallow using this generic compatible without a more specific
one. In other words, I would drop this line and just keep the case
below:

> +      - items:
> +        - const: lenovo,yoga-slim7x-ec
> +        - const: qcom,x1e-it8987-ec

People can add compatible entries for other devices as needed.

Thanks,
Stephan

