Return-Path: <linux-arm-msm+bounces-49939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5171A4B07C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 09:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56E111893872
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 08:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6191DDC3F;
	Sun,  2 Mar 2025 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz9v8jlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490DC1DBB38
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Mar 2025 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903622; cv=none; b=mLSgzFTzugvpSKlb79JphXgPw0VsEH+M4skLdgxrj6mlB2VBUGfiwHjp0X+rHU+vNYHcfFKFdxjuTVrqHzu315Ua/YYc3W0int906S46zsQ2Piyy29j4PfNO9VcFEFXkra+v4tiipb5r9arlJgc9ug3gCq9RvmbN3b688a1iyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903622; c=relaxed/simple;
	bh=LqSAfv6sV6rOVtb/r74cZp8FOqhM2qtObtu/CEfkeyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to0M+sBH4eaFAyQbFs1AJsEDD20+kgiOQKilBF1N+1CT/0NCXFPf6bPVd31Sej48Jic64FSIyk7zcOhgD0mHX6zVCxnyfw8At4bCfnNtpqhOYkT4hnWNKHfe8LBEGYaUpuveQ9nlpmRpiFnr/OHB4ZtEPJ1wQg2GRLxBpDc2DEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lz9v8jlq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5495c63bdc0so995438e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Mar 2025 00:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740903617; x=1741508417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Fdu8h638dVfYIqAfQGe64knL8yNrxRQQc476mt3At4=;
        b=lz9v8jlqFKNLpkN3+3DeByaAdSD1jyd2FPKTdcgiXwyr/td5Sgfiu+pgMQZo001CMR
         4xuFB0sla7XaBVSc0OA8yW99b0yj5Ytkn5wQEZ4o/0mKODAh4o2Cri+f7t1V6qqaTotS
         cPAddTSpsEAczWifLh1bBOEUpUOCpQs7tAHPRyncflrLI2YPnAA9iBf7Kn/wuEZEkAXu
         EY16T3VONd12iHn5qOEZY3jPSRc5nwKG6X1w2FtWbYTtVuRsRRTzpV5dFM98si2CzI4u
         FhDJ816DeZLv7RvLMuNhxIPOejG1okjLyAvqWQ7qetLQGtz3hhqiwaCF/JVNfSLuFgxW
         Hh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740903617; x=1741508417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fdu8h638dVfYIqAfQGe64knL8yNrxRQQc476mt3At4=;
        b=poXJqtT95QRzrSj2rZjzLd4CFjLTRp0tTxGtdI8/G/03gpYyMepQHM2gRT9/UHJOpH
         IeTPlhV2ovzqvJSAAG18OlnvLBrKrYIpxjQdMXwYAXfDdtz1c+tgfGX+lnhiGJV5tgmT
         4gaHbgCzWeYdNsyzhPQrFV25wHYjdP+J6iQhSnApQYx6HF7xv+G9H3RCrJYYKFwTGcf1
         8/jJyxFL+0aAUF+dUsbUpX7tLXs8SnfThwtjzG3CJYgIK7mWopf1/vjSjU9y5eiv3Qij
         EkQ4Ja3YUwq4G+gq+LtBz6Fz+25IZ3RJ7Bl3iB7fPP+J6soNU08+QYLRiqkyDAmAO9Xt
         pBVw==
X-Forwarded-Encrypted: i=1; AJvYcCUb0C04zNMF1eqHvZ6zyXTgzjhpKVCHjhZYxpn4M3zUDNq8cNFEj2NwRTaapcQJpWxfFdI058R2p99RKBu+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Iwo05ybo+VzuBlriLFEbObNeuFzuuh3dgMhOUNr1VscbwLI0
	cF6MrO9PYEDwRe2ZmNI2IiCmYiyhonRHk330UGBXRT+NRFY43hboUvXlIt6D6Y8=
X-Gm-Gg: ASbGncuGLysrsZ7wcXeVMZ8/nQzpB63fpG13+SvUZv7O9+8fWmMS6wzx4v/nGAkakt2
	f5ZccamcJHtob3O6xFgpl2sCYryQACk9tNWurRSp8GBukIyaA1/gyquQWom3ai7aFs4bDOz9cTP
	aJkWivWr0NYF6aSaqU0b/CQ0Bz3sicVtnDwMfH4uudxgWPGpHEEtdCxu0JhEX/4omTq4xtTJmuG
	6Db9QDL90qBgoJc24FC38wY0xoJhB5PjP691xQSyolUW/8yXjnt7KcZftvhPZb8RRB3DAREnNkR
	cqDYECtTdSHYadT+1SuqTnr7ZnhHI4JxHF6v4XuRwwSd28yutertaq0I2YcaRIOfS3zMIZib7HZ
	SQmvjMeINpO11AQt/y0AsoDA0
X-Google-Smtp-Source: AGHT+IG6MwRyMAkP0lusijaUUwBA9N6GITEOtr/qCaV5/Ffw5je3hsGzZ5FfyJKo0ZYon/HXdKTf0Q==
X-Received: by 2002:a05:6512:3405:b0:545:746:f36a with SMTP id 2adb3069b0e04-5494c32fac4mr4044874e87.34.1740903617294;
        Sun, 02 Mar 2025 00:20:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495b8eb16asm317095e87.35.2025.03.02.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:20:15 -0800 (PST)
Date: Sun, 2 Mar 2025 10:20:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: sound: qcom,sm8250: add RB1 (QCM2290)
 soundcard
Message-ID: <l6itr3k7taiyiokaahcg2mwtaa5lynia4bimxridpsyymk5ml4@loii4h7lhjhz>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-2-81a87ae1503c@linaro.org>

On Sun, Mar 02, 2025 at 02:49:52AM +0000, Alexey Klimov wrote:
> Add soundcard compatible for the soundcard on QRB2210 RB1 platform,
> which at this point seems to be compatible with soundcard on
> QRB4210 RB2 platform.

Is it? The RB1 uses PM4125 for audio output, while RB2 uses WCD codec.

> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index b9e33a7429b0c063dc5f5b806925cd541e546cf6..2493ed99268bf2ff8343020150c2c9aca4262514 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -21,6 +21,10 @@ properties:
>                - lenovo,yoga-c630-sndcard
>                - qcom,db845c-sndcard
>            - const: qcom,sdm845-sndcard
> +      - items:
> +          - enum:
> +              - qcom,qrb2210-rb1-sndcard
> +          - const: qcom,qrb4210-rb2-sndcard
>        - items:
>            - enum:
>                - qcom,sm8550-sndcard
> 
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry

