Return-Path: <linux-arm-msm+bounces-64320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E79AFFD7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEBC518875BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED2428D8EF;
	Thu, 10 Jul 2025 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="1/O+34at"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3AB28C842;
	Thu, 10 Jul 2025 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138236; cv=none; b=AW+yOZco2xfstQSL+VcAy1FTprbmDm6f1choYBPnwmCrMQNxT1zn49n89A2EVtnFaBwkUKpNp0p56gfcN2bdiS2air4v19+aXlPZBE+FOsjDdtR2PAtIDQIFcRlqNo/nef8XgTnNrfjZbU0fEvfgNqTIImZThxJCsX1n3cB1XAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138236; c=relaxed/simple;
	bh=qWYEOZljXam2naL1LEipU/Lx3OI25GT+L9hRpkPlQ4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIQF0kLaz3aIuY1wAnv+GZLcfK9iOP61S7szQFETEzj5bvUYixBSXOtBsqkNhFrJcqg9Rn5e+VQkQdc6KM3Bt83vxHzjr+CLzlyVjrJ1EcphG31s7ilfS49TcuWpr08dEnPIZRp7Lz559P2T4QIMOgfGSe/8YZ29T1asDyxMVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=1/O+34at; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1752138217; x=1752743017;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=qWYEOZljXam2naL1LEipU/Lx3OI25GT+L9hRpkPlQ4Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=1/O+34atYcxkATbpfYC5hd1HLJtwpcOW7M1FmbZkVQTMh4lX7N8eC298t8zSrVY+
	 xybyZXJNna8TrOGi0PnG8aZIfW3CPJE2luO0neJED3ZbgWw4SGCv/PaWLsNAHgNhg
	 8ME0/BJ6GfRzbLtSVvMH5QlNTwLkYeTEBROG8LZ29ejFPPZ33DUx86C6wyEvW7EaT
	 54Ui2449v/OPB4yvajpDONu9hJxk7pQYeZlq/P2gd3gL2L08VabDDVHOXMtI2Dayu
	 uRYxVac3Y94Tkf/2E5VCdLU1udHoHgpO5XLdnkEvrNGgIsuejiTDORAcHMr4O1eHd
	 2hLZ86aLUiUSmgt2Yg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([62.226.41.123]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Myb4H-1usAxI1FyX-016gZl; Thu, 10 Jul 2025 11:03:37 +0200
Message-ID: <58c901e9-3a66-4843-8301-2e962ac03c0e@oldschoolsolutions.biz>
Date: Thu, 10 Jul 2025 11:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: x1-hp-x14: Commonalize HP
 Omnibook X14 device tree
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
 <ikWa9Ih3mm9syAlXHTPoLiEwAKXm-3TOHfErQcGGx8GwtsYean4OqEnm_gHgnAJZyejUXUY8uxRamsl7EkeY4w==@protonmail.internalid>
 <20250709-hp-x14-x1p-v6-2-f45cc186a62d@oldschoolsolutions.biz>
 <102359db-8126-4379-aef0-86617d174110@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <102359db-8126-4379-aef0-86617d174110@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hkk+bG0iZ7va4GuQTQKyS2fikmZNKMwBKVg0IaR3p1FB1jyCs7T
 gG1vaEZu8xVRfzlo3gA+cFyT7ZIUGEp7lPW/HwfEcNe+u2nrYtnt8EO/g1IR2l8ovmU4wXG
 GvmE7W89XH0ChbVzDg5UOeR7ChjZ0G6Z+bU7bRE+cVtKRVRHTtLDZ6CCOYGF0wly1oHWw40
 G0Cx6lT5HWrkM/efHOi7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k3aQnpGOXj4=;dSIDURQPwfs5IyEi0ZHVEfDKzu6
 UoLEya3noc6k88GmmUS7FSq9bnwqPtgp2hjI86RJC6ubI2zl7V4iiMs1wW1JzDqHk1eYrHzNG
 w3+G0bP5Gx8MU3JhhjXttDNLZXyk1mDIeBxAxexykXEia0byl73HJKTBhHl6JLswdDyZ+JhcY
 xSyEm+OCYz97u+TBRN83KjQ/lPv9J0/rCMmfMGAX0ZOOHDJkcOhHlQosZ3G5X+56t4vaPYqBE
 L+ZDkThCaYJY0ME6SwDQTy/70tKJHCOGbkL3C/kiZQkyqznJ2m4ynq0gPj3Qt7jO51d7b7Y38
 Es64rMEZ7F9QO6QND44PkwSnTtgDH8tVKQfCSgHj18evd/vdj80AUBH4JsdWUH9nYPAlq6ao+
 XsZRC+6ISlvz+u1rfhq3HCYw1hLZxxs2Vtx4QKvjnR0vDgAMKy8iPqZqkzZEpgZFR3AM+IS2K
 N66o4fuHzaHvSiX5VjtXZmNfGr4OapB3ZO+ZsOYK2pfYthBXq+vY6e0vOL/yOWtwPsg42g46u
 xbbrEjPznxTbC7Dl9MP4FmK9HYzkVUYnAquGsA78I3RhENwj03S6FeNUZPYWv3z2EPAtnEXH0
 4hiL4cWqD48+iWJrC17RQu/CdbOSaOjKTt9OHOV9kbb9rJ7EYikjjqHKAVVtZWFavEKJ6ulVf
 Uz+RQ/SG8KxeyDQkj8oFMrD0kph2JVvOHXqEqtNSH6ChhqD/eE06e+wSj50wwM+Zg41PYAFID
 VjaEGHYvJc+4Lwnw5tcAgIvHBsaFkMIhg7U7t9cla6xjovFrptiOyCdnj7elJYLwUtmZc1JRQ
 pFu/pkUOdiIdubuuf0Ycu9f7fkPAhSxp3HXdbidR/vm8SpyLLYdFf3yDUPB0HT8Tjh0PVki09
 3Z8vQYFzK9Pw4Hdxt5MyP8ccOWGUEe3f/FiTKmRyLSRbpJv5t5wHL173rRV9qN3bJ4vnKXki4
 1bxLhnL7q/ZHCve05zIxXXdE5bjDoXbut1fug5OzL+PVtZ/39JXr1Dh1YPLTVVlrQHlVyYgo0
 wlY41xv532tLkP8h56PSnJpR2l4jiOA+dNOc1ABVvlJZZU11NmSrRRPmTol12URPSU0kKdS/q
 vi15scNqM6kSD+AMyArtJCgfL+HX3NYBPE7wijbmR6alpjSSI3ycX3QslBmNzjw5Hy9ACpKIV
 fs0pX0STvSmDc0mgl0p3VyTXdHHpGe8IBAWxUdx3kUdu8ambhlWzNkbJX5KmbQ4uHGjNCDssi
 GZPkWLXMCiVurwZoAl6IhY8MXt3JIuKq07Iwo0388JMWM9w3gAUS4i/0l3eQyNMZAJNFiJCzk
 R+RYgDn7AhXq5sjfsjdmtakaXMr4S0V5lf3qamMEAdoxz4cgdFkqnLvLX4cjnmc435XpUplwd
 Rb2u76MrtsvgSIuy/w9h0KAczr4owQZ7kFsc9hlDbcP5RlGRput7dWATo7mC0wFU8jkRs5sv9
 xSYaECKd52dwLmm9oZEWoqbdcVSi/yW16TDoK7uyMgRFAW8uPBrOyEm/rv1Pxhfk6mkDas9Ec
 WLqIqdVM8UBrPKXIzcB5nTdJamnENwSkuoIUkSiBbp9rCaGKvDKkuJhRFA5NnA==

On 10.07.25 10:31, Bryan O'Donoghue wrote:
> Commonalize is not a word, "commonize" isn't really a word either.
>
> Any of -> "aggregate", "unify", "integrate" would do.
>
"Unify" sounds good.

with best regards

Jens


