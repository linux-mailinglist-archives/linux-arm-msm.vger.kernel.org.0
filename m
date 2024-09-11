Return-Path: <linux-arm-msm+bounces-31535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B3975BA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 22:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C90DC1F239CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 20:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC9B1BB6BA;
	Wed, 11 Sep 2024 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mWVV6MMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7071BA870
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726085995; cv=none; b=uLhw84EAgxfvJ2glF01w8TRSjdhhqLMne2OZwrhdBoJn1I6ZHdg2K3YqMsTAsasvZWrQ+BJboVTMsKGSMIWXyLcHQ6rN5jVWJK7qYgYHGslUVIqRdt/bRLQzHAhjKJ0aGfzkkYkkD+nMrf7PT8At3RnLWYi/rDlnv0/V7/TSCfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726085995; c=relaxed/simple;
	bh=LNjfIqdnJ7xDwaFYjSU3zgI/rR85Tz4XyQ8E2ga59QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrRRGnkb9Z+ym+yf6ccrdFiU6boO5NLS/RAOoffmAtwZb45kSIxayHwV9136rVaMh0/dNtDAtBODCdUB6I6m0rpqxqODHBbMLRFTsE5fT1JUS9iiPB6yG6jPrqxpahy6S6f7OP0FThtgZHz0iOvJooT+p0pDcRpPX+zzFVBiF08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mWVV6MMU; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6c3561804b5so1344416d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726085991; x=1726690791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ2fUDORmV/sdyoK/2gbNCgI2EeD5lNRSWNYdKecCGo=;
        b=mWVV6MMUA0Zol+1l85DXRzqYPwBYiA/Kvt+N6uPiHR3O4XwwC1yvtIyxnOLC9c8VMF
         cwpPWd8p4LUi4c46+bo9h0nuQHIseMS+cH4cnazfl+5+iZxF0vxzEOTE8gbbFoygz3Ts
         8U0+iZTW/tezO0oCpUG+YSO+DPkuPW0epRa/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726085991; x=1726690791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQ2fUDORmV/sdyoK/2gbNCgI2EeD5lNRSWNYdKecCGo=;
        b=kRtchEXtiRzviXI0NiCKQILbvKLbNQRD47fqPTc8AvBmwPBowWQJ6bEBgWZ0xoadbx
         st5ZGAU1ckpsee6YZtCq/lbHD9Gzmc9JqoDayTIv/+M97+16ejVppRocdaL42dkUyDpD
         KeMqF91SQhNR+v8pWidgm6pyYQcuxB4ZGGLueciKUNLcNNJxypoGaMJHCBRkRgYSfqp7
         e1WtriNxl964aOpdx2vXHJa9TUXtj6jhbJ3+bAjgj0w0+YoT75Oliedw6pC5nlJPDis1
         KuCcFE0aQAo0yJ5WG1FszIARDQDvyXPau+ZdUFiCFn0stPvlflyUoVuDdB7c5l3WKXCs
         bloQ==
X-Forwarded-Encrypted: i=1; AJvYcCX70uqaharA6quEgEOYNsV+nOZI06NqdgCVXmASFLGtPEtjHdX9qHz9WYe4U2RuRgYDG0fZ054uAzV1yN6J@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJu7W2N3YSAjp7d9cTNZj+SvSE2ngZc93D0J2RMIPkhykHSFq
	3Hmz8Gc12Z5dwK/yesH6HUQzng+c+/OPRQ2gQIWlBcFZJDBmpWSEaVRNSPPqfS5HXCJjjYJQV90
	=
X-Google-Smtp-Source: AGHT+IETcMCYEs1AH6QmpiQ6J671cDAlzfa1AYoNAsrz/alDx63oWuc1Ila2EtYnnxApR5RUxon8Sg==
X-Received: by 2002:a05:6214:4803:b0:6c1:6a94:52d2 with SMTP id 6a1803df08f44-6c573519bdamr8763966d6.13.1726085991056;
        Wed, 11 Sep 2024 13:19:51 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5343293c8sm45761856d6.7.2024.09.11.13.19.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 13:19:50 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a99a46af10so20217085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 13:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoHT0haHefrcBqaJhj1Fz7w015IOu06UEtgH/TM1ZubnV4Z91XlVZf3zqHQFrtdzFpMqrUtojK7iZlD4JR@vger.kernel.org
X-Received: by 2002:a05:6214:448c:b0:6c3:5597:406d with SMTP id
 6a1803df08f44-6c57347eb8dmr12957366d6.0.1726085989561; Wed, 11 Sep 2024
 13:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906131336.23625-1-johan+linaro@kernel.org> <20240906131336.23625-2-johan+linaro@kernel.org>
In-Reply-To: <20240906131336.23625-2-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Sep 2024 13:19:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBVct4e4oe+KP1_2FuFjZ4tsX+FavK56FUnrOfZfP=fw@mail.gmail.com>
Message-ID: <CAD=FV=XBVct4e4oe+KP1_2FuFjZ4tsX+FavK56FUnrOfZfP=fw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] serial: qcom-geni: fix fifo polling timeout
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 6, 2024 at 6:15=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The qcom_geni_serial_poll_bit() can be used to wait for events like
> command completion and is supposed to wait for the time it takes to
> clear a full fifo before timing out.
>
> As noted by Doug, the current implementation does not account for start,
> stop and parity bits when determining the timeout. The helper also does
> not currently account for the shift register and the two-word
> intermediate transfer register.
>
> A too short timeout can specifically lead to lost characters when
> waiting for a transfer to complete as the transfer is cancelled on
> timeout.
>
> Instead of determining the poll timeout on every call, store the fifo
> timeout when updating it in set_termios() and make sure to take the
> shift and intermediate registers into account. Note that serial core has
> already added a 20 ms margin to the fifo timeout.
>
> Also note that the current uart_fifo_timeout() interface does
> unnecessary calculations on every call and did not exist in earlier
> kernels so only store its result once. This facilitates backports too as
> earlier kernels can derive the timeout from uport->timeout, which has
> since been removed.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Cc: stable@vger.kernel.org      # 4.17
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 31 +++++++++++++++------------
>  1 file changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

