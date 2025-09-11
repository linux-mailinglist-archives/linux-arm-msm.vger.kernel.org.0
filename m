Return-Path: <linux-arm-msm+bounces-73137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA751B533A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74E145A4D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA132ED50;
	Thu, 11 Sep 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FIfIOjPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9BB32BF4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597116; cv=none; b=sDuIqug6jynb/JgE0uv9IAr0+MXTtM4iP+57WrhuY2ylapkS1PDA5KOevG+3cWnPCJRv3IesskMGnqyd4EdVmvTfnG1m0WU92dsudBZtufCXgIgCqSzpcxjW4gP29QG6tXxY8oZNb7qoHNuQiVfshpCPO3yR4IgzU6G6SO5GtfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597116; c=relaxed/simple;
	bh=tvHtynkzdv1a6/2GIDVhvXbYgP7ctogGxu+SLDsFVek=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv+5Q4eZc116jQEkccwb3VSizHouYwGdupdbUeyNdq+g40EWuAHf/LvFnQNPbzeea2sL0r83vIXI2kIXJknkMPoxbby31kjFZEYSBFFK8kUebdDClPb815Z3P4l0xr6W7oXER6UO1tFwV/q5Q53kLjDj5mKqEBXsM/rpU677uGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FIfIOjPk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6f434c96so741473e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757597111; x=1758201911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKH9Tq5JpqAq1HnW1xohkQd88Pw1g4E8ukSxiOhM484=;
        b=FIfIOjPkSwlc6EbFu6WXdlEpy4VWaKnLjZR6H/dP1XwFlkg+C2xUgxtbIOc1g7yz7M
         GJVAZPqabKe1lAheW1Q+c9zQ2lV18QjU0DIbNJMMk7mVeT9dWXagRHkRqCMbFEAp1L9e
         ejOYM2V75YUgzrxWHgptill6ER5hots1aOG1mrlrP6UUL9RzTQfRpCBKqQLurGZG5aEa
         Jo3yGr7g5ANpqubCjx0vo3xFiN7IFMa+jUikcTnIkfgDdqRVjf9yi6RZmP8BvsoDvQol
         cXlP123VceslaCUvdMGv3JzT2H//oIcQfYpvbh+2O84RpMJeaTtmPhuPkZPOyoCfRglR
         pnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597111; x=1758201911;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKH9Tq5JpqAq1HnW1xohkQd88Pw1g4E8ukSxiOhM484=;
        b=BOsizbEjl/j06v025FTkyMJbqWDa0WEi4yi/m02x4gddOF0btdFYmxWPUcfOPBTl7e
         hH9P4Lh4oSvhbFi99KgCI4OtGnjW/5DCt2L/N+BkdKnQMkZ2x/9Ao9E4C58Q5UXLdFZn
         esVxkkLblb8F1ol2FZAWE1u/YUZKi02ggRxhOifK6C8JZEGJG0HYBEoPyHPt/doed0dX
         FMBdXPIwC7c+fq3qNqNFcdfdpjUeifp95L5o0tVit8uLBczy1E9aBdxGFo+gyiCC8AuR
         7BTQBlDbfxwuCeT3CikKwXYpSf4lc+FjAvg7CuK1iTIetIadPLp3nYV+TSzJWGCJ8yHt
         6/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWHBGSLXwEeVqOtIf7ZgxqyPkt/mDI/SdE3FpnOh4YRP5ZG3EtrcBcEa1/pUrX3L1GIKAshJVXQofxD+CWD@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/wgJ7ssYeN3ouR3+Oxalqn6o9BMFaIZpr6fC7To22CDgb444
	2zy9mFxi7/fwPWTgbPcapc4LbEbnI3cLLrainYch7Mfssh70nAhyIN2xTGtKBwWxRIN94t1KNak
	69NDWWZvulBSdqOkToEpJwDhW1nGpRA6S+khFiLUX3g==
X-Gm-Gg: ASbGncsBDxI/kyelOiahY5zJwgmFKDtQsVVb7Feb1IeOoPSGUvuvrS7tht7goLsU93g
	5H8GpWnTHyCR1jKsISggn5LlXqr4Hr+wK6b1aQl9EoTsIQ1YMCZbfyNukSgvHtRMdnXNmSH+8DF
	a1KLvW7+90pQwzbjz3IELXlb+6atRdplA9WMctvd9T2useWcD1c03AQVmkmLsQQ1OdgQGGKhmRX
	qq0EIOWvwNp1+ef10R+XwvnWU9xSjeY0bXEOV8=
X-Google-Smtp-Source: AGHT+IFsA5ZOyU9tpTag4iQY+UEBWc1v4AgFQ6DjU2UnALeCrswvvm+lEztT+M/sSG35UIi0IcRGR77vi6rw6ChMafc=
X-Received: by 2002:a05:6512:33cd:b0:55f:489d:7bd with SMTP id
 2adb3069b0e04-5625d28e732mr6154709e87.0.1757597111174; Thu, 11 Sep 2025
 06:25:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:25:10 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:25:10 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250908-lemans-evk-bu-v4-4-5c319c696a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com> <20250908-lemans-evk-bu-v4-4-5c319c696a7d@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 08:25:10 -0500
X-Gm-Features: Ac12FXyxL1zBhnbmQPIz3eBGCsQd9d-c4NEoyZ66twALqJFT9m4E9c429dd_4HA
Message-ID: <CAMRc=Mf8P=4vucch0sAtPNZ7DBB0Kw1hgvP1YLgZ5ZRfusFG-w@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sep 2025 10:19:54 +0200, Wasim Nazir
<wasim.nazir@oss.qualcomm.com> said:
> From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>
> Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> GPIO lines for extended I/O functionality.
>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

