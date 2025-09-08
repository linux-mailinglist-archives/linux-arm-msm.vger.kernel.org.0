Return-Path: <linux-arm-msm+bounces-72533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB8B4876F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E9C57AB390
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B222EC081;
	Mon,  8 Sep 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FP0eevmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF212EBDD9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321217; cv=none; b=Sw4jt1iOvZwvnz1SrYHk5iQ/N5j2aEzDlqRiVeQyqv8ciZNk7WCZ+XKF6pqpRxlnP50IgIWIPECGsg1Ud97VuHSBLVyroyxJjcpcSB9V/oRMfa3gCzAZmsv6e9I1n1RD5Vopn6jgKFwiQ9lJcIJs2mm5cAhkXoQYS5EWEkHKObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321217; c=relaxed/simple;
	bh=Bj4f5uRY244iHB4rE4uWa8vhW6auxFTmI1aaD09pYy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruq9orjjCOTZ/Q9STSZxIbcTFrBlao28Z+TbpLj9shRzbc3TL6kou6i3kUNFJgJuujhxFPhybx9x4JokhUlsyH72Jvb1tW5oyo4Xn930tiQDRKuwPrk1EGiHGFnl91EHvm+01rsYdj4fOuLsETxDT1GrcqYVTpMMQ8K6vvPIhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FP0eevmp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61d143aa4acso6573136a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757321214; x=1757926014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUopr+FL50FcSWn7mytwl0gX5Rr+3JnwzdeTq9mrxQQ=;
        b=FP0eevmpxMLL1QI9kUun0x+ZnATStLbZKIMV5RmbfA//BUKxCN46WaFPfXJklhEvWH
         d3OqiuCPiFkCD/SmqFx1DUzBTxeSfsFhKIN7nBGjD5NiUKWgKuRT4MsLHQmjc0vtsmyE
         iLbiIEeD3KiSfZmfCUOoE9RtkLVscQGxaG67yuRECdZrJYmeFn1o9VebwCRnaXhjFvMk
         gHTNuzXFeFVhBoXHGYxDOI+U3ko3LRy2XWtJbsHZALcS5sWHX2MWtEEVLprBBt9F+MAJ
         VfI1AjRxlIKZvrjhOgD8CO3gY2VGw7QMQ19oZRDnpe9G0yTMf2tsKWS65QarocXYULXR
         /WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321214; x=1757926014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUopr+FL50FcSWn7mytwl0gX5Rr+3JnwzdeTq9mrxQQ=;
        b=pYULOTdPgpfHX0l8SZ1YQojmhlXQCdTVzZPlAotqal8U6LwWzgTun/5aSONUzSU7Ue
         rqyhdpa6+wchuVkTfxUrOwdeBDRSuHw1FFdxoTZLUrf3ecHmRDwMqhx879GlbmURsztW
         HgELpD+/2Nn6P0E/eINywxwUgdi6aLkQT/rpWTJPRlX9B+w4MQfE/xkJwoVS2NXO8a5u
         h6sVKXAT+iFqmSshbJY+0vP0o/OeP38qY8GiZuNrPnHm2uDkTVsBmjDtUYmEblY6G8EO
         0V0/vlrz6jPdg/A2YYqSLjoNKJPJwuoipMAhl6YeGwhGYjPaycCX/+iMASsH0DoUjRi5
         ZZdg==
X-Forwarded-Encrypted: i=1; AJvYcCWfhGFsl9FEbPUVqJqN9UJQ+ec4Fd3tUNfC6g0Vpdwd3Hld4MVZq20Fd96xRTk6AB8spk0YpV0xSkKPr1z2@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/TAttXpdNCGSkg3ah0JRSRXiIh9YAefJF05FB6kEQUzDKwhu
	I2sPPc7DbKqdCEm9nWPF4wNeF0UCq1etT5G1UwL5JQgXT1Hab5vdrVs4GX99tFzzrGc=
X-Gm-Gg: ASbGncvpOJbwDFOpayE82y2NtlK8KtxckgZgGcbDvvxh6DsMhj4an2GPa0KiAp4RYRJ
	P552qJ3l016SoEA8E2Vh5Sqf6QRkKEJhFkJBz3DskzhT/Y1xwf3S0IeMyuOm7WlGVZ5UFTet9g9
	hy8lFTSD0MVD13FXS0/6kTR/cMJq3/DS26hkkdIkMwPk0BgD5aRofRHNlyjWK1VC8NWd95Pcl4Q
	L2VP5HtyemiOwTZ1AEV5+Y8iGcT73xqORVGMtOh+qjTnIiQwCF+eiOZDEPLXrjw+g3TOWmlWDKO
	zFZc1BjEi5Ognq3CatJza2BHRrs/gDxnc/Mss9prZ7zxGnYUoq1BnBjHzZP/9xH7od4IzTTD1sb
	hskqeu4S9Qq6R3ngfTSQR+3h4FX81XYnVPNAKa9zfYNxO0NPJlI9QYw==
X-Google-Smtp-Source: AGHT+IGJq4/stKcb5/47RwYSY/9mKYvHfYIb+Y8TD1SuUTdb5c9q3HcwFqg/ndym+yPEqRaT8vxf8Q==
X-Received: by 2002:a05:6402:52cb:b0:61a:967f:55f9 with SMTP id 4fb4d7f45d1cf-6237b972390mr6163555a12.10.1757321213876;
        Mon, 08 Sep 2025 01:46:53 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62343271613sm5201516a12.23.2025.09.08.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:46:53 -0700 (PDT)
Date: Mon, 8 Sep 2025 10:46:49 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Message-ID: <aL6X-RiCyPVbHlYN@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>

On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
> > On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The CCI clock has voltage requirements, which need to be described
> >> through an OPP table.
> >>
> >> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> >> (which is a value common across all SoCs), since it's not possible to
> >> reach the required timings with the default 19.2 MHz rate.
> >>
> >> Address both issues by introducing an OPP table and using it to vote
> >> for the faster rate.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Using an OPP table for a single static rate that remains the same over
> > the whole lifetime of the driver feels like overkill to me. Couldn't you
> > just put the "required-opps" directly into the device node so that it is
> > automatically applied when the device goes in/out of runtime suspend?
> > 
> > And since you need to make DT additions anyway, couldn't you just use
> > "assigned-clock-rates" to avoid the need for a driver patch entirely? We
> > use that for e.g. USB clocks as well.
> 
> This is futureproofing, in case someone invents FastMode++ with a higher
> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
> clock which would (marginally) decrease power consumption
> 

If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
then I would expect a separate entry for 19.2 MHz in the OPP table of
PATCH 5/5? The DT is unrelated to what functionality you implement in
the driver, and that would make the OPP table look less useless. :-)

Thanks,
Stephan

