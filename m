Return-Path: <linux-arm-msm+bounces-40343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EACF9E4467
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDE0DB3487C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3574221764C;
	Wed,  4 Dec 2024 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mcGJHurP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AE217642
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 17:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333173; cv=none; b=RRpiSwTIz+N3QDAkvYowmZvDsQyUJqBdK5vlUO/dqkbhptDB8SPHYmiyohoJ/+HEyUvxSfmO/409baHqbcfF48IixmEPEv/QxDTyqQh9QrlWI0kPHx/sTf+xOHCiXJKSTuCPCIa2YHgZQZ5mKLR6SE/j8ghh588dSUQj3uL1j1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333173; c=relaxed/simple;
	bh=3XOKyfOtCe+byiVNEcWIU0XMb6iWf0YuG2kDOBxGSKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXXgJ1xB+u28CBjxCxLmsZpOflm6/4SyMbtHtWa+xZG8IwSbeeSsubKGWFdD7ZeY3Mwac6sKUtEEq4s1tt8v/47aOXf1oCf0qiCbladm4hkhHOSvAnlfs/9wef2t+m7rFPb5kM0rRUDqTR54rVifXQRhU0wQLSC9yPTLwItjXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mcGJHurP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e0844ee50so59136e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733333168; x=1733937968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcxUVGNwDSHYT0cP1lB+JvbULa6oEpjDSAOsUsCsW1c=;
        b=mcGJHurPFhyWZrzxsqhe3WqxFJ6pLKqpNZR9oI+eEzSGuu+sDvSvgQMRio6kGjgH6a
         KZ4dF6e1XOqzPO6uGws0h5EMgOQFmNHFxT7lLtBkfc/xsdSL9zJ8Ek+o+/fRT1jHYEmS
         SaB8m20QSdJbwsZkI7de/iKUf5IZGfww3N6JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733333168; x=1733937968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcxUVGNwDSHYT0cP1lB+JvbULa6oEpjDSAOsUsCsW1c=;
        b=ORIL35wT91Fd29JPtwTcFo7KJivsFE9eXrmWM/W1MJbe5lHRRO409kzjj1lEFijgXW
         9ShXhQH/oU1XkQNv9g+qhfYSywt6hpBAkjZyg0vgi8IhZnoai5UTYs8L3Fiq7hGF6LWE
         EPRt8ZRSjN5y4Xpbp0EfDIUMcrIHIcxi31syVFToyI1ISUMbmmIDJvLgu1QJtKv2d0O9
         lSelj8E7uBKHUodnP+xZe9cSnRCI8s1vR+IToYRUi1SqUMhTyDJoA/Gj9ZhrwGez9Stc
         IutG6NHtNysaIO0FVA9yMsxDUIJ4QaP9pfOxx9DSE4SSXmLfshnXnbP/V5zKKhk3fUaq
         fmIw==
X-Forwarded-Encrypted: i=1; AJvYcCU1yX9oWqLS13odzlqP3qMgwmH+VRxkX5eN46LqC00nwl1dd9Njt6dUKKDtDHs+wODH9OKF22JfX6N0HDHP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5o7ay0oZnJv++7CfAgg6Kt6RGmOSpFTcffK0hdA+EapiFggw+
	iVEJVf2GZR2WtdkEhohFgIEy7+eaTqcB7zmF1GrT1K5QA2k86RgwBGNWqeYy3AEijuCmsytsFrH
	J3g==
X-Gm-Gg: ASbGnctNyMYczQtnqBMHJuZNvXrKOwDU4A3vPBFkesI31cseYvwGruh/kmlWTezp6Ms
	dCMVe6224HIV1AYEmYAnW07JLl3PA2sVk3wg+olJ2VJv7seUNbMKNQ14gkXOdEGg++sqzyXltD3
	s5zmoHBfCj9hVOa2ddiY/RU1QQr6cVypZwJGY0prp6xbT7qJj57a+XqxPCn9p5e8Jnpl96uusQ0
	Okm+OinW5/nUv8YsP6aPKkMty8eZ1YCEBV3Do67goS/uraw+LCpuLawOzW1tViBe5rby/c1pk/m
	TTJz8JGizgXwz2WcIw==
X-Google-Smtp-Source: AGHT+IE7hbjx41lW8LUSnre0IkON12V/4pSnETBe4aKsV0Tf7oQvYIryCpUnT6+25RpGEXrvHTl5Tg==
X-Received: by 2002:a05:6512:32c9:b0:53d:eec1:a04e with SMTP id 2adb3069b0e04-53e129fdcc4mr2767039e87.23.1733333168385;
        Wed, 04 Dec 2024 09:26:08 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1b34acf8sm495851e87.215.2024.12.04.09.26.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:26:07 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffa97d99d6so72217831fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 09:26:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhXkWbYkYMQhdXQrZq91aow/6slVMktEFn6TSguTkVBSyVzCN5Q27Utd4LfArXREZxiKt8wKzweAJxF9wn@vger.kernel.org
X-Received: by 2002:a2e:a108:0:b0:2ff:c027:cf5c with SMTP id
 38308e7fff4ca-30009c3f871mr30428561fa.16.1733333166812; Wed, 04 Dec 2024
 09:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com> <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
In-Reply-To: <20241204150326.1470749-2-quic_vdadhani@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 09:25:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
Message-ID: <CAD=FV=XF+9wxZ5xNtO3Uy8QW9UY4tb+KR46jkondvBeQuVLsrA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: i2c: qcom,i2c-geni: Document DT
 properties for QUP firmware loading
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, =quic_msavaliy@quicinc.com, 
	quic_anupkulk@quicinc.com, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 7:03=E2=80=AFAM Viken Dadhaniya
<quic_vdadhani@quicinc.com> wrote:
>
> Document the 'qcom,load-firmware' and 'qcom,xfer-mode' properties to
> support SE(Serial Engine) firmware loading from the protocol driver and t=
o
> select the data transfer mode, either GPI DMA (Generic Packet Interface)
> or non-GPI mode (PIO/CPU DMA).
>
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yam=
l b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..a26f34fce1bb 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,15 @@ properties:
>    required-opps:
>      maxItems: 1
>
> +  qcom,load-firmware:
> +    type: boolean
> +    description: Optional property to load SE (serial engine) Firmware f=
rom protocol driver.
> +
> +  qcom,xfer-mode:
> +    description: Value 1,2 and 3 represents FIFO, CPU DMA and GSI DMA mo=
de respectively.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]

I'm a little confused about this. I'll admit I haven't fully analyzed
your patch with actual code in it, but in the past "CPU DMA" mode and
"FIFO" mode were compatible with each other and then it was up to the
driver to decide which of the two modes made sense in any given
situation. For instance, last I looked at the i2c driver it tried to
use DMA for large transfers and FIFO for small transfers. The SPI
driver also has some cases where it will use DMA mode and then
fallback to FIFO mode.

...so what exactly is the point of differentiating between "FIFO" and
"CPU DMA" mode here?

Then when it comes to "GSI DMA" mode, my understanding is that the
firmware for "GSI DMA" mode is always loaded by Trustzone because the
whole point is that the GSI mode arbitrates between multiple clients.
Presumably if the firmware already loaded the GSI firmware then the
code would just detect that case. ...so there shouldn't need to be any
reason to specify GSI mode here either, right?

-Doug

