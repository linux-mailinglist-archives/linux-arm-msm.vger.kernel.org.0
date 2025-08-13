Return-Path: <linux-arm-msm+bounces-68895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE1B24139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 539B04E40BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 06:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499752BE03B;
	Wed, 13 Aug 2025 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnbS1CC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C293597B;
	Wed, 13 Aug 2025 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065770; cv=none; b=YOhVcGvmk9mKFA5wwLQ6br2ux7tfX+x0mAERJYvvhjpOKqRA4xB+ufQiwQb7J3mYAN9hrRiQpEDRtV5bPnQYbEct/gqZjjwCJ+h7FRvewC5bazYfsVrGSHcAJnqQyV1mRCr50w/dLWODUMWrNOQX5guM0T35+afx2BtpXe867/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065770; c=relaxed/simple;
	bh=c+TZbzGFvRmXvp8+YzDXRVZQDNo78fe6EUXMrbYg4iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2q0LR9n3SyVX1+KFkc0DVZcJFRy7hxJNFXNPLsNbZfxW39t5b4PJno7QBmUd9wOiwd8HR8FLAKMmRgre59eneFs/kdcDbcmxAYSxogQmeKLpHqXcZASw22yIQ1/HslgH6HkALKCgWwhsjYtHjLY0gTC8nHW1acWfspo7t7p3xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnbS1CC0; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71bfdb6ff81so45645407b3.2;
        Tue, 12 Aug 2025 23:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755065767; x=1755670567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGHs+XddNJPqC55SFwg8V5Yk+L2d1CEXmOV4NbKbVaI=;
        b=MnbS1CC0qs+B9S8tj0skMW+uNvj/KiwsepdNNyVV5B4mZCjr0w4bfnvZ09h82OwKQY
         BiQXf3Tu2fZzQZ7XFdle7hxPERiZqliSpW8KCxmNK2cmkZZcKbC2cV3cJTf2TIjETm69
         LPy4oVAiiP7egZlyCHgxiLgyUcp47VqvId7hRITeSnGsRzqO9SEidBBw/iHqCC8YIGhN
         b4N1FmsWIgkQfr06hGX229gOUaI8bAL2SI/EI7H8+HTpeYEtLX6mqgP6Ny+epSFdb0PG
         /8lLNdDtR8KS9QCbPOixkQD94O/dEEFx3sfSCF+HYjs7+9cYh3LCdQrpj62PdpJxewPO
         Vfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065767; x=1755670567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGHs+XddNJPqC55SFwg8V5Yk+L2d1CEXmOV4NbKbVaI=;
        b=cLDg774c0GxPJRV9pwDxnjwi3wfO0E/zh/WTOq0lZ+jjPArt9zSP0jmOWOX55Ab7pl
         817qCwZmL7mBbLBhSVdi6wkn7eX1ZBBgE89WBY7JQsPBeGRgJ+iO1QyIoldAMJBPJKfQ
         1kKe4lrTFp8aOyn9LZ3eSsXGjJXbeV5PDwfeJloC61pJJwp0wHCSs+yMgC4rhucl7DOy
         4InQgQ+K7BZfuBtS1JyYrWYLNyhKbksXNdeOvngE3fFXB0y1A8JvSbvZsL9u1Gtgtr96
         dAdY0VYmGydftyN8JjqfY0azi3cbzqdPpOwUkIg+AHs4eUg/gvbMKQrOef8w+0ytXkHB
         CVtg==
X-Forwarded-Encrypted: i=1; AJvYcCUw6kpzxrmFTyQbpvHkFazALb9RqwBKuGCVmGO7BLtWsNWzuDDpfqjhy2ta57RgUNLELoMejJUNVq/7HzK3@vger.kernel.org, AJvYcCVHsCTlcbmG6jsOuw/e0/gIsnhr/rVN+vZ/QtDff3xWZyNV6Evl7HZPtwoY05WDEVdlxY0I0WJOpfWR@vger.kernel.org, AJvYcCWBmFOj9KI7HSS7PGiBKawxsp3keWj0+vRt8YqSsVROtLgy1z68DAY0ZFyz8gA3kG5cnQo7Fq8JivTuNGH8@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZSIiBddGaBa0wWDR2OTa5Eeb+V9KndW6TKg0USZczUMLYlrS
	GceX7aC1W3zE6qbHHyHupXBlqn1/R94zYCx5sAk2XCPYDAihqY5OTVGgTNoTrFpNaPtLRbi3YDH
	MePv26CHiPO2mNfGegBr7VFYG9WL1D+k=
X-Gm-Gg: ASbGncvsjIyHJL/j1yDUx+/h3nBi5cve0bYa1hLG2MoUa7+Ri9BbUDw7KUri4tCf4gh
	zbhSgD9dOpvYNaVx/lez9m717XJvBHw4mdMf01y6sLNU9gy5za8Ar4lgAQvkEgUOc8vq4qK5R9h
	tsqLqv6AmqL871i3zRJZ7cYBSscvTk9Nf0Bqe9KjhbZFK9rS/7c9KupxweV2A1xXN7tFfBZ61cK
	AjlTw==
X-Google-Smtp-Source: AGHT+IGvaTDOsSIZvcUhUIprekNfw4eqFtn3SKGv+2RTxiz9DQaG05Rg1F9rAYDGp1NHpAqlRVW3X/RQNstQZ3imKo8=
X-Received: by 2002:a05:690c:308a:b0:71c:16b7:518e with SMTP id
 00721157ae682-71d4e588b36mr25640677b3.28.1755065767619; Tue, 12 Aug 2025
 23:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com> <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Wed, 13 Aug 2025 14:16:21 +0800
X-Gm-Features: Ac12FXzHVrNJ22jQgp5TTCQxddFQnye2KLkEtZEXVGLumYDMBYwBKhcv7bn2N3Q
Message-ID: <CAL411-qmWLJ9vYTc+NHFYymsJ27ryge88nTc71NAnzDa7TrExg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 1:58=E2=80=AFPM Krishna Kurapati
<krishna.kurapati@oss.qualcomm.com> wrote:
>
> Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
> when in host mode, it is intended that the controller goes to suspend
> state to save power and wait for interrupts from connected peripheral
> to wake it up. This is particularly used in cases where a HID or Audio
> device is connected. In such scenarios, the usb controller can enter
> auto suspend and resume action after getting interrupts from the
> connected device.
>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/host/xhci-plat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 5eb51797de32..dd57ffedcaa2 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, str=
uct device *sysdev, const s
>                 return ret;
>
>         pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_use_autosuspend(&pdev->dev);
>         pm_runtime_enable(&pdev->dev);
>         pm_runtime_get_noresume(&pdev->dev);
>

There is an xhci quirk XHCI_DEFAULT_PM_RUNTIME_ALLOW for it, try to use it.

Peter

