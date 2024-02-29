Return-Path: <linux-arm-msm+bounces-12931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C686BE88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 02:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24BE61F24897
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 01:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72560376E5;
	Thu, 29 Feb 2024 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iqoWSzGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C988376E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 01:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171483; cv=none; b=dFQaMN6Z1H+9MhokwMB/YY6P1OiB42F4Sdq7Mr9Yd28FIrwyKeLfP+hzbgsaQv+eoy+vC/BR9+LRieDtp946ww/npJLyFYZoGbasfAtAHQsFcsci+twyq9J4ggnxS3ysUXAFI1jlBAAAlPAlQVdKD757LoqfZLCQDYuev4tq6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171483; c=relaxed/simple;
	bh=dyNQOsNqoX691z3lmsUE0UqeK3j+5UYGTMnTcRHjwiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEKBnd9SWXrEd048XksLTnXsrxBVh/lpEdtwoLXwQoosm0tYBHEw3lBzIXr+VUspAS2HQzVCjiI0eFjTC2+/Ls8z05Ay2XLWNwTifgUSJcC5GC/nzNUnSeY36jJVU9r2ZYdgbffqggwz7ZUk4V4DeLdQgHrKfUvnUFyDjSW5g9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iqoWSzGh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso58131566b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709171480; x=1709776280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BA3HNtaKQLlopR5HvEpA7g8ezYuwOK+W5LJ79NFDZrw=;
        b=iqoWSzGh37cQSmXOYe5wmZu9QoaiQGkBjr6jBUzcKfGzc9S90/QTsySvUfDK2c53YS
         hpwThV4OwwmfPf44zeBYZe0jRcUn4Ik2wai+UzklEIVZ97QVBd+++MThL/7IvcnQIQvc
         aVrE8CWYPqoXrumISVWKrqx1G1VLEbytEGi5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709171480; x=1709776280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BA3HNtaKQLlopR5HvEpA7g8ezYuwOK+W5LJ79NFDZrw=;
        b=hMp2WOuiKiLqk0TGHMnILgPK4zQH2Ay0fvtD5+jgTKZ9hXveUJRm4MBihCoILNUfEm
         /JAg9bLe2/gaWdzBQNpJxAwaU4fb4M6ap1N7PyLuLwMlVvIyh3yH23Mbni4iFOTY3JIg
         lmR3RJ9dwFdyucgmY/bc9qxYCFjJdUVv9mFeXEfjEq8bZ2hZ1rjxMY31JutnrhfQGaie
         beOLsi3fnOS4Jp9DQi4hwpcR8fnZnrWEvIovfQkxmEkSBheWyfWC2gp9ItP0QRJH6N+2
         qMMu5Mi+L4yJkXpus00Hq09pZUPNvfmVcxxaq7/lmijBizAeaZBkksIaG8VcBcyAzPtP
         7cIA==
X-Forwarded-Encrypted: i=1; AJvYcCXmE/iz1sNkQRD90OMsKtOSetxu18CmpymQqrly/pO+srg7M3L9kF/lBv/fPiKe5mlDl4OoFAgKXV+ZgkY5dPsQfQ7eftHOR2tyt7UEDg==
X-Gm-Message-State: AOJu0YxxfZy/utiNlmXvWQsKYsl5CwEQGD//Jm4XaCo2GXAP0HxXmA4i
	4FH/0IPhpldydNBe7xjhhK9QMG4R92jf2/DIWFQ1PSHwuOz6f3WwLx0q08ne5oEEysvA/fcJgjD
	5x3oA
X-Google-Smtp-Source: AGHT+IFPkVhz5CW5PIafu9/kWIEhsaSD68RqVdaa0qT5OUEV0zAChiwTwlwp2kLOILU4rOlyLRfILQ==
X-Received: by 2002:a17:906:f198:b0:a42:e079:f94d with SMTP id gs24-20020a170906f19800b00a42e079f94dmr497067ejb.57.1709171479883;
        Wed, 28 Feb 2024 17:51:19 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id ub27-20020a170907c81b00b00a440ac20f06sm133278ejc.167.2024.02.28.17.50.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 17:50:59 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412a2c2ce88so19475e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:50:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSOXbm+0AcpLSi70OYrQ9RyqdzCC+jbtXZG94gIQnnBQ/8rwKjRclXEU3nOGPdN5giF4BPrFJtpYV3uu6ToyAYqL/IFB1UPuZEfgnOvg==
X-Received: by 2002:a05:600c:a384:b0:412:ba22:fe90 with SMTP id
 hn4-20020a05600ca38400b00412ba22fe90mr11378wmb.7.1709171458829; Wed, 28 Feb
 2024 17:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229013503.483651-1-swboyd@chromium.org>
In-Reply-To: <20240229013503.483651-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 17:50:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xba76ZER=rqWm8H6dQTgkTRM38Edi81Y8-QXETvsmDCw@mail.gmail.com>
Message-ID: <CAD=FV=Xba76ZER=rqWm8H6dQTgkTRM38Edi81Y8-QXETvsmDCw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Disable DCC node by default
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 28, 2024 at 5:35=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> We don't use this device on Trogdor boards. If we did, it would be
> enabled in the sc7180-trogdor.dtsi file. Let's disable this here so that
> boards with t he sc7180 SoC can decide to enable or disable this device.

s/t he/the/


> Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> Fixes: add74cad7c9d ("arm64: dts: qcom: sc7180: Add Data Capture and Comp=
are(DCC) support node")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Seems fine to me. I guess the driver never landed, but if/when it
lands then it makes sense to just enable the device it for boards that
need it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

