Return-Path: <linux-arm-msm+bounces-33609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 892119958E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 23:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42D71C21693
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 21:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838D1215F48;
	Tue,  8 Oct 2024 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEIpgQim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF761FA257
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728421657; cv=none; b=kSWT/eKeNGs3Y0VckKdqNKyPjpZijaUJpTUgtd+vtkbKIN/mIUUH6AZ37vvj5QWdKgYn39luKvk1EvCUk5q2TykdEQ8KAJbH89BP6cyUWzwp3KheGz8xTfQpbO1c4Td8grsxbUT/Mkz7uMCM0RwRTZ4Q8y9h0cjmi24ggikGz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728421657; c=relaxed/simple;
	bh=hdvV/f1cM1SqYCQ/KfHtJVVSe64ByztDzTP3QqDV7WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY4re2g0PNYPOet2mL+goO47yQtEPoLNaE/mN4304ldtE4TmerctBDjEeHgLA7a2osG1uBuUzHN9ZOtCikQBCS/L7DP0QTVEgE2QcohbutQCcq3zJAmlgHxwf8Nw+iw1jsgF/0TNNQKrX5mJ/Qn3aBeMuVzJcYlHjtuZgbue6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEIpgQim; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539885dd4bcso7709852e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728421654; x=1729026454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rPQRQfiAaozI/z8/sXF+QKwWgYWvasAFIgnN8L6VyCM=;
        b=HEIpgQim5hjt5TMOItndmOyuCgbei+QbaBYg8sLzxWKCVqZ6cabLCgdKPfFXA+Fv8P
         xOLFv2rbCpvDSOGhUkIjoVJDB7zTYPjJthzGzjDUENE481oPrPUppTxmuzWJ/sZqazIR
         2vbTHH2cbMuXkOnA/X+6xDafVL8DhhAQid92O74+3mmnYxfmWBtt9XeSYH+xGzPHrmZu
         BnDQlitBRLDbyNnSTDedbXYVyg3XonLj9L10carZ7WOULD5iyZug/lfaVOFDVIOyKIj9
         WjZH2OHeSsoMqiy4yaaswzDBsm7xpQ8Hiy3xWFoD+EroPbUns5IplJg58R436MgaMzA/
         ZQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728421654; x=1729026454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPQRQfiAaozI/z8/sXF+QKwWgYWvasAFIgnN8L6VyCM=;
        b=Gqsjdw9p1KzrZRpbgbDsqeEVHJxJLtEESz/HIejycP5mSWqZnx2yk1H7Bhv/+OpS9I
         JER9YRwR9OsTD/b8tGhkMemg29yFQVARJyXttISHhQddtiRfIrldYXBgLDZ/c8FWqLZ3
         3EHLx6+omiPIfaPErO8zwKwOhIBEMqD9js660TXr4GFaFlaHSZUx6Xkw7iNR8oMCW8cY
         YlfYWeUrkWh4kP194r7Hi9n5gaBSBXmjHqLWW/nNu0MDQb4i9LuOJlvOVQ50uzHUTdnW
         m0f2JclVR48Lyy/e7+6eybNISAtNOWeP0Gl2JnNo4bts+MBjP6/pSc9Bv/a8cWpf7opJ
         OPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFz83W8eYa8rLmGIKG+6UCbtLjTOb3CV0wh7Wlz3U3eMZib9aKiERQmsz9s/jSBswv5UtVN12fETF3F5UH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7j9XOHZXyoBJwc0O5AdsqdyOFvk0QraxRqLwhXu4Vq2n4h+6l
	5DWoMD/y7syvWagOGDXpgJDI8IlLkZvsdk7vjxINsEdH4ej1rb1W9iIawGedK1ecoy4U/DMPpYu
	NvgcBhhhcU9ZzYt22B9OTXyAjNNlxFNAVONj40w==
X-Google-Smtp-Source: AGHT+IGCIm/ilo7jFS7ECpSD9Zg8i59jrDUKgSV4ZD+C+UPhwmq5Gv/wNp6MXOE8WHCNQydPNcrwj8Sg8rgorL4F61k=
X-Received: by 2002:a05:6512:6ca:b0:539:94c4:d9cb with SMTP id
 2adb3069b0e04-539c48e2719mr72011e87.31.1728421653605; Tue, 08 Oct 2024
 14:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003211139.9296-1-alex.vinarskis@gmail.com> <20241003211139.9296-2-alex.vinarskis@gmail.com>
In-Reply-To: <20241003211139.9296-2-alex.vinarskis@gmail.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 8 Oct 2024 23:07:23 +0200
Message-ID: <CAEvtbut-boW2nrbUTXFkvZ8N7qA_OtNz0dMPzRq0OYu4oF+jmg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, robdclark@gmail.com, 
	peterdekraker@umito.nl, Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Aleksandrs,

[Again in plain text]

On Thu, 3 Oct 2024 at 23:12, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Document the X1E80100-based Dell XPS 13 9345 laptop, platform
> codenamed 'Tributo'/'Tributo R'.
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 5cb54d69af0b..7c01fe30dabc 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1058,6 +1058,7 @@ properties:
>        - items:
>            - enum:
>                - asus,vivobook-s15
> +              - dell,xps13-9345
>                - lenovo,yoga-slim7x
>                - microsoft,romulus13
>                - microsoft,romulus15
> --
> 2.43.0

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>

regards
Stefan Schmidt

