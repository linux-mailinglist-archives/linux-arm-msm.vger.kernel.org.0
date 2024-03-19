Return-Path: <linux-arm-msm+bounces-14537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96657880181
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B91B21C22D8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381D281ADB;
	Tue, 19 Mar 2024 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eM3YBj9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAA81AC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864633; cv=none; b=hJuOmcaG0qz6amPpzAnNDyHZgqYXqhjIkCgpw13jtIvi+R+cdrULfbxH0vDF6QAGoGRY89Ca+qianMVtVKW839CkZpxsqeaEibH9GhGOf9jws73lHbmrVWOZ55+sHpD+L9fG6w3n9OzF9BZy6gmowFqeSQJ8GJHhET1GPB2BXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864633; c=relaxed/simple;
	bh=FWs6LFKM/xcvvgakZ39skUFNVfNPQgC7Bo//2KPJp+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vaqd+RUuY9YsjOgj11nzAQnbVGNiEzpcDjJR01cEhkyO7HMTHnkCWUdRE4eXyMo2lTed6p9S4PKdVjXSxUnLOTO8ffCPWq1GJ2S2C6w4CMh0WyFaiMyb3h5T5eOvzIE1RUsN8ITfRkjsjd+OxThVu4hU7v7hmtKz3IJG4fby/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eM3YBj9/; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-690c821e088so36658046d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710864628; x=1711469428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Suh5QCHeNsdbI/6JZV91e5lppTR9YIcMyoALsn6PjZc=;
        b=eM3YBj9/wWnwAYlxSdq7Ro9SqQiiENW4Nz4K9XerJQ7A0RGjQ2Sm0caYDn18+OopHo
         9GYvo4NeXVSTzrGdHSeR2vfy9hDO9BMJnSRoWTsjEZKlhjJGiZYf36jTEI0mLaDUEru8
         15B/Fbg4Ew9P1I0M8f8LwMHDeMVa4bHtk+mTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864628; x=1711469428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suh5QCHeNsdbI/6JZV91e5lppTR9YIcMyoALsn6PjZc=;
        b=XEEuELrKabyq51IKHfIjn3V63kUQOpjhEWZlAQgME0BJ7srIbe+yHwDjLFpv64ui2L
         +R3uk4EDSq/KYNW7MfgEoliJBTQeQgP+Wmo6ZFHSgfZi7g9sS4DYzEjSJeJmoJ/CIs6u
         2mPS7EkQDz0kvWKgXVSS2CNLkag21idhoQqAllry8mdgPBydKFlr/ZA+g/mOqdVlfml8
         SqmHl7Vca9OwePYm9u7qk2BXfQKcHN2H1D5TsyU+lIayqnLMKQgLGh9F2S+7pPiDcwlP
         rVKBOCFj+Q5mgIjXZ+vk+EU4fiiTznXjcRcOgSuRM2x/o0qTQ/KLzINI96t6jL86MVp1
         zf6A==
X-Forwarded-Encrypted: i=1; AJvYcCWAIEWqrm1y0ed4KNxLFEkuKT2SLHPeY7a2KcrK81FyaE/1Tzj54L8I581flqdOk2iUW76GbOQPOg01Mh07XgQGRH65gIQtHM9F8jRFPg==
X-Gm-Message-State: AOJu0Yz4Vh+VIW+YVRyUKYromW1QjXUIumSz8Qkd3Yw5xPTRixPOPJWA
	avlgVTjCsUxRbXOjMt/0DrdEOGelhnLg7XZmhh7X5HWhx8rrFSq9VahJwTetquPrTGsAEAKxpZc
	=
X-Google-Smtp-Source: AGHT+IESWgAAeIehSwF10GDxfPZzWkKk6AQ8bJelKsUr735LTkU5iw7q+r2aLxTdoXijcDwt95miqg==
X-Received: by 2002:a05:6214:1192:b0:691:4d30:8827 with SMTP id t18-20020a056214119200b006914d308827mr15918253qvv.7.1710864628112;
        Tue, 19 Mar 2024 09:10:28 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id c14-20020ad45aee000000b00695e602d356sm3360511qvh.46.2024.03.19.09.10.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 09:10:26 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42ee0c326e8so322881cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:10:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX82MTfE5vQ7FO6cFVE+l7rt3ge6FhU/BlC5iPrJWIFdU8Pl4zaYerhFp+VjiVGFNvVsaVmd0ua1sjUalxOAdeH8e9xGG+E+89QI9mvDA==
X-Received: by 2002:ac8:5991:0:b0:430:eb3e:d599 with SMTP id
 e17-20020ac85991000000b00430eb3ed599mr197066qte.28.1710864626281; Tue, 19 Mar
 2024 09:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319152926.1288-1-johan+linaro@kernel.org> <20240319152926.1288-2-johan+linaro@kernel.org>
In-Reply-To: <20240319152926.1288-2-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 09:10:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ+yAvDn5NyfCSJdg+DujPrWO+DZu=BmcqbJS-ugEGMg@mail.gmail.com>
Message-ID: <CAD=FV=XJ+yAvDn5NyfCSJdg+DujPrWO+DZu=BmcqbJS-ugEGMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: bluetooth: add 'qcom,local-bd-address-broken'
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 8:29=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Several Qualcomm Bluetooth controllers lack persistent storage for the
> device address and instead one can be provided by the boot firmware
> using the 'local-bd-address' devicetree property.
>
> The Bluetooth bindings clearly states that the address should be
> specified in little-endian order, but due to a long-standing bug in the
> Qualcomm driver which reversed the address some boot firmware has been
> providing the address in big-endian order instead.
>
> The only device out there that should be affected by this is the WCN3991
> used in some Chromebooks.
>
> Add a 'qcom,local-bd-address-broken' property which can be set on these
> platforms to indicate that the boot firmware is using the wrong byte
> order.
>
> Note that ChromeOS always updates the kernel and devicetree in lockstep
> so that there is no need to handle backwards compatibility with older
> devicetrees.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml  | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-blu=
etooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-blue=
tooth.yaml
> index eba2f3026ab0..e099ef83e7b1 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.=
yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.=
yaml
> @@ -94,6 +94,9 @@ properties:
>
>    local-bd-address: true
>
> +  qcom,local-bd-address-broken: true
> +    description: >
> +      boot firmware is incorrectly passing the address in big-endian ord=
er

Personally, I feel like "qcom,local-bd-address-backwards" or
"qcom,local-bd-address-swapped" would be more documenting but I don't
feel super strongly about it. I guess "broken" makes it more obvious
that this is not just a normal variant that someone should use. If DT
binding folks are happy, I'm happy enough with this solution.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

