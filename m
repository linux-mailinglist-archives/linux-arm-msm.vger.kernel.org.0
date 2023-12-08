Return-Path: <linux-arm-msm+bounces-3960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65180A5B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 904CBB20D0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1011C1B291;
	Fri,  8 Dec 2023 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t1ZgvjeF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TAqNS9gY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90AD1996;
	Fri,  8 Dec 2023 06:37:28 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702046247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTnEfkDV0ksdFlV4Uy6ZwJKJWVB47H0+VrHAzxTWeNI=;
	b=t1ZgvjeFbVz8d5yWkvuAn4KGcNmzXXXDp3ImQ2rPznUWM0tLTY97zxVTGx7tcHvQo5B8Tk
	m5pCuhxDRCN5t0ilmAItG0moTvLNa3f/E00sjK0R1EiddkwGd794dvtEBDNuFa7EmPlo6N
	PDkKdBgLh4+xDBvz0izz4GyrkOcqOpyep8JDQyTCC+PfDhE6xrshpXPOgAGDBKwqVSaHW3
	ZRxz+b2yzsWXCYqVcJaFp+PlUAUkWkkMcEgWZ5YOy4iNNJG4TY2TkvpqQO3K/A1FBg/3pi
	bqWonSQzpLRd5l+sZGLyb6Roz+cyij2HdVvvhXDRSyOIGkyOGofk+mkNxd3U3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702046247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTnEfkDV0ksdFlV4Uy6ZwJKJWVB47H0+VrHAzxTWeNI=;
	b=TAqNS9gY2mYV8Xm381n6vh/SXLE+MsVcYcieubV8l2ogD49Fixu20Kq6QLJArHHNxiIqsq
	nSbeawYIBDQUVzAg==
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawn.guo@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v7 2/2] irqchip: irq-qcom-mpm: Support passing a slice
 of SRAM as reg space
In-Reply-To: <20230328-topic-msgram_mpm-v7-2-6ee2bfeaac2c@linaro.org>
References: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
 <20230328-topic-msgram_mpm-v7-2-6ee2bfeaac2c@linaro.org>
Date: Fri, 08 Dec 2023 15:37:26 +0100
Message-ID: <87fs0csqu1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 27 2023 at 16:52, Konrad Dybcio wrote:

The prefix in the subject is wrong. Also please write out register. This
is not Xitter.

> The MPM hardware is accessible to us from the ARM CPUs through a shared

to us? Can you access that hardware? I doubt it.

Please use neutral tone as documented in Documentation/process/

> memory region (RPM MSG RAM) that's also concurrently accessed by other
> kinds of cores on the system (like modem, ADSP etc.). Modeling this
> relation in a (somewhat) sane manner in the device tree basically
> requires us to either present the MPM as a child of said memory region
> (which makes little sense, as a mapped memory carveout is not a bus),
> define nodes which bleed their register spaces into one another, or
> passing their slice of the MSG RAM through some kind of a property.
>
> Go with the third option and add a way to map a region passed through
> the "qcom,rpm-msg-ram" property as our register space.
>
> The current way of using 'reg' is preserved for ABI reasons.

It's not an ABI reason. It's backwards compatibility with old device
trees, right?

I'll fix it up for you this time. No need to resend.

Thanks,

        tglx

