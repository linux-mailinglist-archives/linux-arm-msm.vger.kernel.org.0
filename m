Return-Path: <linux-arm-msm+bounces-40406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EE9E4814
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F07F2167A45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8660194C6E;
	Wed,  4 Dec 2024 22:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MIaWaH1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD0928684
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733352457; cv=none; b=dQjbV0Ks4pEwrVTAmD2ra68YcQj0Op/qtklTt3gHF7VEo/uAcApK7iwCavHUlAwecy88pHEJq3+Q7hwvTiNgZX5Fp1TjBai1G//Q0NbqkI88O1oCqBePDtsShKpKmRxDL6zExGoU6zsvv1hGJsytf/8RwnicZQQDuzsp7+56Ckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733352457; c=relaxed/simple;
	bh=kJdSvnUsUWuFAazx9AVYeMRAMXugvXd7n56wCE1Oaq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7oQbN61Ia5tU2lokP1g+HfKrffdG3i6Ce6ZvOCf2RjMFqeYlhK9fudvzZjpFZauR+Gm9VrnZHc7KNIOBBAroLPLqKSOGPzNW6DpyEk6uyC1Ddm7ELH036zHP2E0Luo/SjR9etqa8mdEznxYtw50JpE2wc211/JIqRcqjC4c548=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MIaWaH1z; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df1d1b726so314297e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733352453; x=1733957253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HJnxmfo5xvPN+49q760TRmvPlUcAyzClpyK24RSgC4=;
        b=MIaWaH1zJqcU2Yr1C8UDy8Zz/DWR6wHsBevwuK4f5cstgGbJ1Go69NLNOMpYibqfms
         IFxZGiPF2ngCzvsJ7xPLaT+UcejOHjnHERPk2nv24mJurv7uvYG29zUt6jJB/1ACE/WM
         vTbg5gZu46ipQXxen0hZt0hn8e/PuMnEeI8w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733352453; x=1733957253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HJnxmfo5xvPN+49q760TRmvPlUcAyzClpyK24RSgC4=;
        b=uCnj+iAfgrgk/v70EBteJZe1Jl0bEXDTrozuh2lDNL3C2ibuxuvmzKmro7l4cwUZD1
         sOuzLz/+w4LO7eZ2l+4qF6wl72hohFaCARwodVXurBZuk/M0y8pU60h5rfEyjaGGygIM
         3bKndpw5085YFceWspr1QX3NDyflce1aCBis/0XcYA+IutevKMiyHpGjgL+EwFYquSmo
         SWZyaL+PhUITq5tPRJIw0kixg6vIb5wEKVmSdN35szsXLIg8tmnYvc1dSl6sRn0fnfdS
         fKSBrZoPUQ1cimcNQK1ZDWrh7Wj7MK61VhUemNcJgsgQtRiu4Z56vtHDOptNIwZGe4ga
         eyfg==
X-Forwarded-Encrypted: i=1; AJvYcCXCXAMmQVbA26FueBZ/SlMrLrT9HeeLvabxmcsCTUM7Euq6VY4UCTlJWe4qICArnhJyi001TXmVka8WmT8V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OPXMIBG76KSkNF4zdvTKxfV/EoDpPwpZz6L/7NwUGBgihGWY
	j/QLpa1NltwByo1ClYVgOZ/PJ2dqRdVPl//JmM6z0Xlgx4fKafJZOjsldPkHn6rShYaivbtU+xH
	T9fec
X-Gm-Gg: ASbGncsfVsUOifGRe431JKYAcobcm013iv0prmx13K66U3+PID/7X5VNH+pnSqZXxxF
	dBq+jD8WUtH5wSRqQsHRZnsZpqiVZZm8We2hVnhQWi2k4sMY7FF7t2pjADvJ09a+Dyd+/LvQv24
	bwg1xfbzrNL1S/JZ3bBRTpYhyAz6M02qGU4JuehRB6iCrWQpIB1bdOUFBW7zJ1vXZ2OagJNYmdD
	YGXHaBsR8ZoLB0AN3tRT9NDKROmmvgRULLtGYvCwALYTXh6xt5y5fb0Vc3IuWtr/IbVm0aClkCT
	hPeA2lRFvB8k6A==
X-Google-Smtp-Source: AGHT+IE3IcwhABF/EZ4woAgCpotM38g+ZTxPyA3O8CAv9lX0+GMOgU2XbBq+LEGD/xYW4+s+aXi1jA==
X-Received: by 2002:a05:6512:b9d:b0:53e:20c8:92b6 with SMTP id 2adb3069b0e04-53e20c8933emr528590e87.5.1733352453188;
        Wed, 04 Dec 2024 14:47:33 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2297441esm26709e87.61.2024.12.04.14.47.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 14:47:32 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df1d1b726so314262e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:47:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH0rq3aR4VEPBafh6IGqs2hpRZf+m8vph8HtAVSrIJsf8trHMVwjIo1VJcggxZ/99JMQcE7Ou61t5jb9kp@vger.kernel.org
X-Received: by 2002:a05:6512:3f0e:b0:539:905c:15ab with SMTP id
 2adb3069b0e04-53e12a01745mr5161964e87.32.1733352451667; Wed, 04 Dec 2024
 14:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org> <20241204-topic-misc-dt-fixes-v1-3-6d320b6454e6@linaro.org>
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-3-6d320b6454e6@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 14:47:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V8VwixdgNjyTL5m5YzEcCuCFE1iYAwBkdkcpzZ6OusgA@mail.gmail.com>
Message-ID: <CAD=FV=V8VwixdgNjyTL5m5YzEcCuCFE1iYAwBkdkcpzZ6OusgA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sc7180-trogdor-quackingstick: add
 missing avee-supply
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 2:57=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> The bindings requires the avee-supply, use the same regulator as
> the avdd (positive voltage) which would also provide the negative
> voltage by definition.
>
> The fixes:
> sc7180-trogdor-quackingstick-r0.dts: panel@0: 'avee-supply' is a required=
 property
>         from schema $id: http://devicetree.org/schemas/display/panel/boe,=
tv101wum-nl6.yaml#
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b=
/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> index 00229b1515e60505f15fd58c6e7f16dcbf9c661b..ff8996b4de4e1e66a0f2aac01=
80233640602caf3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> @@ -78,6 +78,7 @@ panel: panel@0 {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&lcd_rst>;
>                 avdd-supply =3D <&ppvar_lcd>;
> +               avee-supply =3D <&ppvar_lcd>;

Looks right. I guess technically they could be modeled as two
regulators, but it feels pointless. Looking at the schematics there is
a single component on the board that provides both the positive and
negative voltages. There are two enable lines on the component but
they're tied together on the board so we can't enable one separately
from the other anyway.

Thanks for the fix!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

