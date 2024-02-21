Return-Path: <linux-arm-msm+bounces-12108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29785ED2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1DE1C2227E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75C881752;
	Wed, 21 Feb 2024 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G08zCkDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5C12BEAA
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 23:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558884; cv=none; b=FrXKb7dPy5V0BOdZpwdroGZSlRq8Sxtd+SthddY4m+VBNKZw4qXIgvI05q8tRccu5TAdf8H8eT/vW4oMirgdP/Eb+CuUmgsHVt9D7e9CBPaInTOtL56qooibqt/fyIPkNkDx4S+P5Qu/mzYVAdspaZkZ7jMbWA5Wdkz28AyDods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558884; c=relaxed/simple;
	bh=FvoifoPM//IS5W9kYck02wtlG994BL//wpfQlUkE/K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8UyKH3cM6YzIccabnf1yNdlCr4OhZsISSwDM1xg8ucvZhXYNtaKbB/eai96RfQAOl1an7tJCWbGI4V5nNQHri900uKwO2g8oHquFkR0XRH/VtWCGzihrpinSLckBwQnxhaVZ19SHiR33PFgZgJdfM4BfsW7yDnFgan3LAWNrTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G08zCkDY; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so6853767276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 15:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708558882; x=1709163682; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gum7JHLE82lB2obWuKI41M7h3ZETASXy1kYfBRSiY+0=;
        b=G08zCkDYlqw/9S1rH01XI3kWg8V47pcXeYM8Yb98f87tB76bQOTcQoOu24yC5I/cqh
         gspGQgZF6BESd3xj71tLYjzxcG9HAShs/sGc0rKyWCB8+RLoybur/nLJEk/2FQGX9qFj
         lGIoPop8ZA4J752mrjNtzeYLhFv9G29E2Aocr118HzU4pn6KqWu1riSKIcM4WQRF5N7C
         Gkp1TJIIdKum7ntue5zzDzviLhZ/jCeDIDjdvBKOHdJRAD8+u7lG0+L5MoqER4lofpAT
         yR0ZogRwfCZCtvXzKo5pJRaBUdvWhlZLXQTvxZATQTX7rtwcXAogFJM6jxYRxLE8B3Zg
         z0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558882; x=1709163682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gum7JHLE82lB2obWuKI41M7h3ZETASXy1kYfBRSiY+0=;
        b=aG5l0nB/tKhxTzuZ4UdMPuaRP2/F7Bsx3NJYZ5i3lW51089PbDN8Yw1VD1Xpmyi0+T
         De0/q3E9pA12iZSAXUhtYCb+FQEmH1A3YUTIT/6vDSVwTjXYh+IsafPJt2ki38GcDKBU
         YEMAG4Pum4gg6E7g5aELgSYOYt5AJE8yRpRCKdOLN6IwDg0ycnmHUwTU/M9ReJoYLHli
         Deohwg1pL+kx2vhUXNelVNiowIaIWuYe1YKVVonoht6yHyG1yNNNmsFQ2tXwkN6ciyyj
         +MxLUaxIf/EfRVKyrY+JpFxVeJfV2J3THvALyEDyr1GU8BnTQVEkuPyTBoEZR30gT6UZ
         fOig==
X-Forwarded-Encrypted: i=1; AJvYcCUpNR5vU7ysn4r/keuqsDhOGVSkSdKxJTpVoCdAVfcS8IYdbtMEjviAg5Y4bbDkpo5pXeN++FDfKM8egOBhy9n3sVzpYnFYHoSBUjySig==
X-Gm-Message-State: AOJu0YwaPGI86yeF+S9gjrpRaUqXdvDQ7f+JGH50LVisINa6Wr5Qfg2p
	OkrcLGArxDWa5A4lC0BnFKeLSsUftoo7ugVuPo1xVT5ipTNpGBvT533PB2E2xzv/h4zuPWyGElu
	Mvp1dpkB4Q9r0iqnNJ7KyxPasXZna9NWeGQe9tQ==
X-Google-Smtp-Source: AGHT+IEAyXZCJmUxworvOHx5M4iyWXoKGn83vXU9An74FKMewTDmsI1ABCTIrzsggAoLQPNkOHTcA/u8/Q2R45yYeFk=
X-Received: by 2002:a25:48c8:0:b0:dcc:f8e5:c8c8 with SMTP id
 v191-20020a2548c8000000b00dccf8e5c8c8mr763050yba.45.1708558882169; Wed, 21
 Feb 2024 15:41:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com> <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:41:11 +0200
Message-ID: <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The max frequency listed in the DPU opp-table is 506MHz, this is not
> sufficient to drive a 4k@60 display, resulting in constant underrun.
>
> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> fix this.

I think we might want to keep this disabled for ChromeOS devices. Doug?

>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a19c278ebec9..a2a6717c6c87 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4417,6 +4417,11 @@ opp-506666667 {
>                                                 opp-hz = /bits/ 64 <506666667>;
>                                                 required-opps = <&rpmhpd_opp_nom>;
>                                         };
> +
> +                                       opp-608000000 {
> +                                               opp-hz = /bits/ 64 <608000000>;
> +                                               required-opps = <&rpmhpd_opp_turbo>;
> +                                       };
>                                 };
>                         };
>
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

