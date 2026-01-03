Return-Path: <linux-arm-msm+bounces-87297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD39CEFD5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 10:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EAEA3026847
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 09:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03585222599;
	Sat,  3 Jan 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="KJRfTTsJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD23FF1;
	Sat,  3 Jan 2026 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767432006; cv=none; b=Kwi7PsEv6zIL3NNi5OvLfQTSyFInWtIzRIf+5BhmcwxGxEjTuHy9UnPofLBFI7NBpCTjk1gc9gZXpVQz18vxtGXpB9NBg3I5pMf2ARyOM1Fg2cHOmuNmTdExXTPuGicjyDk3Qn+/nAfjUHXboMJdp144peag58NQr9l832IQXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767432006; c=relaxed/simple;
	bh=S+0dNP8J/2CqpoGwFnQK5zqJtXz8+oNy8+cgDIY56A8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=u0tFgc8Wcy1HjFgIRreMCFNUxT0cTo+q05f9ou8lMlKnthr0n5kONUHw42NY8OFsZYyvQoFC+NGY+UH7qufJ8ciz5sP4Ro39cz+MTIR13exjC64vaenSqSd9MXpVnxuCCESPCeLExoDbIrhasdwK648tJIBHQlM7VXX7zm9KAHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=KJRfTTsJ; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1767431996; x=1768036796;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=S+0dNP8J/2CqpoGwFnQK5zqJtXz8+oNy8+cgDIY56A8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KJRfTTsJGtor0YvtQxCJLJsK7qddC8Ujq6CxR8hfoehxxcqr2e8XJ0tS0P+zBT6d
	 r2C4GIf9y7B0ORd90F+5yCWyWmwzKRlzexVWIejvYjOp7+Uh4uNIv7GtvJBm1dicw
	 jBpGL+xaN0kxcjxgI9EgIDpfqDwL+ZtGP8UEAQD08PyASqKxQpxuwaF1EcVjbrMzh
	 cB0oW7eispBbUx2yl4bZYQLZRxq2NKiYqWY0V5Zn/TkAmHq0uwdONz/+Se9tntKZg
	 /aEEi72enxbxRztOu8ZLrdICx1Byk+lyHb7UyNYGN55mDT2PmIhHWanDUySbsXbKK
	 qymTTt7UiqUZ5fSNkw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([80.128.162.161]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMH2M-1vLwfB2BLK-00IwHd; Sat, 03 Jan 2026 09:53:03 +0100
Message-ID: <26f0ebac-22cf-497f-a013-8211335d085c@oldschoolsolutions.biz>
Date: Sat, 3 Jan 2026 09:53:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
 <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
 <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
 <x2zwsjk4vv73a4i4pj2aphvajtjgkw6mkzs5brg6adlm4gnxpu@r7pbypzvcsi6>
 <124d3c41-1826-4927-b4de-1d2d1ccaf5d4@oldschoolsolutions.biz>
 <yfddvt44btci7hxv35hskoxliahml24mmcc4qre7s6ypc6bg5m@7v3pc5wmn7zw>
 <625ca8eb-5d6f-4109-8000-044bcf868337@oldschoolsolutions.biz>
Content-Language: en-US
In-Reply-To: <625ca8eb-5d6f-4109-8000-044bcf868337@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9AqePdDKDrIpJfTr0z2x5ViksaLQv4t9ObwvpLABSpWOw5vhq2Y
 Fsnbs5DiR0INLpGoxRApdjLkx2ml43FQnV98dV9E0UedH4bcoGybGNVCi99UWquVE/joL7F
 sYCnQbS7KaaDi0UnPq8tD8ORnEyhWC6RncA6yiffR4NheYubP7yeTfyTHkuFjGoviHmNmDc
 /dfIptLEv+rCN3VSSauqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GUGm0o4DfPU=;bdbWToC30llYGU/8pRH5oDphpcH
 bHVOZYgMqycarZCDKH6gU4JmGJ53Rc9PZHh4cx56VIin1QdU6l+dGpzf5GxVxluJJJQ8WB4Ne
 RMs94CkTROh1/Vr6z5LrVOB2dAgmrcitqZQ3WhVj5Z1FhbcYgG6AqWGwKrJUfTwXa6zEDEjQw
 M2Utxv6rMSDqu0h9xUTASWkmNYBjLPOmrZ19t5aWax6JPHn03zXLtD8lZYEfwl6WoUfOjJl65
 1UzVpuuGdxJALwMF/Hwev+ICX02ainKoBPlP5YvkFro9X14YKxDHbLWVJeP2wncBcHJQ2AZ5M
 CSF3iLlfBIwq129PkeF8yIVkjatQ3gdbv+2hdA0iQvRMUibywLRu1riW0KIiqTjsnJTzPtKi2
 bgroHTVZcnbbBoCFxsm6BmuqI0fka2FM9thnxus2onM7he7OFwII6+Kyw1m7R58NeA1aXgyfw
 BqbbvkKS7uEuEj93ypRPA+XOPVe9hPq1Bx8/60fuZrPIm4gzd4wdGymzONABDnnu0WvNZLnHz
 4c8221BI4KSwMTCI+Qgv3RCl0uwlqqaE1w0Z7gp39WDNxYktUvNxjZvjdfcfVQ7q/mmWmM/xi
 fZkJQvqEAf1P2QS65yQjQQYG0IuYpvWJApefFde0a41OqA+SBDgSLq9Yy6wkCpCG+gJMhqNjC
 5ghWRHJgs4FG+Hs706ZwATgFDK88ZodUqght0l1EPv7DMrz3Wla+vej/80/TeHHrcmplIrn/F
 m0hhYdvSHiP4gYyOM4rdT9EW3H84hoOWJQU05upkIwyUXhHyimmuG8jKi85ucgnQceXwo2Dds
 8VEANxv08rFoLPmtUumnVhLLb0ElTdYRhheCyaG6FEr46lc3EPMOuxUUhXj1ztv2ngqLFgXwN
 DhDghC9owZcUa65bEeLRc2HgPjkP9ZJSf4hbadXjhEsVMcBPB7ZQVKOUdYJx+Ahg4lrLxiM8s
 B0s2bITE4mOpIGqmDn/O02CZfXzzD1aNsCYs3XAT2JGerBX0RScTDQLOql5yEOsd7TPG5CgxY
 lEFOEMYCx0XLaliO4TPG6tvCd6ThRHmNPu3INNkrU0TcAqfK/XZ4kdAIiWzTOrhGYA5v4Ym7T
 y1eyLA9uWzXcDktl3QSi7EuLSQ/Q7M8zIrbQctgY0qAibp3ElipDly25Zo0X089kYAEw8WSaM
 kSgwhEMSUeYt0bsELVI09lTG8MDkvqQTy27g9ETIJS7vm8fZ7fJwCMB2ubjuJUS3mQiU4z/1c
 TWovdqmaexTavgZGMSVK1/PohQRbAAjxwTly3ceMNOQK1QGPWr6364981VcpjOalImwA0Iv1A
 z+YLV7RDVvyHIhYs/jOf8XWQjjHTXWs8t6dzM8nWDJsy1q9JopTB/I5VUREd9vHGr64ZVnIUF
 3tWSEc4ujuO6bp+xq1O2T5oOgLkSWwZFOqM2NhMHTRpDjOYQXoKbyKqVbo769NryFJ/LAMU5S
 Iime2qSoyAMBDtJjifQd4SeNQ9N6xC1TwKIWR3qGpt4JojWc2NqZAaB/3q/I7F9J5OV2u4RSm
 FOu2fFqz8z42GZSoXpmcGp7kZh+MmVdaKgh5bAHRGmFCPHik7khv+E6mJNXqSAB0zXeTpj/03
 aNxgbRu6Com4y/n+9kwP7kXmEeEjZXme6HiTg/YkMSLWLuzKW03kiDDVgMjiTRIqlbQb41mFn
 EDRJ7T6meLqq6RSEK8uB0q7FB5dCZ1xcxyOpmtbEpSRNioa11wYQLEGtZV5nm4a14m3NkSzhc
 KAHUKf+OzcfWX2ODLNGi3NplclBT15h9498zdEWmvsEQgRy9pZII/zRFmyt9Gvb4pnDWToVfc
 4olN

On 21.12.25 16:51, Jens Glathe wrote:

> On 21.12.25 16:23, Dmitry Baryshkov wrote:
>> This can't work, the pin can only be used for a single function.
>
> See, that's where I am, too :) Configure it that way and you get the=20
> HDMI to work, be prudent and remove edp_hpd_default, and boom the=20
> internal display is gone. Maybe someone with some schematics can shed=20
> light on this.
>
Well I dived into that again (no schematics, sadly) and found and tested=
=20
something that works through exclusion. In pinctrl-x1e80100.c there is a=
=20
definition for function block goups (?) describing gpio pins intended=20
for functions. Well, gpio120 (very near 119) is only and exclusively in=20
edp1_hot_groups[] and edp0_lcd_groups[]. edp1_hot_groups[] fits pretty=20
well for a second display out, and its not used anywhere. Assigned it as=
=20
enable pin and it works well.

Will do a V2 of this patch, thank you for all the suggestions.

with best regards

Jens


