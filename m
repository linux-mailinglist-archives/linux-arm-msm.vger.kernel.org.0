Return-Path: <linux-arm-msm+bounces-81408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C4C524B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B34534BC63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255DF335067;
	Wed, 12 Nov 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uxo36mmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3C32ED4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951427; cv=none; b=Bo0NX2ilJ4o9HNjyeyMhKYBnLiX4q22HLfRbJb9cDu5j2ZVaBk0YrUbZAKv5I7/e6k+M2fmkcBBpYEiS5hOKgG4xR+M/r8pYPMGKZ+MhjtyxtD6QiAyKeRBN1wYZ7imzUZT144QwfAsh3fKy07zQopIYjpLlzkWaGedBTq+gpL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951427; c=relaxed/simple;
	bh=oDG71wLkZH6zNZ8BBmCy1cYzzKvLo2hY7GqxG8NdDxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVvh2zBf3j8FHhySs9NPz9ez760YhXUiUL+E8yZGSIjzlbqeuB+Avli81nl8XvRVt0v3BjAC/O5XkEraa4lGsHgu7uZVw/RzHAzgYhAUeYLY5fJpShpEFdtaMzoGvHOC8YNxGjolL5LhhMmFeiPPGzNV5D7m/vE6LkGJzN26pQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uxo36mmt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-594516d941cso865549e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 04:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762951423; x=1763556223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDG71wLkZH6zNZ8BBmCy1cYzzKvLo2hY7GqxG8NdDxk=;
        b=uxo36mmtj8Hh+wII3sTWzpG8uou1bkkJCbYDvyvOcxOOpzOUM7cmRMlItxiPTpT3lA
         0G3JQ0olpAdjQaaMDHrN4TDKa9GjJx7tk6u6pd3Mc2Txjn7ROQuK4pSzF8Gq7fX4YyOk
         MZjPar6m400HZLMhAqlqqVEBOJxUwcjMmfTtUkAK9CMhlolvzTw3+2VH+L4mzl1GdxMZ
         qr8/FIgPcanmRg1Oen4DdUs9Iryg673YXkKnJj6U2FDyOB0MPjflGMfZpKyT9PHjSijc
         u+lPz5943ICxpmNykEHYHxTVJeIAbR2JReXirkb5hro76hxAHTHg91ciWg2dX/tjksOM
         AkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762951423; x=1763556223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDG71wLkZH6zNZ8BBmCy1cYzzKvLo2hY7GqxG8NdDxk=;
        b=akYS6AFPyA4wzigW6RGqS7jZ7Ri7WfxYy4175hZV8BKEEJgOpjXoxdvAmtgPhmw4m7
         X4g9r6lSF0jAkiF+iQJqRmwLALRRjFIG45vE0H1474yUSjV18wY7DV2AB+FOdYsIii25
         0B0ttY5Ta9EGVUlTiXBz8xYmK7+edsnVjYTpMdm36USKz6snk+hIYvOKHTjdkjRA/PN9
         37NB5XFIQxAyikI9sVlrbcJqL8zYwQVzMJrsmj7KOhHv0ppxeyKuo6+d4Ejf7X8lJ/mh
         XeH1tvNh1KSGDaFeIYZtVGos++Ag6/GCm6KjGThUB40JYgNjmTGq4pfU79PF1jiis2Mm
         c4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVhwia423ZqNwLsi+420wPbeaP9FL/HCcvd8ddRZIR6zpPtYON7b5QYL0h/z5wXaCQki1zc73vN9xI4edP7@vger.kernel.org
X-Gm-Message-State: AOJu0YyqzFn7nxk6X778kCKqhRCT0zj9oYJCz60ypoIUHb9IJAUI94UT
	0F1mGphNCVg5yTRqidWG2w35K64LAnx4h3NroNNQ+LnCmrcNLShWrC2DoX6Hx/dp+Z4UqEQZLMG
	BmBXL8xqM0TvnsJh1HIU6sNgABlKnOf4npp6l1A+PzQ==
X-Gm-Gg: ASbGncv+7mtUbcxoiovMxQFJqbsEBjSjqoJO8bANVtZUxy+SG47LiwitBhiSE1UcaMn
	cjcGCahNeZHT3Rvm+AwRA2uYSMHeaS0DshhlkHZI5Jj56mCPWqSzijlooAF5P+JOiisKDtlRWB/
	jlFaBnODTAxH0vebIzeO9ErOitLl00rsUj/b6zFg3PzDkUAKWIS3lJSRE9QDR4MtY+3XIoTM5JN
	c96rcLWSKTI6JkzL46gPQro6bMQkJAnmWjvg++t4Hx65QY9iMvAyJBqYfj+
X-Google-Smtp-Source: AGHT+IFKrAN2G2zTZh4SCpeU6gZa9GThIvhb7rVDTGkR/MLZ+R0xImuA8WoUYuizes16PmjbOY9KlVCaKR3Fm5qO6C8=
X-Received: by 2002:a05:6512:b9d:b0:595:7e01:6b3a with SMTP id
 2adb3069b0e04-5957e016e6emr28072e87.14.1762951423456; Wed, 12 Nov 2025
 04:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com> <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
In-Reply-To: <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Nov 2025 13:43:30 +0100
X-Gm-Features: AWmQ_blw_0zZEbC2wTIU0HIhaE3Pg5Px5M6V4b6IhL47o7V7zMZgJkY7fz-LNV8
Message-ID: <CACRpkdYEbxtjoi8KQxS5fY6xr3UZwQmG-yKvT3L8fRcCXDaAwQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] pinctrl: qcom: msm: Fix potential deadlock in
 pinmux configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org, 
	jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, 
	quic_cchiluve@quicinc.com, Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Praveen,

thanks for your patch!

On Mon, Nov 10, 2025 at 11:11=E2=80=AFAM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:

> Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
> to prevent potential deadlock when wakeup IRQ is triggered on the same
> GPIO being reconfigured.
>
> The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
> handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
> msm_pinmux_set_mux() calls disable_irq() which waits for the currently
> running IRQ handler to complete, creating a circular dependency that
> results in deadlock.
>
> Using disable_irq_nosync() avoids waiting for the IRQ handler to
> complete, preventing the deadlock condition while still properly
> disabling the interrupt during pinmux reconfiguration.
>
> Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

I applied this patch 2/4 to the pin control tree for fixes.

I removed the word "potential" from subject and text so as to
reflect what Bjorn is saying: it's a very real issue.

Thanks for fixing this!
Linus Walleij

