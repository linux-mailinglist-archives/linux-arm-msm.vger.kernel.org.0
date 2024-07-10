Return-Path: <linux-arm-msm+bounces-25878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1F92D78C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DA4EB2765E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB6119538C;
	Wed, 10 Jul 2024 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dTd9390j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C60192483
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720632952; cv=none; b=lwvkjnWZh3Wsj4AoO4MaDiW7UsmMRVouKMbcqPRKdIWCpEg1tMU5O5Qi5AKUPy5pcxasXr7lF+hhP3yOgZBJELTmKVmIMAX5spVUocwRqu3PgDXBEXjXvUAwcqy0zApCL2oIxZoAMEg/eRlvSAEJY1YyqXceKewk0dOTU8oyp60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720632952; c=relaxed/simple;
	bh=qUtJuf7BpW7416xCDEnMAZ4qpPxi046SuSivO4rvOIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvhD0tZbtzeHlMfp9Bav1otWNaghmeXwQDEk+DK9KxBGbt6ineXMqMlltac8Sux3JEDsjdU9FBWJpe+RHuIt8z+sVwNe6QrRhBjGiLjdX1EfgLLO6cZqWb2vmMv+uxlF39vAiMDGuhV8AFyBF6/YSEi5jLQoZOJGalZATZ4wTGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dTd9390j; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-79f178e62d1so1753485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720632946; x=1721237746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq9tNUhoBsUEDC1UEIUaCv3t+k06QOX2ENZA+annY9M=;
        b=dTd9390jg/D/SmsKCxxhn04a7hRndu21txgY9l77A9b0DPU6V1LKaokKpULbIb6tq6
         Yv0ZaI778IJ/HFBOSMNHcR05d9NWDbwRunfJH5QwF71QjN2V5SQ5FONfHB/nT5AeFPGi
         A/cHioEtG9Y5tdXDCFuV2r9s5PF1mlK5J5QPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720632946; x=1721237746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nq9tNUhoBsUEDC1UEIUaCv3t+k06QOX2ENZA+annY9M=;
        b=GO3tpsgYeqkBqtPCSHiCoXl9VWbozAi1WUzD7cv2Ktn2Bv4VwG8slfuBhti6NUzpbx
         jvIyPTsyjsHfJFK32gTIVf84uIQtPLeeNXVNbQOwOTpwsSIKYREwqcjkJAfUGudt2yUu
         VetkIWFnuobaY9g1vr1kQqLCrji2WR90/xy8Lx9LUzvZh6N0qX3V6gazxPNWloSa4POn
         MWAFRMrxIlJZ7KbbVzdc4+cE/vPPkjRNm4wieS9Ho9H6unloC2dhujFdU8rN8jl51U5e
         qtt8K10pfCpQG5zPOf8W6Xn7ROVJxJ0ziVwfKWnU0g/C8AU1W3kad10nv61vGTJ4WOOZ
         mGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMPmgkIMcq+Tjtl+0/S7F6zgeLICFLc4f/09DVVKSS9mwlmW3kVeiAe+9QScn9B+FFMEQTR3x24mbrTqNs65EdtfG8TP/KR3DCIvITEw==
X-Gm-Message-State: AOJu0YyZ0urNgamYXJnrpFIQ8TrP7m44Q60AIRf+ANFe84pPkaQnufql
	dKITKTialxfiaeYDNKz6T4/GKCFbLdrv72CD9vViI5ishvlHcQdCfoNuVpzASIQzOkiboIlpdyu
	UZQ==
X-Google-Smtp-Source: AGHT+IFF6xc2hFxJWSil5b1/XMMj7ixodeCsSA3c7aOXr6PfVe0YjbbVxiiugdwvBftHQqm82TsQeg==
X-Received: by 2002:a05:620a:1096:b0:79e:f9c8:a223 with SMTP id af79cd13be357-79f199e5696mr653042685a.6.1720632945739;
        Wed, 10 Jul 2024 10:35:45 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f190b4906sm209802885a.133.2024.07.10.10.35.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 10:35:44 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44a8b140a1bso24531cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV400Rw46/Y72Jq57KAz1vsNqndg9ka6vJEx6ganZvxBaIyww7MR9Ol/XYvkpIkEg9DjrD1DUHN/sn7GoqyoRkWgUbh4htQtDOlaYjNGw==
X-Received: by 2002:ac8:5399:0:b0:447:f3ae:383b with SMTP id
 d75a77b69052e-44b1a14a434mr3218051cf.19.1720632943866; Wed, 10 Jul 2024
 10:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org> <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 10:35:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
Message-ID: <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 10, 2024 at 10:05=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
>
> Add a new "samsung,atna45af01" compatible to describe this panel in the D=
T.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml       | 6 =
+++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 765ca155c83a..d668e8d0d296 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -14,7 +14,11 @@ allOf:
>
>  properties:
>    compatible:
> -    const: samsung,atna33xc20
> +    enum:
> +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - samsung,atna33xc20
> +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +      - samsung,atna45af01

Seems OK, but a few thoughts:

1. Is it worth renaming this file? Something like
"samsung,atna-oled-panel.yaml"? I'd be interested in DT maintainer
folks' opinions here.

2. In theory you could make your compatible look like this:

compatible =3D "samsung,atna45af01", "samsung,atna33xc20"

...which would say "I have a 45af01 but if the OS doesn't have
anything special to do that it would be fine to use the 33xc20
driver". That would allow device trees to work without the kernel
changes and would allow you to land the DT changes in parallel with
the driver changes and things would keep working.

...and, in fact, that would mean you _didn't_ need to add the new
compatible string to the driver, which is nice.


-Doug

