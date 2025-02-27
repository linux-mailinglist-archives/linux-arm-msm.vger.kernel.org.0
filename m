Return-Path: <linux-arm-msm+bounces-49658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B091A478E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE406188FBC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEF3227B95;
	Thu, 27 Feb 2025 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="gUG+3QeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A312248B4;
	Thu, 27 Feb 2025 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647893; cv=none; b=pdqoHwnFxItJv/l7ZJ7vtes8W9FPsHf1bkx0cTN0VnGIQPbHPWy2VdHM9HgIaGkaIgdxYUqpU79kGcv+JE0fPEaiGFGcbt2PKjBd4GABPb+hDCVtkaGTbTkNouKxG4tQPrtAGQw1WzePV5skJRfblkgNJ4nM1IsrEEdy9iHg7KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647893; c=relaxed/simple;
	bh=gBwAtZeTy/Zlgo32PTFVZI7+JHiyhf4hYfS3Uvau58Q=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=iC071x6SQShLvypIt2KmAZe48WDsOtAn7165PBEFpo0F0/0eVZRPWRWwRmY4D3GtHRdroZBH1qoflhXlQ9MORg5oa/FoEpLyoyOAEvcP377RR8anktyh/9/nHj24QNLbJWScQwE1p087rADo9G1A2Y4ZoU+meZLVDlVeoZiTcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=gUG+3QeP; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740647889; bh=gBwAtZeTy/Zlgo32PTFVZI7+JHiyhf4hYfS3Uvau58Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gUG+3QePYqpnyNpH+kbOYxT1W7yFfQRbMTtH1ufV/NuqEH1dEf6uh1LWtKcqMV7PX
	 azBou4jrGvOUgFI6E2jyCSKAxSh/gxzr4rSLKsfSRBJllkLa0axzX13jWG6TsRK9na
	 XON3hCOPZiB3WsmRECmE0lXjrF/40YFDAFuUlt5QAvzOgIIDurEcTNgqMNSu2Fsb/p
	 rJkq9cLUL6oGQg25N3OmzvABqsginf6yya9AUlZFpUtXmbLFE+xZWngOXjFFsNBBlZ
	 67qozODwdgTL1KjOFPaqDPWyGV26JAYpmQmGMAReC9S/0C/a6LKj+DK4LlVrPLPaix
	 IRRV6DLf2I7dw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 85E6F88B8;
	Thu, 27 Feb 2025 14:18:09 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Feb 2025 14:18:09 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Rob Herring <robh@kernel.org>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Fix
 broken overlay root
In-Reply-To: <CAL_JsqJH5g-A0Td8zYn--FuYFZi=HQ96BeNSMLuxQU6+5X3k-w@mail.gmail.com>
References: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
 <20250226-qcom-nonroot-overlays-v1-1-26c6e7605833@trvn.ru>
 <CAL_JsqJH5g-A0Td8zYn--FuYFZi=HQ96BeNSMLuxQU6+5X3k-w@mail.gmail.com>
Message-ID: <a72d3264eaa352652a4ebaf4b1baa664@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rob Herring писал(а) 27.02.2025 00:22:
> On Wed, Feb 26, 2025 at 8:30 AM Nikita Travkin <nikita@trvn.ru> wrote:
>>
>> When converting to the overlay format, it was missed that "/" in the
>> overlay corresponds to the overlay's own root node and not the fragment
>> targeted to update root of the base dts, which should be "&{/}" instead.
>> This results in the cma node never actually being applied by libfdt.
>>
>> Fix the overlay to use correct target node.
>>
>> Fixes: 231c03c6119d ("arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Convert mezzanine riser to dtbo")
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>>  arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
>> index ae256c713a36078afdadc67193f381a19ea8e5d3..254df3d518d8cbfb1082511f38e132435b7fdf59 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
>> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
>> @@ -9,7 +9,7 @@
>>  #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>>  #include <dt-bindings/gpio/gpio.h>
>>
>> -/ {
>> +&{/} {
>>         reserved-memory {
> 
> IMO, this should be applied to the /reserved-memory node rather than

Hm, considering pretty much no qcom dtb will be without reserved-memory,
you're right...

> the root node. Though I also think using overlays to set CMA size is
> questionable. It's much easier to change the kernel command line than
> apply an overlay.

...and deleting the node altogether would be effectively keeping the
existing behavior, which, I just now realized, was introduced in an
extra commit after the conversion (which I assumed was the cause of
the mistake) so my Fixes: for both commits are wrong.

I think I will leave it to Bryan to decide whether this should be
fixed or original commit to be reverted.

> 
>>                 linux,cma {
>>                         compatible = "shared-dma-pool";
>>
>> --
>> 2.48.1
>>

