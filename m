Return-Path: <linux-arm-msm+bounces-33933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D899954D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 00:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972501C20F79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 22:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85A51E8853;
	Thu, 10 Oct 2024 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CrC4/ZJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9651E7C27
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 22:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599820; cv=none; b=sE/N/fJZzB4kmEOi8U5Wa71QErSqsy0Hjd2h/sZOXn+QTE/Jr2eOPFc4aBYIfHMwhlHNXu3gPBMqqx4CkQzf9lhN3kcGDhh9BNQ+n/gex9rK5BPoD9wzsoUr2jjfnMUyzceuS9oet+r8jUOB4WWJdxOswfOtqkNq/bco/LaL4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599820; c=relaxed/simple;
	bh=Oxl2smtTASJ6MycM3FoVyfEsgbMMCGZ1Gfzk4oNcX8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZI8Fm610EDn/xpmO+4pjTpm5f3UXJnRFM2mSZsbsULPeifG2+0qzSqfFbz896/qJ8xEjAi/vOfzs8cB7jPYCGMVgIEA9FIcfz8R113M2/b7zsd95iKQNfkY56T2Q7z8N4C9i+jJPIx4c1jQuoJvjMD5r0kx9JgpqjKAFYtQ5Lpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CrC4/ZJK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fac187eef2so15841631fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728599814; x=1729204614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjeDbIjsUK09P9siScyxEtPwzKzblEFE3ZJjqNhSVcQ=;
        b=CrC4/ZJK/XRWlvSVjGUOjlnjIiNfYEIiBTWSO0nUFsTA92R/R38QoZ+lQp8yc9RWhU
         mNwNemzpfbJsUER9ohdpJyFvdyS3aZcXYgRtlN4dfNg4AXN1IEQGkBO2qATTgfUKFXPJ
         LHoe/ghN9kxHqBvpxDB4cS2e8c6hcCXphzfhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599814; x=1729204614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjeDbIjsUK09P9siScyxEtPwzKzblEFE3ZJjqNhSVcQ=;
        b=ERFfKd0IrHlm5va3G1PimRc3s3mWrT8rCKJobxUTj/b12yxEoz+uZ3cuLnq0MzTKkU
         k4W5H/i02v+kzm5Bcms8A55O1PeXn+fngeSjvz1Nmq30uETBmnXH7q6M6gkacQ5sbGAC
         rhpecnzyZc7OHdrxt6gYGxytK3jl/OT/YwpYiQFglFfixJTeTKKY1ZOZLKOhyQflepf+
         UA/Zy4PRraToQr9f7TI0h2hyhni48aWa61rQz7jv816mNgOz8i7WocPjC6AxE9IWz4n0
         AQHd2YX6DovVxMDb5FsA2FiQLyfFFWzLD4WA4nPHwY3xajWjh0UXef8sS5py6v8pcwxn
         VCDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu2LwSygnRDaW26eFDKx0iX0QHRjmnRmu1bCTv5mbQHxRQR9WMwl9JVKlRHTDtJQ4Si9o//EOBCVYa1FGa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ibz6GAZ7S83eYDmO1lZlXHlIiavjVbYip0KWSpXmtpLrqe6l
	AV+FUGii+JQLUianYZMzkrEbapuEjantyeVRYNVBczdXsuo+rlzEqr2wPidP4J918mPMmG8kn2x
	MpsS/
X-Google-Smtp-Source: AGHT+IFCvt9tb1imeujUOqRVosbxux5moIhgBcnCFUqpCkqMiqAWinf5W83bKDaaAIlx6MOTPHir/A==
X-Received: by 2002:a2e:a9a4:0:b0:2fb:2f7c:28e0 with SMTP id 38308e7fff4ca-2fb327409b1mr1186661fa.18.1728599814086;
        Thu, 10 Oct 2024 15:36:54 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2477231csm3244001fa.132.2024.10.10.15.36.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:36:50 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53988c54ec8so1855021e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/pTG2oARrQg/bMzvbBTW8Jb9mxCncGFPnRoOAPefVeTZnPHESFn2qO6t8mdra+jgGBdAtmpadsU7k5Lod@vger.kernel.org
X-Received: by 2002:a05:6512:ad4:b0:539:8bc6:694a with SMTP id
 2adb3069b0e04-539da55f2c2mr163074e87.43.1728599809960; Thu, 10 Oct 2024
 15:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009145110.16847-1-johan+linaro@kernel.org> <20241009145110.16847-6-johan+linaro@kernel.org>
In-Reply-To: <20241009145110.16847-6-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Oct 2024 15:36:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ue8MRvb4h5f0ijRRNORXCrypSbpaNWZdv5S3C2kmYp3g@mail.gmail.com>
Message-ID: <CAD=FV=Ue8MRvb4h5f0ijRRNORXCrypSbpaNWZdv5S3C2kmYp3g@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] serial: qcom-geni: fix receiver enable
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 9, 2024 at 7:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The receiver is supposed to be enabled in the startup() callback and not
> in set_termios() which is called also during console setup.
>
> This specifically avoids accepting input before the port has been opened
> (and interrupts enabled), something which can also break the GENI
> firmware (cancel fails and after abort, the "stale" counter handling
> appears to be broken so that later input is not processed until twelve
> chars have been received).
>
> There also does not appear to be any need to keep the receiver disabled
> while updating the port settings.
>
> Since commit 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during
> console writes") the calls to manipulate the secondary interrupts, which
> were done without holding the port lock, can also lead to the receiver
> being left disabled when set_termios() races with the console code (e.g.
> when init opens the tty during boot). This can manifest itself as a
> serial getty not accepting input.
>
> The calls to stop and start rx in set_termios() can similarly race with
> DMA completion and, for example, cause the DMA buffer to be unmapped
> twice or the mapping to be leaked.
>
> Fix this by only enabling the receiver during startup and while holding
> the port lock to avoid racing with the console code.
>
> Fixes: 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during consol=
e writes")
> Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for seri=
al engine DMA")
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

