Return-Path: <linux-arm-msm+bounces-57672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54CAB4FBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 11:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF94219E0193
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5446E226177;
	Tue, 13 May 2025 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtXHVIrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C720E03C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128523; cv=none; b=akFXSWgKQ6oaWFkIB1avh3M6CNsTzpcGxEyKlO+MTzGSl+pQjIFfMsZPFaoOpn+pMldUey2Uz7LpSEuJrs9bAEmJiSV+N2XOxa3LmjyMXZ3N5S1IFxH7/QOJv9nyrITfdcSgcr7h6DexgKCQeinXZf9x6dnPSd9ODjFmnP/rEdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128523; c=relaxed/simple;
	bh=sdWO6ko67mqTWcGMEtMgDVXtVTLim084V1a605JGgT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5bYptAFGCEN/E0dxDbZFLuNxVRHFOdPRaFZqSi/gJjLpz9ZI/dWFxTW6aq7QNLFssHGVooFFjMlt6VRaGBzgw/8X6OPGjTXc0n5kF4c4pP1UdZwMJmfRTMz9rnSb7Y5ZWDb2OZkk5ER/uy03CjjT2PCpwP8KSZBVoq6IpzMVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtXHVIrE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54fc64e8419so5132214e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128519; x=1747733319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBWoBdG3lbXFBJdWTyceAqfFC9xtnHUxGj7C5Wu4R/Y=;
        b=xtXHVIrEJxQpK/jITVVUxFeYQH6C6fVt+60KftrSUEpcV+ZgECys7tjl33Recxr7ZX
         L7cAZzCkuXLXDSq+UBPQxzDwe3EAx6RXkgsGPDSMgJFAPpWug//zhfP9EQ1mMmr089lk
         ON7zUSjCE1WIPfjfoRXGxeJ3Tw4BeKLG9ig0T4ZLxNikNCJ4OQYaGQUXooFKybdpY/T7
         AMm8SHkM9O2FjGJUt8Ci3XHtWKPFztGf1DCdGpPN0gnxkn7sbr5Fz7WtbZo851wbXmpS
         MPDbRY7FwNXBVIJp6/xsgRe24iiSqb0qly7RXgUHdobJjCtrq3hpnrZV91xj2d8Cghkv
         FdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128519; x=1747733319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBWoBdG3lbXFBJdWTyceAqfFC9xtnHUxGj7C5Wu4R/Y=;
        b=Foofq0QF4ODVNtGaKrUjMP5tETZ6fyEBmBbkXopOVljYCc5UKVYNkk+JxIYcdLMBvA
         8FRZhHNJEIiIkWrCsJbncZi/JpMV6txffelUGhVPuDY/a1W1j5IreaoJzdBOHpuRVLWd
         oI6LeHTeYkjmdDJr8iY1as4BRIIPJ+yeEm9PythNBh29dUTQKHMH7YI24pXoFOAqwWAw
         OukzY1DH0AYcLeS445tL1R0wV27v1BS/hA6Jsp1ynCjpoJ+8ZV9LBvYIFtLRhHJfnO2V
         uk2F8tkzaiINnZY8jJBv6zMfkPyeICEkahLjvl/NObqrpT2VC4V3zBaekH87juWkcTZt
         ETSg==
X-Forwarded-Encrypted: i=1; AJvYcCUpb0tWs60kZBqx+VxonUHArJeYBpm4v0Tjk1HomFHZqxuJOaEyFPw+ZzzP8raX1igTksapMXI/aduPjKI1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/rQv1CqTLa/7kXXr9APWWB2KptByuqqkkRDU/Q8yDuQ2KUiCd
	NIn7ebKSXH8VCYir4PAjhd3csATi/irMq1a85JbIMqq6zFGf6n5rIXHWnQuQcVrFDpgN60232dU
	yhyYPpeMp86uEPwowUvUotdhuHHkf3Bukz6gH6w==
X-Gm-Gg: ASbGncsnAU2OUXw+CoYCub4x46wEySaUvNPpu33cYeOD9D8bBZSqd21w1+jOfNYHw/Q
	ediNsq9HU8M3WulZFQ/7r/ATnp4Ohv6tHDWvY2515W5ePscBQ1kcXGZkqid1ZUQoCi87ETOLtZl
	sl55M58/A/9Rebnelrcj3nLw2Z337SYLQt
X-Google-Smtp-Source: AGHT+IGPsCaQsVwlbGypFhudSFOc2s4QHLHTEndYHt5ArHEoc7abTls+1/mAIN2RUHgXYU7cdExwVaSdPdvNIIu+maw=
X-Received: by 2002:a05:6512:1385:b0:549:6030:a720 with SMTP id
 2adb3069b0e04-550d0c09efbmr969887e87.23.1747128519475; Tue, 13 May 2025
 02:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:28:28 +0200
X-Gm-Features: AX0GCFu5WhS-D41dmYNwbrb5PKy-0pktNjYekORF361g_nOjHNY4p6UTBXBPCbc
Message-ID: <CACRpkdbcm3AkcT9SxWfEYz1tsZQSLMUgY5nmTD9_iEq3Xs+shw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: qcom: several fixes for the pinctrl-msm code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sat, May 3, 2025 at 7:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Fix/rework several issues in the pinctrl-msm common code. The most
> important fix is the one for the gpio-hog handling.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (4):
>       pinctrl: qcom: don't crash on enabling GPIO HOG pins
>       pinctrl: qcom: switch to devm_register_sys_off_handler()
>       pinctrl: qcom: switch to devm_gpiochip_add_data()
>       pinctrl: qcom: drop msm_pinctrl_remove()

Nice work, since it is core stuff it'd be great if Bjorn could take a look
at the next iteration too. (I'd suggest to ping him on IRC.)

Yours,
Linus Walleij

