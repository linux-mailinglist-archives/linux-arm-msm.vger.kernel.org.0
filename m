Return-Path: <linux-arm-msm+bounces-33044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3698F620
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 20:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6F391C21193
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A551ABEA5;
	Thu,  3 Oct 2024 18:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MF/0lNPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9371A7076
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980234; cv=none; b=FennVC7/7UBbNqKVXExiT7YFPSYaZqfFz/R3F+an0u/3zJ42E3RUx15RHdlf2XnpfdERV4Cd9sWzN8YTJbt7lzy4SjKqypgIfhUQ+RSf7wq96KcWG/0nBHA6YWItlHQRSxGghaAmuGV0mjDCgxFXvsbe/m8hwMfL09cjbqfxpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980234; c=relaxed/simple;
	bh=c++Lte/udt0jLRhLlSKN7fA6Bnq9Rxf2y0Cj+HWhPvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfMCNg5wyeW6lFg3vBcxeJsyvGSwaNAu+Uh1/ri3Lx10dyPqDl6Z//ywnVle4zqjY4q9bOQy7GKBUPRCRIRmVplay4Mpj6u3cHYZIoDYmqEOuelYMBIYCqYLjKbMM4QjIKrWS283z3Wa/h//LNFMCTZukTyvy9r/5XhXHoHDQFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MF/0lNPq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53959a88668so1676665e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727980227; x=1728585027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c++Lte/udt0jLRhLlSKN7fA6Bnq9Rxf2y0Cj+HWhPvA=;
        b=MF/0lNPqlpbRaKdx1Jz4sO90iMUNj4GfoaAdgxAEM90mfk9ogcPRzCWcUZeJx4HOyD
         GYbOKUXE4oFx8ZZzOeKAXHJ0Ack8Fj+Q318S9o5exV5UBOlWsWzZBNzRLqkSjcYgwwEH
         ebRn+XkmNowvcau17S8PuGRTQb4oQZK6BubzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727980227; x=1728585027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c++Lte/udt0jLRhLlSKN7fA6Bnq9Rxf2y0Cj+HWhPvA=;
        b=XrY4txmu45xMnCk8kvIQrMUNOXa4GDTYNVdDVlyVEBAYVqgJwxtVez+Y7W1jqyg9By
         YF/Hxf0yP8wSUkTofd8soIhWkrAxaIUQiaIsPLAjktVGIrAcXmM8bT/LA7aXxenbyVeI
         jlvanfNiAnK86s+9GjDdb3OeDhxYWtBhrduVv18xo32h1N1Th5TvgEkp0GezPpL8gnNl
         vxRL/jfpNVbF+ucOADdw4AqP3WLmTNfP0jUkBLDxUeAg6RtsXTyA1W418ogANhVWFJaj
         39NMv6Q0aYywFfdfwwQ2964OORSt1tK/Bg9ZHx4IQTCdiovS1tyo9PdJEXT36e7FdWlI
         JZjA==
X-Forwarded-Encrypted: i=1; AJvYcCWZDqh146audKLzk3QMLp0nBegd0xL1YNa93IHtQJm7I9hGSOa5J9Oplg5gvkkxTk9MURFoD4JlLh5pL0RI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb2jF7MvnEzx7j8nF/VQALa/L6Haikin4svP022ZKLYryF5L7u
	9Bw7Sf2nmdjLQA1hKdI+Uv129Ymd9sw56XJE4aOvTxvpx3Cg3I3ArKcHqzzCYlA2lztY806P2X5
	yuZsc
X-Google-Smtp-Source: AGHT+IFt0qk6KOGCVasd4zyqJ9avSJ8dsAc2fGS5boInnb6/fV/14bBe7sK4x40CcInUh1cqTCgIfg==
X-Received: by 2002:a05:6512:31cc:b0:52f:154:661b with SMTP id 2adb3069b0e04-539ab85bfdfmr206557e87.11.1727980226876;
        Thu, 03 Oct 2024 11:30:26 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8256b69sm232501e87.108.2024.10.03.11.30.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 11:30:26 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e33155fso1680921e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 11:30:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVuN4gjPINlW3PEjxdoqgsB5fakstN+dom36WUqTcoQ7/+cVVBeRYGqXHhkPkxNcK84Tspy4CGucHGnQlB@vger.kernel.org
X-Received: by 2002:a05:6512:2211:b0:539:9155:e8b4 with SMTP id
 2adb3069b0e04-539ab85c137mr174931e87.2.1727980224394; Thu, 03 Oct 2024
 11:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org> <20241001125033.10625-3-johan+linaro@kernel.org>
In-Reply-To: <20241001125033.10625-3-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 11:30:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
Message-ID: <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: fix shutdown race
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 1, 2024 at 5:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> A commit adding back the stopping of tx on port shutdown failed to add
> back the locking which had also been removed by commit e83766334f96
> ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> shutdown").

Hmmm, when I look at that commit it makes me think that the problem
that commit e83766334f96 ("tty: serial: qcom_geni_serial: No need to
stop tx/rx on UART shutdown") was fixing was re-introduced by commit
d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in
progress at shutdown"). ...and indeed, it was. :(

I can't interact with kgdb if I do this:

1. ssh over to DUT
2. Kill the console process (on ChromeOS stop console-ttyMSM0)
3. Drop in the debugger (echo g > /proc/sysrq-trigger)

This bug predates your series, but since it touches the same code
maybe you could fix it at the same time? I will note that commit
e83766334f96 ("tty: serial: qcom_geni_serial: No need to stop tx/rx on
UART shutdown") mentions that it wasn't required for FIFO mode--only
DMA...

Aside from the pre-existing bug, I agree that the locking should be there.


-Doug

