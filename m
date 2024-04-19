Return-Path: <linux-arm-msm+bounces-17970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E138AB1DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C02C1F22E68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C247012FB21;
	Fri, 19 Apr 2024 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDM5Juur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422AC12F5BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713540675; cv=none; b=WhSx3MmNoi+2bfp3vxh3lup8GbTVr7a+YOhwnKbgg+SPWfZWgYGH02d+6o2LG9i4+hHEK1jxdEmg7onPD+XfxTQL1nJj0/25mEGtXXEi9XA1vGeuRQ9ixqlZUByZlYLiecPrGW5BHSnaUpch2cjRy/lulYctYwEBPmTf28j7lvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713540675; c=relaxed/simple;
	bh=iyORyWpSBMWMCLstc8MOWi6t89RmrF3ru6q2Rw2Q2Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcHYl0ERjiBiwL/XP5AqTmcM/quV87RlBNbiJhwhyubrg5Rz+ZFtQIxQiS8SgeJT2W4vyi4G2LKJnZ2cA5Jz+3LFtcdzNcWUbIumshIEDVVQ1RKbEo5EKhJMSCWa/p3YSBLPP5QJYc1/tPPPj0cxEhUqJcqZK5soUOAUecBWSmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDM5Juur; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de462979e00so2589414276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713540673; x=1714145473; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UOhFLujYxKZnKXu9a33FDTIua+PpsCvzUprH7ByhBWw=;
        b=jDM5Juur0PD7bkKzTsca2p4Iv7TQMDnIOcLIdCImTY4dpZrd0MBZXlX8A0pvyRzuC7
         o/9dxPoJxl93uOgMHDdERKvoJ+Qc20Ni45M3uaRCdXNyUgO7v2qr85nMVvQt34BNxw/k
         sc7QkMAHA1iZqoRNDJLrrb8mzJRCEe2+a707nbKvFoSxyk+FNCwFTPMZghjoj6pYpJMs
         dSvpptkmR9FlUfc8AGJmjbqXhoDlnnmIDNTWmN04wj+SFvgastH43z9+E4gZY5PxbhHA
         jyg4feK1MFUNrezVvh0DMis0HDTU5X2l2gP9b1TwqiqiQnu6n59IAEfC9aZBY7brFeXL
         jMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713540673; x=1714145473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOhFLujYxKZnKXu9a33FDTIua+PpsCvzUprH7ByhBWw=;
        b=C9tVOGG4+Gise5qOrvnoUP3bNKVvSe0CBHAZHupkWfRJ5UjqouJWW37mYLkN6IkFpe
         kGb1KFS49RvneROgXAbqKRu/LkQE7l/1MaXEqMG1xZV0j/hZQTeSaBftcJ3jbF2FqUf1
         RH8BJqcOnTWFqOc/qwHvG98/ZU8euZXEu1yjdgkOH6HDRFTmPWbBx4YS1oYF6nt/cd0a
         SJzFGi2fNt3bzHxNzpP6xiLYj90Ii+e+APGwylOasONpkChMoWfYb+BuE5+WD/sTSXDa
         HSnXZC15GjcrLG6WtiSuSQByF0Vr7XVjTJkOxjxwnHa3NBlfzK7scYOflzM6oYlW/hCn
         K+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTy4XATFEKEUnLAnuAlMeP2N9gEDRbyA+nNpmAg2/AGgO4f09eP34zKIFVsut8Msk3tLpTIbAyPbHTjSUDgngQqBCHwvfUVQ44XyBUPg==
X-Gm-Message-State: AOJu0YxWUu6EbhXn//pjaqqhXLtRkNb14yYuDyM0WaKRY3JdcVb375+R
	jOT/bKnKa5AZMkfFsyiTBDxrANMlzu2pgsrGl0FjreqoRg5jNiSc7a1JWJFAOj/PaQWkXNkEbI+
	ogekzYonYbTijuhhByS2raZ9H3FqKULJawpVlHw==
X-Google-Smtp-Source: AGHT+IFuq+KlOolhiQ+NHAAq8t1+6TVTfRh2XE/ClYxC+SNRITjdX3YHAzkPtLbPf7S1Y9gyH6+1IPTqOXEALwqSWu0=
X-Received: by 2002:a25:ceca:0:b0:de4:5d8f:eca8 with SMTP id
 x193-20020a25ceca000000b00de45d8feca8mr2363800ybe.5.1713540673130; Fri, 19
 Apr 2024 08:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403043416.3800259-1-sumit.garg@linaro.org>
 <CAFA6WYNxTPgiq6WLQaKGMTenuKe51SXXhgGYkdyRibghXAMfnA@mail.gmail.com> <CAFA6WYPk6E8JM8z62Skxq454WwPFYQ9EDx7FD--inqe7YoNJkg@mail.gmail.com>
In-Reply-To: <CAFA6WYPk6E8JM8z62Skxq454WwPFYQ9EDx7FD--inqe7YoNJkg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 18:31:02 +0300
Message-ID: <CAA8EJpont5jn9X24saBiM_TVRNh9984xoRXFojj-wmTiK0nU+g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC
 board DTS
To: Sumit Garg <sumit.garg@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, stephan@gerhold.net, 
	caleb.connolly@linaro.org, neil.armstrong@linaro.org, 
	laetitia.mariottini@se.com, pascal.eberhard@se.com, abdou.saker@se.com, 
	jimmy.lalande@se.com, benjamin.missey@non.se.com, daniel.thompson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 18:27, Sumit Garg <sumit.garg@linaro.org> wrote:
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

I see an email from Rob. At least GPIO-related warnings are related to HMIBSC


-- 
With best wishes
Dmitry

