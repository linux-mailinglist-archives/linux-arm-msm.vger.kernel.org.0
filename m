Return-Path: <linux-arm-msm+bounces-64133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD02DAFE1FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5DC481E66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009B1235072;
	Wed,  9 Jul 2025 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="BArrqa3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8870A23AE83;
	Wed,  9 Jul 2025 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048587; cv=none; b=H+Gk+hBpiQRn8D1D1lc4Tj935AIZrqBxDT4wxEN7coKhBXJ8JJDJc3jpjetd1RPSoQMo4oS1YBnkW1KvCZM7EPR4nxNlrqBeC0EC6N0VxLA9cwfTjEsJWAX4wKU20enPDr9gCfyvnHptVJX8yYU91cDPd5nW75atnxk2fzK7VA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048587; c=relaxed/simple;
	bh=uZE5jplWSjAv+o+bVBwj8DwJFyiDM+RKcxpQzWaMbCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyqTqFBsh704BgayJXUtpkue6VnPxXEGsyM1Ebk561S/+FBRij2+vbtkBR0OayhIFTxHgqfcuFvYgUyrfZUk1T2vs0C2FLnNslZ8/eUqdzYCDTlmssvzwMCocjQqX36kPookXCr+AVC2sUenxccX3MOP0Sy0RzvSoHGngx36iKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=BArrqa3f; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1752048567; x=1752653367;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=uZE5jplWSjAv+o+bVBwj8DwJFyiDM+RKcxpQzWaMbCM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BArrqa3fkxJXJWLJI/rBNR5q62+qhwP3y8ZBF9cMyf4EuC0vgd82XrbG0BeA9tO1
	 4yAIJLltg/3qLc450uvocZ0gOgMSpFk8fsftNfusfuoQmcn6pF4OYrqh2JTcmWJ1q
	 N9BUTcWO9roEr8GdCYoE5UNFJ/L1p5oK91vs5ICyt9e1fAZ3G2Cvjl9GFQNAdO4Qy
	 iXqvGBW+/R+SyGi6x7ciIbyo9AiBUcHpInLWVkq1Vw58qmURjFh7t34z1SsxTvzkY
	 GU0aXjPH2W50hVDf9zGBfTXc9XDmiGSvysRyy/ZFPmWcmFuOb2zIs9IBVsJ9KFHvj
	 T9e88klvmUqqVV2l3A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MUY9w-1u93JP0vIW-00YZub; Wed, 09 Jul 2025 10:09:27 +0200
Message-ID: <52b68d5e-b051-4c59-9186-eda9071c9303@oldschoolsolutions.biz>
Date: Wed, 9 Jul 2025 10:09:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
 <20250708-hp-x14-x1p-v5-3-44c916efa973@oldschoolsolutions.biz>
 <20250709-arboreal-basilisk-of-opportunity-bafaf1@krzk-bin>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250709-arboreal-basilisk-of-opportunity-bafaf1@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lR8fq6HQTQGSlHeN5MJ+99V2xxKIXYPiMFGrBSnMs5eTryMM+tN
 auuOx0xOxQmfwki8RQYm+cEUsMfIZ4QBDxm8nQov0qBfVkmC1l6DPv2IXGHwbvKPDqhaVcF
 g9kfM1mjgNM6GYdgMq/TUkU1LjpCLmekmfxyK5gRX3wskPBGHPBNsPL+XLe5U1Ge+hNDo+X
 DXLI3N0fD5jqym3O7zdOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XVvFInXj01o=;jwXqqiOvdH4Jh3JNynB1QTCVb0R
 +S9bwtd2sVobLel8B4LunQVoSqmDXsXEi9iRP8E0/KqHjAx/oqsz1i228Ft6wPoDrGr0HQvvS
 mwMDvyRiHoP0SbzU4RWwB2sME7sqJvMr66898D5kHiBjQ3VQxTXRVdX8AnW5sBtxtSNqNdzmi
 dy0Oej/kxO5Nu8SL8YH+9f2lSyBFGKtMjkgKNGovobmkxw0TH3fMbUm4joEGZU+R6603lcmIX
 jQU1imz9IyqpWKF1DYE5VGeGEcE/eC0yIJaIQaCgATcDf3MnvhNup9O38UvW3cJPPZ9z7i/SW
 4FFnOqP9FNqcVYEQ8fb0AUi3qrb4yEpGPCY8avUWJzLYi1g0Wp97qZc+YHQTDBKrJ19dAQFxP
 f52dlJcvYmdBGC+o5X0v72NlCq4doDwviDUc8QZZe9FAigJ/tkV2dj+jLPBorYcEbcDLw1i2C
 wM20TiUr1Q4ipl/vOBB6lNwkxYjjXjG4xvtNoHyeW/BSpMN6Um3ifP8M7eM9uF16RUrP5tTjv
 trZTvwHYaEv2BYMwYXSoEPcKdYfBtQFASdOdHOy5K8fp+LqA8RMsFFR75bOIsmbe73zlIPgOU
 TmPet5VHY6tIiww0uUgIE5AydfYUb3GRkDcw7nfDFM7Ti0AhcDVb5Ku7U42uleBoS/YNDaZIl
 AhauTKSj9hKbQQt62puXOT1nyvng8xKUmBsyBvvYDafFkMHzvZ8cJRvnPgqXv8+Az7W8wfck5
 6TujRxCvB9quLTcuA4eM8j7zrYrjFZ79o5YcBBExaUwO/XV4P044B+uMfZBxay5IVWDTZtCad
 YNJhjMm+TNRK4M3u2N0Hkkqg20QicDAPheUImC3HBG8ZfEatB4jXmYLrMxSqZosAEjcApcQtf
 QldOP469oIOYSglM7+NJtf9LxFj9X9YceKKazQKuWhP6KoZgQ4Rokfs0KV5t443gOwXSousMQ
 QphSwsXQiSYLiHONWCPQAzy1RR+cS5/mp/ao0AoE3eTU72HfJWlaSakakF+7NqNEEanC95aIC
 AX4KWWqXHeuodsPy07mzzEFEYgaWgfs8yuXTf0CuZ97rYfY3jaFDuYTyg6vSRICKfxLvVyd3r
 IczZfTt47II5Ciy1t1yL4tI4qEpuFdMhuz/j7zGKnuf+JFJp7U/I8uk2ioNF5eDiUbOFKKxvW
 sW81EKCl7Z9LDEjvJVQNA9FKXcuIityaeamnwl9sgNlrK3aH+NpSq+fkbdvFfNsBPEXJBFrX0
 wFsIWpJbjKSg+mLqsen3S5JD/f0n3VV53OzPEGiQyBdQWSraHgMj3xvxSNBZy1IBGFNum2DkS
 kuC/UuYB2V9FnhMXAoJAa7reNuoWdV8pCThYwwvrCjzsW2xwFfVZMp3E5s0TfuGWP2vOx5JvE
 oXDwRXoLQoNpKajaTPY+W5T+2qL5CfyC2fL6YHpEvWVCZTrDGH9+ha7405pso78Za4X+hHo8y
 sOE6WX5gM4QaJ6BdTLw34o44RxUTm+MtLKJhNueRg0f5vwm+GKynu17HM4GwCLGyupMe2ZrUQ
 wMcXBeQ0KlNpgZFvofSKqDPjQqis3hOckDF+/6hbgllijggZpPw6IxA44+c0LsgUIYlOkXokq
 w77+3pz3JDKXWYCfyMEt2u9QF6MoGac

Hi Krzysztof,

On 09.07.25 09:39, Krzysztof Kozlowski wrote:
> On Tue, Jul 08, 2025 at 10:34:08PM +0200, Jens Glathe wrote:
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights rese=
rved.
> Odd copyrights. How could this file be published in 2023? Before the
> laptop was even made? And by Qualcomm? Qualcomm did nothing for this
> laptop on Linux - it's a Windows platform for them.

Ok understood, only license identifier. But I do copy from other dts(i)=20
files, there may be unchanged portions.

with best regards

Jens


