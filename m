Return-Path: <linux-arm-msm+bounces-10958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DC85409B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 01:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5D41F23C53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 00:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1FF29AF;
	Wed, 14 Feb 2024 00:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFc+zHDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A758063A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 00:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707869014; cv=none; b=sXz8qAjYfc9M7diXQr597nJbKj3MbmPDSeAnhaD8ZJGIddI7Tb2nJ/HmMstYy/CWs4Ld7H3qPmxoch209VW1T8ivwp/mc+scSWdv9qfwznE7vtTnA6h07WoK2t5z8Ox3r4ruvd7damSMOHt5wgou4TMxtwrsNXEGdKtFpDojhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707869014; c=relaxed/simple;
	bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6LdSkKqXqTKfwkwLYVeKXTuwbbbAXd9BqXbSpx4Kx89/sy7pWTs5VzZHi4VqTLLhHAZsJkccAljHADiYq09JEmxGztW2HSgzHvSpdAOBBWnCAlgCOzsgQ87bRJGyv1JFw8uTK5At234Wu0/vTht5quwXGweALnqnOu/csZzods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFc+zHDD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5101cd91017so1942331e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707869009; x=1708473809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
        b=RFc+zHDDHNHZPYY860JMcUjw1ieTPl0k3wPCGB1xgdl+6Whc110soGGTgVZNSfGmPO
         yYh5oG756OHA0+czTTUDsGKrEkOvy4nWfmlDrs6Z8w+uLNmkdqTUsGyKSbXyy7WJ4/L/
         8gbaVfoe1VuKUfWF8OyGCF2nH9a7BaGY0nmAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707869009; x=1708473809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
        b=DSl3LpF7PuSJCVpO9SO/P85f/5PxNFX1pyBr5sw3vruWGU9vkQoaoZkHNwqv+80wuM
         KneaLq3S+AmoKmg69zuKNR6R2TDVJK+n0FaNqmxNjbZtM6u6RUPrI+ClSuUEAjpvpRki
         71+6IIHljW2b9U9BEsLZO35mxeXGxIsSjlDrK1mfOaz3qDV0n2S/QqAfMnuG9zujt5Fc
         +0RqJek9bsYNqSysBTO/6T5o5/zdOC0IvGwp1g3CyTs1lEjD2AYFAQv03et54d+lJ9TO
         kwiJHggKY8xDkgtgvzu8oEDwT8+VmgZXRGHSkMfwGkU8IHirI4rS4SDpJgGxt7CtqYbh
         Z49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUJctCBrT4vng4lVWOCOO5rBf1fsh3O70clVBdhRC65rBciLe/jfCLrfQ7xvMqLnrIAXJEhnNluLwZwmSvW1PBrrPq3yQ0b3BwDRApqQ==
X-Gm-Message-State: AOJu0YxllbG3gD6azSLSvkbrFiXrPWcJivmqmaoRrjLSUiobRYPew8pF
	cJJbIYNXdTztD7ptvH2Km0g6S9x3y7Ax0OkJLjbGJ/MQy58+5rfgMzVosKAdDfvfgJF6gIGbHUI
	A0Lew
X-Google-Smtp-Source: AGHT+IEIOgDzIBSWVMmMP5LDxbCYiuKa3ltey74ytLCHqIoiVOp6UeNFV2PK3rKV2DO+UHUre39V7w==
X-Received: by 2002:ac2:51aa:0:b0:511:9008:7266 with SMTP id f10-20020ac251aa000000b0051190087266mr640214lfk.6.1707869009230;
        Tue, 13 Feb 2024 16:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUr8zFS7fVf/8tPYqD5q7C6LEx2yand23yeu52MOejaq56je3VbKLhK4S9ycEzOiR3TqnVCr8jdwSKe69BagCqsYVz1M7gNJ5YeImg4rQ==
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id gz13-20020a170906f2cd00b00a35a9745910sm1756507ejb.137.2024.02.13.16.03.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 16:03:28 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-410c9f17c9eso100835e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 16:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcj7nwdfjhDTyAvBQ+PHLcxLFIXx8SdXzimgv7ddruTcTGNHTznFRi32d42L/WrmHSGPiaSjtjUbvbPmdnOZXU4+8sR6KVTTtbIYqv9A==
X-Received: by 2002:a05:600c:519b:b0:411:e5c1:9b2a with SMTP id
 fa27-20020a05600c519b00b00411e5c19b2amr21434wmb.2.1707869006878; Tue, 13 Feb
 2024 16:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-5-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-5-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 16:03:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
Message-ID: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
Subject: Re: [PATCH 04/22] usb: core: Set connect_type of ports based on DT node
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-usb@vger.kernel.org, 
	maciek swiech <drmasquatch@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:09=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> When a USB hub is described in DT, such as any device that matches the
> onboard-hub driver, the connect_type is set to "unknown" or
> USB_PORT_CONNECT_TYPE_UNKNOWN. This makes any device plugged into that
> USB port report their 'removable' device attribute as "unknown". Improve
> the connect_type attribute for ports, and in turn the removable
> attribute for USB devices, by looking for child devices with a reg
> property or an OF graph when the device is described in DT.
>
> If the graph exists, endpoints that are connected to a remote node must
> be something like a usb-{a,b,c}-connector compatible node, or an
> intermediate node like a redriver, and not a hardwired USB device on the
> board. Set the connect_type to USB_PORT_CONNECT_TYPE_HOT_PLUG in this
> case because the device is going to be plugged in. Set the connect_type
> to USB_PORT_CONNECT_TYPE_HARD_WIRED if there's a child node for the port
> like 'device@2' for port2. Set the connect_type to USB_PORT_NOT_USED if
> there isn't an endpoint or child node corresponding to the port number.

The above sounds good, but then I look at patch #18 ("dt-bindings:
chrome: Add binding for ChromeOS Pogo pin connector") and patch #22
("arm64: dts: qcom: sc7180-trogdor: Wire up USB and DP to
usb-c-connectors") and it makes my Spidey Sense tingle.

Specifically, I _think_ if a port is "hard wired" that can sometimes
tell the system that the port is a bit more trusted. In the case of
the "pogo" pins on detachables, though, I don't _think_ there's
anything that prevents someone from making a "pogo to USB A port"
adapter and then you could plug anything you wanted into the pogo
port. If there's any extra trust given to these "internal" ports a
nefarious attacker could presumably abuse that trust for the pogo
pins.

I have no idea if this is a realistic concern or not. I'm about 95%
sure that hardwired "PCIe" ports get extra trust and get "deferred
IOMMU flush" enabled and, in the case of PCIe, that actually is a real
security hole. For USB, though, I think the system is more isolated by
the USB host controller so I'm not sure that there is any extra trust
given to "hard wired" ports. ...so maybe the answer here is to just
ignore my rambling. ...or maybe the answer here is that everything is
fine but patches #18 and #22 should be modified not to cause the pogo
pins to be considered as "hard wired" since they really aren't...


-Doug

