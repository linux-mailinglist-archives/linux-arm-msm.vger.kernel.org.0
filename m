Return-Path: <linux-arm-msm+bounces-7536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575883155D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 10:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9E41F237C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 09:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F40A1F612;
	Thu, 18 Jan 2024 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjKqr4Wp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E21F60B
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568572; cv=none; b=s7ziBfo2yLv/a28oSoatF8bioDXbS4Qc3JiFXB5vlHTFmR3+CVUciDHguij+UfNoWgMCLorp4btob/R9U+oxG9eYJVWOe2cisA5oqIGOrCMSpPalZZqWlKC0r2L0R10gldBiYwQXAw+YOkfVCyZ3Fm8N2KcOFFiL6v/7sPpF3XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568572; c=relaxed/simple;
	bh=SCN0DITGtEyCZhxC49TDM4ZSpawE8A7q3RwTS/XCbr8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=W6IneJBGkyo999lfn1lYJ/5K3vkJi+RH4I4WrBhMn7XbwXGar7UEocYxdQa/+hKFGo9eQnioQPQfsNiITBZxyOD36V1t42KwJDO1V/dz9j9tagCRMeuTciSUZZi0Hs7ADGHMJqgZH65t/DOjJ9b3Cakt+IKRhk9uVs08fUa3cuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjKqr4Wp; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e89ba9810aso99961037b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 01:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705568570; x=1706173370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCN0DITGtEyCZhxC49TDM4ZSpawE8A7q3RwTS/XCbr8=;
        b=tjKqr4Wp3MTKqMI8HpTbDsdCOEqchltQaxJIHP3vQ8GkgvV7XarMFuuDjDma5xoJEn
         N+yFA/Ql8LpYoMORnuVavo9VBXWpy0W8dhYIhVhyLiA9dsvMmA5XHGJIWhXJ8lUa5WQa
         ghq0a25523UkDCPU2xCs+XrRh4dDC0BZz4BXL948yPp0+ASRnVMNHsI3BVNsvRGwVJGu
         UHscNNQix0L0JN2JdJP+F05fb0isQj2s5F13PKFUZCAFckvCIHKNHsesjZAS6oWuFVdc
         MEuQgi5jIJi+VlpXcsSoRYqopf/wEsrw7C7kHhYXPVYJAPbHuc+/lyvjaHno6WVeDmZd
         dKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705568570; x=1706173370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCN0DITGtEyCZhxC49TDM4ZSpawE8A7q3RwTS/XCbr8=;
        b=klnfgCcRs9/XCjVCnMXzGG3QoDB9nPrxPMy5oceyqAaqwTM1/QhlyFwUl/rZxIc6Vn
         IrJl2kau89sVmJQvHmPNiyT/c++xe3NVGFPAz0aSU06d6hjxO1rRZiSTsl72YHeSEQkn
         hoVV0TF2SdBb0BU6SRqb7+2Qr6j1An+BdlAOPqydkZP/MqAaU4/OIJ7rghnn2MfPxb43
         Oedl7OB13yfIX9CiAcKyv9FGwsI5MtQWYlt6JV846uidNOBezF/NbKEwr3B1uP7fsUOT
         hUglKajUDmZ7LhG9livAUMvhUvveGQpLQBfhlgiEaqDN3cCz4Me3BdpePNBupr2UvGLQ
         rl/Q==
X-Gm-Message-State: AOJu0YxxxcqVRnqBVbZLRurRwW5f1SsUZxBB2dDj5feweGuNO7SJ6UcI
	xmjrVgICJ3V4FKRwb/lfpU6vrdiupACymGAgy27JUKjAxku4WM/zF6xS2JoC9JBfYc1/dGPDYEB
	hjDPTOJOW6tv2i3IU6HTBV6AxJ8UFYCKI8L311g==
X-Google-Smtp-Source: AGHT+IFn0oNGpUtohUkixMpPda/cInzk0oTl2IZ0jSG7AXNDnpGJ5BZW+dJrWH4qJl2XVKHeIoh+tuR35SB/+3L7MMY=
X-Received: by 2002:a25:4842:0:b0:dc2:1e21:eeec with SMTP id
 v63-20020a254842000000b00dc21e21eeecmr322545yba.106.1705568569626; Thu, 18
 Jan 2024 01:02:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221021181016.14740-1-ansuelsmth@gmail.com> <CACRpkdbfvr1pkVb3XhBZLnmn7vy3XyzavwVjW_VmFKTdh3LABQ@mail.gmail.com>
 <63531543.050a0220.b6bf5.284d@mx.google.com> <CACRpkdbOQq9hUT=d1QBDMmgLaJ1wZ=hd44ciMnjFVgpLCnK8Wg@mail.gmail.com>
 <6357240c.170a0220.999b2.23d6@mx.google.com> <CACRpkdb4iqazgVerHCPU0VqZKYoB5kJeDSaL+ek67L=2Txem-A@mail.gmail.com>
 <65a7d352.050a0220.ee5cf.f69f@mx.google.com> <65a85cf3.df0a0220.9615c.a798@mx.google.com>
In-Reply-To: <65a85cf3.df0a0220.9615c.a798@mx.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 18 Jan 2024 10:02:37 +0100
Message-ID: <CACRpkdYNhUxFMOGPx-yrgUji03w0K5fRmVFFWW0MfDH1ZeBnxQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: mach-qcom: fix support for ipq806x
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Russell King <linux@armlinux.org.uk>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nick Hawkins <nick.hawkins@hpe.com>, John Crispin <john@phrozen.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 12:04=E2=80=AFAM Christian Marangi <ansuelsmth@gmai=
l.com> wrote:

> Some followup on this... I manage to enable DEBUG_LL and can have debug
> output from the decompressor...

Yeah that is helpful!

> From what I can see fdt_check_mem_start is not called at all...
>
> What I'm using with kernel config are:
> CONFIG_ARM_APPENDED_DTB=3Dy
> CONFIG_ARM_ATAG_DTB_COMPAT=3Dy
> And a downstream patch that mangle all the atags and takes only the
> cmdline one.
>
> The load and entry point is:
> 0x42208000
>
> With the current setup I have this (I also added some debug log that
> print what is actually passed to do decompress
>
> DTB:0x42AED270 (0x00008BA7)
> Uncompressing Linux...
> 40208000
> 4220F10C done, booting the kernel.
>
> Where 40208000 is the value of output_start and 4220F10C is input_data.
>
> And I think this confirm that it's getting loaded in the wrong position
> actually in reserved memory... But how this is possible??? Hope can
> someone help me in this since I wasted the entire day with this and
> didn't manage to make any progress... aside from having fun with the
> head.S assembly code.

I have no idea how this happens, but when I boot images I do
it using fastboot like this:

fastboot --base 40200000 --cmdline "console=3DttyMSM0,115200,n8" boot zImag=
e

So I definitely hammer it to boot from 0x40200000 (+0x8000).

Yours,
Linus Walleij

