Return-Path: <linux-arm-msm+bounces-89378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84705D2FE42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7F873009687
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746C9362135;
	Fri, 16 Jan 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b18pLFLr";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dqVXfdpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7FC36166C;
	Fri, 16 Jan 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560719; cv=none; b=X0cvFBKf8pjN2u+VNP65Yxv7L3iIQjWfPtDTRRCiy0jZa+jdlBgP37ZKHeXl+m9dZn8zSQh+4f2h00k4K/71KfKk/1j/BebMYi4oexpODtIbuAX2ThY833cFZ8FsKVLybNkd7lRyP8UnitgxbCnQlKi3Sq7zVYsZCLELEco5bc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560719; c=relaxed/simple;
	bh=QcNmSpgWm0A0jatZX6qSc7PNL/7ZQmhq3iZkKZ6x2zA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=vEYCLQn2dUQzY8lM8TpjIeuiyPCI6Lp5O2K43Sm8YRbFstMyOA48C4ImsABFw9J6mFlSYHSIvkXOY0lHNcC5Y96XBStvHlYq5LPlxZkXgbcnhx00yzcaaJw3Hw2hacK8dHOan3pHCjdLEfQcbLskkG31zseAx+eyD0iUiUwj+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b18pLFLr; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dqVXfdpI; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768560670; bh=mGSLi9v2LWTFAloYgVa+hAw
	dWT1VMwyLLzVt6ZF2PiY=; b=b18pLFLrCs0lOXVCDaQ5KbbjFH3xd8SmqKqICAGDgGdrWl9TSp
	lCmMu1cOlW1W7c/epouw/jqRtemn1knCSEubrw5BXFZfLllRQE+nugW4v5y1ebNXacy//YyBvOk
	WxpguG/o40kFmnQRA+F8QBTwki8W7U9MAMiNZKm4h09ggsIUrZWXi6QxaD+lvX2NU26ITWqFwZY
	okWlpNPoJWM6t/FoP8ErsH0OvbztZrnxdgYRIOgKYfek+V8EDf930HWymKj04mc3CdC6tmzHyFC
	63OMTMOrOzeZO6nrI3y8rFNUOT/0/Ni/B0RT82orMHF9olEDlUoGsshNiaaZt3RlRSw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768560670; bh=mGSLi9v2LWTFAloYgVa+hAw
	dWT1VMwyLLzVt6ZF2PiY=; b=dqVXfdpIrANnAid759o6ZWyPyC+QXw2doN5PO56mn5XoNj/OMh
	9EDllJhD98ZROF8vkMX5xL+gwY9VGAk413AQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 16 Jan 2026 11:51:10 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
In-Reply-To: <253d0cbf-f65a-4f60-b874-4191e552c191@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
 <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
 <253d0cbf-f65a-4f60-b874-4191e552c191@oss.qualcomm.com>
Message-ID: <f2188ad4346e31a679fb6a082c9d32fb@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-16 10:53, Konrad Dybcio wrote:
> On 1/16/26 7:53 AM, barnabas.czeman@mainlining.org wrote:
>> On 2026-01-13 10:04, Konrad Dybcio wrote:
>>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>>> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>>> the only difference is willow have NFC.
>>>> Make a common base from ginkgo devicetree for both device.
>>>> 
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>> 
>>> [...]
>>> 
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts 
>>>> b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> index 163ecdc7fd6c..70be19357d11 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>> @@ -1,304 +1,12 @@
>>>>  // SPDX-License-Identifier: BSD-3-Clause
>>>>  /*
>>>> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>>> + * Copyright (c) 2026, Barnabas Czeman
>>> 
>>> Is there a reason for you to remove Gabriel's copyright from the 5 
>>> LoC
>>> that remain in this file?
>> The original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi.
>> I have not removed it, it is a new file with the old file name but
>> i can add Gabriel's copyright here also, would that be fine?
> 
> Well you certainly don't seem to have contributed anything additionally
> in this specific patch, other than splitting a source file into two
> source files, so the rule of the land is to generally keep the 
> copyrights
> as-is
I have kept the Copyright in the original file. The question is should I 
add it here also?
> 
> Konrad

