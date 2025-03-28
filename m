Return-Path: <linux-arm-msm+bounces-52796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB7A7509D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 20:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E77189517F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 19:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A3F1C5D4C;
	Fri, 28 Mar 2025 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="L0QLwyUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE561482EF;
	Fri, 28 Mar 2025 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743188721; cv=none; b=nCbAq5HFkdU/7i4ma3/TL/bgF+MCfiCJaiqca0t6bBArqsUL6W1GXSDzWvUjlOONY775esMQxWDgMwjGxAHq/dZCaPKzP/3dVQT+rapmzj8TV1t0C4qlcz3DH8fhf9tfpZyywziAXaXgRAV4DArzggk7FzucLTDTZtwVPdH2Q4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743188721; c=relaxed/simple;
	bh=jOsXkiN4zS8kiwV3cwiwixj57c5f74/Oq2sxAMpeJuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k01/qppbKfA8yXcIigZEMjAC5kh6stxENgKLBP2pgExumMklbwTRlShQTIwQXI7ctPZZIiuBEvVIPOujAXK7x58btVFUcujgIzmpmZJYIPspwYEfQvNpeBDJigFoy/ukvnlYdSa6AoC5EfKR/d8SjgYFi9qq4y/DI46q/pI/ew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=L0QLwyUy; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743188698; x=1743793498; i=markus.elfring@web.de;
	bh=jOsXkiN4zS8kiwV3cwiwixj57c5f74/Oq2sxAMpeJuM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L0QLwyUyTR0EqrGx9YUwLuZmfmdlI8Hpb5sG96NM4+zNuDkJNA71s4EeyXxj0wuE
	 mqWz/z9oeFnd60z/beEb6si2p4BhTtPMaSGlCA4HzivGcGTPwKVxy/BX/lxygsBR9
	 nzJU6bdh4Puw4ZINNYs4APKD9s/fmzZ2oogYFOYB06DdMv8ldxaQIIc7CyCJp8dtp
	 nZoXcAVSbftqoFl6Ksh/QOAiHuNo4DYjizjJSZDnfOpHlUGQsp2okXITmVT02OW7P
	 r4SYk+E1l+AKUGdHZ0Gf1FoUI7mF8ogFxoaK7exgl58LC7bwbWSEwmhMVMvUewOTH
	 02SIyC8kyDSYEoCoPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdLK-1thgb02RWm-00LIxN; Fri, 28
 Mar 2025 20:04:58 +0100
Message-ID: <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
Date: Fri, 28 Mar 2025 20:04:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T7u3qxPI3WBz+9O34BuV/2Jv5KTEmCEu3iKfSY+G+o7DSm/aCvE
 pp9v/ic4W/McvGc0YbBtKGV0sx46UwVZOKFTGJtD5tIfv0ZPDXOgFDo7uiGWOhJM1h9BYYt
 rguY95Sbvn/Lp5K9m2BG0uWoqUoHvbAOK6G5a/IoY4JhBPofvSov9N/amDUniGxzNcFPEth
 nM/mqP4koheEiCN9ujjuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qqse1amEUSE=;K+dmILupNtAQj8PPVB/oOTWLo6J
 NgMcVA52rk2boJxbQv2e7z86py5jTwh1bHYS4fNvLZ2iYoQtPzTaTQe9J0h4zE5j9DEB5T7Qi
 +6pppXVxwy5pL+s5rllEPHZ4faiyNOqBjUmUDY0nQxvdYI8cdonvWVj1VQDEdpRKMVWVU+PLj
 2yV79OgvPz6W9GOv8kA9rcym6K+ZPObg+ZtBN2jZIeCH6xpMii1t5Qb0vPX8/8DGNKM8PJ6OD
 0ARGOeA8x3HzLI2gCmG6XqNhILgpVmOmprROMevRHCqEq2TqlMW3afyF5fp+SI2AztUrMZMAF
 j9j4VgJDVVuHRpR+6WAdZRGlZYKgNsPF4cfd4YYU9IhYj6osUMr8iTv1klJGzxsajIQJkZqtj
 FDMBpWGIyFH786GSDaOf9BqLoNiWz8FVxGws/LgLh3m/fkgBhxGkdXqjX8gb8BGBGMqCgG8gd
 xCbjMdekPsthLdBZZP8PuBTBAvBEbzhkheUK83cV4PiT/iZQWIxEE1tk13mtsqa2hoHs20eFY
 JaiSXm85mpSMHNpbf+H8LKC7rku0PThBBEikRL9ioZ1722uXpsAXIlhxNdHIbNhHa5bJnjKfo
 90IOS3Gu9abBx926bEiT+BL6XgRr6VVAzQ082VpXvBFZTC+QCUyzPWGKoPVM033KSYCt+EAti
 /W0cPAxxBfR1RHQlMw+1qTN9NGBZW96iBpWC8HjR3t98U60IFxz55a6inQ79zKwXpVXuYMyJ1
 vzFQVCgwXCPLzJrrKKuZH2ANUDWD+qkuNiW22mdKNsBiUIp+ZLMR/xDwA4mU77SOmiy7cRNSQ
 4W8gtZywIgYXXoVK5UCvNVlYHrKX1eJqfGN9lSO17WgN/CQPZPAUqXtNerJg2gBOY8LhlsuPp
 I9udimlR/xi7GidGqEegpdvjxQYYJfMk4Rz07fMlDP1STL+K+VV6tybqrpOmJfhE82kRhx+Yv
 YVK17s2BUbRSaUObPANgSehzpR+Pa7cwAKMYCPcbgMAJcxhwi/dYp2DV/FYr+u/Gu8yu1uqXn
 5j8kd+/daaRFOovanpki+ON7XlMJLOT5ModkYAaWqN9AW+Sa55W0vBxUGocJRmAtnrt16SsHM
 /KX/spQGB3PU/rE6SSXICgxbzmGWxMP4z0QIovrw8e47jsascIVeH34Ouk+PrmpGSD1GH5nsm
 9229f8Kh+VacDqjINAyx68IWyXBvgeCpWUPCaL+zsyAFIsLKCA10jdBTw0ybo0OnTTkWgHe2B
 5RTWq4/Xs3xKi3OqoOuN47MxuzKqhTCA5FKWh5KluAaH46Jz13a1BJfkgRSGjdTLEnSnOd3AX
 mIDx7xO4snEzi5k0KI+hoeCarGCZ4GY6xkjoIUt5UKZCuacH2OqkVKXxrUjmT5mPIxVV4+JWo
 JYxO5cdMTgTufhjZrCEMlFtGeiz+605EOHWdBKrvT8HueRSXD4FOg94L5DoHmWtie9StJN9ze
 lnxz8GpFee7EtwUKM/M2YzplUkIJipmCGICx56NxAFQeiYF5d

>> Under which circumstances would you become interested to apply a statem=
ent
>> like =E2=80=9Cguard(spinlock_irqsave)(&gi3c->irq_lock);=E2=80=9D?
> Didn't get, hence a question.=C2=A0 Do you suggest to use DEFINE_LOCK_GU=
ARD_1 instead of existing method ?
I propose to pick further opportunities up for benefits from scope-based r=
esource management.

Regards,
Markus

