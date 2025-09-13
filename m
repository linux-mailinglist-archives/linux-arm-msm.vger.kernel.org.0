Return-Path: <linux-arm-msm+bounces-73403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C1AB56272
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 20:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630AE17DAA3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 18:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7C120110B;
	Sat, 13 Sep 2025 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="bT/7ZkIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D581DED53;
	Sat, 13 Sep 2025 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757786415; cv=none; b=RBfcTbcAUvhixVxraAYI9SAaz9K+BWeGOq9X7KCVAJxCwy54okhxxnsppZMaNB/mdQ0bsZ1EgiK44Mfq4AfZ2fHMHgCBmdb+4rTuME83iTr0j4tK2IVyrq4qtYePdSnHA5rcu8JytmA1rzt0Amx9NUyqRTTjmHgduT9vlhzIxtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757786415; c=relaxed/simple;
	bh=TXw6I/kYsfBBG7IqtW2tmUt15VqqpsmrJknjg4yKz6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Unu4x5SJnEeBkkQF+1zUUDueuwivjYznSQlOAacDEUYm1Es+MHHCgoTWo1DsGFhcbeJ33bFDXxhu92BTyY0I591rLOoXu5+iO29Sdfrml4lRl++JEV5sgU39pkICvUWndRhjyxbwT1GpcXxG7+RSWMbluTi+w0L0Oqu9RNFTtNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=bT/7ZkIb; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1757786405; x=1758391205;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=TXw6I/kYsfBBG7IqtW2tmUt15VqqpsmrJknjg4yKz6s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bT/7ZkIbHSe5jb4DLq9rfWtm+V0lbUaqkKTfa0ZbRm49gRFVDqfhU2spbT+IU5R0
	 PDFhzV3P/lnTm1t+n0AVMfbFcPKBfjb//RtsuD+xBsnmGBsqqvtStxmiSRBAgzSnU
	 vJm5G2O64b1xzuZmeasJL8uc0Dpch222wWSuCg1kLci+xIxqxjg0Lm+anPxJ2584k
	 FZSvcGUm0ilLzSvXsD2wT60DEmiHlwwIbx0daCZsUUU5HeynuuaivwdUDCCfvbeyy
	 9ZcsG4IVC3AXrpRbiGrEfewet2owa8PTG5DdLpOUK9V7Xw9a3GPV7wf4Tqk1T4ftG
	 NV0ZxjinvzCd7bkCGg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MTRAS-1upoGa2AUG-00VKGy; Sat, 13 Sep 2025 19:46:32 +0200
Message-ID: <e160c810-b481-465d-97b9-b2e1f3819905@oldschoolsolutions.biz>
Date: Sat, 13 Sep 2025 19:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14
 device tree structure
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
 <20250710-hp-x14-x1p-v7-2-19c10c81713a@oldschoolsolutions.biz>
 <xmkbzqsiovvozudhcny7giovl5uvg236jjmu2pzkgberh32ywv@wrevolmrrkhu>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <xmkbzqsiovvozudhcny7giovl5uvg236jjmu2pzkgberh32ywv@wrevolmrrkhu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dGdgkn3e7mSYEnSeu/Xxv1Xw9nETyoSHvz0cH5WmCCoKdxqzzbe
 +i8KN/XPzYh7mBkX0ASDsfbQ2V29UkVAc505Fw9TYDW1Sj8RrNIK7hQlxCvlRFcxQfACqCz
 XK39OOmbON5Rrk9RIA8oGbTcaL5FNYc6Kd8kSNv5inmVdb9Lg5k+0Kt3fwZZw+7bJOrM1ou
 M5HAQLNHU7oQUNbtZzeBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nCqeY51JkmU=;pOMNys9FGOqXyHagrFfQAG0W1Yx
 ea6sbo1v48oC5udt0L3M1JWHlWvy46yNprZWKYSsbBWE/8rPF4RRnv4e5cN1CqKVTCr8v5Qv/
 aS13UZHZdMjenp4KcfFfcxW1zy9MYqssP31pEK5MYlMeulPujp4sF5dJyKT7M8/qZD06+0iJC
 aOv5iaStjkzIt6yfRRzdWGO/ZtWxvFkZaD1LrDvFYZLSjYrcctdiH5EocOWGjHEePZ8fEo/e3
 cBsM6Jgi1zGulX2EfK5Sc+Hpt4bBt14tI7scOqfFDkDEO7XLw4LowaWqLoOp6sdd6Pm2tJ8hF
 zmnLHD6PR+H5v29QXjE/6tKUhBMW4sB1pR5IznLy21V3t/ltpoFys1hRluDVuup2ErD7GV+K2
 HkwZixtmcG5yUHhxCfEKwpPmdBT1HXKapSPMuJhYnJUmwQoyqWr6RHIuHv6/i4QzCYTWV/yav
 /alUCAOGF3I0CrHQb6jL40Qq7LoiLRSLAmwY/7+aL4HSqLVmVozOnzbKJBR5psifKNzHojqxs
 +bYVyEof+ZPO15NB3yAcZvKtLP7yjj2zyziWmv9XZ5NjYEDjVxXOVoAzDoPQ/VeZXpO9ED10W
 nokYqRJ3/GUyClSMkpyUZldP8QKptwGvWTw+WwAJutTHDFGiokn6v/XnNKF4mvtjg768aE7qo
 Atb1u//LRjWMuK6xuhNmcrAOml+BxFUiZIxrNaX56F8QsS59X0FMTbsbRW9DB3yz1jUABMxyU
 uZPcNZyDfWAtWuOqu8UWysvTRVV3t72g9ETsEDkhz6A6crptsJ7VAZq3OEwiQztAWmNpeRBta
 h3gYNHhE9sswbuVPF9XECnxe4gk8Az8yO073y3whhvS7brLCFubs0DZeEoHMW8V4lQXhDxc0N
 Tqxq2VxI2CEIeWYv1q1cGbZQ1/hW74wRALQwhlRGcSIWUHOLmIyfyIasQoqirn8YnwJyFnkZY
 jGHhigA92aQwt8h0MtMQAj6Tus0S6hSI+f8jkbLGFUevbhAzpSPcmo5ZYvtEnff4fvoGRObnv
 3K5zaQOlmFsv8e2xRGQZZJYJVgWRAP1Y2PH28fiC3wwwRj86/HaRZHtdGND+U6GHcmhsZn6t7
 MGakWk8BswhTPoAoHzfOgbUDnMsYtCNbfO/gIyI4lEzNQ/+RQ+IO53EXPrc15dCgtZmwqicIe
 DFLuzlHNE2aCWUglt5ZRCK4aNl+a6WXeWUxQJiRe2TeH1KtiG8wLO/d4Q5fAIgraGH2ng4E/5
 fqxFPGGdLQf5unj1uyGbcnBiHG7gnsKAzsvD8vh8O6CiPuM7whrhHbUIHt27t6QEPqATxVgCD
 EatUC9RLtJfSQr7kxt+H6J/QDqHctgX4hYFciryImfpyLzcerxdd62w7e6ZH55RhOiOc2VFPf
 AwmCyxl7jw2D0NrvB8u1jsIF1ez1Z00gdiu0IkY9w+bjQ1dr8jxSmpjWLNnZ+ry/Kg03x/v8V
 7ago4fS3/l9y0+uXIzSa1sSGrtSQ0eN8QkonixcPcgQ6OAOhqNgLHyax6KnDQm8mHzSat7pXS
 7XkpGaMD+25WFpkwDkT4VQ1jGpUor2HlTAx8XAl80tpuJrNXnigM6+sdVeko1zZEmgPYlm7uW
 pQ/A0RxFix2if1+dHoah+hYLFkQHjPu1AT+8yzUH6B4SeDkxi3H3kACNWT4vr/FRtLXHCnxNl
 BZbfF58Is96j7nI96U1cP+TgFPXNNTnUR2A4h4o/X3FuTcZ6hx+CCWYl+tpQYK/oFZtdNwUKQ
 0TTTmO8cGFXmfgB8cSJC1SLBkHeEqBHkRdwV7JOh1DOac7XsDqw3NW1Y=

On 09.09.25 18:07, Bjorn Andersson wrote:
> On Thu, Jul 10, 2025 at 12:50:34PM +0200, Jens Glathe via B4 Relay wrote=
:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Extract common elements into a shared .dtsi file for HP Omnibook X14 to
>> support both Hamoa (x1e*/x1p6*) and Purwa (x1p4*/x1*) variants.
>> Required because the device trees are not compatible.
>>
> This got sitting in my inbox, as I confused it with the other similar
> patches, and now it doesn't apply. Can you please rebase this for me?

Hi, its rebased. [1]

with best regards

Jens

[1]:=20
https://lore.kernel.org/all/20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoo=
lsolutions.biz/


