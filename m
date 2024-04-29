Return-Path: <linux-arm-msm+bounces-18757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC08B523B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 09:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 045BC1F219B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 07:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAC615E8C;
	Mon, 29 Apr 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gC/uRCyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7470B15AF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714375277; cv=none; b=iiG6A7kwu+rU8zIa0033RCqzZ3x+RYe8AfBxH0t/1mABzYemnwQmmvvE+8L1PDP1l8YGvMv0SkwegIOOAvM0DNGDZzp7TKVBnv2/wTyQ+FIC4XRabRpVA9sQ0RBG6hWK2o7wOHV2XVb2qr6NyZKbGCIp3eqidGsO6lYTd348ikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714375277; c=relaxed/simple;
	bh=cBTnCY3KBtBRr30AjNsz8q6YkNKmPKiRnzFhas2NNX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oumkLDdjXDK0vuwvFJAFA6nEkZzynJxeVwFGFhHcqCehenQ0u/kjL29/h4AAFXLjz/usBaQnMhVt7AjNLoBqBahLRDznLmBrmAtLGQLbMRGEUpdfeV560MmCWPe29LOUjtSThDxKCqm2zq7mbvU6PcVSafflEvCnQC6Jnm9s8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gC/uRCyV; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7f032da81e4so14780241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714375274; x=1714980074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k4CtgL63N0Lb5Fc/VSdHeoMgN9WVz1qLr0PmEGVLiVA=;
        b=gC/uRCyVHPA41Q9BN/kaZQ5YtCu0u2XpOeeKu/jKzziCuUWdYrcVW4tdlxF8XQWSLG
         mza6/y9Kfn+Ve1S035X48zQ5joAVFhiIA2ZylBg5omEh5UsVoA2fIFG7CqahJdy0b/dl
         C8gIMaKq9z+aZyFjvQkAkEXZSsTYCr/f9tno8ctNdrV0Lkx7V1ky+p/E7ACEMOdm12/K
         soQVKWgiJkckUjiiWmzheBvvcdmcJWa+AzmhGwctOvbp3fDxbPsQmIg5NS4F2ME/W/UB
         UVdgH/aVPH6PUE2J9Rwxp3VsOeD0d2XJf82j6dVKa271WIb23vBSZ9TWYErLj8DuLpG8
         TaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714375274; x=1714980074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4CtgL63N0Lb5Fc/VSdHeoMgN9WVz1qLr0PmEGVLiVA=;
        b=eRIV9H3aZBaRjbKsmTPDIanExPWcX/rZj3ojkhHO+YrnquDz5DJPoPyic9DC0LVCM6
         kiXGrquNi/6IpUokKi18lHHc6DxhkY2bm/FOahdPdGMDQFxkrpsYv8M5qiO8+ALSFi94
         odFRrKI2S0eOADGm6yQ42iX3SxiDQU6MO1muZIEDmnewjOKSqgqdb6iUTf6R7P0/s8K1
         nKCDCZ6X3USEcGmlvaQjW9CsmmiGMiX1guKOBg408ndCafD8DiJTIT7D7hqat/2klIcI
         zusjUEQQCE9OLJ3m0rlGV5UfX+Oz7MO4uoOrvFjd7AAe9C13LIIzGHUzQkTCpdOORFLp
         acXQ==
X-Gm-Message-State: AOJu0YxOwa7UWRX0aP0+KQw9RgyQ26WQ7XBMLQRrkZYu/Bb8vnl+S9d9
	b67bhwGrb+HXiVDqVGms/Z/jG2jRExfHWzTk+59MSgke5iuw19HS+xJauGCilHfb8vHHVxUXanj
	z19Z4C7A6yOeu+Oiauc/RP0gEKY5pobYwtYePdQ==
X-Google-Smtp-Source: AGHT+IFTQhCi6zGH8UpHY/Gea7P61K+intVrtnp1dSZHdoHSbR6jH1Glk906JzDo6d3r6zm3BQ4dpX/TSHx7GI4x8ZA=
X-Received: by 2002:a67:ee09:0:b0:47b:d49b:c59 with SMTP id
 f9-20020a67ee09000000b0047bd49b0c59mr8661651vsp.10.1714375274307; Mon, 29 Apr
 2024 00:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403043416.3800259-1-sumit.garg@linaro.org>
 <CAFA6WYNxTPgiq6WLQaKGMTenuKe51SXXhgGYkdyRibghXAMfnA@mail.gmail.com> <CAFA6WYPk6E8JM8z62Skxq454WwPFYQ9EDx7FD--inqe7YoNJkg@mail.gmail.com>
In-Reply-To: <CAFA6WYPk6E8JM8z62Skxq454WwPFYQ9EDx7FD--inqe7YoNJkg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 29 Apr 2024 12:51:03 +0530
Message-ID: <CAFA6WYNbQLz2Gio6dS2MbDT7hgNWmq27K2ng218cbYmGvQ+VhA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC
 board DTS
To: andersson@kernel.org, konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	stephan@gerhold.net, caleb.connolly@linaro.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@linaro.org, laetitia.mariottini@se.com, 
	pascal.eberhard@se.com, abdou.saker@se.com, jimmy.lalande@se.com, 
	benjamin.missey@non.se.com, daniel.thompson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 20:57, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Tue, 9 Apr 2024 at 23:24, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Hi Bjorn, Konrad,
> >
> > On Wed, 3 Apr 2024 at 10:04, Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
> > > Box Core board based on the Qualcomm APQ8016E SoC. For more information
> > > refer to the product page [1].
> > >
> > > One of the major difference from db410c is serial port where HMIBSC board
> > > uses UART1 as the debug console with a default RS232 mode (UART1 mode mux
> > > configured via gpio99 and gpio100).
> > >
> > > Support for Schneider Electric HMIBSC. Features:
> > > - Qualcomm Snapdragon 410C SoC - APQ8016 (4xCortex A53, Adreno 306)
> > > - 1GiB RAM
> > > - 8GiB eMMC, SD slot
> > > - WiFi and Bluetooth
> > > - 2x Host, 1x Device USB port
> > > - HDMI
> > > - Discrete TPM2 chip over SPI
> > > - USB ethernet adaptors (soldered)
> > >
> > > This series is a v2 since v1 of this DTS file has been reviewed on the
> > > U-Boot mailing list [2].
> > >
> > > Changes in v5:
> > > - Addressed another nitpick from Stephen.
> > > - Collected Stephen's review tag.
> > > - Warnings reported by Rob's DT check bot aren't related to HMIBSC
> > >   board DTS but rather they are due to msm8916.dtsi or extcon-usb-gpio.txt
> > >   still not converted to YAML format.
> > >
> >
> > I haven't seen any further comments on this series, can you help to pick it up?
>
> Gentle reminder.
>

Is there anything missing on my part to get this accepted? It has
already gone through the review cycle with v5 posted for about a month
now.

-Sumit

>
> >
> > > Changes in v4:
> > > - Dropped IRQ_TYPE_EDGE_FALLING for pm8916_resin given the expectations
> > >   of Linux kernel driver. Instead depend on systemd workaround suggested
> > >   by Caleb to get expected HMIBSC reset behaviour.
> > > - Incorporated further DT coding style comments from Stephen.
> > > - Warnings reported by Rob's DT check bot aren't related to HMIBSC
> > >   board DTS but rather they are due to msm8916.dtsi or extcon-usb-gpio.txt
> > >   still not converted to YAML format.
> > >
> > > Changes in v3:
> > > - Picked up tags.
> > > - Fixed further DT schema warnings.
> > > - Configure resin/power button interrupt as falling edge.
> > > - Incorporate DTS coding style comments from Krzysztof and Konrad.
> > >
> > > Changes in v2:
> > > - Fix DT schema warnings.
> > > - Incorporate suggestions from Stephan.
> > > - Document UART1 mode GPIOs based mux.
> > >
> > > [1] https://www.se.com/us/en/product/HMIBSCEA53D1L0T/iiot-edge-box-core-harmony-ipc-emmc-dc-linux-tpm/
> > > [2] https://patchwork.ozlabs.org/project/uboot/patch/20240311111027.44577-6-sumit.garg@linaro.org/
> > >
> > > Sumit Garg (3):
> > >   dt-bindings: vendor-prefixes: Add Schneider Electric
> > >   dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
> > >   arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS
> > >
> > >  .../devicetree/bindings/arm/qcom.yaml         |   1 +
> > >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> > >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >  .../dts/qcom/apq8016-schneider-hmibsc.dts     | 491 ++++++++++++++++++
> > >  4 files changed, 495 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> > >
> > > --
> > > 2.34.1
> > >

