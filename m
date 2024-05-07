Return-Path: <linux-arm-msm+bounces-19310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C23618BE173
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F262CB23EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 11:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABF0158A13;
	Tue,  7 May 2024 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eiiT/8ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4F157462
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715082958; cv=none; b=Kkal0jk7ZaSesgbMTR6YwWlJTmG6RpxoU0dyWXPvP7eowOJWcr2GgH0bk9HjeA+W/SEw44BhzMERQGWm10EnVwfSddSMk2sOZEMfl520Q5/KwDi4GJtsYUr3VmzvtIJ1J5Eb/sLjekWcNgI7jfY/qF2C9BGzfrec003fUQ5WPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715082958; c=relaxed/simple;
	bh=UEi9x9olAWyIw4Y3dEkosSNpqBSK5ax3cAPFMnIeVYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4vyaSuOzDALYeF4Gk5YjV4kCVEaCOn1le+fEOt7+Hpb7fJYtEtDP7LVChCE9XrdlSX33URg7THbDhthKEOPv95MrmOOlOp6qGS/am+TpWJSWqyXI1ORoqgGPZz9u5qVsWsVsl2mdWO9fpBRY6CvkZYKkbyWjpVNT1DNZzjgkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eiiT/8ah; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2978210276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 04:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715082956; x=1715687756; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+pGkFUViosNbBwj85G0vrmVhdnEjrRiE3lfdvk1nPvw=;
        b=eiiT/8ahvrwt0g2otN4xst5wYFMpA5tOeZMIZ0FKC61oJ7g2px+6HG3Bs6n5YI32Cr
         UtdNvCiXTX1aXrCLo5/rhwd9Pi+5jB/w+Gjc8p07s81Eyl3Wo7uPYGO/gc9vlr5ZRyaX
         dxK92IkA8hMeYqwlmjoNliLkgI0qggJFLOiJ1L3e4+sSz9S8knvekTli/1KQm0krRUZd
         vArTDDJwqnbr/MjcLzryEHJb6tQFcHdAGMp/fjW+uwqeMJXVOkjJ7PoEk4ITn01HpdhG
         uy4EKh0OY0Evm9126SUuxzLlrIZu8OE8z+We7rjHY0Is3ZqIuLrNiNKfZW4dcnYFWnd1
         WVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082956; x=1715687756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pGkFUViosNbBwj85G0vrmVhdnEjrRiE3lfdvk1nPvw=;
        b=U/xQk8bi893WH3zF/idoWzWQiRuZMxWVsGhjYky1TE00+hNg+23yK9QJISLoxwW4QA
         ohF4vjlKIn68JfsNPKXMBLCqE0paGUfqIBcp2HHFLJMP8nkureYBu63AuIp9mr7LjPXq
         0ZMRrmr+pWJhkKZJIC0XsPeWnRVaUeCBeIrVXasFTKGw6ikJm+sCkI5gcsU/Ktx2YtbC
         vCYqar9SUmKoRQ13RhmcQ8veUIqnQ68/sP93k5XmvtjrvccQNobdU9gLYc+ba7UzNVog
         2Z2Ot5NsvZKcuYT2OzYSllI/MjCU5dt13O97gDNwNlar+U533peQT3Z9+r5KaqS5jUmw
         9XNA==
X-Forwarded-Encrypted: i=1; AJvYcCVM9CzZYldFvcN+cUzaGIMT2liyLzDlehd+ufOLIGiuQ0KWTQAYVu9AfIxEIUzIk1UPFvaY2apl+8Ngfy7NGK6faGetKqB/J7GtQYedHA==
X-Gm-Message-State: AOJu0Yy6EXHf+ZoBXu7vC/KTODdLCNInw9Bqfg0bgr2VMvMpSqfWnwm1
	Tmq8NQtpE7SEYmo/KrmEIwtCsGCsGOS8EPGhFhKCS9VeWoCT+gsM4L+lxDW77Rp6nrdyMp8mqhw
	GH0PUVfusaGulT+ZmfMkTAkamAdYpuXJHQrNJGQ==
X-Google-Smtp-Source: AGHT+IFjjy/JkHojT8EtUSY1sz+DG0YV+wEmy+k/TPQ1lX5kK3s31xaoFvKEbuasOExcuTi6OPxZ9GDQ6NlEAbyEDBY=
X-Received: by 2002:a25:f621:0:b0:dd1:3cc1:5352 with SMTP id
 t33-20020a25f621000000b00dd13cc15352mr11210499ybd.15.1715082956486; Tue, 07
 May 2024 04:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502123312.31083-1-quic_ugoswami@quicinc.com>
 <CAA8EJppeQTadmny=hcs4xCQDXHwXEBHXjeecvZCUVcSXmwBTgg@mail.gmail.com> <90a5b641-af5b-4640-b2ad-85dbbab523bf@linaro.org>
In-Reply-To: <90a5b641-af5b-4640-b2ad-85dbbab523bf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 May 2024 14:55:45 +0300
Message-ID: <CAA8EJpoWWXvJabcVqp+YSa8arQbLPC=v+XkvPZe6nwH7aaKnfQ@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-snps-femto-v2: Add load and voltage setting for
 LDO's used
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Udipto Goswami <quic_ugoswami@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 14:43, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 5/2/24 15:12, Dmitry Baryshkov wrote:
> > On Thu, 2 May 2024 at 15:33, Udipto Goswami <quic_ugoswami@quicinc.com> wrote:
> >>
> >> The Femto phy depends on 0.88/ 1.8/ 3.3V regulators for its operation.
> >> If one of the regulators is not voted to the required minimum voltage
> >> for phy to operate, then High speed mode of operation will fail.
> >>
> >> On certain targets like (qcm6490_rb3gen2) where the minimum voltage
> >> of the regulator is lower than the operating voltage of the phy.
> >> If not voted properly, the phy supply would be limited to the min value
> >> of the LDO thereby rendering the phy non-operational.
> >>
> >> The current implementation of the regulators in the Femto PHY is not
> >> setting the load and voltage for each LDO. The appropriate voltages and
> >> loads required for the PHY to operate should be set.
> >
> > Please move min/max voltages to the DTS. There is no need to set them
> > from the driver.
> >
> > Also, is there any reason why you can't use `regulator-initial-mode =
> > <RPMH_REGULATOR_MODE_HPM>;` like other boards do?
>
> The point is to aggregate the values and switch to HPM if a threshold is
> crossed (or stay in LPM otherwise)

I see that other boards use regulator-initial-mode for the USB PHY
regulators. Are we going to change all of them too?
Also note, that while the combo QMP driver sets the loads, the pure
USB QMP PHY driver doesn't set the loads. This way we can end up with
the undervolted PHY.

-- 
With best wishes
Dmitry

