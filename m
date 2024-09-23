Return-Path: <linux-arm-msm+bounces-32190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381197E863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76467B203FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DF51946B4;
	Mon, 23 Sep 2024 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0aGWe7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594D150271
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083034; cv=none; b=sCy+tCypvfPJvi012gLHgP7WAKz6mW87FQ2gPHaTD+AVlZxjGyu6YsdBUL48mBwooOta86Uj+JOBhI11hUxUuQWL81WskBDnpGRa6d9cN4jBZdlgFZWihAH6rXjeVpW+ZeFZkYWihkT/LGhDxmfYgpfuafkR321bJaqtDlzxaSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083034; c=relaxed/simple;
	bh=3Ng+sDg2QT5rzu61/aYwIfYlo9ljmcln0gZXWTADH4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0zuGVhb1VVeQjo7z01w/3imhJc3pmglE3rX7odXHQrc2zJgPPLnYP3XWfxi/7PnDFWSlHHvEbzWVwqouCSg9h9HYOA7e3jbbFSfkASXoFFgrRa3PFxnDZ92JmnYXnVCj1HxZcWcAU+t53g3lwnyr4WVDiOZE2ZwV17RkqWw88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0aGWe7r; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365c060f47so4747431e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727083031; x=1727687831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ng+sDg2QT5rzu61/aYwIfYlo9ljmcln0gZXWTADH4M=;
        b=P0aGWe7rHFGm9kCI1S9U46WcSoZnr/TLZcYVXhROyGzOC13R7Y37SLKgHR4EhkHGpz
         9JMgP7g6GuEIhJKSD457CJp5uCWkCKAOn+NUjFWGOsD1NaSfFnMrNNC01rRwoKYfPlul
         mRF58XbluHOxJxFu7Psxz4SAATRZ45GQJGHvkoNkxQAtxauOQO4VdsIboPM9YXywt5mY
         OhZolKQ9prXBFp5u1UtLgxNx9240cOqz3UwDO49puuGgOjjcgVxsPp6w/PsTJDJGp/N+
         GdRFYMGLk40B5gVmCYIm8MN6I/JMMdH8f4ldxzNjf3siRSJKPvFkdlREVe12UaWAD2Qu
         yLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083031; x=1727687831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ng+sDg2QT5rzu61/aYwIfYlo9ljmcln0gZXWTADH4M=;
        b=uNMlm/r5bYBmER10WvbTO1t7bP35q1e0FLlqabZ6+xqQpxo+PXzbhEWuw6Iw3kEZTx
         OTLEpjYQEBgiD24QwqGva6x8vnR42kIm3s0utwIVoZtxscgWPuquSSqrBECNFjVXIfYS
         PDKK6sJ/xH5UVtkFln5eW89m810jzd+lDKeqMW1DmNDyaaY2oBhps9ttJXHvwVnnEQ8P
         Qv4cVR/weS8wTCPvobpnJJtdbtpJvT4uFqqvhxA1BciIlvtCCROLEj3xtYoQFn0GjfI0
         zbWLHlzixp7fRKSsbA7Zl8AI91Xpe0zKGPnJeNOanZs+I0NtcdgJ8iMD38I9kAed4kil
         wZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXwVuhydcFNYTXItj4VY/vDk4zffEs/HH7QmuR2OHAPdtVyxPQUtPq90ZDVsnuXBeRs7I46VkHcgfC1GZnm@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7ZCj2QTFTYL5P2nsRinEB10JmN3L5fqXhqeAnQcZ2K+wTHv0
	2b8rVjVpTvAif9U4Thx8bekaFtHkmIKR7x/eh1OjwFSYh+Zd8gwzEN+FGfdo1e8JQ7LIfxFBIik
	Cm1LR804SbSLru8oVl+KRmkUz3aYj1rgfmSkM7Q==
X-Google-Smtp-Source: AGHT+IF5N65MAjSl2RI3rZ8tSubimfvrcMOGWwimT6ri/YlzByTwDzfSSqy/Vo/Rn2B5RVjXBogTTQ/dqeeiG1yGEoY=
X-Received: by 2002:a05:6512:e94:b0:536:52da:5183 with SMTP id
 2adb3069b0e04-536ac2e595emr5416859e87.18.1727083031495; Mon, 23 Sep 2024
 02:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905200218.3810712-1-quic_nkela@quicinc.com>
In-Reply-To: <20240905200218.3810712-1-quic_nkela@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:17:00 +0200
Message-ID: <CACRpkdaKNyO9J265AQjDbta108V6Gw+89nDXscMRyvJN611VGQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Add SA8255p TLMM
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 10:02=E2=80=AFPM Nikunj Kela <quic_nkela@quicinc.com=
> wrote:

> Add compatible for TLMM block representing support on SA8255p.
>
> SA8255p uses the same TLMM block as SA8775p however the ownership
> of pins are split between Firmware VM and Linux VM on SA8255p. For
> example, pins used by UART are owned and configured by Firmware VM
> while pins used by ethernet are owned and configured by Linux VM.
> Therefore, adding a sa8255p specific compatible to mark the difference.
>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>

Patch applied!

Yours,
Linus Walleij

