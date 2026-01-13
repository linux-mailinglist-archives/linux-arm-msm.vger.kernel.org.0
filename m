Return-Path: <linux-arm-msm+bounces-88639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A5D16149
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080F03010FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 00:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A576222B8BD;
	Tue, 13 Jan 2026 00:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CQJ0qtZS";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="njUdrJF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122DA21B905;
	Tue, 13 Jan 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768265444; cv=none; b=WoLd1gINXQgXvx3fj8VbzV+tIpHe7LgxuaVTZcuRaChIx0COmZ3MWcoVgHsoq1t7BxA7FdXDYfqlFETDmPx/QtNcF3PDlAk2e1lNhZrfadNvJxvRs6+PdvFuGMHXs7u0S3ZYPKZGa1H9DOeVksFkXKMdg5Z+a7Mfxfdm2V8PJj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768265444; c=relaxed/simple;
	bh=EdYs0sMQmFJs3Vu7/bLSim/D93KZdvT2XKm59eHNqSg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Mt0xwLWtlSMGGa8S6sGcMxQLinCQXFUsIT/9W9+6YYTOhoAgVwtUug8oclmyDmMhDMsrGgckZA7/t4Pkyo8hbNK3BS9iltBDVtZQNp7JL9CXfUhSQwhGZXu8HJ1Q4xlHlB3LsUtNrYWi5RybdzFrVK9xUonNbgtOrRMIpRrqIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CQJ0qtZS; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=njUdrJF4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768265399; bh=NgWHBdKp6/mSdDhwZHUwI1Y
	EwxNEEv+9t87MX8Bt0pk=; b=CQJ0qtZSgeycSX7Yvdv1WMIaT4E5kr5mqMTbiOAAkykLfNQxrg
	zqa3DHj6rye07IpmURkZjLm6j8azGO2ry9Z2Mros7/JlUmthGGKMPwo8e2iwk7UHBjG5V1RnvdU
	jt7Kdz399/yWyQqbACszMroRFR3JnSSco+JSkgWO2RI5XfxEs8Sa3H0ZqEY3Dnk2bVTKsFHhzOf
	knW5ZlKMTN7PrxUd6Njnv8ilLZ7PYQKb0JAeV7NG69jL8+KQvD++5GypJepxZ9QCOWUMPaSHPmS
	WWIirl8aBpkZc03sqPRIOFXGTcOVUPQZepj+FAl7rvtC9MIlKLwxOclbNJLuHI01PIw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768265399; bh=NgWHBdKp6/mSdDhwZHUwI1Y
	EwxNEEv+9t87MX8Bt0pk=; b=njUdrJF4zLzyI34pSYFjmL59jdBMPztNWYmG8o+Gm6u2Ih0Z3I
	FSuN7o6cgPpj81dqFsb3IY7fbU5yeO5nIfCQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 01:49:58 +0100
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales
 <semfault@disroot.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
In-Reply-To: <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
 <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
 <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
Message-ID: <abd31188336b3322b9322f1e6791320e@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 01:22, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 12:41:43AM +0100, 
> barnabas.czeman@mainlining.org wrote:
>> On 2026-01-12 23:15, Dmitry Baryshkov wrote:
>> > On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
>> > > Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>> > > the only difference is willow have NFC.
>> > > Make a common base from ginkgo devicetree for both device.
>> > >
>> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> > > ---
>> > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>> > >  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302
>> > > +++++++++++++++++++++
>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296
>> > > +-------------------
>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
>> > >  4 files changed, 318 insertions(+), 294 deletions(-)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> > > index 163ecdc7fd6c..70be19357d11 100644
>> > > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>> > > @@ -1,304 +1,12 @@
>> > >  // SPDX-License-Identifier: BSD-3-Clause
>> > >  /*
>> > > - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>> > > + * Copyright (c) 2026, Barnabas Czeman
>> >
>> > Hmm?
>> Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this is 
>> a new
>> file just the file name is same.
> 
> Following Konrad's advice:
> 
> Would the following addition to .gitconfig help?
No, only until i am not creating the sm6125-xiaomi-ginkgo.dts and adding 
it to the stage.
> 
> [diff]
>          renameLimit = 999999
> 	algorithm = patience
> 
>> >
>> > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
>> > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
>> > > new file mode 100644
>> > > index 000000000000..9e3aeb5a9e74
>> > > --- /dev/null
>> > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
>> > > @@ -0,0 +1,13 @@
>> > > +// SPDX-License-Identifier: BSD-3-Clause
>> > > +/*
>> > > + * Copyright (c) 2026, Barnabas Czeman
>> > > + */
>> > > +/dts-v1/;
>> > > +
>> > > +#include "sm6125-xiaomi-ginkgo-common.dtsi"
>> > > +
>> > > +/ {
>> > > +	model = "Xiaomi Redmi Note 8T";
>> > > +	compatible = "xiaomi,willow", "qcom,sm6125";
>> > > +
>> > > +};
>> >
>> > Please consider adding the comment regarding NFC.
>> >
>> > >
>> > > --
>> > > 2.52.0
>> > >

