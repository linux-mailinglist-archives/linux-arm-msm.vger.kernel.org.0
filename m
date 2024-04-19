Return-Path: <linux-arm-msm+bounces-17969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D98AB1BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B37DE1F22EA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C4412FB18;
	Fri, 19 Apr 2024 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGUXWstb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD9B12F5AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713540449; cv=none; b=hdxBs+WR6TdxDPAaJOc7cpQSW2h9+vj/kJK/el613ajj0ZwTUDaGokC1cZLYAZrkom+/RL9WrXePjg+no7BKPtNISLniynG2t+W3MsgdhM84yUH8leDKAUNeeHJqZITeZs8SPj1G6b/IR+OWoDmDNo3Z60AGinAjGZ2oYx8a1Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713540449; c=relaxed/simple;
	bh=wZS3/ka5uw+QwA+dK12SUdNfDxnhQ1D30LTvW5XU6ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfY2pLZzVqYowkLgDjR9fPFI9viHE9CFDFLIZywNsNlF1wAnvCzt4VjvVXPNRdDs8wY2b1/L2+WGra5SwjXf6OhPMAU95smbd0zy6N7NQXYfOWNDB8OuHx9OZQRRDXjrgipm0Yum2UG8LuXXirQCgLp4GaPdeVw++M6coW+nT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGUXWstb; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61acfd3fd3fso23644807b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713540447; x=1714145247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0CnJQyqRqCko7CRyzv7CHI17zfLS508ulBJIPXp4bTY=;
        b=OGUXWstb0eb+/3jEW8eIwYNSqvvmNe4wUc/Wsyr7rxELkUYSY70lzBxHhHRHBSqw/6
         4gpGy9kf8fqSNd7TbIrKy8LVZG7DVg05zHSCGwDCYwcMoUA3CzP1vpYNAhIvfe6ag5U6
         A8D6l4+ge0d99iuZTA/UPnLR36ZQx3/PHyrgqDf6bTx+/zYApj62BnDeUC2W9PbPpN2E
         ODCQUJWJ3wfv4PNgpN42YXo83w/5YSFgfTCKBCzsZabFGOJrYHhdDlUV8sIUDPb4a0ha
         y/ci9JgeYQOPf99RU7WKuZYBRYZDVI/FTXy8lXIn1v7MLgeUgl/APZsTu82ftVrAbvuJ
         9/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713540447; x=1714145247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CnJQyqRqCko7CRyzv7CHI17zfLS508ulBJIPXp4bTY=;
        b=BCnUa5aE+xLUUsm+EanJf7xGjjxH2Ug/vFqjJyKMO6WJuH83Z17ywiO0s4i87MTsnF
         3y1GJTQL5jQDA9fu8d3lYN84N9RkMSJeKn0Gvi0IM2c6gY7nFjDEUb5SCkKShbbO5Uju
         xsQNfkalHcAE5SpimKrJ+s47bfKWzly27fvTo2Zdrr02tBq3B4C2OSfSBbp8RzgP/qC8
         gtJwKo744VvnYoREPjqwJ7w1W5yxlAbrdYK+xYMRwLTRbkRseViLDlcgBxOCjyrAuHb3
         K/erSm5ObcCRj+g2XbhVT0Ipyun5jqCpjs0KuCSf8KypEh3TXWh+/aI7YrZeSNsILXST
         89ww==
X-Gm-Message-State: AOJu0YyxEd7VRhY+Wta9UOAQgLHKApiUDFyH4V51Gcqzql4PIENKtfLI
	JXJfyylm9q3Ro2nN/iTf6COVhlSGyQ3Wb+9ytWN3BfOSrhvsWRJspMcrAMgy1R02k5041Exwqx1
	14ls+XDznrEW0e0dqu/zXrFNwF75m1TubTt/ifQ==
X-Google-Smtp-Source: AGHT+IGV9Ml+2vVPURcFgC+sUz6bLEO3DJd5BJxFzxuHh7rksR3eggTuaot2N8RDy5rH+Tz+m6dektlK/f1rFXqTUdo=
X-Received: by 2002:a05:690c:61c6:b0:617:d662:8eb with SMTP id
 hk6-20020a05690c61c600b00617d66208ebmr2758611ywb.19.1713540447459; Fri, 19
 Apr 2024 08:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403043416.3800259-1-sumit.garg@linaro.org> <CAFA6WYNxTPgiq6WLQaKGMTenuKe51SXXhgGYkdyRibghXAMfnA@mail.gmail.com>
In-Reply-To: <CAFA6WYNxTPgiq6WLQaKGMTenuKe51SXXhgGYkdyRibghXAMfnA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 19 Apr 2024 08:27:14 -0700
Message-ID: <CAFA6WYPk6E8JM8z62Skxq454WwPFYQ9EDx7FD--inqe7YoNJkg@mail.gmail.com>
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

On Tue, 9 Apr 2024 at 23:24, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Bjorn, Konrad,
>
> On Wed, 3 Apr 2024 at 10:04, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
> > Box Core board based on the Qualcomm APQ8016E SoC. For more information
> > refer to the product page [1].
> >
> > One of the major difference from db410c is serial port where HMIBSC board
> > uses UART1 as the debug console with a default RS232 mode (UART1 mode mux
> > configured via gpio99 and gpio100).
> >
> > Support for Schneider Electric HMIBSC. Features:
> > - Qualcomm Snapdragon 410C SoC - APQ8016 (4xCortex A53, Adreno 306)
> > - 1GiB RAM
> > - 8GiB eMMC, SD slot
> > - WiFi and Bluetooth
> > - 2x Host, 1x Device USB port
> > - HDMI
> > - Discrete TPM2 chip over SPI
> > - USB ethernet adaptors (soldered)
> >
> > This series is a v2 since v1 of this DTS file has been reviewed on the
> > U-Boot mailing list [2].
> >
> > Changes in v5:
> > - Addressed another nitpick from Stephen.
> > - Collected Stephen's review tag.
> > - Warnings reported by Rob's DT check bot aren't related to HMIBSC
> >   board DTS but rather they are due to msm8916.dtsi or extcon-usb-gpio.txt
> >   still not converted to YAML format.
> >
>
> I haven't seen any further comments on this series, can you help to pick it up?

Gentle reminder.

-Sumit

>
> > Changes in v4:
> > - Dropped IRQ_TYPE_EDGE_FALLING for pm8916_resin given the expectations
> >   of Linux kernel driver. Instead depend on systemd workaround suggested
> >   by Caleb to get expected HMIBSC reset behaviour.
> > - Incorporated further DT coding style comments from Stephen.
> > - Warnings reported by Rob's DT check bot aren't related to HMIBSC
> >   board DTS but rather they are due to msm8916.dtsi or extcon-usb-gpio.txt
> >   still not converted to YAML format.
> >
> > Changes in v3:
> > - Picked up tags.
> > - Fixed further DT schema warnings.
> > - Configure resin/power button interrupt as falling edge.
> > - Incorporate DTS coding style comments from Krzysztof and Konrad.
> >
> > Changes in v2:
> > - Fix DT schema warnings.
> > - Incorporate suggestions from Stephan.
> > - Document UART1 mode GPIOs based mux.
> >
> > [1] https://www.se.com/us/en/product/HMIBSCEA53D1L0T/iiot-edge-box-core-harmony-ipc-emmc-dc-linux-tpm/
> > [2] https://patchwork.ozlabs.org/project/uboot/patch/20240311111027.44577-6-sumit.garg@linaro.org/
> >
> > Sumit Garg (3):
> >   dt-bindings: vendor-prefixes: Add Schneider Electric
> >   dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
> >   arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS
> >
> >  .../devicetree/bindings/arm/qcom.yaml         |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../dts/qcom/apq8016-schneider-hmibsc.dts     | 491 ++++++++++++++++++
> >  4 files changed, 495 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> >
> > --
> > 2.34.1
> >

