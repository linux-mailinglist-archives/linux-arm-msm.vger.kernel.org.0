Return-Path: <linux-arm-msm+bounces-63990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45958AFC5B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4045717B6FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2D729B224;
	Tue,  8 Jul 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="n/mqDl/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F8217F26;
	Tue,  8 Jul 2025 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963442; cv=none; b=ZwlXdRPMoSYMeAcwYwuXP23at/1oUChYudvFlG4w9IBYCvTNSN0GdOiouxfo2Lk67hwv9F0vb7Ogt8hYTQKCEskybVzy9nlcu+CT+Xt4PmVGjNvohCufHGOV7JAj6KiWw7zjP4lV/ESMutK2c/tWQ/1SuY/o/BjJnRaoC824rX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963442; c=relaxed/simple;
	bh=AtI930qJBmMfyqWFOIdQ5JnYvss7IAyYoAPxUWuNpww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5L0DVXKRl6vKizv7MXVdJ9kePe6gFGcykBvrrTS4o6+yiFZaBjr6Lkv18H5WKpq+ZjtIylRr8uHaZhejMsK3NoPO6GLRiHOTWEG4KkFYNfvKelEmmxB7JkSB2doEwPsOfr46RXfm9Zzct1U+CCecgPTPta6W5OT83eo7QQtnu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=n/mqDl/j; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1751963429; x=1752568229;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=0MOMZrroxZAKIoqKUwYzm3sCqRVqeZHakF/ZHtM08KA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n/mqDl/jJpsaAY/qTm/rYaTF0ZqgdguSNFYpaIvbe/nysT0SiBKJWZ5hFxf0OgZ0
	 ZLaD3UpGC0I/Ppd//l+IDYA31Uc0A7ItwAYxW7MOWoNXncSk01GtB88/Q90qXuomQ
	 6HNW5fMfle9Q76icCDU2UoNi6A7jefRw9S4rP71A3nrrGhwu21Y3rpIrcJAykYacM
	 SlcgV7RWeJEYTYJT4dOcoqZoZtyWCIpZ3aiPw4CSu4RN0UybDLPFUV1vdSg61KsYE
	 vwdGzCMyIATJrXH4lHqEpx/M9bXNB/Q7gW2ar6r0lRFk85SKFVXqYzYqiya1m4mGV
	 nS7a01OdeSlGLH7Jrg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.192] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MI59b-1uUOgx2Xqh-00Bhso; Tue, 08 Jul 2025 10:17:04 +0200
Message-ID: <83c6c3f6-ff6f-4e1c-8c20-78a13b0f85cd@oldschoolsolutions.biz>
Date: Tue, 8 Jul 2025 10:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI
 in SoC variants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
 <20250705-hp-x14-x1p-v4-1-1c351dbeaf18@oldschoolsolutions.biz>
 <20250708-brawny-optimal-lynx-8aab31@krzk-bin>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250708-brawny-optimal-lynx-8aab31@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K72BSy1wq2juB1ll3YQ4zRvH1s1W3GQFSp3CRRU5wOM69mWNdA+
 Ea4GyX4GRC/KpPCHRUgyLo2pJq+3+4rxaoqrM2xEzhG3kcHbrufH+qxLClxk7DDnNp99/YE
 wA6sidFkqBemOVMCg/bpc5WQjT1ej4zfExDJ7syd0yQ4U+aQklWBIXLOCmnvB7QTQn/f3NM
 MQs2Jn0TOV6wrXIafGkmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:izt36kR+wOs=;1GGssAxjo4S4PRmy9TGS4KGsRQX
 YVe6Qb8hCN3a7exEDKjwONFBunp58VUwg2Fu4rzL7LjhNynmGldvt9KcNlpcv8RNFM9lz/2uw
 CiX3n2xkFSL1RSY64k10oJxvpIOPYHBwMmp4dLiu1jSfXTU2B0P9L67kFkXoHdKnCgj0iIlsv
 AAw34C+j1mChNOMT3am67gXPbsbPe4++ZbKDO9jKUkAKyRvWHLS8VkdqFVLEWIkwyjDSMdar8
 jvm6vT3lz/HALeqsh5lLX58IRbJaL96cgu2IBU0IeH//dsIpBxAoun7SycmbQS8NRp7T2l7aP
 PgN1ZeOm59WPjEkyOpkMXFK0UxckwOhYk8HxdkJR4GW4R4edLQ32+w7z0iktRwIntEzCJJNip
 PVyWRDU1hOb0nRIyQkHN0HqqDQQFmjuYdwEjejVxcXf2NMgLulH5Z589R28Tcd+CeJDnFoYzB
 Wl6iuBqBs4+pOlyHaT/PcY/KVQMBqq6A3cFgGTlzsUbZBvQEDwHpsYR8kffKlPhTJBE/dYNuj
 6hTk6ZRVJhBrns0ahzK0lJTGeY1SLRq0736iWZfqwwA2e6/IrlnPdYhgqUYAAsLyzvNzz7Oo8
 QVOU8FbmExqd2Uh+HIvdShaL8UPkrFOyTTw0ZElhuNqP7vKyU2xb9rZlG28S9Hk80MR1SDkYb
 jZro4Xf1Qr3BBuDwbOQEEAAIJJGO8zCLBS9n0zFYK10R2NArMAdcn3Yag4oYPpvE/EvMwoatG
 5qtduel1OkxpUisTNFpn+//SaWeXbOve8zmd18tcAu0V8gKtyy1JlD1Z569p7Q6+KJ5QMaFKT
 VansgXgQDiRA9jvzQC44sEkt8wucaAPL8qdWjwJlgOqNXzaNXwVJLmvJecf+sLq/yRUqH+icx
 nNatDx9nCwNtIi8KG5XJ8pmvLxMYLE3hOAzNzPYr6EDgnBYgsgh/rqr0H/jv0ETQ5Wy+6hRwL
 d7GO5v8TDxVy5vTt/0HyT1YJEH+20a8KPkutcngqmnA88STr5FP7GUdqZTTmiCp0koFog3Hkx
 KhnSgmY4bH6B178Wl8qvPa97yaG3sqSbkcWDW+8hrZIeXzB1WOgJns9qKsKqx/D/tip37QNM+
 RYT9E92USrU6WvT3eOv+4ig6Ot3/BbpJWZ1qR5Jq9BO9/O3RwXKMDg21koLDbzmdXsj4InoBC
 3yPi1IWo9vLfqIfeTFZJfjTS+oK8OiWwQkTCNl21tIoqZVDXXAdYTr7XGUfMqkeRmaP0XsxJ8
 ARU1TDbAgt9ygZtxSt+DSrGFNe+Xbcy/c+OIK0HY8Qy9vBYTiH/1QQCamOieBvJi7b4mh4B+u
 YpP73O8us/sJzIz6E8AS0jd2oPL17o44WZo2eRGlMUOzKE4I4gBJqx3Ol4bTMQjXrHDQyeXGp
 sF1GhOWjnBX9v8S6853R0Whiwq4KH1HrTR2do4BWhOuz2FbAKvCqY+86tH/IXzFdrN7HrRrXl
 dFomu6aFUkYT86AMYJWQiesU4MrwuDozp6Z9EaTe1r8zktSjdbrMFANy5FLjH1ek7qmfqGi22
 FcQD35mnf2LYx+jTlcsk1KIajUkybBASpsL5g/fQPQ12oXntKTpC0MVxS0TbuAu3ofV8raRl3
 eWJLaJAzTLP3NGP5x6eo/S9Mbotx4Tf

On 7/8/25 09:45, Krzysztof Kozlowski wrote:
> On Sat, Jul 05, 2025 at 10:31:54PM +0200, Jens Glathe wrote:
>> The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
>> fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatibl=
e,
>> split the model strings in 2 variants:
>>
>> hp,omnibook-x14	compatible to qcom,x1e80100
>> hp,omnibook-x14-fe1 compatible to cqom,x1p42100
> I don't see split here. You are adding a new compatible for the fe1
> variant. It's fine to mention there is fe0 already, but main point of
> commit msg should express what you want to do and doing here.

Isn't the effect of creating 2 compatible strings for the same model=20
with different SKUs a split?

with best regards

Jens


