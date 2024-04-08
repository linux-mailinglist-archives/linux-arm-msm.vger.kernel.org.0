Return-Path: <linux-arm-msm+bounces-16760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C389B817
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0DB3B227A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 07:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE1321373;
	Mon,  8 Apr 2024 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kRzoHkQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD89520319
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559816; cv=none; b=CbJzgxpkS+DzGD2luKEwVcpt/RnAMYvIzZJQP/FzHhRCVI/G97PZC1Xb7VoQ4GFzdn5tDa6kWCkQGuemQV8ZSKHDpMWiQNy/vBJUUYsnyqhLYf1+FRInH0Z0wtVAlb4zbRFzvgmX+2WuKk4Ie4Kc9hHXKZYloqBZer4yuLE8stI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559816; c=relaxed/simple;
	bh=w9WoH+wgUPFBZU7v5FMV/NBbq3FVqAgJaP5B6SvPbuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBsFSf1KfOhQiLCDo2JPB7MCAhClerIdNYdwsLoSmHl6sesmRvm7+Cie0r4uTXBmpwkneNlQ3NHIxhbIrONduYEj/YIyK3CdoCXoaitXYNLycrzp7gj2x0f7C+YjQaltB5qQ+dn0IoWu5nQHX3Sykuv+/P03/8PDUaPyDrijExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kRzoHkQ3; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61587aa9f4cso41408377b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712559814; x=1713164614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PfF2zkgsBDIRWN7+tKxmHFe+kf7e/YHcSIbplWB0Y1g=;
        b=kRzoHkQ3+68wO2DWj4Nd0incYVzjHGsyWLstH6rYHfCop880AAjD5aCO9BLvm0goQG
         i66oNVKNufULbTO+XUO9vPENmN97YEaypEsbOPs+EhfbWPmuQ+KzJwgvNluQCZFJqO72
         3MPquX69g1LrkQ4yJEbdVMRUNZpwpLdf8iIMIVLXPCyTAtQcmfZ9N7DnFaFubVO0uZqI
         SFyVGE+V/2C0cSM7YI8HCo2hJfU3OqBflA/ZE0YouP/uidZZsVimndGGB/K93wJyhsxV
         Kc2KQq79OlTKJl08zLgD0uGe0tSUXj5uS9AryQ3o+jzu8fIsqWkbuiVZDOuLbIenGmEb
         uoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559814; x=1713164614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfF2zkgsBDIRWN7+tKxmHFe+kf7e/YHcSIbplWB0Y1g=;
        b=bjyJUzWOYNGk0/qDUmY8GvC3CMYo5Bzo5D+XaONuqy5LXMW4rKtL/FAFbeUNxv7+dF
         5jmYojXhdlE+k+Hh+bHIE/0MElYxZXbO0LR5MEynub7SdhFoZWFcUUef4zwodzalmFjM
         648y4GXoqIvnFbBzzu2lZ5Ap0g6BIv26exQJRquh8gdPJB+1vf7bAcvq1VxAyoZSaV9q
         UFMCjJXAJVM4qjBzA+aTn5cw+KcyisrWUlrcXNOwRbLwICCLAiqGTpOzBcPIyq4DtnjS
         9MDYcNEYLX2/MkFe+jrFFXD8DcIJqeopL2qdUS2VyMkJNyreMspGC9rWx9KQrQDuUEjg
         Hp3A==
X-Forwarded-Encrypted: i=1; AJvYcCXRNrNSIhFI+cZg+3buTtot6N0rcPoAx8YB8kpvBeV+80a7Xo3ZYH/9npOR8Wi8rFdU92tVljK6FFr+oI/3bimPJwVH7YGJBmkqKACc6g==
X-Gm-Message-State: AOJu0Yy4W1DIzCcnAeGjpRfMeKT/sgabVymzZkNtxu6c7xQIRsVRGmyq
	A/aPpjqKbzYz0KcT1U6bOAM8W5cBKTxO3RPRHEMHWkWZQTZfbhJ7v287+GvyQk2hh+jKB5GNZZG
	vle6jGcBEgSQaSrTIpVxrjlgO9I6B2tfMwAPPZw==
X-Google-Smtp-Source: AGHT+IHV2PTT8QQKFc4m9lOlmGvjeL/Q7PLVOM0UT/1P6BmeSpQc0oUBrTAPHJtWuy+A0W1owqvUsstkFOCku0qEqLk=
X-Received: by 2002:a25:d312:0:b0:dcc:7af5:97b4 with SMTP id
 e18-20020a25d312000000b00dcc7af597b4mr5982654ybf.12.1712559813815; Mon, 08
 Apr 2024 00:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org> <D0EJR77G6HF0.2LUJ3XY1YFG65@fairphone.com>
In-Reply-To: <D0EJR77G6HF0.2LUJ3XY1YFG65@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 10:03:22 +0300
Message-ID: <CAA8EJpqUz8anQ9V_Ht67DMrMXw49u9R01mHKDMxnGf-UpXrrUw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: add USB-C orientation GPIOs
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 10:02, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Mon Apr 8, 2024 at 4:33 AM CEST, Dmitry Baryshkov wrote:
> > Populate orientation GPIOs for some of the PMIC-GLINK-based devices.
> > This leaves only FairPhone5, RB3Gen2, SC8180X Primus and SC8280XP CRD
> > without the orientation GPIOs declared.
>
> Hi Dmitry,
>
> How would I find this GPIO on the schematics, or downstream devicetree?
> I scanned over some relevant areas but nothing jumped out at me except
> for the USB_PHY_PS signal coming from PM7250B CC_OUT and going into
> GPIO_140 of the QCM6490 - but I'm guessing this is something else?

It is exactly that GPIO.

>
> Regards
> Luca
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >       arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
> >       arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
> >       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C orientation GPIOs
> >       arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientation GPIOs
> >
> >  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        | 2 ++
> >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
> >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 1 +
> >  arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    | 1 +
> >  4 files changed, 6 insertions(+)
> > ---
> > base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> > change-id: 20240408-hdk-orientation-gpios-141bc7fd247d
> >
> > Best regards,
>


-- 
With best wishes
Dmitry

