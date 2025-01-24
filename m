Return-Path: <linux-arm-msm+bounces-46095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A598A1B855
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 16:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C40F7A214C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 15:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFD51547D5;
	Fri, 24 Jan 2025 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlLbmnyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31412EBDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731026; cv=none; b=YU5R8Zb5LVXvewKpO/pv27NQZTsdtra1nMp9mMG7OXondqY9tSN6n/oyIti8tOVBK65auvBfBPMs+lP7s+PHY1b3Uwip7mpAYE2ckrIhaK/gefNECzqEvWUoaXekxQd0aAtLhUa8xXNO3VRe1Y65ZuHLUwv7JQY/rLIizvPoht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731026; c=relaxed/simple;
	bh=gN+7KPBjQ3apdp+svz6jKhy2+Bo20hn7fXqkj0diiq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5jasIByu1n2pC30TYAOU+zsndqdZ/wwe1JYhsy+uil/p/JxBj/Dikq6zkiTYqHBdD3Q5W1vw1U3IZGKWnlB4LQwR6bcdCjTcnGqCVpG0Gsc7qoO/WuifsUSbnOed6xv9N4TMKepFBsPBgJI6yCFUcLhe93gpjeTups8ECtkEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlLbmnyU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2257292e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 07:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737731022; x=1738335822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7T+NCUqaMb1L5bzUtS5gNUEu0whQ9tB9Ycz/UKjNxK0=;
        b=BlLbmnyUT0ycV2izcUqK/Edmivp3CDhs7W7/4Fd+eyFeXh7WOoCRI6R5MdTyyhwvQF
         sCliwK/OYmOu1akAu3jlss+5Cq47MPG2VM+hpIWfSQd3pxZk33IwGFCXSRh6p3/Z7Gre
         x20au7Q2OsbMvF5S01jm8ekv+zmAJXQmyu1YtEuH2hZfZf1XhabTRCA+ngIxaOwxnsw/
         bSe3u2soMfXTzepPckPMxvutfzqGKHldaaWuaPauNZC4Mhl1Egdas+GrvkdaUvAacKNm
         SOoa0u4tKzqn68Ru021/yLmHTqo3t29tiQ5jqmxNAixj2Whsw+PY/tvyHCWZFuneK0WI
         cDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737731022; x=1738335822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T+NCUqaMb1L5bzUtS5gNUEu0whQ9tB9Ycz/UKjNxK0=;
        b=kPmRAYTofFVwHJTF/ZRFrBZxm0bIEJF9fdn/ZivOjXAzq4Wcd18ZeAn39/3FSZWqjI
         kiUxYgcKLhydCJ1rszLDLkdbjSJ6LI7cwkweOl5kahP9nUjIjWLKmtzzTZOBazuPbt+u
         UOkU8ByNwSkvVxAvhIteQPMM1srS46/i+gU7NlEPPEk1WUQqr5+iYX54qQ4Qd+DJQ8A7
         0kW++Y/LzzhhUxalFtnoIntlBjTGYoINiQhdechHh+IA8hG+uCiYV+my5XjNVQfSSDUV
         K5F/AdfcSNqksf87fVFT1TMiWuotmTRH0m8w9gLbKAEWNBHTENTt4dCdFNg+/IdxJsFI
         r1cA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCU0mngZS+dfBn7c8VT5GakGbNY3aDZaGLoKR68h7/blHzaFuxKtiQvSIDZzAYHOhYLpVWunPINDtYjOm@vger.kernel.org
X-Gm-Message-State: AOJu0YwlaH6NglYP9F4V4JDuydl690hWaCs+DnOQ8vUojenLXhdspfSj
	CfvNy3AcENeGAnd88aAPVtoiUra9qxW/6ImjFB1fL2DEPJyqQpCToX8N72bb22U=
X-Gm-Gg: ASbGnctYvupYIH4ZvdxIvPy/pN9u0G4PfTlmb7jmdVgRdaYhHWNb99xsGhsLaJ1vr3Z
	Z3VogqZx4nM2GBYcFftY3mJUHf7i43w8UiRDblEsbY3GRyjtDupcp30LJUHEikUWvc3poGElsLN
	yF7IWZSrOIp8FMa6ocYPOo5seKJ0i8jpneKa62QWIFk8Gv3iUjYoVecWgoCX8D+8LrOYQdfsrWK
	3ynz2Lxu5Xq5FWV/gEFGgk798ueRYljEsWX60cO8ef9f86Hj+tqOB/x+msWA6jrmc/6+LQ6GRBO
	X1kxsGeCDCfgF8cD1JkXa5Rr957N6vZSvijEGM7SMRJrdxcnh6x7KYYDF7ly
X-Google-Smtp-Source: AGHT+IEQdJgfpDkA2kLfF64yUHBaMCdd2VK0VHt4hFo/cuvczFWmqHG+G2R0tRPk4Ktqceg412FjcA==
X-Received: by 2002:a05:6512:691:b0:542:29a6:db5a with SMTP id 2adb3069b0e04-5439c2820cemr10379948e87.35.1737731020389;
        Fri, 24 Jan 2025 07:03:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368537sm316786e87.108.2025.01.24.07.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:03:39 -0800 (PST)
Date: Fri, 24 Jan 2025 17:03:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2 2/8] dt-bindings: i2c: qcom,i2c-geni: Add support for
 selecting data transfer mode
Message-ID: <ewwk5tvwlhu7cbev7su75ysooboq7ivloydvd3unwic2e6p7ap@bpyoqsrgvf6f>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-3-quic_vdadhani@quicinc.com>
 <r4zfoaub3dwkirdbsolbl56xxa7ax5eusb2256c7ezlyl2s3vh@hit4g5cpzijw>
 <da7b9678-76cc-4e45-89e9-4e8d9c9a2005@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7b9678-76cc-4e45-89e9-4e8d9c9a2005@quicinc.com>

On Fri, Jan 24, 2025 at 05:52:24PM +0530, Viken Dadhaniya wrote:
> 
> 
> On 1/24/2025 4:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 24, 2025 at 04:23:03PM +0530, Viken Dadhaniya wrote:
> > > Data transfer mode is fixed by TrustZone (TZ), which currently restricts
> > > developers from modifying the transfer mode from the APPS side.
> > > 
> > > Document the 'qcom,xfer-mode' properties to select the data transfer mode,
> > > either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
> > > 
> > > I2C controller can operate in one of two modes based on the
> > > 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
> > 
> > Is it possible to load the firmware after it being loaded by TZ? Is it
> > possible to change the mode at runtime too?
> 
> No, firmware can be loaded either from the TZ side or APPS side.

You answer actually reads as "No, yes" (excuse me, non-native here).
Most likely you mean that it can not be reloaded once either TZ or APPS
has loaded it.

> In non-GPI mode, the transfer mode will change runtime between PIO and CPU
> DMA based on the data length.
> 
> We need to update the device tree property(qcom,xfer-mode) to change the
> mode between non-GPI and GPI.

So, is it actually possible to change the mode? E.g. if the TZ has
loaded the firmware and configured SE for PIO/SE DMA, is it possible to
change it to GPI DMA?

> 
> > 
> > > 
> > > Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > > ---
> > > 
> > > v1 -> v2:
> > > 
> > > - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
> > >    qup common driver.
> > > - Update commit log.
> > > 
> > > v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
> > > ---
> > > ---
> > >   .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml        | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > > index 9f66a3bb1f80..68e4bf0c84d1 100644
> > > --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > > +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > > @@ -66,6 +66,12 @@ properties:
> > >     required-opps:
> > >       maxItems: 1
> > > +  qcom,xfer-mode:
> > > +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
> > > +      The default mode is FIFO.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [1, 3]
> > > +
> > >   required:
> > >     - compatible
> > >     - interrupts
> > > @@ -142,5 +148,6 @@ examples:
> > >           interconnect-names = "qup-core", "qup-config", "qup-memory";
> > >           power-domains = <&rpmhpd SC7180_CX>;
> > >           required-opps = <&rpmhpd_opp_low_svs>;
> > > +        qcom,xfer-mode = <1>;
> > 
> > What does <1> mean? Please provide corresponding defines.
> 
> Do we need to add a string instead of a number, like
> include/dt-bindings/dma/qcom-gpi.h?

You need to '#define FOO_BAR 1', then another one for 3. String is a
"string", it's not required here (in my opinion).

-- 
With best wishes
Dmitry

