Return-Path: <linux-arm-msm+bounces-85922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C778CD071B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 16:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86FD030F7542
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE7533C1A6;
	Fri, 19 Dec 2025 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcAWcoEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB9338935;
	Fri, 19 Dec 2025 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155979; cv=none; b=eUaJQQQH3c7ZnEeOxJTfSrLvd20m1zI9Wl4Tp0fGl4W0YFsWQNu+G0JF0AMUponll/ClEAFLx10f8DJhxBFoiXx5ReNy/I56RTLcO1YarWBTMiDX3sBQCjb4WuVCItQBbJVFvKNMcGl8q4iY3yrH8s1JEB1W8jLp4Jm6/WVBDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155979; c=relaxed/simple;
	bh=YP7lb/tia1LJhyshozaR4x6Net2qdgEZZ3mSCgOVtQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGe+31aqjPZ5zcKdq6UK/dneK8Flr3r1gkBSck8D3XOwUFIEW1ui3R7zTmr7ct0lDoQognLKEbaB0rv0ty+Kam2kW+xLAtM88VLlJXHjg1iuBGSmkQFLpxY4fibw949iyy3vfXV+FGHOM+om6vcIEqoWxFyKs+xOmCIjIPprWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcAWcoEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFA5C4CEF1;
	Fri, 19 Dec 2025 14:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766155978;
	bh=YP7lb/tia1LJhyshozaR4x6Net2qdgEZZ3mSCgOVtQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AcAWcoEYH8VwkrrjR1/s+Z/lOG1WofuoErDMOSWrfASq3tesRnmJ9aOQvpe8haO3W
	 xhrZiE1DmAO1iZCvxUwBC8S/UcnN4j+fX/t2GyXqBpW+OPjgK1HOb8SMkT1Dn4yW4+
	 OtG84HtOaGbOW5alWaeitHuDaZxRXCyD/V9Dk+frXcBrZ82pmzabtoXU/EQLTJMQGC
	 xm/aAzY1L13djsnjTJXJ4yZcuUlPNcnbq24B7sQMyeYo2VMU4snslJWTJwgJVmeX/b
	 Y6ygYNAgoE2oqEZR1iiy2CJ1fo1BM17nf9rWnUyeJUut0lq57Kc/H2eD7YQq2uexhp
	 iAcFstWLbgfkA==
Message-ID: <abec3933-279d-4111-8adf-a2e1280ce0b7@kernel.org>
Date: Fri, 19 Dec 2025 15:52:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, krzk+dt@kernel.org, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2025 05:34, Alexandru Gagniuc wrote:
> Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
> schema. The text bindngs incorrectly implied that IPQ8074 needs only
> one qcom,smem-states entry. This is only true for QCS404. IPQ8074
> requires both "stop" and "shutdown".
> 
> The example is to be added in a subsequent commit that adds the
> IPQ9574 binding.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

This is not v1, but v2. Look - what is this "dt-bindings: remoteproc:
qcom,ipq8074-wcss-pil: convert to DT schema" in my inbox?

And what is this:

> 
> ---
> Changes since RFC
>  - rename binding from ipq9574 to ipq8074
>  - use a real person instead of placeholder as maintainer
>  - drop redundant minItems and descriptions
>  - merge if: clauses as suggested by Krzysztof
>  - various other fixes suggested by Krzysztof

So not v1?

And now run b4 diff and find differences.

If this is anyhow weird (although how counting from 0 or -1 or -2 if you
have 3 RFCs can be natural?), then just use b4 which would solve all
these problems.

You also miss cover letter, which would be easily solved with b4.

You are not making it easier for reviewers.

> 
> I used my name as a placeholder for the "maintainer" field. Krzysztof
> mentioned to get the "SOC maintainer" using get_maintainer. I don't
> know how to do that, and I don't see anyone listed for QCS404,
> IPQ8074, or IPQ9574. The bindings apply to any of those SOCs.

So you run get_maintainer.pl script on the soc DTSI file and you got
zero results? I claim that's impossible... but just in case please post
here the commands.

Anyway listing yourself is fine.

Trying to see what happened here:
b4 diff '<20251219043425.888585-4-mr.nuke.me@gmail.com>'
Grabbing thread from
lore.kernel.org/all/20251219043425.888585-4-mr.nuke.me@gmail.com/t.mbox.gz
---
Analyzing 15 messages in the thread
Could not find lower series to compare against.

so this patch will wait.


Best regards,
Krzysztof

