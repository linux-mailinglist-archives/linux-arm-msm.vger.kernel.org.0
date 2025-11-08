Return-Path: <linux-arm-msm+bounces-80851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9092C4357F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 23:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696E33B1187
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 22:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9EE23507E;
	Sat,  8 Nov 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BkxKNUxt";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I8OD9smD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024081A7264;
	Sat,  8 Nov 2025 22:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762641338; cv=none; b=G49huUJbMPtFNenSx71H7/8C4LddSeuPNurfOuebexbZEbJ78eQ74R5/o4fZYYCQ7JiKBAQ5cqRlBwH/DNH4JjqLMKK4XSgT9rbTrmxk2P+Vtx+r2hUyx8xNPWwN31uC+k7oMG/smSZbVrWOT/yEwm3rffUc8dvrFOtstVKBfMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762641338; c=relaxed/simple;
	bh=XjYZXbjmoIPFzRCv17b3xmLQlqS4OPn0bRiULkYT2NE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ax+keo8cVXF/bpMTQahi/Jw63lzxwQ2WVLjdqvITI5yQKblUIvRz4N9pap/UO4xCGm39KYM5qEpkjYj/7gpibOw+C4LaGdV33Zb7Ya/ISJZheecpbNbXOCyY4+GEsaDCS39HZ3La6Ht5AQeUTWzhYgSr+9JuIcWKamMyvd9ol8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BkxKNUxt; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I8OD9smD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1762641315; bh=mYjpgg3sYXxkZGeolPHjyHJ
	bQbL2ivOLy0KELWWvKdY=; b=BkxKNUxt6oq4Os7IhtMbAzfV6izImpkIXM8G9b2/9WvJfHn9PT
	CHzjl+RhKpsIsvq2OEBgpUE6ZidcCwb+zNDCX66x5pvlzh3q78xa/48dLdvJmbnvWWlVEmC4roR
	WUyxlVUXB3GNqZJ+pPZYhrwuV5nXejlAFqyad8E9lpJaoK9Ml1JA7VGx4Dsk/E98WpY6hMpDouM
	sDKebpd5KqIiuAxBqHPhbEHQR8jTa3K2fiTH5grn7HqLwWH9FWyAPpeknZsEscIU4Owj8xg/R2E
	e/2Ep9vi9g9yPhU5HDgSoZWDcGU3xnGzrP2Fzsyat2uXGH8M2w/7c+cV9LAncJsdpnw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1762641315; bh=mYjpgg3sYXxkZGeolPHjyHJ
	bQbL2ivOLy0KELWWvKdY=; b=I8OD9smDqI2SiGtkRGZpXUqoDRzvCVmhTaG5RG934qllvMxKMz
	68hiipDjrraUO6TellMKUYQT/jhHg52BCrDw==;
Message-ID: <ee1b9c87-24b6-4391-b01e-3be73cd42862@mainlining.org>
Date: Sun, 9 Nov 2025 01:35:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add FastRPC nodes to
 ADSP
From: Nickolay Goppen <setotau@mainlining.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-3-895ffe50ab5f@mainlining.org>
 <229c1807-e534-4f9c-b459-350be0a12888@oss.qualcomm.com>
 <1fac29fc-5de8-4e24-8a25-067d47fe0ff7@mainlining.org>
Content-Language: ru-RU, en-US
In-Reply-To: <1fac29fc-5de8-4e24-8a25-067d47fe0ff7@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


09.11.2025 01:22, Nickolay Goppen пишет:
>
> 24.10.2025 11:26, Konrad Dybcio пишет:
>> On 10/23/25 9:52 PM, Nickolay Goppen wrote:
>>> Add FastRPC subnode with compute-cb subnodes to ADSP node.
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 33 
>>> +++++++++++++++++++++++++++++++++
>>>   1 file changed, 33 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index f4906ee3f0c3..2764666714e6 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -2342,6 +2342,39 @@ q6routing: routing {
>>>                           };
>>>                       };
>>>                   };
>>> +
>>> +                fastrpc {
>>> +                    compatible = "qcom,fastrpc";
>>> +                    qcom,glink-channels = "fastrpcglink-apps-dsp";
>>> +                    label = "adsp";
>>> +                    qcom,non-secure-domain;
>> I'm not sure this property is valid
>
> I've looked into FastRPC driver and found out, that the 
> "qcom,non-secure-domain" property isn't valid at least for adsp
>
nvm, it's used when registering the FastRPC device.
>>
>> Konrad
>
-- 
Best regards,
Nickolay


