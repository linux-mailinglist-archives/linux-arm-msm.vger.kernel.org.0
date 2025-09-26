Return-Path: <linux-arm-msm+bounces-75338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6FBA4E8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 20:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D744C3CF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A37C30C609;
	Fri, 26 Sep 2025 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PYAARSyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AD4C81;
	Fri, 26 Sep 2025 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758912189; cv=none; b=lyrSWj9L0McXNKsyW7Q3fzzfcUnArDLsYv+u5dmTPJ+kGVxBqm/X95VhH7Lfic++/1IQvPJKl8qPYH/LalTTjRD1Sg2sh+sRsFzSyX8gR4p4jIjKSRpVRRe/sNSF40rIJGgBggBRpTJ1VCXAYbIo607+Ptv0nI8nZ7gFFnUnmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758912189; c=relaxed/simple;
	bh=h4y+8CUoaKgJl/hGxGlrt2qInS8Nz4uoeuMb0/pRasA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=g2zc6caLCfc0SUWDNjygqnnki/FcjRjhLZGnJve9/A93O+fB9kywrd1lRiBhkgukjMYhDv08hrwTy5yPLG3CzM2xfhktquyYpWa0o1ccphlye2HIiVdP6kKw2/xj6Bw+LgP4AJixsEr0zRcnqTbOwKdVXkjGcrTgD3ElajU3wlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PYAARSyg; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758912178; x=1759516978; i=markus.elfring@web.de;
	bh=h4y+8CUoaKgJl/hGxGlrt2qInS8Nz4uoeuMb0/pRasA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PYAARSyghqs9PceTUJFDYBfwWVQpWxkCqICPbH+qODKxtkhJjXVVcJ3EcXlwF+Uq
	 trH/UkT24V+z08D04RL3Lhk4JUrV41G3EaRunPZAW6/obXO3LtPQMqbYl269up2OB
	 4fiOheisO//kqMGdbbdajP4nZ0PuD0j/4JDeo2k/h5QiCOwDQ1ebaZ3Zdcv3eTh9r
	 34+vTmeuobkD6WpFTCzWUhXBEp8TuUhQCl6BkyY/cFKQP2hHtFQWzghWkimXLRYLz
	 lntPJfbNojXztMkT3crxzS9e+wjxkmcov9gB1L2rcElmNoGGZDjn/sivs04y5M7QT
	 HOEK4xu4u2qY4OAZTg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.192]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrOdp-1uVuqb1inn-00ZRQs; Fri, 26
 Sep 2025 20:42:58 +0200
Message-ID: <c74b0111-4db0-4974-b40b-e2cd66cac59f@web.de>
Date: Fri, 26 Sep 2025 20:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Brian Masney <bmasney@redhat.com>, Miaoqian Lin <linmq006@gmail.com>
References: <20250926143511.6715-2-johan@kernel.org>
Subject: Re: [PATCH 1/2] soc: qcom: ocmem: fix device leak on lookup
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250926143511.6715-2-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OrAzeOwkYOYgTVPiW8UASbxQ2vWBnWnT9KVW5nv2ITqy7RlvLIm
 S0EugoLQsoAdAkjmDYerVKSQTdyPzudhsCBUp43LxwGxUXCzwOGEHfiuMSlQImKnhEABqwn
 u0R+9wGuY4IRFwwFWYTrNAFAXJ3zBDV3GtyX/XXQajTWk90mr690/XNa+556T4qjHt2Ekmr
 C+K0IwV4K7hn9V98bp1EQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V/BxVyjxnYI=;EsI0flHkpTsw5Pt3OqUaBWFPIFj
 eWxt0N19Vidw3v+SUNg+gOmCYqC09p1FwBYYIeXPCkQCSUXmDOoHwX6UNiOsCuvYNN9OD0L27
 1dqhLdTUShlPZtOxYoxNQ0aplnOupiYElqa48Udr7zpTaimPBVByJkFSk/f32zZTTYxJe5uDN
 7luLZlaPVTPeEPL2flWXC2O80kgb+izkLloNjyXorA6n/Wa1m1Uten2ESoBUzAkVwlYn/S9iz
 KB/jdo7H5burlrACJQhGMP+Wx81yh5CFoNU7p5kz4l6Umi6C4cpHjDNU2a2hJiigGpJ1GJPyk
 sCMHL+l8cGkbDfwYPahDrLbdtZuzy1Kxxt3pfnHF8lk2Sqf4nZ1mgsRsMFAb+065a7IvK7t8J
 fk8fx4PfBPipPxgyzvjdkza3Vnxg8/VJ8mocmpljORaDI0xAeShXAW400tmIvXDM+kcJ7e7OO
 gYA4mNZVKkPAsuEXSG3wXk8TqPjoNnUvqfiEbuLvAz/5HXaQcPiW+pq/7mtFoWHijI/O3RLdk
 ALYkApKcxSjYLDiHETsuZtcNw6vodUUCc4Y1pa+J7/Q+5J4VHGGo7lOP5bICllEyzIwxl5tmf
 ejd/R9b0g0Ta6Hj04Dojjq56qjzGvgVJoJjcS/M8yJuDTjMnEEhy2xaavEV6VgqLKl4DgoKKM
 6ytvtXMUY+a/l6srFjlBOwHb1akzx8QL2VwqnBR41bl0fsnWJisMguNkBkvqxBR8Oise1w5Fq
 VOPzaMEigAqbkZx/SqJI+FTP2sGu+DEUFoCUAFIwGeXiVf2HNGkeuMPUZLQU8QjD9uKtOCu7V
 Fu/T1XR0nFTxRGJ36O+XtTzSyVGRhP9vUkW2Cc1z5yq0mNCtrkME1zgEpx4P5u+zlg/7tfIK/
 Nbt53ViEo4hpjO8+4CV8DSsAnQ15GqEXmN3zo2+N75So//unTDqw/q254Gxzbouhjhnc1WxBT
 hLV07CoUN+wCoXzllMTzuIAAaDZOnGuLOgxHM6C4ShvBeSmIj+FNkeFhmCV8IExJ1KkMgIxo3
 U215gGkeWcHmAkgrq+ZgHwBHRJiHJyHTx3xb4SbV6v0huVdofOP1OLWdkDG/5Zy0Y858L9q7m
 fPjaJraV7bMTsAuMxUJHlG2F9qYa6kxqn0Devt410ZOdDM+Fo+NSGzSo/raznnyBVNRQOIGHm
 9pHFnSXEedNHSqW+TqFsD+MSh9J6Orznbu8AaXZ3wD/eUK/2qc00a+fWU9o8iWCv+JYy3R/7+
 vvlp2cAKraotLM7xx8f0iW/k/B2rcLiFP0nGyuZXKIs8aLQrhhUmLboynL4vI8HoQj7TeuAQ5
 jCdZbJBjubx4m/b5iWJrQKhWklyXNN/7L7x6fBUzWt9ZVOmn7UK/P7OLEMSthcoxyG+ZMRivy
 f/rD/NHxnTLZgT7jOu9YCZbUQMVUllIXRD5gymyLOgKYWDHYLZY9WdWtvUNIt7eeHuTgM0o5y
 7VVzO/s9U7Bw11d2gnnD21jxHJ2R4kUhjX+qzggA8bd+2n/3Qf/JfFSoX/sYBbAq/CE6Us2Fe
 VV7QJDwDHKfEXI/Jac7U2vLVJXpiDO3uo4Ixhd8vcwQQn75fbq1+GwPgqbNVdzRbz8+WUECwT
 puJ6oGiRHC4hcQAVN4iHn6OUwAR+qlodEmoIcGaYFwvG6eiLxuo9McJqGTM37M2/l0siyy481
 bS4hT7FFav8w1CG5Dk766fxCdD8CtaG1Z2me0/EjY/9jCKstt5K5I4fqVFvJhBCaerPUOl1oK
 WIpvwn5PpJpa9tMWIc28aimWp7tm0MT5nFg/5HrCHbezFnj7QNkOgCtW7Dk9xRP+RR5hYRCD/
 kz1xM/NVlSM0DVwXUWH1oajH+VEGfpNpW6PJLxUBBgp+xxuANn7ezKjpIb1XDCl6hQH9SiAOE
 n7bgXqbwMAWoKiJKujrI/OXDgSYGkbaHOv+Y2Z5grVBNnGgJrD5BGu/+VDsmNfXt1zYZFWFlt
 w+89zpv3qLSIQQCKk5896ET8XzTLhTAmYK7gbkMfzW8zF8DKvLxl5oZKulQwF2Mdknmmizdhv
 Ex0cBi8IBnaJN5rULh621qSypO50rJ6ioRxhltXAdHlEop4yiKF6gd43WJqyZMsODCC/xMr9q
 eXcVpr/Yonj10AJ9aC4HbjlM105h96x3IQVTbNCQO6mty1CNljUyJN3+Dwv7XSomqnS4qnwZC
 hHeYddf82aAMA83KdcLTpg0cAoWIC0B01UHQnlIutwfEEV4EAe1hiHDzV54JwBrRR2XQLazfx
 gEf0WUGB+v0x09G6tNHUjPycGIUalpFfuU92apA+aR38kgi0y2hFPysqX2mH96Aca8ky39aBq
 xp6gSvRS2ro9ALGKZ6eBfl3bJwrk8mmckiQDpus5qKFqGwMe+emvU5erqBB1r6LFp0tBnVUkJ
 99pj6rUepP47p0WrUA5DsoxjMuG2218B45913d+jsJi8gzKjph30deTtQBkl+QqCe/6sVeov7
 jhVVUWPvlMWvnmB5z/Ne+/HvVn+qYwyBO7GDAJcKxdjNCmOutWkTVNHMlXKaqROI/T8F/cBlP
 BzR6YwVKy8l3W98Jmi6dQMMI09QFOK1nKGvA857L1NeugTNz8saI/LChbuibbqhaDI3BNbo5D
 /qOjMgLvWKaBDrhIQ1PiEFTg03WRtxYx9ws58AXYiIkivkGHTP3VsIwlYqyrQaNasXT0PEfEL
 cAg8MqQ3Jrd9wwXr2+E/ovGVuMywKYGj4iLCZdZybzBIbduSDpxRwwdKnaqSyRas1An8LZVXZ
 pnwirHWhPzPrbqyYG9Fj7+1yAPYFNYq0MzYeQ4Z8acHEh6yW3cXoMn9XIcaI1aZcmECIDindO
 PNcWa7Qw0/yjcHQqb4fLeFmB7qvM8piCPqwSACy3n5UE7ah2ruhX60Uaa7CL7+92f8nPh11Rx
 TAEm1QRVeZu2jLYnKg+yIz+Fp9onyihBHVZ4ErCzS81FXzou7SFcFz0MSonfWe/Nliqw2HWNW
 rIVnTQm6vWvaTi5ELs6LCrOZUyilK1X6udZoZ7uabVVHvPXwbpXlxZIAZmLfdGBVeUa1isqX2
 kKErYN7/Q9B57j4VAhcNtdWplOr2WL9pg4eKCzZnbqdnMn/CBAUNPsEDTYNXlaL+PPX+wCvQi
 A52TMAZO5Wl+ROXE/CnHOEVVnWu6cgNXfxp9PB0yNMvy0rBi3b4RI+cUT77VJMj+6j9WUmunA
 n+boI4kU2DH8FMHPU3shk+3vBOnGF8L7cg+arQgRqfm+FzSowjCgtcAJUKMWD1W/RhjpNpB3y
 OBMgg2KIx4AKUiVodPWZO7iX0oZcgJ/fFOoP8fybzvwyITwQH/lF6r5f0L1W+81NI7eTq5RAX
 o1rm792zwZw8FLOx+bn4He9RRa/A6k6nuydsKpOWCqW15yWn3xAuAWut63+YW4tfEdk16wZ25
 lcUxpjvhkygvo5HpV6LCHavsERYsPUUnim36/tLwoSnjIREWrq6gr5DtazcgTGTqTkwy07nZ4
 9FXULT8DP8B9q5gneSSkHBOoDKCVHFG8X5IY4JhhOFoju55h1IfJZK1Kb8g6sOx0yQJNwmSvR
 8FnI0WT9Lei4RnCTx4gKsI5oGxxLGtrw4lSDLwRxpeMESQrKTTN27jRZUHq6eBS/WRsRMjUQp
 2+bp6i1NHGS6Zy7o1kIsVh509ZnRofl7VOGnsqJ5RKtk9m/Q1VEen893DjkbiOQL6ZC25JwmJ
 gSgJBoShvKACljhCTfPFWBRl6y+2LQLt0ZIQ1pWyP5CrV56ne+IU5HaNbSXtcKM30HbeS5J81
 sWre+LkIPM9Bzg/CRrytMOWgF9jDZsfMu98es6V3tvM1/Im8zCk2XOrxNnpXsvykhfpmwA3so
 EPQ3LJtq10r954MHi8qeyEfYwkvBY72ENg2RXXbWTEM96PF4ha9qCQjzNXoblVuCKvK5C66Dq
 qit53wfDm0YO+B8JYYXxceh1Y7RVXAJ2ZK3+9i8IIICvEs7jCZeUj+4zXAuiY9vXj3PScDFVW
 +D3C4nBc7uQqaEiIz7XO6nBHRFwWnOt5fSE5xdq+W1s8N+5r9uOEMIIpBjx+ZzArENssD/KRr
 n80ZLI0gsYjhv2F9VJOZ1kYvmZUHBwWu2QRxc+S2I2CSXNLckKae5X8W9ZsBcvvgauMDV5pIA
 k25zPNpfMb1JA9uDqva5mhXWlsNIYX1LlDKHGbupBeBrjR3+Cep9P+lZwnwFsGZ/+wNJkzQbS
 cwnoozED4OO4bZG4unuifJ0u+Ly81an4RjrG8cD/CXM4GBfA84CSBttYc4yHEqKSEqm8g6V3n
 qUxE2bCjlHg8lksM+njX4EcDIsoSFi2SNWhMSljxMhwKzxlK9lHcGhUYdax8Fl6jl/WcKNZZh
 En88anKPgJIhHRR1jplo4AK1eIGiwZquEjq14GiYgW6CuUxFEQ4Au3OPFRKPW5sPErePh3Ucr
 PNmI7t62GJmPdcHNfjL7Y0vQPS2kqEqLoHAAACwN44B3kP57t7rYXchgvKNJvgXqwOogsCRzR
 oOlmVBCHBDqkiqMWZHwSKv1AbHGhQmxjccMEjqY9FiX/pjQnX3v7PyBusw4pCy1Z+sQVi38zv
 LcZoyFVypsvo1NxFrUc5HxGs9cpPLSWetCGOD86jKJ1BADhZdx2uDmQ7oR4/yxcq37KCQUMol
 i+BxKXG6T/P6KI3WjTanIi5f0UEnOq+i2FU9JJj6gFEohRHtXsyk1t/aF7YLac+X+HoMo1n5i
 HnWCfQ1J5tFOZImvMx3ZQhxJ8mBHGiCrn1S4lZtODtLwRk8jYGxQ2SejS5Gga4FblC1g+RtiK
 5q+Y/BxUWjeY7mMcTT8gm8hMNZ1YajpmJdBQoy4yg5R4w09rFaqh7jOlyI7w3WaP6IzHwnSN6
 GEO9iZxmlb6XLkz59bWRn8DUuaTvrx7lHMcTRJIDS+rYd3xgno83SckyXv7hWAq6zMBjflARC
 GmAp6DPQqUB6xFG2+66XyWf78f/pjUZ5PiVfd70P+t4o=

> Make sure to drop the reference taken to the ocmem platform device when
> looking up its driver data.
=E2=80=A6

How do you think about to increase the application of scope-based resource=
 management?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L=
1180

Regards,
Markus

