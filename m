Return-Path: <linux-arm-msm+bounces-46410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA1A20F28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 17:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77CA67A33F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 16:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DA81DE4C5;
	Tue, 28 Jan 2025 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="0KgFhe5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E17C19E967;
	Tue, 28 Jan 2025 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738082907; cv=none; b=MkQLLqyWVfwX5rQQ4CGGtAilFYj6Pg1QBiNZeJ51m/9fDIELc7Xnksrj7xdk06sPGn2U3SQXBsgdT4Mb/xVap/Jc2erIl4ewWD/CXmOdAR4j5xPtz/aYiV8e8GvB29rOunsitKMV4+EtIyOYbcNdDqzmZjQddAsYcQqAqPaqwR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738082907; c=relaxed/simple;
	bh=QUgIaiKIHUoeTNF5idK00mg36DHP/yGOTioSLtL1oqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNpmXtNykbbInrf7k21sl+o264MPS5DJbN3QuOysfkMaeG7CWFW4YO1PiWlqv8uYoo/e9btNYhk470k079GSqo3h3XjvgtjHs8Lo6qi3SF49/b3XJSTGy47gGbmdAfcX3eLrmFMYWEmFLH4EcqgwqMTuLgoERL+l2v2iujjMGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=0KgFhe5h; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738082903; bh=QUgIaiKIHUoeTNF5idK00mg36DHP/yGOTioSLtL1oqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0KgFhe5haH86Znix7V682YfUl/b3Y+Lk4EekPJ5K14b3ylA80tXvrKhIA8BqiuVpZ
	 3W5md8T1hIRVfowalOb79byJp02aw4HKirAgtrv8hOJd9dmWzITCKowkAQykzkyoDQ
	 XIS+o9TMrMlVt5zUm5Cd34H74A1S9lafq35QrejU=
From: Luca Weiss <luca@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matti =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
Date: Tue, 28 Jan 2025 17:48:22 +0100
Message-ID: <4981867.31r3eYUQgx@lucaweiss.eu>
In-Reply-To: <9badd95d-65d5-4a49-8317-1d09a8844b21@oss.qualcomm.com>
References:
 <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-12-67e968787eef@lucaweiss.eu>
 <9badd95d-65d5-4a49-8317-1d09a8844b21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On dinsdag 28 januari 2025 12:14:09 Midden-Europese standaardtijd Konrad 
Dybcio wrote:
> On 27.01.2025 11:45 PM, Luca Weiss wrote:
> > Enable the modem found on the MSM8926 HTC One Mini 2.
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/
boot/dts/qcom/qcom-msm8926-htc-memul.dts
> > index 
d6eaa82cee4daf6a1386902f537f1351811d4a06..cb571aa13c11598182dc020f064fe8268bcc061f 
100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> > @@ -195,6 +195,16 @@ &blsp1_i2c6 {
> >  	/* TPS61310 Flash/Torch @ 33 */
> >  };
> >  
> > +&modem {
> > +	mx-supply = <&pm8226_l3>;
> > +	pll-supply = <&pm8226_l8>;
> > +	mss-supply = <&pm8226_s5>;
> > +
> > +	firmware-name = "qcom/msm8926/memul/mba.b00", "qcom/msm8926/memul/
modem.mdt";
> 
> mbn?

The mba gets loaded with .b00 for some reason, not even the .mdt.

And at least on this device the .mbn doesn't work at all either, but this 
might be due to very weird firmware loading on this board - because also for 
loading wcnss firmware I needed to add a quite weird hack to make it load.

Modem fortunately loads fine like this.

Regards
Luca

> 
> Konrad
> 





