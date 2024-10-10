Return-Path: <linux-arm-msm+bounces-33932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6D99954A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 00:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D69D2849F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 22:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CC71E8837;
	Thu, 10 Oct 2024 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YvNjgkKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F271E7658
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599815; cv=none; b=a9jkB/9Jn9sYp1w7q3ISZgq4X+RuXlrM9b8w+rcXY7cPi+8m+MB81sIANqKYRnN+iYGuLQ94A30pla5dczyZSfznNda0MWjJqpVvjAkmSA8QK8LXof2goe4iJStzFgKyY/ieIVC4i0+isiD5LFdFOdJm29jWrQ0m1BwA2EWFz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599815; c=relaxed/simple;
	bh=S8MzrVyVXYrrKDN3sreSlr2FvATE3GpWfAgeOexSlnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jo8VU8vK4ktgYpJ0D5E+WTlJJfZTllk/v7x7keaavb64n01dn69Uw87hFM7Z5E43UlOOwAbAIfmnxWyiy2ba0kiz48k2ul52NJNujwOQlGUh2oyx4Ex0GJuLmZ7EWQwvte65FqbdUO2bjXTAaaIDYuGlhPqIn60yDEWREXfNOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YvNjgkKB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53993564cb1so1793544e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728599809; x=1729204609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWMUsztqHY1RJBiR4O9/uVA8A37ER1fCtc2N/7pUsd0=;
        b=YvNjgkKBYyjKZ/WALtWCkYyhluwEZoU9YeIh4nsxhyp9EWiIasFdMOSGWlLGXHeJ5a
         C3O2fOqxTWvA+6R40ZbfNAG/7XFgHj+RZ6LpPk/muHJLFNZnYs8J7utt8+/sdNac8yH9
         Lr231vVxWZa6EIc/IKrKt8Ug4Hfd+6KsHq59w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599809; x=1729204609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWMUsztqHY1RJBiR4O9/uVA8A37ER1fCtc2N/7pUsd0=;
        b=qpQmOrFe5Le+ryARVhHt0RSFhDzePvzZbAJrWiRlaFb9ulvY0zk53cMgfVpIhNwXE5
         1vO8UcSotuUmAFTRJ5krRHOe2T2RvfU3Tpa46fjDVdvAYWmiuRlaOUTy92cUFkyK7n90
         BwcqT2EJNplZJtyU+TV37Bg0+EKDSMQ2Z9sS+mXtMQddtbsDP9P/Ny8s69nOX8SzEDUp
         J82FdgiU9Mg+GKP/NK20F93RCAodoyYbjwB8fk76njOTf3xFSiT4Ori0Tk/NkNCZyVOb
         QKkUysu7ws/XRMUMGyY5gyw51+kDGPpNWdfhzN/o2fEE8DK0/C3d7zZvEBUhnSTy/zla
         V1XA==
X-Forwarded-Encrypted: i=1; AJvYcCVRQ7JqQydFDWuc3SV2zwYt5I2Uv/FvlCqT5/rgas0WQf2HKy6JLubMO+R6v0nOjem7fLi2WiLo9dNuOpVR@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8uY/JL7mXzqnpfChKC+3YjO8r6ycF2Mi+1Lh5MChNrtcu2Ho
	xjE1LCfx7xFNu6ND0qY32Bc/1Kybkxlo2K6cyBuqxBSQpQUt+6LKJnkz2JGaRvd/6wUXWiO3RhK
	IrNxF
X-Google-Smtp-Source: AGHT+IGPwvqBfghbsTGM/twhsXWAcappyPggUz434twrkDsbMLV60hkIAeAwXN5Y3luyAzSu3QhyCA==
X-Received: by 2002:a05:6512:1305:b0:539:d05c:f553 with SMTP id 2adb3069b0e04-539da3c6967mr186397e87.21.1728599808813;
        Thu, 10 Oct 2024 15:36:48 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c86eesm409580e87.82.2024.10.10.15.36.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:36:48 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so1819354e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwsPwuPik1DE3HEWONcM8/jrsGOyoYnc/0y3pvABbcyNbpVeE94Z/Hsy3Qui+PmO6IZvfha+yakhQWTdqQ@vger.kernel.org
X-Received: by 2002:a05:6512:3091:b0:52e:9f6b:64 with SMTP id
 2adb3069b0e04-539da4e09a3mr158626e87.34.1728599806982; Thu, 10 Oct 2024
 15:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009145110.16847-1-johan+linaro@kernel.org> <20241009145110.16847-4-johan+linaro@kernel.org>
In-Reply-To: <20241009145110.16847-4-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Oct 2024 15:36:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdxCbQm36sq4RtPMGyi+ZefPYoOQortAN+SDYTAY_m9g@mail.gmail.com>
Message-ID: <CAD=FV=WdxCbQm36sq4RtPMGyi+ZefPYoOQortAN+SDYTAY_m9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] serial: qcom-geni: fix shutdown race
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
> A commit adding back the stopping of tx on port shutdown failed to add
> back the locking which had also been removed by commit e83766334f96
> ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> shutdown").
>
> Holding the port lock is needed to serialise against the console code,
> which may update the interrupt enable register and access the port
> state.
>
> Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in p=
rogress at shutdown")
> Fixes: 947cc4ecc06c ("serial: qcom-geni: fix soft lockup on sw flow contr=
ol and suspend")
> Cc: stable@vger.kernel.org      # 6.3
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 ++
>  1 file changed, 2 insertions(+)

Though this doesn't fix the preexisting bug I talked about [1] that
we'll need to touch the same code to fix:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DUZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z=
0jkH4U30eQ@mail.gmail.com

