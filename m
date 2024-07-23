Return-Path: <linux-arm-msm+bounces-26921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060493A3BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 17:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFDB8284BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC60156F4D;
	Tue, 23 Jul 2024 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="Didv7mRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB683D55D;
	Tue, 23 Jul 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721748373; cv=none; b=u8zZeziYi9+BGuRVQgDa0GK06apDK+ONaTIRSTlyPeZ3JcAATyhcRLb7fZZi1Gbi/W4NiqZFgRM+vVWaVBK/ok8hgzTyk94V+KnkLc++vV87Y0RDc/A4vUTN6KHnApMDh4JJyJmoJcyvBg6R7RaMue0L6ZDFPNVtl6JpBmVgu4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721748373; c=relaxed/simple;
	bh=K8gU5w3T1PWXvWaMeSk5CCQtBdR9YrlwWnQneLiIZg8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pv1CEgExk615lqvpbInbIC5xbBqP1PxndwUNaO1S5aVrIryv29gqgZBNouE/gHQedFup+a1wQjaGcLho9E+W1gt1YKBvRRzENr0AdHSoAy0ylSPaQzYG8iMR4xGQGdUcht4eGZw2VvQmUyngW8SyYh7Udjs7b+pAQp0h7XtXLAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=Didv7mRh; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 07BA3403CC;
	Tue, 23 Jul 2024 20:25:52 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721748353; bh=K8gU5w3T1PWXvWaMeSk5CCQtBdR9YrlwWnQneLiIZg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Didv7mRh+P7gY7vwxcBRAwk7wzgC6LUS8/tHtyJ5Km8grz2X3SEbfBqgxT6pPidPY
	 m/A48gRZUq+e9sQHZN3qSKl0P/ZCFJyGvrXmrq/GS2TGP0Ra8mY0f5hePQfJ5Ft3kx
	 CFyZz97UcnOpVjAgVMV1n68iHhsc3q3iCFzDeaiF/aewQj1b0X3pyXJR8KreXTj+Pk
	 2zSSe1eqCpNKF23voFXqfRQB0re+8DnbhnbCs8bBX9pxRz5InOOFqvzbSkTftLM2VV
	 ayE7KiWUwB+ZzBZNYT3AdQPTXxhEU3Ua0vf6s8hq8djCMGUuDAUxfg89kK0nHSYJd3
	 RtpeiUmAGkfRw==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jul 2024 20:25:50 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Anton
 Bambura <jenneron@postmarketos.org>, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8916-wingtech-wt865x8: Add
 Lenovo A6000/A6010
In-Reply-To: <0d982452-f41c-400e-b350-3c022927036c@linaro.org>
References: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
 <20240722-msm89xx-wingtech-init-v2-2-0c981bbc5238@trvn.ru>
 <0d982452-f41c-400e-b350-3c022927036c@linaro.org>
Message-ID: <bb270fce3c78314ffc5ac8590cc3685c@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Konrad Dybcio писал(а) 23.07.2024 16:24:
> On 22.07.2024 2:47 PM, Nikita Travkin wrote:
>> From: Anton Bambura <jenneron@postmarketos.org>
>>
>> Add initial device-tree for Lenovo A6000 (wt86518) and Lenovo A6010
>> (wt86528), which are MSM8916-based devices. These devices are quite
>> similar, so some configuration is shared in msm8916-wingtech-wt865x8.dtsi.
> 
> [...]
> 
> 
>> +/ {
>> +	model = "Lenovo A6000 (Wingtech WT86518)";
>> +	compatible = "wingtech,wt86518", "qcom,msm8916";
>> +	chassis-type = "handset";
>> +
>> +	speaker_amp: audio-amplifier {
>> +		compatible = "awinic,aw8738";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&spk_ext_pa_default>;
> 
> flip

Oops, missed this one, will fix.

> 
> [...]
> 
>> +&sound {
>> +	model = "wt88047";
>> +	widgets =
>> +		"Speaker", "Speaker",
>> +		"Headphone", "Headphones";
> 
> Please don't start a new line for this (same below)
> 

Ack, will re-align.

>> +	pin-switches = "Speaker", "Headphones";
>> +	audio-routing =
>> +		"Speaker", "Speaker Amp OUT",
>> +		"Speaker Amp IN", "HPH_R",
> 
> [...]
> 
>> +	/* left AW8736 */
>> +	speaker_amp_left: audio-amplifier-left {
>> +		compatible = "awinic,aw8738";
> 
> Should this get a new compatible (with a fallback if sw-compatible)?
> 

Per my understanding those two are supposed to be effectively same
chip, not sure if there is any point in adding a new compatible/fallback
in this case... 

Thanks for looking at this!
Nikita

>> +
>> +		pinctrl-0 = <&spk_ext_pa_left_default>;
>> +		pinctrl-names = "default";
>> +
>> +		mode-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
>> +		sound-name-prefix = "Speaker Amp L";
>> +		awinic,mode = <3>;
>> +	};
>> +
>> +	/* right AW8736 */
>> +	speaker_amp_right: audio-amplifier-right {
>> +		compatible = "awinic,aw8738";
> 
> ditto
> 
> Konrad

