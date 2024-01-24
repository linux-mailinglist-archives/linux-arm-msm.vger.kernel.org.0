Return-Path: <linux-arm-msm+bounces-8112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCCF83A554
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 10:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8671C264D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EDE1804E;
	Wed, 24 Jan 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2BGTB20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D8217C65
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706088177; cv=none; b=e2VzIN1V9OterkQKsY/4ZjmCl8npT0Z+Qx5iw0kGp07gF0dAMbdROfsyZe1SdjpWcKX0fW7h2C4wdgYdEqveOURZqSuUGVrJSQdt8OUcmN0HP+p8BbfYM+9Qi2VkhRKOrHp4KLWh3aLypEazcuJrE/qMjjpNJmngtZgyd9E+UB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706088177; c=relaxed/simple;
	bh=RvnstN+NQtpHBGLJ1c4pR3cxTU/16Rx2Upex7re0PLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6h04VEAeEyfgiaoQ0ynmnoa2scf+Et/aSR9siUVIwultqYJuCH7Eadfyeba2bPKYfwe9v8tj26Ms+cmOgmFeND3XUFKIwS24HD8/Kph+sxbz7ozI/vVuVN1n2PVs2IxSMij+O3gE00ytfGefmFU/n7ZIO2b0P6iHsvOq17Y0Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2BGTB20; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a31047165a2so76128066b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706088174; x=1706692974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sR9zPble25AhmUNn+7x39sNPQF5UdEiml7UIrsN5jbk=;
        b=B2BGTB20b5UXlN9sUOASVlxIooM9/v55LjQozjD8DCsgomzq0X92Q7aBEoYB+zHcXo
         CE/oI5iCe2IFg6LC+WRpRgQ56zFGGa6MJ+1mgQJZPA+HhVHOVe+7fluNtzjV0cLYt/yQ
         7FbBMocf3RVQGZLKRMQ7d9JhBC2teYMjwc+5SM50knfuE9W7imKvbYFTu9t/Ev8ryhIm
         CK4JPMHBz+idWPM1qDbEBrnzve8kMCXXiczBD+xC9B21yw7fl/c0XyUEPnoZPIb+gvvx
         nCb2b4gC/e/ynYUSGgC8IHDjEji982pXZ1nOhtjbszzGsGI6HCBzC6H86GUTF3P8Tiz2
         q23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088174; x=1706692974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR9zPble25AhmUNn+7x39sNPQF5UdEiml7UIrsN5jbk=;
        b=wGZA2VyEmQ7VO6TzPifRsZWr2kf1eddHRIVN7ntp+OQCS4RtQyulpJm+xnNs15cr4R
         Mg5TqvWTCXZ8nnxy6LCkAKhsfV3FezFfLpR8d1UOGT/QatB1ch9iSE/r51ZB98u1RkFh
         8vRQTcSOkfL2K+D+OR7z+WxxaJ/pVXkBbbBK2+PDXvFnTMDzSFLU89YBKBN0Aww/ILTz
         4HG2ThtVcsCmdz+cfuYUOCjxPe8tLLNpM1OhvwDXox+Ptz7rPZvG+Rhc7nzqUeXC7j6S
         8/EP98267zaOKZo9Ya7dFzYD9WZFh9u0yZ6YkRjEBZHpUHwajnlA73lOIVBE55A2YGrU
         C9SQ==
X-Gm-Message-State: AOJu0Yztkk/48uRQh8ghk4JMYpzr6fdjlPnTn1t4mHYD5Wv8/CMc48qZ
	h1z2cWiw1MVxj+fe2wnpvHhWZ2rgZvbhnC3KvzAZrsBzU1vQjIsVkNfcng3OmwM=
X-Google-Smtp-Source: AGHT+IFdHK7IwG9O5huGr481sKlTD4E6DbBxhdu32Sit5PoGIT0INmXPy3MH1E6DiFAnsTKSOS6+Jg==
X-Received: by 2002:a17:906:c4c1:b0:a2f:68cb:dbe3 with SMTP id cl1-20020a170906c4c100b00a2f68cbdbe3mr627050ejb.75.1706088173863;
        Wed, 24 Jan 2024 01:22:53 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ss3-20020a170907c00300b00a2eb3d16fa9sm8688546ejc.144.2024.01.24.01.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 01:22:53 -0800 (PST)
Date: Wed, 24 Jan 2024 11:22:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2 10/10] clk: qcom: Add camcc clock driver for x1e80100
Message-ID: <ZbDW6zKX5FqG+6Qy@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
 <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>
 <Za+n4zfzoZFhhLIa@linaro.org>
 <f5784838-0386-4ef8-bc3b-195a0132a29d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5784838-0386-4ef8-bc3b-195a0132a29d@linaro.org>

On 24-01-23 18:56:03, Konrad Dybcio wrote:
> 
> 
> On 1/23/24 12:49, Abel Vesa wrote:
> > On 23-12-16 14:39:48, Konrad Dybcio wrote:
> > > On 14.12.2023 17:49, Abel Vesa wrote:
> > > > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > > > 
> > > > Add the camcc clock driver for x1e80100
> > > > 
> > > > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > [...]
> > > 
> > > > +enum {
> > > > +	DT_BI_TCXO,
> > > > +	DT_BI_TCXO_AO,
> > > > +	DT_SLEEP_CLK,
> > > > +};
> > > > +
> > > > +enum {
> > > > +	P_BI_TCXO,
> > > Please don't overload this define with DT_BI_TCXO_AO, add a new one
> > > for the active-only clock. Please also do this in other drivers in
> > > this series.
> > 
> > Nope, that needs to stay if we want to align the dt bindings between
> > SM8550, SM8650 and this. At least for dispcc. But I would like to have
> > the same dt schema for the rest of the clock controller drivers between
> > platforms that share basically the same ip block.
> 
> No, you're confusing the dt ordering enum (the first one) with the
> parent list enum (the one below that I'm commenting on).

Got it. P_BI_TCXO_AO it is then.

> 
> Konrad

