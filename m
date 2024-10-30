Return-Path: <linux-arm-msm+bounces-36376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345BE9B5D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED6CB2839CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D001DFD81;
	Wed, 30 Oct 2024 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Ovx/kF/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244CD85931;
	Wed, 30 Oct 2024 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730273971; cv=none; b=sMTrXGpMJoYgnAVLoZ5+CbOISho10IjYD/gqp7Y+gPEXs4Bd617FbN6P/VP6gQo1GEoM2kiqN89DOUxa3Fy7c76nFK8hkpVowzG4Q+tSkO8woyVP+KlEQEVg6vfiexNRT1Vlot4lQDgk2ELEWIrgnWtPLECGcW9uScZQq/JM67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730273971; c=relaxed/simple;
	bh=nEc8gOaRix6UvtSNUq9rl1lK52vlDUP26tV9LTP2Eb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9qCXS2JlRVaA+VZctbhwq/Q4wYpBBO6LduoDxLCRthZiitz9NRZIhovpHderAMIEXFWbHYmOnX9H7B0dLnLEb9/ijmSrmF94fzC3V0622OwfL/8Y+U2GZjie0u/8y4oplVVWNidfKRyeA/rAuysw/6uDrt2I8+qjSXpQA32WVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Ovx/kF/E; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1730273948; x=1730878748;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=nEc8gOaRix6UvtSNUq9rl1lK52vlDUP26tV9LTP2Eb4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ovx/kF/Eaut9Xd3+ViszWFHGCmBQ1yQzZf2O+cqbQHveE2D8UGJHQUI6GZShXAxu
	 J/bg/ThEjSFs5UaeCsgX8gx1KikFk0RewCPh1ZQsemDZ/tjDJrleZx58iI3uQBEAG
	 d2J4c11uvukwA0/pDhA2jeh4oKiA6yAEnYQZT8rpJSRb7FcpQP5l5ZwnIs++ZZ7qJ
	 rDR5MbJ1Yu111MgUJmFKqvakGz/a9c0PXORIaE1SYhvRzqNaCL3h9Tx3EJbcU9B7l
	 guwGy4PNeuqiYo27YNj/aez4wiXNOHi430GDyhm4SCTA8NLe4XbxKlq/U/dNrzxx7
	 91B5B+09G9++d7SuHw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKKdD-1tRAXs3Ho7-00VMfH; Wed, 30 Oct 2024 08:39:07 +0100
Message-ID: <482522d0-49f4-4c13-9f2e-8e74a21f1fa3@oldschoolsolutions.biz>
Date: Wed, 30 Oct 2024 08:39:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>
References: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v5-1-830c938437ad@oldschoolsolutions.biz>
 <ca46a692-3ec4-4b83-abd7-3fb82817940c@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ca46a692-3ec4-4b83-abd7-3fb82817940c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:koOHil8b+q13ExNc3lAAgPM4oeJSkwUSz0WNRMj0ObxVCwFp+13
 UBmv8fRV192f+KsCUst7lQncUamRrPwSsH4QxC4JZ0KrjBoFrlLRhEbsyUOEMIJcN7yfXcc
 2amJMtMxJ+Qcyw1FmmuQRBmYyBdK4fuJXaPLC96su3bD9KRLlw6BQ1Zw6+kULaHTvZLnIFt
 zwy/fd2OESNEG41FcyK5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vA+c6s76AlY=;r9vRNa/sivZb56WkrHqTOCFR1aU
 iRuUByT9okjzWz9lICb9n8mOhkwgDJwpF99GpOJg4BPrjON+x9AAeKWe4wjZv4K3nSFuqjG7j
 zf9fYrVu+O7WSxSTOeFY0bS2h183lBq/ZrsRr/lbXIvscY2Lzhq5a5htb7WN8mMvItFqy8aeu
 K8zcFmUHWZUBXjEKBQRCkjIaIZSSCYisTLvcdqW952J9qJmxcLeMtlk4eCKcXnFX6yZRADa8K
 BIuMoOP1501Uhn2hnXsdGoWvzf0tzJ96Syw/wAkPHITkSepLw2N1RqhxwwM+NJiSmzAOjuIiB
 CzYIKqxN5RW9ELfDY4WddIXIZlrEXEtKrtbXyHPtEXh8z+jsBf959/Mt/I6Yq34wIlgpdiu85
 +ketsWgJtwI9JJ8/r7DzcJp6jYB/ymrHIETRffuuG34agj6Xc04DrZIeaW77VQ5eSXMWAzhvb
 xq5dfJPsvPgfWRYoeQR1WQeEue9ArJ4osKwYY31LwbeY0zgtvAAlc+4KyWddXAfzkVNHmQSpo
 ODYyjstJz1W+gWNOgJMWUss739FFl1L7Mninu0WrGFha2jEzAyCKWLWo1NPcV0dUyeAlCoKJL
 265FwInFJjKFL9/jweW5P1FeyYYR/7sftaFEdDApzWnG08vkW3h/Yc6qFSxODTjtHPivVSJho
 7rch1MIAYSJdotWYZA1BPNV+vHRD8w92wDl61mwOniHPnebSavxnkg1fEvKKhD3h10YEB6dX0
 UCWiXNoYOEc/yodAQFrK6VjPIoiMiWMbg==

On 30.10.24 08:25, Krzysztof Kozlowski wrote:

> On 30/10/2024 08:09, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
>> with its codename "blackrock". The Dev kit is a small desktop box
>> based on the mainboard of the Surface pro 9 5G, intended for
>> developers to test/build arm64-based Windows software.
>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> You got one reply, then another with bigger instruction, yet you ignored
> both of them.
>
> Best regards,
> Krzysztof
>
Sorry, misunderstanding. Will be there in v6.

with best regards

Jens



