Return-Path: <linux-arm-msm+bounces-64057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF901AFCD90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56FF11C2166E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C622DC35A;
	Tue,  8 Jul 2025 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="IzdQyrzy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6402256C8D;
	Tue,  8 Jul 2025 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984785; cv=none; b=WQuJv/a4dT2l3yZRJqAMLdh5B/4udJMA8EL8jy+i3wUBf6cfyiQPbBbjr1EKoye2zaF4PnOM9ZNlZQ/SC3j+51yp2cK+zEgXWoOJ0J/BkFfIE7KVRkOq9V5nrLdKotLRe0q/v4ZB41vcPeZ9SolFbSGMnSxPb6wIfcBo0gV/os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984785; c=relaxed/simple;
	bh=eLHqOgY/Kam9Yul/6rWRwZsf9nmBsNnDW90wqEqwtKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b52V0uxMDFdvUGOJ6fwwwI0cMKTDhS32a/dd2/27AlaX4MnjDjtWBjzB3nCUk8aNJ3/dcnV3orsoaMKrqShm9MWmqXXLAEUpwyOj/9Hv4MH/Q2H4WAyPkCi1sR1/eNw7vH22DgeojI+SNW6Jmn0c+3aaiA9/VQpQGXarjzMkdxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=IzdQyrzy; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1751984774; x=1752589574;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=VsAlCDCkjDI7LKIRfuSagRW/75+w6kpNx/r65jw8OiY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IzdQyrzyOGfu4eved+6Q+dG9yRHdYsYihk8CkQMJDLZ+V3T06J8X4mRqV0oc0n74
	 jEawsvRYO3v9mmAth6qZnxkyJj/5V+abbBU32mVe16/ZCb6hxR241a3rqkazvYA+k
	 44gzt4jm84yPY2wSAfY618qrsMyuUbLRa07ZaqJ7a2qH3sQILBwvL5HVq3tr8g5Wn
	 r5G3Dcgd1utvgRkMGaV5UahBS13jEWvEQ5xHvkVkk0cygy2+cmdrBqg2HkfwnPpov
	 6HIctegfQQLWkqAlS/1CLMeXEizIE77Yh5ro+hzSGRuwoyx+TwJcnn6nNRW88Abny
	 CurNH/yd9W/m7mDuvQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.192] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MFsAJ-1uRhZB22Pv-009Nvp; Tue, 08 Jul 2025 16:26:14 +0200
Message-ID: <2e6dbc0a-9c96-4d53-86dd-d14321cc755d@oldschoolsolutions.biz>
Date: Tue, 8 Jul 2025 16:26:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: x1-hp-x14: Commonalize HP
 Omnibook X14 device tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
 <20250705-hp-x14-x1p-v4-2-1c351dbeaf18@oldschoolsolutions.biz>
 <a8d28a19-0730-48be-8e0b-21892a89aa7b@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <a8d28a19-0730-48be-8e0b-21892a89aa7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YR1kqGsMLO58TrYEPEMdYWi6nddhrx3NSPH2VahlGF1eKfFCmUz
 3S0BaQTHsVDB6GWQvDTxDrRrrtUHuA09V1Q0jiUa2qcjnxMR5Be7M+Rd25Z0AeViroqUuTf
 I+HWCxJ63dZCQ7fdrGA5AzMlQQkvdRbReUcGl+2UbpETkfGIH1Cnyh5D0ZAPoEaKC+/P5Cu
 6lbXgEQJv+vOMvL04Ns1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n2CNvauAuXQ=;bcpmfqmRHrXZcwZyWC8Ob7othe+
 9dNIsk3rtxfZFJNOgpyP8mw3kmMlaEXK1pQLZQHYGdR12KJ+iZ+MuYCqnRtoX4VCbaGIKt21z
 8NQtfighkuj9dAyiIy9A8FAmsKL0cB8v88/SgGtevBjJIATFzf2akxAUl8ZeuubiM/xPHTEuP
 XV8XFATq6kEI8RaXUGcbAOzAmX0VofQYG7Y5wKjR3iG+mqK1y8zk6wjsJjGTv8Ldz9986njGD
 SMpZnDJeozfpzWLQDOCfXzfhr4owO4FxwpvqRFxJ1jqjGwWxGoNKRoYPvH4X7w07iLYEeSSs6
 dL5CLy4qKKTBEHGjnhqWJb2p46VKQhr9GtJdPgAQo+HvCegVunvE5MSEP1Yy8bCa1l3yv4TgF
 Q++L9P2rSDucMYfKWQNkwN6wOVZEKCQkp+6qZIIfzeLJFQ4Z67QlPd8KSZKqpeGpTWAgB8j0n
 BJH020XeXNwO5BEKSLjYFnRmTaqHZKSLchAcysnP6xpiYrfdLDwZQOiOhgK/g3yNjpyV+jtjb
 4N3GVueydGPaEU+xt2ydeKfojwkX4SgXrCgtdZym+nWcU0GAyOm+N1C0IsN4iqTAJpoUJ51p/
 HlzMq9WFBHtHmQhK9FiEtA50TMSnoQaQlRoRRJP5I/4PqBNplEAAk75Y4l1jtYgiOLO9fjEa4
 4X709lDmzaJvYfHeymGU+T8xl4iXTrO64/aPQUGP2GJOvPeGyagbna4YHi/w929jb542uouje
 wbGk+GBjsol/FD+JTMkl4sSW4lOyGdfV2vE9OkuFgj4EkLx19S3vvhNVicuHn/a7PXaI+tL/D
 gPprVYOJBXOr69P3fY2B7CW2993qIFFetysF30GczMYeUJDwAdSSuNFY9maz66hjSlPlB/Qbf
 w+fs71im64WdKxbvardekTmPTL8s1GSQoOEKXb+hi71a/AJWA1wVaiis7aL5M9i0uylUYI9iT
 COLxE+vcTaXq25xq3HGe4kuoPjx/bmpXObE35I8dyYbyzJQjaZESr5P+4zkr9X0P2bNlbAGbI
 Ac/akP2l/vGAqCETJ+MPphY9UAyNRwjncfHpKOnYxk/ApKkx7vEYCYrU4wdo0eq9sNWY6hk4L
 kQA3Yt5W7RuHVM7/Kdye1BE5iQ19yZmo2zuZNMMJY1hVaYBCtQg1p2/I8CtVxXs1q1a2kVujx
 0wFuG1nbhsPZ9y4VtGIRFm/bhRpUQbwesglAgEo5lh6mlM7zEM0JHppSRZGIcVE3UrqxiGi1E
 RW6cOnNOUiREa4oKDvJRHHJilBn+siEEHmYvxcjsNf25Be3BWB8vyo5Nn+TEZn+aSt+NupEdE
 hYGbNpqPJ+GSSM0F1usZWlfpdiUsDG2IILcNKb47VsUxdGrhKjdo/60Ia8ntxmwjDXyLGJ7f4
 1B71vKV1m0We0jbeytbPPbh7CMU6manrmVT1Ne09Wo5sYpPhRgkKbGg2+YKK2YIbL5+tZQtJ4
 qrlZ9M4zY5p64tRL3fYSFH6lakW4BarAX5cGGZD7WcmfqWvsIxd8FTYdO871qoq3vvXRKrXW0
 J3MTZAQDBo5RftbBBjUQOKCOOTnO0frVGQbcan5Q52cqDYI9AlLdC5YFfAbBFj95Hy4p34/zu
 9xc2+ewvN/jZqbYAPfQmIQ9g4ishUCB

On 7/8/25 16:17, Konrad Dybcio wrote:
> On 7/5/25 10:31 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Commonalize the HP Omnibook X14 device tree for derivation of Hamoa (x1e*/x1p6*)
>> and Purwa (x1p4*/x1*) variants. Required because the device trees are not
>> compatible.
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>
>> +&gpu {
>> +	status = "okay";
>> +
>> +	zap-shader {
> Ideally you could switch to using &gpu_zap_shader {}
>
> Konrad

Since I need a respin anyway, yeah. Will do.

with best regards

Jens


