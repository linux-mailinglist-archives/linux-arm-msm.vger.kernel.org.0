Return-Path: <linux-arm-msm+bounces-33047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3798F768
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EA8B1F2113F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 19:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9F11ABED4;
	Thu,  3 Oct 2024 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bIqTpKe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F36419CC2A
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 19:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727985360; cv=none; b=hUESHiu6ujjTdOx5RMdO0PuztEOMYX+gP9pr9xwls0fTU+2YA87Bspnwjgb2dg3B3C3EG+IvbwuiejDkWPj2VZRfRWo5BOEZ9otB+lkK/1TJqEqKI7qtLwzDu7EzazqOmpwZqWiPZyQTHX0j4m2pKqvOSJnmpESoTbHOrXps3fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727985360; c=relaxed/simple;
	bh=5EccGR70GSzvWHC68nC+X+tqsSbWiKZAhks9ypGfRZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjOtDXImaBeHEQXapo2lBJyTIQNRHKnXG2Ud7W95lRj5h4Udb+BqJyc/1mceNtVv+zRA2Z+Zljb8OnPA65NccrDtJxMbZkz+skhythCEJGbWjmN8fYWq+0jLzLnK0phb+QF7Y7EN1hPq1rBWbjykKiFWV5Wmx/pMFi/AnAWx6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bIqTpKe4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facf00b0c7so22713291fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 12:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727985355; x=1728590155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9YMrf0Tzihdplb/RBKwiSK1PmhTX7h2pmpItk8J4v8=;
        b=bIqTpKe4iyhZq9xmUzl5zpJ4G6fRhduh0q3wJWuWhPRbQ8V7ZG2XgbBUYckU7d8esV
         OW8N6Ba9bL1VSaCVUiVLmhAe+p02FPJP7+id43p/HrpbSaPYuLl3t6DA2/4e+AX+4aiv
         rq1WE0f0FRxqzsO/nvvE1+GHW9QLQRoSJ8mjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727985355; x=1728590155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9YMrf0Tzihdplb/RBKwiSK1PmhTX7h2pmpItk8J4v8=;
        b=LvrHLE7Oeglpqe0Y00IH2Drr5Nt8MOoT9cDNOuyaDlpGJdAotkjPQL/W4QKClySisq
         buhA7TiYLUIzrRfAwIl/K6FE0FYCicf3yzkqtlcI4+w2N+gIbfKEMPCjhROBLusMeoCp
         3TivwzMJxcgtss6Vmhe4oPAE9xO3kUjZt5q/nmRyy+3wW1Qyczzq1+KsnGo2WoYZ8VM0
         eKZj8E+2k2MoHHaJC4nhq/+rkwKinbKnRTWuDuyem1pJ9xH590gsRa+JCWfWsnGOQ7Qv
         7jloCkaix+mgystVgpC/j+yyiu85glgADxltHR9c70akWsMThFSdd9ey2JTspKSf+6ga
         X28g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ77xdnhojibxSnfN4GgFrWT1jxBV8rE6MsWmXLAjVm1JX2C8uSCYsd5Fk2vAVW95JOTfif/cpTzUUuR3X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp/Fpus5WA+ELOpZXWruPxX0F7V832P7mW6KBs8ogofSBPywc3
	3PfmnC/T643hk7RPC2tfLxrE39PIat9s51DiCVM4PRjdqQRRwIfTctZH4f3U7LAqRk8fbfGnxKC
	rZfSx
X-Google-Smtp-Source: AGHT+IGVIvIPFZdq9Ovpo8kMDUsDXySS/b5WrTMLfQQXqMSdAyN/6lKRRcC1GlhDA3aGC+4vuktQ2w==
X-Received: by 2002:a05:651c:221a:b0:2fa:cefc:7386 with SMTP id 38308e7fff4ca-2faea1b788bmr15134521fa.4.1727985355046;
        Thu, 03 Oct 2024 12:55:55 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faecc6c06fsm2867351fa.95.2024.10.03.12.55.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 12:55:54 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so1442236e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 12:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaHy+xvlfg01mUfYCxNZ5pXC97ZJDXbQdqajdSia7aIz3j5TmLM4nUIvDnvrWMDbtQlOJu+y1GDcGL1EfI@vger.kernel.org
X-Received: by 2002:ac2:4e06:0:b0:539:9476:25a with SMTP id
 2adb3069b0e04-539a627ba0fmr1592030e87.21.1727985353524; Thu, 03 Oct 2024
 12:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org> <20241001125033.10625-6-johan+linaro@kernel.org>
In-Reply-To: <20241001125033.10625-6-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 12:55:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9FfwKREBfBbCRiqH3y2K=oTfQPj1Nx1paxrVwFD-efg@mail.gmail.com>
Message-ID: <CAD=FV=V9FfwKREBfBbCRiqH3y2K=oTfQPj1Nx1paxrVwFD-efg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] serial: qcom-geni: fix rx cancel dma status bit
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 1, 2024 at 5:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Cancelling an rx command is signalled using bit 14 of the rx DMA status
> register and not bit 11.
>
> This bit is currently unused, but this error becomes apparent, for
> example, when tracing the status register when closing the port.
>
> Fixes: eddac5af0654 ("soc: qcom: Add GENI based QUP Wrapper driver")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  include/linux/soc/qcom/geni-se.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/ge=
ni-se.h
> index c3bca9c0bf2c..2996a3c28ef3 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -258,8 +258,8 @@ struct geni_se {
>  #define RX_DMA_PARITY_ERR              BIT(5)
>  #define RX_DMA_BREAK                   GENMASK(8, 7)
>  #define RX_GENI_GP_IRQ                 GENMASK(10, 5)
> -#define RX_GENI_CANCEL_IRQ             BIT(11)
>  #define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
> +#define RX_GENI_CANCEL_IRQ             BIT(14)

This looks right, but do you want to fix all the rest of the wrong
bits in this list while you're at it? Things look OK up to the
"RX_FLUSH_DONE" and then they're wrong. Specifically:

* My datasheet doesn't have RX_DMA_PARITY_ERR. Unless maybe it's one
of the "GP" IRQs?

* My datassheet doesn't have RX_DMA_BREAK. Unless maybe it's one of
the "GP" IRQs (though why would it be two bits big?)

* RX_GENI_GP_IRQ is 12:5, not 10:5

* My datasheet has RX_GENI_CMD_FAILURE as BIT(15).

In any case, this does make it better so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug

