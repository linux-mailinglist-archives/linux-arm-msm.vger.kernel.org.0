Return-Path: <linux-arm-msm+bounces-81985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50173C6176F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 16:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 145834E2B82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 15:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FFF26E6EB;
	Sun, 16 Nov 2025 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzOyQ2qm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB0247A6B
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763306644; cv=none; b=S5OPezsSM6FPyeWKyE3PlpHIe2e2K4EYJjNnu5csb4hiyLHybt6ZZ1AZFtKKPTQQP64Xt8EgdIo11S/NjU4zvMjQZKGI0D1NBsPKqv2q2upswMG7OLQ0ec7Jkdc+vgPwoWfx7t7sYGxpXq7yjjRYaWPpUP1DS09Tsm8PVIwlVW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763306644; c=relaxed/simple;
	bh=GY8ijNVyhcPh/mwWEOVVo5WOE9vpx9bjScoGqC1FOK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S/u92BoChJBwH6QAdRJZhDcO3a4kBiqkEfobyTsrak3cgbKRV5QxmBjJDB1nSLuHeqQMmhVULCy1H5eMpSqW2LXu+qdiYWruzrn8X6IPFDuhzDfzmMVZxsLTJxd/0ICxBARxJ84pjbHTrO44u3QoslxNmrYGeQaRQ234b8qPsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzOyQ2qm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927F4C116B1;
	Sun, 16 Nov 2025 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763306644;
	bh=GY8ijNVyhcPh/mwWEOVVo5WOE9vpx9bjScoGqC1FOK0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KzOyQ2qmpj45XffP0pgcdhD6uT1Jjjc0CKjbJtKKk0jTrL++btOtRLsjseK3E4eHz
	 Gt86sTKDdQ1ikv1YvznPyd6TMwO+cHAIcptbYkitdaJ9MN3NrFTr0U1w5vt4ly0UP2
	 PgnlMf4OI9oa8Qw7rGMIz5HzSSjPmWbKsdvUyzmMVIO2jFpRuB6SPmc45XeLLf2W9W
	 aI3k6naqeL8bMzc5441XZFM5eUOElYmMpDGc+P0o+DHJeVH+B+F/qeBfSZzQi7PusC
	 G+uy25lHoTFbYy52tOGo5M5rmGci+LEdGVRNi8nIdBCWVG28f0Yi5iazLrrhRkaPJ0
	 jZONuH1JTYQlg==
Message-ID: <e6efb381-f4b3-48a8-a0fa-a6ea9987bcf7@kernel.org>
Date: Sun, 16 Nov 2025 16:24:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family
To: philmb3487 <philmb3487@proton.me>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <9nTdr-7UlyytB3d5Iz0IEGrAAzjPipf4NEiZvLMmpk9OmCmRuL346OxjZgpLkLdG7dFYE_rj-5aibg7bhYHrQmjwo1e096-2IGhfi1rKglE=@proton.me>
 <66d58b6c-aefd-4848-882b-51770f7020f3@kernel.org>
 <Q4eaiByBMrzIsd0C_0QEVlu5wPEW7kRn_1zqqWiu-Jmc7wHjVfBTftv4oiLtGzJiN5dYh0tCagJEh0A-2siXiRjEe3y6QBBvEmGoiExRvfo=@proton.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <Q4eaiByBMrzIsd0C_0QEVlu5wPEW7kRn_1zqqWiu-Jmc7wHjVfBTftv4oiLtGzJiN5dYh0tCagJEh0A-2siXiRjEe3y6QBBvEmGoiExRvfo=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2025 16:13, philmb3487 wrote:
> I'm a bit overwhelmed, submitting is quite a complex process.

Please do not top post.

> Do I send an email to everyone mentioned in ./scripts/get_maintainer.pl ? What's the difference with sending an email to linux-msm ?

Answer to yourself - why would you skip some maintainers? How person can
get it to the mailbox if you do not Cc them?

I have feeling you did not read my message, because I pointed out also
the command you must use, so yes, to everyone pointed out by
--no-git-fallback.

> 
> I've never used tabs before, but now have to. I can't get this error fixed in emacs, does emacs support the linux syntax format ?

I don't use emacs, dunno.

> 
> WARNING: please, no space before tabs
> #28: FILE: include/dt-bindings/arm/qcom,ids.h:286:
> +#define QCOM_ID_SM8635P ^I^I642$
> 
> total: 0 errors, 1 warnings, 13 lines checked
> 
> 
> Also I tried subscribing to the list, but then I got 500 emails in a day. What's the way to manage that, or if not, then I just don't subscribe?

The only subscription needed is for arm kernel list just to post.

Best regards,
Krzysztof

