Return-Path: <linux-arm-msm+bounces-93367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOvDBoftlmngrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:01:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B316F15E1A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEC6B301C14F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0317033D507;
	Thu, 19 Feb 2026 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1n9cgQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18CB324B1F;
	Thu, 19 Feb 2026 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498876; cv=none; b=llsVrIMvEQB7mOp76vbKffzz8CUZyF4mtySYCLbtfA/uVt+ZL1hwvg0KOwRuUyoYyeplAI6RropNe0YmfiWIfBi8dYcZRZwDWau6DftI8G3GHADkZQRJdcSyDe74sKrwui4mgPOWyxcVF9i6io+pvhEh+yDnzHORStaXM9PUGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498876; c=relaxed/simple;
	bh=miZhDsMWmagt9nqGKuiS3OD9emZt6QV5Ry0UEmS/4po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kf6SrtnI785pScYgbmvlGe1orx7TZRIen2ayGTrPN8JnAziFyvBwByCOTNwU0PTbZpO/YKHforCwMP5w0WuxyUucGsXaq+N42t3KV6W3avWP01KUdCshSIIfNBYtKtLr8/jcaBss1FJX5FvYVUF4kfkeYqAAskZbabqLRRA3PAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1n9cgQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29A4C4CEF7;
	Thu, 19 Feb 2026 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771498876;
	bh=miZhDsMWmagt9nqGKuiS3OD9emZt6QV5Ry0UEmS/4po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y1n9cgQEBqIXOQAWFUbCpZdFC3l8BjKe1y8eR9Z6TkGLC/VejI1TwVZGVyPUmZskJ
	 OrjDrAwZDRl9AC1si/SBjVifGqOA3w3TkYqarItNpkwWLFJ2stN4L9zr6HVSBhvxFL
	 C0/kSvW8LN0eH6o2gETAC37x5TzEhgVc+xvJQF/eRdR2ZVggOQ5veZhSNkmUuHOOL6
	 Ahywd9m/jWGnLCR9V+8aOpaGe3Ic6snwLPyJDccqpbn11ggUa8kuDVvQbcXI5kRtz+
	 SN5otb/DPJtu0RpTTjZwyLszvWgIgUWwAlL5i/67QpWlMYhrMkTk9wdkYpeU33nXs2
	 xW7gujRLlQKHg==
Message-ID: <00b3d8ad-47fd-429f-9c46-aa540d4257ae@kernel.org>
Date: Thu, 19 Feb 2026 12:01:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables subnode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-topic-ipa_imem-v3-1-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-godlike-silent-owl-0a8487@quoll>
 <36f0a71c-a8b7-4aaa-81c3-1945b268c57f@oss.qualcomm.com>
 <0bfcb292-4e49-4047-b631-dd3029b43f1c@kernel.org>
 <193d236b-864b-45bd-b0a9-6efbdccf6db9@oss.qualcomm.com>
 <9bfb4ef0-49a1-4127-aad4-2ba1b9dd8e95@kernel.org>
 <ac568d38-adae-4fb6-8f12-1d3593d9843b@oss.qualcomm.com>
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
In-Reply-To: <ac568d38-adae-4fb6-8f12-1d3593d9843b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93367-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[foobar:query timed out,foo:query timed out,0.0.4.210:query timed out];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RSPAMD_EMAILBL_FAIL(0.00)[modem-tables.0.0.4.210:query timed out];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.4.210:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foobar:email,foo:email]
X-Rspamd-Queue-Id: B316F15E1A7
X-Rspamd-Action: no action

On 18/02/2026 14:32, Konrad Dybcio wrote:
>>>>>
>>>>> If you'd prefer a blanket pattern declaration with say '^[a-z]@[0-9a-z]+$'
>>>>> with just a reg requirement inside, I'm fine with that too
>>>>
>>>> No, the problem is that you do not use the ABI here at all. Neither
>>>> would you use the blanket pattern, so my question stays: why adding ABI
>>>> which is not used?
>>>
>>> The subnode I'm trying to introduce is going to be consumed (via a
>>> phandle reference) from the IPA node, as done by the remaining 2
>>> patches in this series.
>>
>> And that's the problem - I do not see consuming child. I see
>> of_parse_phandle to sram node, not the child.
> 
> Ah, I just realized this series has no DT examples..
> 
> The property I proposed to add into the IPA node&code is indeed
> named 'sram', but my intention is to pass a phandle to the *child*
> (similarly like we pass a phandle to the child of a nvmem provider
> rather than to the provider device itself)
> 
> i.e. the design I envisioned is:
> 
> imem@foo {
> 	...
> 
> 	ipa_modem_tables: modem-tables@1234 {
> 		reg = <0x1234 0x1234>;
> 	};
> };
> 
> ...
> 
> ipa@foobar {
> 	...
> 
> 	sram = <&ipa_modem_tables>;
> }

OK, this explains my questions.


Best regards,
Krzysztof

