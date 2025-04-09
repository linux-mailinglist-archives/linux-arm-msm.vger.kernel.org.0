Return-Path: <linux-arm-msm+bounces-53691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E9A82E50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6F6F3B897A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 18:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D007127700E;
	Wed,  9 Apr 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB3GdJyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CCE1D6DBF;
	Wed,  9 Apr 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222263; cv=none; b=sYATA2EFNOtWJ0Ry0lkcdCy/jhCaTviN3cstDuYOIuFFsc8IocIwWiNvBfWoCJrHBz2GGCETpeSF3UbDvCCUVquGynEKfo/x+ws51L8I/ExtOtzt+Qgz8ajCQOk8d/rwCWXu30DjAIXErOvF5t1kFC1zF7jOcYm+QePgComzhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222263; c=relaxed/simple;
	bh=dHvJ9+eEjlF71dEQbog68jYNzXGSmn/QePJdRg+RP0Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=FXNJgglYs6BV0FKM6XrNaCvzNlSpRvyOOKHvuFc/OwmhlpKXYLEEP5bsIowCOLDbtPa5CfVRFo61xnLfTmcBwj9LicaiqA8it7gohXIiaOmu8s+mPD0Jf9eZql7H/dDiNbLOmgcNsReNvTfuIgiREB4P0EzKjkiawqss5NAtyW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB3GdJyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D78C4CEE2;
	Wed,  9 Apr 2025 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744222263;
	bh=dHvJ9+eEjlF71dEQbog68jYNzXGSmn/QePJdRg+RP0Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LB3GdJytWYvj6/4YL+wkyCncPvm4zvj4DRBzr+hjloRzKmRHl4ZXvh0iWVHsfuyg1
	 KLgykPnStVn988WPK1zMTPKbTOurr7NJ87v3hp+o6LFAnLAVtrZzbr9GOyXESpcRvo
	 uPfdWusGnTBRwvdN2wnZS3sAUxGg3pEmJVpxdiNQDp5LEjcw5vaNB/Gc51caK75HqE
	 vVjJw/tL+V02E7CHMCmYXNSDoK2nRdhxfll1Owu3nv9pmW7PhdmYgKqbLkGg139XYb
	 Jh5LpSBeVWpAbUqOVhvWbb2WBXk9dRes/t2peYyl3uNtyg9cdkx4C3EdQLe3FM2KGa
	 QJXf9KijZIrCg==
Message-ID: <ac130f09d89b8efea8e0d24f1465c42f@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
References: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
Subject: Re: [PATCH] serial: msm: Configure correct working mode before starting earlycon
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Sam Day <me@samcday.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Apr 2025 11:11:00 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Stephan Gerhold (2025-04-08 10:22:47)
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_ser=
ial.c
> index 1b137e06844425584afe5d3f647e9537c6e2d658..3449945493ceb42369d2acafc=
a925350fccc4f82 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1746,6 +1746,12 @@ msm_serial_early_console_setup_dm(struct earlycon_=
device *device,
>         if (!device->port.membase)
>                 return -ENODEV;
> =20
> +       /* Disable DM / single-character modes */
> +       msm_write(&device->port, 0, UARTDM_DMEN);
> +       msm_write(&device->port, MSM_UART_CR_CMD_RESET_RX, MSM_UART_CR);
> +       msm_write(&device->port, MSM_UART_CR_CMD_RESET_TX, MSM_UART_CR);
> +       msm_write(&device->port, MSM_UART_CR_TX_ENABLE, MSM_UART_CR);

In msm_complete_tx_dma() these are under an if condition checking the
version of uartdm. Do we need that here? Although I also see that
MSM_UART_CR_CMD_RESET_TX is unconditionally written in msm_reset() but
not MSM_UART_CR_TX_ENABLE so maybe the condition check is wrong or the
bit doesn't exist in earlier versions of the hardware so it doesn't
really matter.

