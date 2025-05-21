Return-Path: <linux-arm-msm+bounces-58949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C392ABFB34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 18:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5AB87AD0F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E30222565;
	Wed, 21 May 2025 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INlfdw+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230EA19D06B;
	Wed, 21 May 2025 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844807; cv=none; b=qFUCjLs3H5MU8zuPYPncSCu8AqdJSvcc9sIzyUBall1XyTjOINPV2FqNOoI/3iKPP9s563ZOj6QEWKJp6RAj4qdnlfmYzTymRqqcKqd1o0EfbMN27xKuQmlUsegUCnL48uoW4vUD6HNh5yiaw00VSimfCMRNzGRZe/6IpEfvoDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844807; c=relaxed/simple;
	bh=e8B7QaaNHQIZrf/7IajtCOXeAnmNGd6fcL/DqQeHJkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCw8InjPJZD1gWjV2I5FILZ4c8Tb/+ucUNb7SwCV+YLT8h7To3JzhYvmIFOGpn7vNRn2KzFTbcCFYKl8y5N4stDc559DyBnhVdjdxcVAGw1mHYlnXuGpsgtx+Am8jnafrSKuDTcMXBMnaT1hnzayD96jfhRhe2kJOGDQ9u5LaZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INlfdw+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E65C4CEE4;
	Wed, 21 May 2025 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747844805;
	bh=e8B7QaaNHQIZrf/7IajtCOXeAnmNGd6fcL/DqQeHJkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=INlfdw+ECjfX5UG+Q2U4RmEQmWTks+4xs6WtL3jU/LjLUpa7WsKJCRMw7/Vi62w5U
	 stiqXxXIX0Tu5zZj6myhqCmwwRbjtsSq1Z2QQN4GV+HO9wDkwDMIHkxvz4R7dcEFL+
	 B2ZJSRhwRW6Jc33zwY/F4bVuOHXwFqETIk9OSe3M3GthBUHwFkfhr6jKcKsWr8ZEl9
	 4UKSKr+KrQ1BKPiimXHRbgaxOmi1JiEn6iplpj1k495H4BO2nAp8yGHLNCSkMD1arM
	 gKLXB5N9yeSQCbOAx5XNt4xllwwjIwvzkxDQxxP3ovIxNhAXV3o9wIL8vsDedKavv6
	 8yJXJdw27nbKA==
Message-ID: <9df2f9f3-289f-4916-a293-ad5d97d530fe@kernel.org>
Date: Wed, 21 May 2025 18:26:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, kernel@oss.qualcomm.com
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-2-quic_wasimn@quicinc.com>
 <79eb2b17-06ee-42d4-9954-a78ada1ced29@kernel.org>
 <aC3y0PPA8qrvmobw@hu-wasimn-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aC3y0PPA8qrvmobw@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2025 17:35, Wasim Nazir wrote:
> On Wed, May 21, 2025 at 04:20:53PM +0200, Krzysztof Kozlowski wrote:
>> On 21/05/2025 16:08, Wasim Nazir wrote:
>>> QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
>>> Unlike QCS9100, it doesn't have safety monitoring feature of
>>> Safety-Island(SAIL) subsystem, which affects thermal management.
>>>
>>> qcs9075-iq-9075-evk board is based on QCS9075 SOC.
>>>
>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>
>> This was already acked twice by two DT maintainers. Apparently we need
>> the third one.
> 
> The previous acknowledgment has been removed due to changes in the code.
> Since, here I have removed the som compatible so though of getting it
> reviewed again. Som compatible is removed to make it align with other
> sa8775p & its derivative targets which we are trying to refactor along with
> Ride changes in other series.

Nothing was explained in cover letter and dropping tags needs explicit
mentioning. Nothing explained about first tag being dropped, either!
Read really carefully submitting patches and your internal guideline
before sending patches.

But that was not about it. It was about us spending 1 or 5 minutes on
your patch every time, because you send something not ready which your
company decides to change thus we need to spend time again, and then you
change it again, which we need to spend time again... do you get the point?

That is not fair. Your marketing changes should not cause more effort on
us. And this is not the first time.

At least I do not agree on that. Anyway, I explained my point of view to
Bjorn and Konrad. I am not going to review this. Maybe you will be lucky
with the third DT maintainer.

Best regards,
Krzysztof

