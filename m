Return-Path: <linux-arm-msm+bounces-26871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A7939E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AEFD1C21F0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F2C44C9E;
	Tue, 23 Jul 2024 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGvWfzek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22114D6FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728804; cv=none; b=gk7fZr3ePsVyiWXIISg3Wx+SWEdqUccE35rsR2ioFBKazlA4ICEwIn31XLkHnI0h0WM7Kd0uydode6AczQOOBqgBPhPBV6mFxNaOoSauH2xd9Gh/Q0OvIoM+d+LMVSNIy0SumfyNqeG2aDtMez68KEutskGkAdknAmfywf53aV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728804; c=relaxed/simple;
	bh=kk+j2Ql6QbWJ+8iVDFCSzMYsYxcq5fYQlSZN0WTgnFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shMT1wSBu9IYxmNsBEXsy7wkSTDvIu3JkoFdXbZvNVgo7sMQHKD+qj4kJ6nsZ1NACPp38IQTf0okwzvXcOYZUOHK8alLRlLHNWXqBGtJjxNUTbiQc6I907ubZ+xT8Xny3pmHvPPZaoEbImTThTBX+h/cDRmF+w9CTS0v81u/L4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tGvWfzek; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6678a45eaa3so50841837b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721728802; x=1722333602; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ9Qf7tzxpC5iei1isMPCv59BXDJInOL01TWRb+zzks=;
        b=tGvWfzekownXT+fHIvqVMu/Ypk5Bqn+H2v3qbFEUb8EVO6Hf60ofFRBaVfrx6I9Q8F
         zXz/kDDkL4K9RAQsQqZrlysKFLqaMqFuj4bMpnoSl2wnzeujU5LzDwox0KgMs3ZAvfy8
         AjYiXOMq5S+Ep1ubp5TSRWSbWxqEOifdFauk33FLppTo5JJRJbfe7shLPUIEEF6c03C5
         +hZOzNvO5QwvzIsIa8G4GK0K/vUAwWu8sdq4QSRBW7JPX0ZPsfmP+VDbnggraUlBFwNz
         x9Mc2cdNQFZodHp5CfvOx7KPelI3oVQNy7xUrZ6muMm2/0ZhcSwoPbBqys8BXZx14Hot
         ralw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728802; x=1722333602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ9Qf7tzxpC5iei1isMPCv59BXDJInOL01TWRb+zzks=;
        b=gQFjuNgcYCQYSbstTUQXFJX1veOr7oqvuvb2bBydfzX+N0Gq8b9Zv1n6Hd17m9KeCL
         N4kV/2DFaVn8ksosRXyWOD+fpa5dS9w9oerAJKv2PxY7sRgrOmfgrWCwvVmoWTgGslMP
         bUc74vRJn8QR1CyrklaLcdUOeqBI+TpxZMfYgCrw/veXYlg82yD+MvnkHdZLIBuv3lnC
         kE1nyZdoF2XTjt2QrzJHON129QozHsL0RLAn3z1QlryrbeYQ/Sqb5+FuJEq6+zty5VqZ
         j+9jEdAy06Dzw2KiUQuRfoeJycbSgmwcZ8k0jbydw9OekjOeEaRuYAMEtdt0Qsj2nIL0
         N9xA==
X-Forwarded-Encrypted: i=1; AJvYcCWq9IBLO3G61nVBcZjnVNRhRk+16T4QNItCES5HiN+i6upTPGMjzRuRq85zxq6gfybGY/FshU2wXNOabnWZZRuiMu1ltGFpn7S4MPrwGw==
X-Gm-Message-State: AOJu0YwKOwN/hV44vouw0H08bMANZ1IiAs+5eTjedcmrq4QpaEdDNoMH
	NEQoRoDfpqxa6F1L/oFUWqJqcxJV3tg8GQZ/OXKYf2qOmCLeHJhjytHA58rzFXfCza5QZq0SyJ3
	A+54g0rTw9MyPOkAHv2DvQsvUtLqykC6dylxdhg==
X-Google-Smtp-Source: AGHT+IEK7eHMKU1XQHiBgtOg3dXLbIEHt6ytDKj/LYQe0cCDUemYTFAfT3Z9In6r8gnhOF50cJznogYo2H/FLxdYzK0=
X-Received: by 2002:a05:690c:2fc1:b0:665:7661:2b7a with SMTP id
 00721157ae682-66ad8dc2403mr100520887b3.25.1721728801875; Tue, 23 Jul 2024
 03:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr> <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr> <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
In-Reply-To: <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 12:59:50 +0300
Message-ID: <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>
> > No, that's fine. It is the SMMU issue that Konrad has been asking you
> > to take a look at.
>
> Context:
>
> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>
>
> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
> on my board.

Interestingly enough, I can also see iommu errors during WiFi startup
/ shutdown on msm8998 / miix630. This leads me to thinking that it
well might be that there is a missing quirk in the iommu driver.

>
> I can test a reboot loop for a few hours, to see if anything shows up.

Yes, pleas.

-- 
With best wishes
Dmitry

