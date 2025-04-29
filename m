Return-Path: <linux-arm-msm+bounces-56062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED6AA069A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469B318833FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D425529DB81;
	Tue, 29 Apr 2025 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rZxufACr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009AB1D8DE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917564; cv=none; b=S2OkfAU3bYUHwihCTJWP42BxBpJ5MD5VMJqDW0cbxd9aEYDZjS8jYQj1CZCTQnr8eEiur/TqPzJUITGUhBu5govDN07RIXQwcfCoqV2O/wLGfX2lS5GMzSKBqUR9vU0MhZ/uzX/u7e6n7Clr6nFpwrQBiIHvF06JLypfzSiukkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917564; c=relaxed/simple;
	bh=qkRHa501eVnNgHsKBEHeYXm/l1LwtCxMPaoCXH+474k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogHSTL8Ojo4UQftM+TUYGYlFFSBflHhKX2ksn5NQVpBGlSOlixpNkzKeccLjv4kiQz7V6/QPGzS7uJeFOLJP6o36lnLJqkEbj/UvQztcxiAXyu38e4Yicx7FqV+1vaCTt9Kw58rcCNlo3K4fX4wvL8eFHCri2QZ75X0g9YdYwIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rZxufACr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25d2b2354so850804266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745917561; x=1746522361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=St34CXEhhvs84MHtoWjKg9uUjbKo8QcnXhc2ZI3qO8s=;
        b=rZxufACrhzIDoeAlm2hInizgikdWFKt2H+5b7wFu3x6isHDaTLC3FZumxVDz2dRxhQ
         YcpoSU/+3WZmuOnuqGPro5UN3J+8QFntUTMALCl1i3LH5W7VeBAdozReG8ZJKKSbL33z
         wwpDZDdSrffaAL5xdWb8/NQdmyKyJNDpNjGNu04kOjJV2pv1tVp48nh9ApY5YEBK8Snk
         xWStwit8ubaiLFey/ImZCFEaVWo73gpf8H6o6TIAYtMBF1QzMyYesMta9nxSBTW1731R
         TDsCZZLd38mFHZ3sHJQCoXEQkne+8nV83RfAU++LB0ACOvg7rbaAAbyQZGaPMklX1cyv
         mS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917561; x=1746522361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St34CXEhhvs84MHtoWjKg9uUjbKo8QcnXhc2ZI3qO8s=;
        b=I3E5pKgO8RIjkJXF32OcSdjF4qGPz4PDou7MIQ87NViP0srDkSPc+/lqv//I8m0rIa
         qB8ePsTTOgagGBcBtveVHLFo9fYioJSRAW66PWGk2HD5Iu5L/c+5wnGWeKqjU/8sr9YL
         m/8z9uIQOuZEFwoi055P5g/Oh97siklltkMYkXn3MGa91ifgjYXQwE8MURg4oZYH4THG
         bGXfxihzRLASk7wfHuJGVgJ3YfiKhPK0HwJEzckpeSXsUIHnsMogxk6iKbJJB/8LRov8
         JFwW3dy2Zps6AOhKC2f9GfGl5gpW1YOfnVPLmUYfv1GbDRE+iBYgxuL3Coh3JPmA9hzS
         I8cg==
X-Forwarded-Encrypted: i=1; AJvYcCUQnd55U8Pg6YTaoMWFZbOc5uFvW9IfDDCr+iGomKsLQlxLPs6VAvI6f8823qGjacnABGPONQVcGe8nQaG3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KoHxQEkA5ZPnTMmOyLm0Dg+fskLLAHqjMvK8hJ2N0dFDEdEx
	Vdc21xyWT2Rkfa6HG38Vt/P+eoBQYDFTQXZoImT0B7udEz9j++BMjiLtC/850ok=
X-Gm-Gg: ASbGncug9+eUqLmo1j45P/dEeEkdkoqni9ssAQ4+UrUmseR9bBQUmp2NEIEkQzH5Pt0
	IaOg3mswSPvx30w/hkLfcnp+OYG8U7fwHPscun6nBRVQJoFoi3q90udQxgkYgFaCCxBd7qllzUH
	Izyl33RQRQT5xssrzpfK5HTpvKLJRXxRKgpR7SO5WrecB1WQEc123AKFzMpsYOuYck6UpkFKZe9
	l9PaKU/tSfp26c3WBh79n2dpcQhMu1/QSqwvaOxGH05Oi4OJHzzBlZ51fH/vhsSpYqD4cMn0Fkx
	FzZYhU5v9vy7+s7/FP44h/F5dlgqLptxyObbjA==
X-Google-Smtp-Source: AGHT+IFmI25gdGUDFX+EYL8wwESKP6CDqL7XcjLVoi/vRf53apyrXKNyCcwgIrqiDFdc//uuYfkUpg==
X-Received: by 2002:a17:906:6a21:b0:ace:7be1:1434 with SMTP id a640c23a62f3a-acec4cecc3fmr281782466b.30.1745917561077;
        Tue, 29 Apr 2025 02:06:01 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c934sm743471266b.8.2025.04.29.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:06:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 12:05:58 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <aBCWdpk2HXPaJPlH@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <aBCUiIrg3oehMVjx@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCUiIrg3oehMVjx@hovoldconsulting.com>

On 25-04-29 10:57:44, Johan Hovold wrote:
> On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > It all started with the support for CRD back when we had different
> > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > is now figured out at runtime while using only the DP compatible.
> > 
> > It's almost funny how this got copied over from CRD and spread to all
> > X Elite platforms.
> > 
> > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > beyond X Elite to newer platforms.
> > 
> > Functionally nothing changes.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Abel Vesa (7):
> >       arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
> >       arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
> >       arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
> >       arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
> >       arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
> >       arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
> >       arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override
> 
> Since this is essentially a clean up perhaps you should have squashed
> these into one patch.

I was actually thinking that before sending, but then I decided to add
the Fixes tag to each one. Since it's such a trivial worthless cleanup,
I wasn't sure if the Fixes tags were worth it either.

I can squash them if the consensus is that it's not backporting.

> 
> Either way:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks!

Abel

