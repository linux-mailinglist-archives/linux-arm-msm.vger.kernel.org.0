Return-Path: <linux-arm-msm+bounces-88728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC33D17A1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 630AC3004206
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4401238E104;
	Tue, 13 Jan 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gnFrvxw+";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="P44nCMQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4636F38BDD3;
	Tue, 13 Jan 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296117; cv=none; b=IOGMpzcPtY7bLMmsCsDqgvhrJ+3HTUb6i4FhigIycuj52cj4Fgf5hd4Jt+n7YY5tygNpvq3UpLCuRUy0UVpEmcGgnHOpGngckTOtY2b7EsYhN3++E/ymfsUiUjiL/rk11FUvwELyreCzEyNCdEkeuEMCif7Ts6oh8Iq34ZMKwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296117; c=relaxed/simple;
	bh=IFXALJsU7ZyYzmN/mrFPXbe5yw1/FuVG79CxuSYV5E4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QegQaTb14lZS4Xbef6rOTwhQN8WjyyU7Lfm5OWftUXY4Xfs9//sdAZBgnhzKN6L4V80kmauclN9fl1QIjN3Py+9QOU8s2mCOZDWGMOzkJ8Ftmy+40l7N2z6h++IpsA9uJ90kbJcDrzu+hrDqh4wJFEVM7FzNU3hdJFhgcj8Ljbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gnFrvxw+; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=P44nCMQE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768296039; bh=aMn3foNplUZsnve9CEK0vWj
	g77nlka7W8Uj6OWcDZXM=; b=gnFrvxw+WncX2CfywdNi6vM/++dOcdqaQIxjV5pusBGpY82C+6
	V6N/xzgkzOZEOqdPMiA+tlx/Flzq3OutXrq56M9LZEFPastTlDCiA0H/1sCnXmvRWQgfTlv9ydj
	oWVRtmyoT59UPpKkKvCMJTzIFg6nkKs9DgVryI4Tf56A4IHjNYFGOic8cwwl/q6ef+WOlNMyWzy
	LRYccuTCtO+AgBW271yxqVf/qyecB4Yr4psX26jECNuSvZ6BaEPOpLljUZyEysrObRw5dVjoNbS
	a/G74bHtCCuVaKOseZ0EFpvmSHfH+UJ+G4M5885mjKof6UnXRJzHYsVkSTF5t4LOdYQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768296039; bh=aMn3foNplUZsnve9CEK0vWj
	g77nlka7W8Uj6OWcDZXM=; b=P44nCMQEoNTFut0CBhg9Ut5P3mIim5VGVB/mjAKrZq9drGNyoJ
	Li6u5iwK1WDbW2ERN7JtCwz/xGu/2CvkMZAQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 10:20:39 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Biswapriyo Nath <nathbappai@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
In-Reply-To: <dc0d8efc-2cc4-4d37-832b-f4cb3c170722@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
 <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
 <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
 <abd31188336b3322b9322f1e6791320e@mainlining.org>
 <dc0d8efc-2cc4-4d37-832b-f4cb3c170722@oss.qualcomm.com>
Message-ID: <f5940436ed08c4dbe5edb230b3dc71bb@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 09:52, Konrad Dybcio wrote:
> On 1/13/26 1:49 AM, barnabas.czeman@mainlining.org wrote:
>> On 2026-01-13 01:22, Dmitry Baryshkov wrote:
>>> On Tue, Jan 13, 2026 at 12:41:43AM +0100, 
>>> barnabas.czeman@mainlining.org wrote:
>>>> On 2026-01-12 23:15, Dmitry Baryshkov wrote:
>>>> > On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
>>>> > > Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>>> > > the only difference is willow have NFC.
>>>> > > Make a common base from ginkgo devicetree for both device.
>>>> > >
>>>> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> > > ---
>>>> > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>>> > >  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302
>>>> > > +++++++++++++++++++++
>>>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296
>>>> > > +-------------------
>>>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
>>>> > >  4 files changed, 318 insertions(+), 294 deletions(-)
>>>> > >
>>>> > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> > > index 163ecdc7fd6c..70be19357d11 100644
>>>> > > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> > > @@ -1,304 +1,12 @@
>>>> > >  // SPDX-License-Identifier: BSD-3-Clause
>>>> > >  /*
>>>> > > - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>>> > > + * Copyright (c) 2026, Barnabas Czeman
>>>> >
>>>> > Hmm?
>>>> Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this 
>>>> is a new
>>>> file just the file name is same.
>>> 
>>> Following Konrad's advice:
>>> 
>>> Would the following addition to .gitconfig help?
>> No, only until i am not creating the sm6125-xiaomi-ginkgo.dts and 
>> adding it to the stage.
> 
> JFYI it works on my machine (tm), the part with just additions is 
> turned
> into:
> 
> copy arch/arm64/boot/dts/qcom/{sm6125-xiaomi-ginkgo.dts =>
> 	sm6125-xiaomi-ginkgo-common.dtsi} (98%)
> 
> I'm on git 2.52.0 if that helps
I am on the same version, rename works until i have not added the 
sm6125-xiaomi-ginkgo.dts to the stage.
If i make 2 commit 1 with renaming 1 with the additions it look likes 
much better, after squashing them
i have got the same result what i have got originally.
> 
> Konrad

