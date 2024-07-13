Return-Path: <linux-arm-msm+bounces-26090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5E930661
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 18:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D6231C20FE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 16:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D27913C3D3;
	Sat, 13 Jul 2024 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="v5WNIkJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B971BC40;
	Sat, 13 Jul 2024 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720887981; cv=none; b=h/B3ylqNaf1dSd0AX3P4MYUJGt7Voxb9v7lqhCqJlxsYhHgN1C4CtEc/nkhdjzUaRLOS5rJ52y8UgMEa8VK1LUQ13XgMhRhDrrLMn2F+X7fLxZzW6vKKyY1jqJXh2IoRgaorcPrAx+j/ZL5v8RWTigJ/4fbMXkqPgJ2moKs1haw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720887981; c=relaxed/simple;
	bh=vfQ/dflkZZGpY/W5ewWzVGCHHv8nCt9jdFUaKwjSyac=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=e7xVpMDPWxYz7w1C6hJjYH+hUwgF3SVCz+rZaHjoZfDhTXkG1hN1+NIrZxSoavdohgW+2b3S4BegFUlLyJgrIMNkzSwhCdq1V0fI0hmNVKPA8bBueFNJcAvJIGA+LftvmXb8VCicem/LK4OCkuo+tYZQifZSE3YwRJGKvViDZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=v5WNIkJ3; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id CAA08424C3;
	Sat, 13 Jul 2024 21:26:09 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720887970; bh=vfQ/dflkZZGpY/W5ewWzVGCHHv8nCt9jdFUaKwjSyac=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=v5WNIkJ3vldFx7oB6SQDMmbZW5y/q7hsaah6i8PeH6MBg51tOcmqlAkW6Z2Elg44G
	 iWsOtVCin4LqBF8kU0gBmikkW2inWNzIQFceTbwRNiFvyqv66LG1MCMRlUJxL/yzSZ
	 VLjk2Ia/PohlzLfsqsWpJd+KQCRPG5K0QFl3P0AeaSCrRpSd4H3tX7VjQRnKDf8f3W
	 /P9zPqiYQ2yQt7lTjJ258OKSIvBLRnGRBmtMVn/YwtMrE84gWxycQYjbImYuBfI8OW
	 dNNZ/ypiuMEz4M055Gp3s1VTDoPuT2bb/2mNur7UezFHc11sFvZCS1Joe9LmAN/OHV
	 Kn/xXAErbWJqQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 13 Jul 2024 21:26:06 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, =?UTF-8?Q?Adam_S=C5=82abo=C5=84?=
 <asaillen@protonmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
In-Reply-To: <znzgr6hqbokis7zrouh2zbzvigdl4gnm5ewqoiph5eqdk4qcg6@zlw2b2bzbmgs>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
 <f377a55c-4a74-4555-926d-afb7dd813e00@kernel.org>
 <28e2dc758c8867693a183d758a9dad6a@trvn.ru>
 <932efd4bd08a2877ee1e7c7409ff1512@trvn.ru>
 <znzgr6hqbokis7zrouh2zbzvigdl4gnm5ewqoiph5eqdk4qcg6@zlw2b2bzbmgs>
Message-ID: <f56e6b1fa9a9d2afe55ada8b2b90275b@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dmitry Baryshkov писал(а) 13.07.2024 21:12:
> On Sat, Jul 13, 2024 at 04:07:13PM GMT, Nikita Travkin wrote:
>> Nikita Travkin писал(а) 13.07.2024 15:37:
>> > Krzysztof Kozlowski писал(а) 13.07.2024 15:02:
>> >> On 12/07/2024 18:04, Nikita Travkin wrote:
>> >>> From: Adam Słaboń <asaillen@protonmail.com>
>> >>>
>> >>> This commit introduces multiple hardware variants of Lenovo Vibe K5.
>> >>>
>> >>> - A6020a40 (msm8929-wingtech-wt82918hd)
>> >>> - A6020a46/A6020l36 (msm8939-wingtech-wt82918)
>> >>> - A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)
>> >>>
>> >>> These devices are added with support for many features, notably:
>> >>>
>> >>> - Basic features like USB, mmc/sd storage, wifi, buttons, leds;
>> >>> - Accelerometer;
>> >>> - Touchscreen;
>> >>> - Sound and modem.
>> >>>
> 
>> >>> diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
>> >>> new file mode 100644
>> >>> index 000000000000..c3d1d1ace2f6
>> >>> --- /dev/null
>> >>> +++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
>> >>> @@ -0,0 +1,5 @@
>> >>> +// SPDX-License-Identifier: GPL-2.0-only
>> >>> +
>> >>> +&opp_table {
>> >>> +	/delete-node/ opp-550000000;
>> >>> +};
>> >>
>> >> That's a very odd SoC DTSI.
>> >>
>> >> SoCs DTSIs are not meant to be included as complementary, but rather as
>> >> full DTSI.
>> >>
>> >> IOW, this is very confusing code and will confuse everyone reading it.
>> >>
>> >
>> > I think Adam wanted to keep the common device dtsi based on msm8939.dtsi to
>> > simplify things a bit. I was also a bit unsure if I should change how it's
>> > done but decided to keep it as it was. I will rework the v2 so:
>> >
>> > - msm8929.dtsi includes msm8939.dtsi
>> > - devices .dts include needed soc.dtsi, then include the common.dtsi
>> > - common.dtsi doesn't include any soc.dtsi
>> >
>>
>> (...) except gah this makes things quite a bit more complicated since the
>> device makes use of the "generic design" msm8939-pm8916.dtsi and duplicating
>> that would be quite silly IMO...
>>
>> I wonder if we can clarify things without making everything too complicated
>> by calling that dtsi "msm8929-opp.dtsi" and keeping it as extension for now,
>> then if we find that msm8929 has more differences - we can unfold and refactor
>> everything.
>>
>> What do you think?
> 
> What about adding msm8929-pm8916.dtsi, which includes just the right
> things? This might result in duplication with the existing files, but in
> the end msm8939-pm8916 and msm8919-pm8916 are also very similar.

Right, I guess the reason my thought was to avoid it is that msm8929 is
(seemingly) just a bin of msm8939, compared to i.e. msm8916 which is a
different soc.

But I suppose it's fine to create a new dtsi for it too, will create it
and change the includes as suggested (soc+pmic dtsi is included by
device, then common dtsi that itself doesn't include soc dtsi)

Thanks!
Nikita

