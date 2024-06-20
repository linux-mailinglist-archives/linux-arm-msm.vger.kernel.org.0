Return-Path: <linux-arm-msm+bounces-23378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3C910945
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 17:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EBE1F257AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 15:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027491AED4E;
	Thu, 20 Jun 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kv617gOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6C1AE0B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896058; cv=none; b=Xe1nHQvo0jA1atOlZJO6nF9vY+zcaE4HoSNrTdwEFYJfzqZuoAkT/c+41xgVX9hRH6ZYNfXob9TurkoRErysOw7uVDNxruqQUJw2hbKpNmzuoFqNfnMIuTSeWOczX3WGrWG4TAP8q5I6KHISRBlC3VamQil7Aq3a8Uqjq50XYbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896058; c=relaxed/simple;
	bh=xOcm8o2l5JQWCUNLOtfrA1GvSBAKjpP+fu/aDRuwnQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkHOkb0+F4NRdBaFzHACkzfZR6hJqlqBjrNJkGSHkH5xYolYjDGryBAp4Q8WSUEh3Ly9kJUwxWxDdL/YU4/7uljf1QX7pVc1hqRxDJqJatbDynGvS2Uxrti1z3O4C3LJjjQoHHQDuMjF6m0K1cP21l9UjvCnmlUm5zFEhWy/wAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kv617gOR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso1035711e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 08:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718896054; x=1719500854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYHweVZ8SvM7aRt1wRctpq/Ps6ZF9IcCw1HXUUFOaGE=;
        b=kv617gOR340Bvkxav6ZpWNPfpOBpWn0nuh2IUE2E0vG0x9OENgmrZuQ1gYYamRw4aA
         ocMmjG6SUFULjAeDXVMgVmCVlhVPdtcES6llkb9WOkAN1V81narr3r8MUjAbTJzCtctV
         A0O+jxnUQmaqtE3WAmo6M4rVixdbNX1BIizZln03jix89dEEqU1E3MRS3UUjXJvqQVvu
         HwZVWCVb4pqVB6CCjmXMnHkSGVKvQ83LG3itjW9yR0I+3Uc+OQxZlP8oXdxVqjJU9cOs
         gqLXQHL3pAOZXexfYvBiGOMUMLUgGCw7aOesJbRbsUkDDFpDECfxm+L43YAJAsMQNphr
         OcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896054; x=1719500854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYHweVZ8SvM7aRt1wRctpq/Ps6ZF9IcCw1HXUUFOaGE=;
        b=JXDWKs1/7zpvp1gmQqVEsq1AK+Gras/UW/4kNReFxBv81aUhlFxEX6Sg7MW2QDXO2Y
         tfXXe2hGREoEBwPqNuqLnSSp+vbIlcQ+NQFPZkJ1h1FQAY+ghDgMXgidwJUAGVuvJ2Gi
         Cy0TCtxcS9zUcbVBWWRCKjj4FQhbRB1z0BhDw+0XWO3LAOypa0ESrekVN+4hGMCTusQq
         kONaEouiM3ZEYQR7VxHAmw1nMAcvPg3BMDIb86iQx8vWDVoRgVoCbS9MxyYx8WPIRYXL
         7yI+jdxZCEWB6LUOawFpw1x9j2e/AFkHkGaX62IdMeYT2NwCKVmEpj3nKX0TEqJBeUFq
         RgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCURPKlaCQP2xh8Hc2qazcWsQbTqV6V2jLxqc1h2cvLY9WEsRhY4lxzo9MamZUmhsvLeOdbb/V/+sYRUCQN6BbM83RNKWmgZwuDi/L0LvA==
X-Gm-Message-State: AOJu0Ywu+x/CNMOgej0cb3lV6UP04LfxAa6LyA3HUpd41Z440cMyEJRR
	vKNC613S0F34+rrLL3ztOIzcI0pHKc149VALi6IbOb4qAaRpiugrhYDszx6tnvI=
X-Google-Smtp-Source: AGHT+IENbydYL9b/lxRdBwBfRCX40quR6NXKdUEsjdOpUHzUNVMsk3xSbEIqa10UsppQ0ZVSsdYeUg==
X-Received: by 2002:ac2:554b:0:b0:52c:9adc:352c with SMTP id 2adb3069b0e04-52ccaa340dfmr3047367e87.24.1718896054463;
        Thu, 20 Jun 2024 08:07:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872427sm2107805e87.166.2024.06.20.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:07:34 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:07:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set
 role-switch-default-mode
Message-ID: <v3dgoeybewgegi2xuixhaq5c7jwju6wojrmzcq3rtb5f5r5nfu@6gj4tfz5blx7>
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
 <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
 <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
 <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org>

On Thu, Jun 20, 2024 at 03:30:29PM GMT, Caleb Connolly wrote:
> 
> 
> On 20/06/2024 15:15, Dmitry Baryshkov wrote:
> > On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> > > 
> > > Give a hint to the OS which role we prefer. Host mode generally makes
> > > the most sense.
> > 
> > Why?
> 
> I guess this is subjective, but on these boards the more common usecase is
> host mode (before we had role switching we forced them to host mode...).
> > 
> > > 
> > > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > 
> > Would it make sense to set this for all the RB and HDK boards?
> 
> The rb1/2 are the only boards which lack multiple USB controllers. For
> others it's fine to leave the default (peripheral mode).

SM8450-HDK and SM8650-HDK also have just a single USB-C port. My logic
was slightly different. We consider these devices to be SBCs, so I'd
expect that they act as hosts _by_default_. If somebody plugs RB board
into a laptop, then it's logical that it should work as a device, but
between the phone and the RB board the RB is a host.

-- 
With best wishes
Dmitry

