Return-Path: <linux-arm-msm+bounces-43645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B09FE6DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7F918823D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1441AA1C9;
	Mon, 30 Dec 2024 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXSalNya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923531A9B40
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567874; cv=none; b=GZLQ6PgMyxnOsLe/TXIDSP21UfxLUU0QSlfNo6NwcEFqitE0fiiW9Crwt3qrOPHlEsSDfn8PYXDehqS2qvcNC7B9P5BWGgU2gg/hPLWzVJjKgRPnwwUnqZqhx3cXSCrl2nchgybBqfjDcUP7xh81odo2kw35+IkfA2gmX6tuk5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567874; c=relaxed/simple;
	bh=74DbNi3gkLWnHHlux0W29faGFC3Ka11FDqctEq9j4EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTcGTI9kNvif/iG85vtd2ALMHunWTrbVHVX5CbcUy9wWJWu6B9gukjWPFBSCbyCwBAhp6cNgYI0s2sDDHTpUB+cTxFPr59Hxk1V6CoNWlBc60NLKN6dZgXykJiHgCdSEwJENniiDKKf38r+7+0aM0KwXAUgdLFEgfwHmhAWqfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aXSalNya; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3a0d2d15adso10433280276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735567870; x=1736172670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xyIxL+k0/r10u7r0j6LNml5wuNs20+/LP1O8usk/34=;
        b=aXSalNyagGIbw2pt7E257exIij4HHhb4oPNSaYrIpjdzjNpjO7z8du5OxkXnzLjjEL
         qLF5Rv6hyZ0McXA5isPhD06vnoBhPqJ5o4uMdxPFn95XuoI5DZPDAM5I9xbMtBhw4XDa
         P9jQP8lHDbJKFj/x7g3E2ucn0uNYEFCp5r88GyHhp7tObsHqD91rhprSS56Iw4gRwZa8
         tZBy4mPX1gxvntQXpbBY6rnZ/0qaqtNkJ/sKElpBUNOLjmVxtuXQqwrIdciBzLfxNRsC
         IZ22cBI20xB8Q9cMms4/jPKpDdE6OOAzsbLLfUDN+PFnixDakSQOIcz3R5KQtT3VAN35
         brcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735567870; x=1736172670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xyIxL+k0/r10u7r0j6LNml5wuNs20+/LP1O8usk/34=;
        b=pGlhuEOhbNpHjg6o3dXu4MSIsVNyjeJZCqDeJNuIj0+U1sUsmwTv+Ck5D1srJqzeCb
         FGIAjhNcDke1BM5UwANqsW9lHkOu9HmqrDX8v+m9Vyr27SNqndp5S/8HCCUMjM5etxU6
         JmHjK1fkaeFc/qAtja7HTa+W9enPeJlgD3iF2OiqV6DzSVKrbCKklcaKxCcvYhEi7HQJ
         tx/75N0dDmQ8ufhCkghAnZKVLEpEQZdVg1WCcpDd5Gq557nhbTczPof5nNvOiNa2GubA
         5aRNBKlgpU/DRaBHF7uCuS/1xpTNKVOLIXNYtDSSB/+unrA/5qMSxpdDiRrY2VRFYX5f
         GO5A==
X-Forwarded-Encrypted: i=1; AJvYcCV0Z0At1h2bo3733cPbl5cVfPMzZq4+MuB/EbRAWfcSIXbNixrXzVw9uY7DKndgxFfxNbL+V3zu1ZOBK175@vger.kernel.org
X-Gm-Message-State: AOJu0YyPaGlQbjsS6nJQacvlcw/zqLZItNppOSiJUq8ipy3UlPNw3+gU
	SNmNyZkAI2lI7N56cVfAjvVPJqikiuU3F1zbg3buNlPkZZ83OP5es1+8pcDJAoCE391Ee7IAE4z
	1KJDR/RAkLI5HSOeBarBDHX0qQETuJXejowFL3g==
X-Gm-Gg: ASbGncvBZ0moh9Kt7D7Iv+mlUGsYtS/62fRoplp52LLseXKEM39ZEjS9kpbVQK7MBQX
	H6mzmuCNgf//3wF3wl37RO5XEnCyH75q0RBxIhXYsRHSEZBqLaNiPSboweElqhiGU3qOF/pc=
X-Google-Smtp-Source: AGHT+IHzrNBziegt8zjXLaQXL/tSraGvcZwJ3NeJVtJCcPX1lrPezFgy6uNUX+DLRta49V0Gojj+Ck3r0hCdW86fc6c=
X-Received: by 2002:a05:690c:4b05:b0:6ef:801f:437d with SMTP id
 00721157ae682-6f3f820e12amr285731497b3.26.1735567870524; Mon, 30 Dec 2024
 06:11:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
 <20241224-fix-board-clocks-v3-2-e9b08fbeadd3@linaro.org> <ef139090-8c93-475c-a715-9413ca28e4c7@linaro.org>
In-Reply-To: <ef139090-8c93-475c-a715-9413ca28e4c7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Dec 2024 16:10:59 +0200
Message-ID: <CAA8EJpp1a=qpc-0OVQWeLvbndyTGv6oXPU1FiM9rgV6q_i=XxA@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] arm64: dts: qcom: msm8939: correct sleep clock frequency
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>, =?UTF-8?Q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
	Jeremy McNicoll <jeremymc@redhat.com>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Melody Olvera <quic_molvera@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
	Stephen Boyd <swboyd@chromium.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Martin Botka <martin.botka@somainline.org>, Jonathan Marek <jonathan@marek.ca>, 
	Vinod Koul <vkoul@kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Dec 2024 at 11:49, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/12/2024 10:17, Dmitry Baryshkov wrote:
> > The MSM8939 platform uses PM8916 to provide sleep clock. According to the
> > documentation, that clock has 32.7645 kHz frequency. Correct the sleep
> > clock definition.
> >
> > Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > index 7a6f1eeaa3fc438f7b6c1d3b2dd17fb1b6f81d9a..7cd5660de1b33def5b9dc8a0d02583c3eaffb17f 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > @@ -34,7 +34,7 @@ xo_board: xo-board {
> >               sleep_clk: sleep-clk {
> >                       compatible = "fixed-clock";
> >                       #clock-cells = <0>;
> > -                     clock-frequency = <32768>;
> > +                     clock-frequency = <32764>;
> >               };
> >       };
> >
> >
>
> Here's a quote from "MSM8936/MSM8939 Clock Plan"
> Section 2.1:
>
> "The chip does not have a separate sleep crystal. The sleep clock, whose
> oscillation frequency is 32.768 kHz, used as the source for timetick is
> generated from XO using a divisor of 586."

19200000 / 586 = 32764.5


-- 
With best wishes
Dmitry

