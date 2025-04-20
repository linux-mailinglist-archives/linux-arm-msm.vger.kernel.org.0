Return-Path: <linux-arm-msm+bounces-54827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018DA9486B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 19:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F721888E52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 17:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16C420C03F;
	Sun, 20 Apr 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="mQtqfyAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22617A302;
	Sun, 20 Apr 2025 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745169261; cv=none; b=C4j7enAdTuQiYDZuRRByXpGZJlnv41IZmg8nwUPhQpGfwSFnUROWK732trKQWbkgq7U8MxHgcSOYPZf40v1/EOG6ThKiaifJbGFavNfqaddBlzRjQ3v0Q/FoOrGXRCqAWcv0S9Smb8VBP09/6IDaRpGFXr7fxR7J6y2d1ZIxun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745169261; c=relaxed/simple;
	bh=DR9RTXhjwQk+raJBaZzX7DBA8S0Sta84T2246rAqUCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqGkqUP2+MOIywh4KFRIOuS+U9KDkj4QLMVx/o6hA9F38Aa3/rYK6q/+QE3TwxbmSQD8o5U5RRkMVyaXPGVU7GLLPhq+wJmZCYMJnK0yQMvy85GYxNqTfO4dNTQ3QYVs6O75An4VLrxUBMZrjVMv2ULiCF6DK5tsUrLFjd2B0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=mQtqfyAM; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745169253; bh=DR9RTXhjwQk+raJBaZzX7DBA8S0Sta84T2246rAqUCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mQtqfyAMZ1vquFtvYte5peCKA43juMwEZ5JjD4lg8Jpk8fepWjOsLcDIqTVqkI/3d
	 KdU92Pml8tC4HcfRjJKK5hjI9CYt/AGDPQCM7dipZnqV68grAjGVkxD5zm2LkRFAqH
	 cv2CWYvih9Nb1BGiMgExi3IVXpWGSLb1x83dYJ5U=
Message-ID: <ea7ac010-3b9d-4915-9a19-cb5ebb77c764@lucaweiss.eu>
Date: Sun, 20 Apr 2025 19:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for
 mmc0
To: Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
 <20250419-msm8974-mmc-alias-v1-1-82aa131224b6@lucaweiss.eu>
 <k7dm2tpw3mg34fydyug3rjnkwgfu2lwwzddd4edmano6jsgoiv@6klzba5rjpdy>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <k7dm2tpw3mg34fydyug3rjnkwgfu2lwwzddd4edmano6jsgoiv@6klzba5rjpdy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 20-04-2025 7:05 p.m., Bjorn Andersson wrote:
> On Sat, Apr 19, 2025 at 11:03:57AM +0200, Luca Weiss wrote:
>> Add an alias for the internal storage so it always becomes mmcblk0.
>>
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> calls for a problem description to start your commit message. Sometimes
> the problem is obvious, but here &sdhc_2 is disable on this board, so
> when does this not become mmcblk0? What is the problem you're solving?

I have really seen internal storage become mmcblk1 on one of these 
devices with no SD card. I can't recall which one anymore, but this was 
the main idea why I wrote these patches. Maybe it's something to do with 
the mmc wifi on some of the boards?

But I think it's not a bad idea to make this explicit for all, and align 
the boards with each other.

Regards
Luca

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
>> index 4c8edadea0ac63db668dbd666fbb8d92e23232b7..88ff6535477bffefe475cc5fe927b3cc5d223084 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
>> @@ -13,6 +13,7 @@ / {
>>   	qcom,board-id = <8 0>;
>>   
>>   	aliases {
>> +		mmc0 = &sdhc_1;
>>   		serial0 = &blsp1_uart2;
>>   	};
>>   
>>
>> -- 
>> 2.49.0
>>


