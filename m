Return-Path: <linux-arm-msm+bounces-22845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C990AC86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893191C20307
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1CA19047D;
	Mon, 17 Jun 2024 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+1WFjLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1163653AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718622064; cv=none; b=YE6JFGRTcxvIG9b1YV9qJyRQIxFIV5PY5FQ7wIegKtSH2EGKDy7l4WgRYI005zN5MqNU3CentV8xfrsKv2IJe3+dH18cvUR4YQuThC0nK/aZxRLMWSglYo+30mPFEKygP9shZarHl/p587e3q/B2o/Fceaha+HNcnOlIQDyOe+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718622064; c=relaxed/simple;
	bh=cKofoxhoSF5ZQPhIVi4G0l+IsmRHCdzIQcUF+FD2XyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQvXoZteheUf+hLBPHxX3CRU93+5cDDlauMBPrLZScAYT8/u8K0BwxKC2SZudQdrvZfkvoS0lWPBEpj6/yDQMTDWs1Nfo864rvJ9h/qQ3uPlqPy1Xfwzetbv1pvp4ArSqutYwm4Tt4koK11b9unQntBJJlJ/d002mfL9LmL+koQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+1WFjLe; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c7fbad011so5013868e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718622061; x=1719226861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SjNe9vmU5byAvsAKJbghGk4V4PXep6SvlVxJjNPLCM=;
        b=o+1WFjLe5iHMnIJFK6/5EHggVUxNKTkLC5bRpkyDnPnH4mFa9+xozoX8waK8199/JW
         wJGUHx6s3Kih4j3glwb8ZjxrwL04nPOLGbObdjoUlunI8gdKtckGmgHxBkS5mygTnlIM
         Ivi49dwortHOAfnXqMSMN0iWi/6qzz7viR0tnXgIKNvTcyOjrmCTESjzYPd8UGbOg6wB
         VsHriqkSsoOPbLysJopShTYMlBt6lxsc8eUdUXvExM8bgMAfXDFTBVLWr6mGoSDisjL8
         GfsvUrLQWVPc7SEhSy3KNGMmuEeXl9VNFPs5/JqOeDznd7jyAlGwfjkBMLbKv6NMtFaS
         X8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718622061; x=1719226861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SjNe9vmU5byAvsAKJbghGk4V4PXep6SvlVxJjNPLCM=;
        b=ffw7fRDXGcFLnHqbzuv3JpaIJTFPZ4nxtVhWYMFJzYlJOxgcNnIfC1Yah9A+wdak9G
         fAQCb6z36Rwh8t1OXsDH2lTRWePtg33uecUNZU4kymArkU+wb5cvACd65XjIFE7uc4+n
         FffEs+jYUpWgHijFjFFmVPDqAaVnMDj99vPuMIDaeGudSWBgXH30WQ7L90O+SnUos+cB
         dGriaSRtZz/fuVPr34z41q+AxIPjrO5DSxE0XXxjvA3BGdF6huTuBY0TXLl5nEA3T/Gj
         IPhRS7FtBBC1K+4+OvzJsKUr0tR3nWSALp6TtF1rshcDeTTU6DFv7aZ+Ofz+IuG2Bo9a
         rsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXleqK79e9ZxDjvAe2fXsgmV0Mlkmf+x2dXLiX+1F5b/X/kKH/N518DFO2R2QsvKnJjXyJwXnWLiWzNf0hyXmCoErfS+z3sxujKnogpg==
X-Gm-Message-State: AOJu0YwX4MMgAYdukk8MJucI6TZgGlxROZpWpo+EbRUfpZLSci6NOahi
	jRnnRVk3Nh5iGZdLs/IaxQd6GEovh/In23pZ3AycvsscFD8Llhub2nkB6Da2dTM=
X-Google-Smtp-Source: AGHT+IEXhLINf4w3Jt6vhMBeIEaqYtSUuf/UGyq0ougmpEhxyfRWYmFs/qW8gnDYQ7pYqWK6RaW5Ug==
X-Received: by 2002:a05:6512:10ce:b0:52c:bd0a:dd32 with SMTP id 2adb3069b0e04-52cbd0add64mr1873804e87.46.1718622061319;
        Mon, 17 Jun 2024 04:01:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282de47sm1203069e87.66.2024.06.17.04.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 04:01:00 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:00:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: krzysztof.kozlowski@linaro.org, djakov@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [RFC PATCH 0/2] arm64: qcom: Add BWMON support for SA8775p
Message-ID: <3yrji5rrzrfj3j4bekvhos36mgafbdcufsslk5daqfn7y5k2qz@k3nrrlbnlsmb>
References: <20240617092940.1724962-1-quic_tengfan@quicinc.com>
 <yb3ni6o22zdm2lqodj7utdb2dlg3jkbwzutxhmljxle3syoe5y@op2prslmri4y>
 <d997f42d-0616-4180-ae36-9d2ebd60d15f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d997f42d-0616-4180-ae36-9d2ebd60d15f@quicinc.com>

On Mon, Jun 17, 2024 at 06:42:42PM GMT, Tengfei Fan wrote:
> 
> 
> On 6/17/2024 5:43 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 17, 2024 at 05:29:38PM GMT, Tengfei Fan wrote:
> > > Add CPU and LLCC BWMON nodes and their corresponding OPP tables for
> > > SA8775p SoC.
> > 
> > This series is marked as RFC, Request For Comments. What kind of
> > comments are expected for the series?
> > 
> 
> I found that the BWMON patch for x1e80100[1] is currently under review.
> There are upstream comments suggesting that we reference the same shared OPP
> table from all the BWMONs that share the same OPP table. However, there will
> be some DTBS CHECK warnings[2] if we do reference the same shared OPP table.
> 
> Therefore, I pushed this patch series to collect some comments on whether we
> can have separate OPP tables for each BWMON, as the OPP table of
> "pmu@90b5400" and "pmu@90b6400" in this patch series.

Thank you for the explanation. Now why wasn't this a part of the cover
letter?

> 
> [1]
> https://lore.kernel.org/lkml/4ef1d9a9-6a0e-4324-b6d5-2ae225855b03@linaro.org/
> 
> [2]
> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pmu@90b5400: 'opp-table' is a
> required property from schema $id:
> http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
> 
> > > 
> > > Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> > > ---
> > > 
> > > This patch series depends on patch series:
> > > "[PATCH 2/4] soc: qcom: icc-bwmon: Allow for interrupts to be shared across instances"
> > > https://lore.kernel.org/lkml/20240604011157.2358019-3-quic_sibis@quicinc.com/
> > > 
> > > Tengfei Fan (2):
> > >    dt-bindings: interconnect: qcom-bwmon: Document SA8775p bwmon
> > >      compatibles
> > >    arm64: dts: qcom: sa8775p: Add CPU and LLCC BWMON
> > > 
> > >   .../interconnect/qcom,msm8998-bwmon.yaml      |   2 +
> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 115 ++++++++++++++++++
> > >   2 files changed, 117 insertions(+)
> > > 
> > > 
> > > base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
> > > -- 
> > > 2.25.1
> > > 
> > 
> 
> -- 
> Thx and BRs,
> Tengfei Fan

-- 
With best wishes
Dmitry

