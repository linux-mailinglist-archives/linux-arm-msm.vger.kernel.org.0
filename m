Return-Path: <linux-arm-msm+bounces-30325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C6C966CFC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 01:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69F0D1C2212E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 23:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240AC18FC8F;
	Fri, 30 Aug 2024 23:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHHAI1eQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3117B4F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 23:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725061520; cv=none; b=StZ4vzNLZtc7+ZQhpvkrGTCeDcEhQ12CQRWTx7NMW4flTBoHQg8x9zzDLsk9AqCaE88ZYRw9kQdLVtkT1CPpksRA/LuCrbdlf9dm4c428K2cVzIjX3K82gNBvoSWwXKpSh4EuiiweXQl9ZJUc/EDOpIsKHg2AO8s/u7aSGCcVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725061520; c=relaxed/simple;
	bh=BJrJHWK2hrRviWc8RTcAUobYhqxsaxKanbop8FqZH3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i77uN1F8JXznih55ABtWbH6LKFTUL7qvkSjZSAfw012oTmHozRWCS2LwvIDKYsnBHxnvu05s4DMIG5biymKiQkhzx5hsoR1BiFiG7cfWz/FfGs+U+UM1I9l5XSscYl+Tk8ZsuxrZquI2g5h9/dLeyxZU4GW2LgafmYZ0Zc7YlTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHHAI1eQ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ca1d6f549eso27135207b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725061516; x=1725666316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s6RDRV/2cMLBxQkdzyFPsx7+tarsO2IXXvRThC1aAb4=;
        b=XHHAI1eQL60aX69x6/I7Zm4WA6bX4rxWBSF+lOSPxKd1r1G+V0SVZZ1/B2QE1cfpff
         tt+j6SY/wmRRO7BQWtpWZtC3lJScrIPAvAKDN30rvqARw86rDD1b3x7lmH/1qsVzXN2s
         8LRIvnxRHzSP6Qc/kJwmpHw+spNUmk7uS87VMBOOj3o00/TMQTGRZtC/ggN6GnK8KvdZ
         K4LQ9qFZLT8/+NT1NNcVoGcE/RBZEhIEd1YIVQZLMJSnXqRY0PLFNNlsATMaxQK0xe0Z
         1I0j+X8PRuYoWtirH5dMaDhZ6rE7Hj/1/NGRAmdGbGqBryhrjG2LTwue/WtY/5W4papy
         smQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725061516; x=1725666316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6RDRV/2cMLBxQkdzyFPsx7+tarsO2IXXvRThC1aAb4=;
        b=mSo/Zw0NmiFdJOe7h+P5R31jyNwZGAegok66bFbqktn2vkbSSSMde6fX47rCBbnWuw
         UtCApMgC2h1SrGD4XOlKF5XEDX40Xg6Xxqzpoa4idkRk7R/XuSPiCU76fBNmHv8QgJhs
         CHXh4V//FoIWYlZlm5DzEos0IyX7ZJOy50JgvmdebBP2vR/Ww9CRJdZEDkh/MVfUTZvn
         +wcTOzB8gg/2QVsShIRRGF2hwqaWiXVz9Q/AnNB9KuOcV4noHzsb47viULe/7eVeVGCe
         gUmVoOOXtdONRlpX5So3QkrQfVGdIyyk/yisNKsFbvrQN7EzE6rEvZJ9HessJvvb0dHb
         2w8A==
X-Forwarded-Encrypted: i=1; AJvYcCU2KUFV19KCuqEkELj2CtmOQ47MiGHFCxxjsNdpwHv+sYwyKDrTev8q1SdWLxbUOlaxIHqOH91YKdT8s9EO@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUB6Z9awRsyrorWPIRoAEDbg2P1uqqC/+hT5ivO3vL53koRK8
	9M6D+BCzT+icrKH/3twxPsF20qQhJDkfM1JcGtHDlEP3YgsqDlPUKbWjwpPKwvsSIbDKCxwg/NC
	oMSGv7lFqMzao393MkMRGoocSqab7toLxsVrAdQ==
X-Google-Smtp-Source: AGHT+IHfhSbm43+Kc4Ly206lcH17lzoQ0MsCuKhc2fSpqgnSY7QJASQeQlrIK7n1P7aXyz3Fk75oT++EVgArwU/kRyY=
X-Received: by 2002:a05:690c:660b:b0:6be:28ab:d873 with SMTP id
 00721157ae682-6d40d88b9e1mr47313387b3.2.1725061516161; Fri, 30 Aug 2024
 16:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
 <20240830-nxp-ptn3222-v2-2-4c6d8535cf6c@linaro.org> <6fcaa893-70a4-44f4-afc0-853799e30774@quicinc.com>
In-Reply-To: <6fcaa893-70a4-44f4-afc0-853799e30774@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 02:45:05 +0300
Message-ID: <CAA8EJpoTb_-HtBPv2=FecHvtHYQD4ipqfq3C98ky=qXEXB=_6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
To: Song Xue <quic_songxue@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Aug 2024 at 02:13, Song Xue <quic_songxue@quicinc.com> wrote:
> On 8/30/2024 4:20 PM, Dmitry Baryshkov wrote:
> > The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> > translation between eUSB2 and USB2 signalling schemes. It supports all
> > three data rates: Low Speed, Full Speed and High Speed.
> >
> > The reset state enables autonegotiation of the PHY role and of the data
> > rate, so no additional programming is required.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Tested-by: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/phy/Kconfig           |  11 ++++
> >   drivers/phy/Makefile          |   1 +
> >   drivers/phy/phy-nxp-ptn3222.c | 123 ++++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 135 insertions(+)

[trimmed]

> > +
> > +MODULE_DESCRIPTION("NXP PTN3222 eUSB2 Redriver driver");
> > +MODULE_LICENSE("GPL");
> >
> The I2C driver just realizes the function on reset and PWR. What about
> other I2C driver function like I2C interface operations,

I don't quite understand what you mean by this. Could you please clarify?

>  auto-suspend,

I think you mean pm_runtime here. It's a valid case, but granted that
it should stay enabled when USB controller is enabled, the gain should
be pretty limited. I'll consider a followup patch implementing
pm_runtime for the sake of being able to disable I2C host if DWC3
controller disables the PHY.

> remote wakeup,

Not supported by design. PTN3222 doesn't have IRQ pins to report
events to the host.

> memory maps etc.

huh?

>  Who will enable these? I think it is not
> incomplete I2C driver, if on someday, ptn3222 is used as I2C device.

Well, I'm using it as an I2C device.

-- 
With best wishes
Dmitry

