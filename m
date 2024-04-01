Return-Path: <linux-arm-msm+bounces-15968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF708944FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 20:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC13B281EA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 18:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507DA446DB;
	Mon,  1 Apr 2024 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ncyYBgv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B342056
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711997332; cv=none; b=EuGgE+f4cxx216UKdYZ+aQFS4Sj/pf+IxiIDBcjZMS6Br+afT5yPL9Jx5YZd0EzRdZ6MeJULsfzLY6cEiP6FEafjASVzf9g/C+vchm76Nc+NldkNoYt69uF3Jn57pzUWjs3qEpxeZ3oRTQCBYVrYWya581U95kyr6THH9qZ5/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711997332; c=relaxed/simple;
	bh=k7oaUCZYi+tFu3mnwGC2mP0W7sg5b2RBuxNglUKI9GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJ4atvpLnGbrZkaUOKrYSZo4Jh6wiswZcxHyewnKmnAyYZJtEODPPstuqK/1py/L6aZ+KOx3cbBjf7gZKXQ443xTkp37esuM66Ws9mzqnHwq0avkatblW53cyupRaona4dvX/s9ffILjjkfZxz9fmnL3oTkS+tJxd1gHotbIkI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ncyYBgv0; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-614769887e6so13424197b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711997329; x=1712602129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcJHXP6yoVOVq/0bTdnc0kU73nmqwp/JtuZqTmV7YiM=;
        b=ncyYBgv04M6+IaU/aF9R++tmo5O1bf5bVkunC2O6vl8olSlKMx7IiD6bGCQ/A6c2Tn
         JSczL4q3p27ASMLNS8+u+iUjtHxgixr6yXdhyczps40JlYZUwkfRrkDnVBqvtBqwsCnO
         5ZbXS18asxuWZc1jftklXoNksODzZ/8++YrnECnz8F+IDo+jRhks8iJuwkOmZ9YSXoqW
         abqo3OLOnXdV3KQDUyn1tDpvASRAE2omR6A5HhVgTAdTIHWFTDgayMrorFR58avF0OYP
         BxTJqe0A8VbFvFFhwOBdbV/5mn8scUlbtMSbHYPyotcvUsg/wfksRnkr7eOxP9wsLEXQ
         +/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711997329; x=1712602129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcJHXP6yoVOVq/0bTdnc0kU73nmqwp/JtuZqTmV7YiM=;
        b=p27qr6OBBiNpZ6UJDxQHNDNGEPf0jo50JCrN9ZS+H138zTPoncvUEY8KORVK3t+ZYv
         w7vI8ptSbYUY762bFg0ivc92C8sJdwsha2718iHloLUg8sq5FSPOJ7Qk9xJ8Q7jhwCJK
         nsYFeICihaE9P91xMNqM90QTpe8XOyvtnLSqh2r7Zqc0FYSSakyUsoyIvT++4xWQLAF8
         NVO++BFIkjAdXCrUuxG7gjnWfEWN6SxNKkx9nPMF1m8gE974rHV05zyjipxjRNu+BEGd
         G6wKkoAo90cbRKeS5iTfxYY4teuG/Wdy33uE3yfFpa7Ged1DZGaixa+q73L8W3iwjOnK
         IydA==
X-Forwarded-Encrypted: i=1; AJvYcCW6pcP2MRKbSUS28aYAlmNNcHsVuqlJ6bc/sb2Huz2BRrEGkTj/DqJyj1CXC1Juin+aDPA+VyPdUMxBT6FwlGRFWTWb8+0qTXn7EZj/FQ==
X-Gm-Message-State: AOJu0Yzh2VTByW6rqc6SOVkltoGbyuAai4X4APt7msbPu2oaHtw5uKQh
	GuZfLgXozhyW4DLp7qsQ5sYodRqBEMtA8cbMiAis9iLfa8HwI6/D80+dT9Vzwy2caSoikXnqy8Z
	FW2Q8pxSsu5HDvC2fMLhLz0v7tQwnngvI3I3W/w==
X-Google-Smtp-Source: AGHT+IGuFi2qpwA8GW313d/Qlxd28TYnQmccY50m6PgePIkbBZYHq7P54q4cGA9c4m2MocI5lTc9YyYGxyOpaQB897U=
X-Received: by 2002:a5b:845:0:b0:dc6:f0ac:6b53 with SMTP id
 v5-20020a5b0845000000b00dc6f0ac6b53mr6523459ybq.15.1711997329387; Mon, 01 Apr
 2024 11:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org> <171198916314.1093638.15006189720750656914.robh@kernel.org>
In-Reply-To: <171198916314.1093638.15006189720750656914.robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Apr 2024 21:48:38 +0300
Message-ID: <CAA8EJpp0dvvM=02r3L+Hztb--inJLPJX+BhGrNB8xhdFiKDF_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: fix description of the Type-C signals
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2024 at 19:36, Rob Herring <robh@kernel.org> wrote:
>
>
> On Sun, 31 Mar 2024 06:48:50 +0300, Dmitry Baryshkov wrote:
> > Rename the HS link between usb-c-connector and the DWC3 USB controller.
> > Add missing graph connection between the QMP PHY and DWC3 USB
> > controller.
> >
> > Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Fixed other platforms in addition to sm8250 (Bryan)
> > - Link to v1: https://lore.kernel.org/r/20240322-typec-fix-sm8250-v1-0-=
1ac22b333ea9@linaro.org
> >
> > ---
> > Dmitry Baryshkov (7):
> >       arm64: dts: qcom: sm8250: describe HS signals properly
> >       arm64: dts: qcom: sm8250: add a link between DWC3 and QMP PHY
> >       arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings
> >       arm64: dts: qcom: sc8180x: describe USB signals properly
> >       arm64: dts: qcom: sc8280xp: describe USB signals properly
> >       arm64: dts: qcom: x1e80100: describe USB signals properly
> >       arm64: dts: qcom: sm8150-hdk: rename Type-C HS endpoints
> >
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   8 +-
> >  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  16 +-
> >  arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  20 +--
> >  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 164 ++++++++++---=
--------
> >  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  20 +--
> >  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  20 +--
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  54 ++++++-
> >  arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   4 +-
> >  .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |   8 +-
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi               |  24 ++-
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 149 +++++++++++++=
+++++-
> >  11 files changed, 340 insertions(+), 147 deletions(-)
> > ---
> > base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
> > change-id: 20240322-typec-fix-sm8250-33c47a03a056
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy qcom/qrb5165-rb5.dtb qcom/sc818=
0x-lenovo-flex-5g.dtb qcom/sc8180x-primus.dtb qcom/sc8280xp-crd.dtb qcom/sc=
8280xp-lenovo-thinkpad-x13s.dtb qcom/sm8150-hdk.dtb' for 20240331-typec-fix=
-sm8250-v2-0-857acb6bd88e@linaro.org:
>
> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af0=
0000: clocks: [[41, 0], [42], [95, 1], [95, 2], [99, 1], [99, 2], [125, 0],=
 [125, 1]] is too long
>         from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-=
sm8x50.yaml#
> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: cl=
ocks: [[41, 0], [42], [97, 1], [97, 2], [101, 1], [101, 2], [127, 0], [127,=
 1]] is too long
>         from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-=
sm8x50.yaml#

I don' t think it's new, it just had PHY indices changed. But let's
fix it anyway.

>
>
>
>
>


--=20
With best wishes
Dmitry

