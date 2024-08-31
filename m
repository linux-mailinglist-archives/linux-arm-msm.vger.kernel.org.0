Return-Path: <linux-arm-msm+bounces-30338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF8966FE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 08:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E791C21D0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 06:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC516DEB5;
	Sat, 31 Aug 2024 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipA2EL28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FFE13B797
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725087419; cv=none; b=q/ddLs06MqEKKjUuz/+xnHF3fcwSCC4HjHdDt8WWQDCwQDVjHeiLKf6b8GDjbUqQGs9E/FDUcxc+LVfL2PyWrIWx197TmNbiNY3HonIj0HGmFJ+a7r028U2qftqk5OpKUwJI5bRSmybe2DicU2zjZZjjKV0B3ZpBouC0uegtkjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725087419; c=relaxed/simple;
	bh=8+xb/c5q8Te81bywgznH7epprrs+vus2sJDb/zrAqlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjyvrgLte2h4rkuhxcyY1wctjWgzT8CRUx41RSeYfg2+Vak1zqyoaxLcWjqh7M6DiTC8ZZ0SnK+JPo+3oU6cDBDG1C3187DPZLOYYmheaenZduiRpPcBtNJSvwlpNrXOR/WIzdt2Qg/4Jnlhghg6ioZKVQ3tB9r34KY1rd3hFxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipA2EL28; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e13e11b23faso2584875276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 23:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725087416; x=1725692216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35/Cpco2p2doBWBoqkU/4WZL7A9fRuozoOMEP5DhBlM=;
        b=ipA2EL28NfkHMF7Bu1AE1NRHUWJcX3Jg1VVzfgrd6xD/g/xekeEJULFMdm5ZNaVbnw
         spp67cqXt7EZZrUaj8yk80QL6M5R2lzkRRRtdg4/F5NH2gh/kCu3E2NdOTQwube2J6NI
         cDvDsZa1cemjGvwLj2MOgrk1/kFlE+IJq6LVi5vwqRn0iXio46lFvKKBR+AXTv862xdj
         1/zeYScrc/34ICH/mWL9lEJogDtZ5TjTqG7oWmdzGuLmh2EkE5m39wAB/IFQUJ1ipCVu
         IrkqFE2FuG+/gO7R6IiKnfQCbATqLRq3xLy2pZyk9GzkN/MsMCFmQ5XfAgML4RJfp47N
         trIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725087416; x=1725692216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35/Cpco2p2doBWBoqkU/4WZL7A9fRuozoOMEP5DhBlM=;
        b=w+66ehOroMiuOaEkw9TDIKjumSogxOQC9UuWLkGeZ5Z0Ij+uYyWENydmcdbGQkKAFq
         RUcfZTvNWoAYVDEeSxNmTBlV3zuKP79C2me8uwwOgur3flG3V/e9x7UtK4xjYf79tnwk
         mApFCAmP9eyjsWT3/sIxmiSehMW/d4r6R2UIqWwP9/GV4Alu5mMr6wIeXL+lRzg1lsvf
         735WvkBbKldFPYufuBQBgTR3eCEdRErmEpUeE874OmBki5pPLDyonud8IPr2hqyEjj7y
         vMr0OdRi47oBKqerRAQHs3OXbLyhmrF5xNmhqUj4W4pLkDSsJMmqO70Z/fUCSeLwya1m
         9TBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn9eH9UNM1DOwMvQmBQ9RRNbCKFGQNwGXEmP6VwpdcwgzsxYIoE9K+xuyEL1Gy6fJIVaJd4lcgAOs9r++B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7refmZAPB6v5DTotQMUe4511Rjk7nUiQezoRECzKoGR7zHbq
	KK6EHVuvQ+E0IDAeiwr/S8uqleIDjHK57h2MkATTA9Ntv7/HgZPO0x9LfE0CDzOkLiDLwsbV/h4
	2VI2Uj+i6vnlVibfii38ilC7zqCCwTUcDNLZUDQ==
X-Google-Smtp-Source: AGHT+IFWbLWA4IjXvF5bKeQh1lJtnNOkDsN8Sdtsfq95rr64K/eYP6o6HPpIf8dFbQYhHTulhF5MoAz7eON8AeOpAgw=
X-Received: by 2002:a05:690c:d81:b0:6cf:8d6f:2bef with SMTP id
 00721157ae682-6d40eb67be1mr51383017b3.7.1725087415578; Fri, 30 Aug 2024
 23:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829082830.56959-1-quic_varada@quicinc.com>
 <20240829082830.56959-4-quic_varada@quicinc.com> <gomm5yozebwfuhmgziajmkflbj6knmbwae4mls5kuwl5ngcbrx@mndpiktfken2>
In-Reply-To: <gomm5yozebwfuhmgziajmkflbj6knmbwae4mls5kuwl5ngcbrx@mndpiktfken2>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 09:56:44 +0300
Message-ID: <CAA8EJpoSZwqw7_UVVXzwOd77Xh6j5LzKus-ZfuL_f5yrc8AYkg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: clock: add Qualcomm IPQ5332 NSSCC
 clock and reset definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	djakov@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be, 
	neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Aug 2024 at 09:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Aug 29, 2024 at 01:58:25PM +0530, Varadarajan Narayanan wrote:
> > From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> >
> > Add NSSCC clock and reset definitions for Qualcomm IPQ5332.
> > Enable interconnect provider ability for use by the ethernet
> > driver.
> >
> > Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v5: Marked #power-domain-cells as false
> >     Included #interconnect-cells
>
> Then this might not be GCC-like clock controller or gcc.yaml
> should not include power-domain-cells.

qcom,gcc.yaml already doesn't mark #power-domain-cells as required, so
it should be fine. See qcom,gcc-apq8064.yaml or qcom,gcc-ipq4019.yaml.

-- 
With best wishes
Dmitry

