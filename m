Return-Path: <linux-arm-msm+bounces-21966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B906B8FF13E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51991C24B14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E989197A8E;
	Thu,  6 Jun 2024 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ONLkwG6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34D197A6A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689100; cv=none; b=bPnmHmJxgHemIIIvC/jHO+Yw/pPIIZEkSaar4NL7YrrEivKPY2VjkYLGQ2K4j6kOYIann7yp904zBnwehs3yMPSAhFTrss6gnURhfPSHDoU4YIg5ifIrAZkg0yv/xgCvZN7IKBIbpZg8aFRACnCOJnZ5FmKw+AL1LduZe6dOWOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689100; c=relaxed/simple;
	bh=vbFi6Ir0YQXvJY5W+Cjh8wTHOqNP+0lx+B5Yq8nTAaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3wVgS06t1BwXhCZORRkECTbw4KOKL9pkDedFZp/zvB9ZaNxiZZasW1rrOtJaf8CfMzcg6AXv7b0dJCn9CEXVw2o7zORL+OiTQ/J5qJud8+DSLeWl/9VkWcFeLdaH72WkQ6364Y8xZCiZiRfWf4oMuXcCelSRRA20ta5fDGdMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ONLkwG6D; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-80b26f1cadaso367847241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717689096; x=1718293896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTfArhgeqr5paLlpWgE1fa5MPN4uTVnEfjUxQhkMxkY=;
        b=ONLkwG6DieFBT3ApIDEgy5Fmp9pv7s+g9+CVGTIeMrA4HDvrbcofRzo+ynP3PheVgP
         X+vQUyluxGFtx/hZpMhC3tuEbrgDBiplEKjSiqDDxnGk0tjdz+Vqgt9zTIsASK01sJCU
         PReT1hB1f5UBLAOI/U2tD1epT+TcSWrw2t8q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689096; x=1718293896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTfArhgeqr5paLlpWgE1fa5MPN4uTVnEfjUxQhkMxkY=;
        b=jACCqoDqLRTvtEvwe0nH1aMKOqzDGrRVmQhx2bG5+NUTHpn016GeCgzRp3lL5C0VgD
         /hBHF6QewC1Lesf8cxJsG5HjY6wrectbf4EolCjOKUEwQafg7/C6Uz+fpQ0r6ByG91X2
         VG/D19CVvoxmQznip0E9dyZWVujKmfG3ovWUIt9Svi/6WzHbECWXFi3w71TcH9OoJ78s
         whhA9QmI7Z1aI8Zypl724Lj/e2ViAEztJ7GzKDA4KBaV/uNHfDsmJ+sCe0xTpPoG5g4e
         A0ldDRZXnlEFgRw/5+PN+YGwfhxryYyLs1Be1aAYoBKA9KCR8JLz6z5rOwq4vi1eeZkA
         C3SA==
X-Forwarded-Encrypted: i=1; AJvYcCWij6pU/1KIlPTEzmyIIeFCJ+FuXRpRZi0OfKJO8Rx214xNkSWrLn33sBjNBn+02OeVO5LOGjopG/R7QlL2NqNZBlM87KsID1+VFO/+HA==
X-Gm-Message-State: AOJu0YzAzhORODx/pmxGWIjcgTkiLFYUHaxXccFHgWextShAxk+XWTKF
	8NL4IAPifdI0eCDW3MI+3bKIP7a7u/leTTzvQ8Y9LMWfhG82aPlNTLCmT133RlXYvM3BWSzqO3c
	=
X-Google-Smtp-Source: AGHT+IEA/8MTOeLNnEntL5jz0m2Cgot1ItAnQpPBl1PhP7k9vuh99vQo8kSg4stgYg58ldnL5H7S5Q==
X-Received: by 2002:a05:6102:1914:b0:48b:dba6:7531 with SMTP id ada2fe7eead31-48c04a4e635mr6110605137.31.1717689096429;
        Thu, 06 Jun 2024 08:51:36 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-440387964afsm5573101cf.0.2024.06.06.08.51.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 08:51:36 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-44036ce0adaso379221cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 08:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3Mmg8IsD0fsiDV33J5FBspbRKGPXurBVo6LDM2SA4s6CwBvCGgHhhfKkqROzb3keGTUPHuGxNCaSfGl8kUjy408HIr+dmW4H6EreB6A==
X-Received: by 2002:a05:622a:4d04:b0:43e:cb4:1d10 with SMTP id
 d75a77b69052e-44037247b8fmr3980461cf.14.1717689094600; Thu, 06 Jun 2024
 08:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604214233.3551692-1-swboyd@chromium.org> <20240604214233.3551692-4-swboyd@chromium.org>
In-Reply-To: <20240604214233.3551692-4-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Jun 2024 08:51:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9SX20Ckaa2VqwXk=jqjYZvdMMqzXd1jwucPuPXpKkSw@mail.gmail.com>
Message-ID: <CAD=FV=U9SX20Ckaa2VqwXk=jqjYZvdMMqzXd1jwucPuPXpKkSw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180-trogdor: Make
 clamshell/detachable fragments
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 4, 2024 at 2:42=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> w=
rote:
>
> At a high-level, detachable Trogdors (sometimes known as Strongbads)
> don't have a cros_ec keyboard, while all clamshell Trogdors (only known
> as Trogdors) always have a cros_ec keyboard. Looking closer though, all
> clamshells have a USB type-A connector and a hardwired USB camera. And
> all detachables replace the USB camera with a MIPI based one and swap
> the USB type-a connector for the detachable keyboard pogo pins.
>
> Split the detachable and clamshell bits into different files so we can
> describe these differences in one place instead of in each board that
> includes sc7180-trogdor.dtsi. For now this is just the keyboard part,
> but eventually this will include the type-a port and the pogo pins.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../boot/dts/qcom/sc7180-trogdor-clamshell.dtsi     |  9 +++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |  5 +----
>  .../boot/dts/qcom/sc7180-trogdor-detachable.dtsi    | 13 +++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi      |  9 +--------
>  .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts     |  2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi  |  3 +--
>  .../arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  3 +--
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |  3 +--
>  .../boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi |  7 +------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts      |  3 +--
>  .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   |  5 +----
>  11 files changed, 31 insertions(+), 31 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dts=
i
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dt=
si

Reviewed-by: Douglas Anderson <dianders@chromium.org>

