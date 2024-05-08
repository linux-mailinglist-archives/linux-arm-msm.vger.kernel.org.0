Return-Path: <linux-arm-msm+bounces-19493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CA8BFB43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 12:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62B61C21788
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA79181ABE;
	Wed,  8 May 2024 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ice7gnbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A57D41C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715165279; cv=none; b=qj3QQ5D4CViYdmaIcG1JgM+8TS4op1VzU1PMWtbkjc1lQFlLSWanu74vY3Zo4Ltsahqkwl5fImEaI5yPY1OQx5x6z5Jd7yjamPC3Ypfg1t4NUI5DA/51Gbz/O2YosPOuyDt6RhMJEc6r2ywyxU/1PgjQQxxM5lYG8f/fsiwZKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715165279; c=relaxed/simple;
	bh=vpbiHsnsZyeL5F2e2N4ix1aSqeYmPGen1pGmaZRkQLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho8dO48c3xS2z6rXEBR0N/WnOLXYAesuLM29KTRRVojWJskCn5mnhbl5C134JTsq/GD3p2df5Uz1040uZt9PPeXM2oGH3FUl0l5afZ0eGYISOSsc1F01JLL/w6TwM7lwurGO0NiDRMwl2KEdkO2z+PPrr108ILs/HxvByljvdv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ice7gnbB; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-de603e3072dso4821977276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715165277; x=1715770077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoZX15B6govTZa1crSFZ03U1Z5NpIxQlGrKdNgAOQcI=;
        b=ice7gnbB6KJJbj+0L9JlGDku5Nnr3B9LNgRo76/G44JSa9uXtlwrehvj5DJNfoLPQv
         +cwguD53v+58bb4beVa0UOB1dmtG/aOugurMw6442qShzZwRYN7V+5OKBb5Q50Lk35mB
         j8eFbN5BDpe+CM7BMs9nzEOI3gJsrNHqeV2TY0HCkqVAqvcFHIoHEQic4ms5NOBFnVIz
         sbtDmBFbaVOyQMuWqhZT/PZ0EfOId+BRPN3PQdzeSJmVbUqWo4AxwheEP3uGP2lSoGc6
         Nva1LfeZ+8y2EEwyrEcFRrlesVDXsms/z2EKA0LNcCcUGRk+0AotoA9N2u1f7A6fDmkz
         MWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715165277; x=1715770077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoZX15B6govTZa1crSFZ03U1Z5NpIxQlGrKdNgAOQcI=;
        b=obTmNETJ7xSuYBPXhkdLg+MyRP09Rn4VGaQRhUjrul4HQWIVGeUogrtj4p7/PnZQKb
         g4KYldP2eEL0QN8xkOl5TGoXR/uGrLd8l8Ja1KIwcwVEI+vPtSawyzNxouarZbPdoZmw
         Tk4dY/Cqgcer4bLfutXD8Efd6+xVTf9MJUkp3lA20IDhnCFqHiySPdSDiY7XlBLP0pnw
         tcbPm8D+PjKkBfIrXaQJ2MyVXkM5oksBgeMcB26HeDwOG0unzJzcJiyvntlZR2jmB+bG
         Q18eL0huNhcae6ttXnT6U9Zc5iiXfTwXSLwlFJ1TG7HhbQsMUMaxFNEvI9MqZ9766aVU
         wHdA==
X-Forwarded-Encrypted: i=1; AJvYcCXDAcfBBEecmcwmHHuOGrkFJhnnf9uBOdXxopZXsJ3nFtnvg2M5jg1eyOw3+9WPSZDd2S6IyK04h352SFGyctJbg5TvGSM0jZPj7JATPw==
X-Gm-Message-State: AOJu0YxlJ8nfyfhnngKBmjgcnSyZQSHU4EhMJOsD3R+vLN+03u3MJl5M
	mqxNYXI6gl7WQKS0KEwM5sqxHliuWCVSMt/eKIMrBJg9gct5aUofIuQOpVPVJ/u/vk7vPEhW9mA
	mhAwJdVaiqit+dTXw1L7dD9sV4tN3PVGsR37qFA==
X-Google-Smtp-Source: AGHT+IEWwosbEieIG3yPj7wVS7/X+26Rl5SJvi7/VdhV3IY6zo46NS8e83824/vbmNXb+zl5PPWRF6ISWsjL+0RJS9M=
X-Received: by 2002:a5b:9ca:0:b0:de0:f74b:25f3 with SMTP id
 3f1490d57ef6-debb9dd9428mr2093299276.60.1715165277491; Wed, 08 May 2024
 03:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <171405653305.2527744.3813895380659072690.robh@kernel.org>
 <20240426142442.7769-1-quic_vvalluru@quicinc.com> <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240508102202.GA28609@hu-vvalluru-hyd.qualcomm.com>
In-Reply-To: <20240508102202.GA28609@hu-vvalluru-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 May 2024 13:47:46 +0300
Message-ID: <CAA8EJppiGiaddrNLRGtzjKHfcYYU4LcXLCyOgfy2En7LRggv4A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
To: jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc.smtp.subspace.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, konrad.dybcio@linaro.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, 
	quic_nankam@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 13:22, Prahlad Valluru <quic_vvalluru@quicinc.com> wrote:
>
> On Mon, May 06, 2024 at 06:14:10PM -0500, Bjorn Andersson wrote:
> > On Fri, Apr 26, 2024 at 07:54:42PM GMT, Prahlad Valluru wrote:
> > > From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> > >
> >
> > Please don't thread new versions off existing version. b4 helps you with
> > getting these things right, please check go/upstream for more details.
>
> My internal gitconfig is not configured correctly. Fixed in v3.

No. V3 was still sent as a reply. Please fix the way you are sending
the patches. It has nothing to do with the git config.

>
> >
> > > Enable lt9611uxc bridge for qcs6490 rb3 gen2 platform.
> > >
> >
> > Even if it's clear what this is, I would prefer if you described the
> > hardware a little bit in your commit message.
> > "Rb3Gen2 has a HDMI connector, connected to DSI via a LT on i2cX.... reset and
> > irq pins comes from x and y. Describe this."
> >
>
> Agreed. Updated the commit text to include bridge details.

>


-- 
With best wishes
Dmitry

