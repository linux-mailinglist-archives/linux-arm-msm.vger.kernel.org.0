Return-Path: <linux-arm-msm+bounces-100269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNOdH+Ncxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:33:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEAD34297F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A5EE3021EA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC24633ADA7;
	Fri, 27 Mar 2026 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5UZ0QRi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66822DEA62;
	Fri, 27 Mar 2026 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607582; cv=none; b=fMaffZe068jdU052VdAs5nj5C0+RESEvxZnmsErOfQF7AWc3N+QpsSOw05tVr8/pGKAQwR3zyTHxAYzYOKuQEaaX4jeDMLLWx1kPrp9Q5/Ez/NfgZxdpVm41ZicTVZOS46+QBnJqb3FEbmNBM7fw+2VMzSMeHe4squyYMsMOE2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607582; c=relaxed/simple;
	bh=y99k3AxszXoLLqKJdSH9zI8nDHzmGnx3kbvdsI8xFa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKmfq19gVMy8FAQXOAKcddaK/eXfnX7QnCVtbciu3ge5kUC4hZdS9CLuacmBGHw2dUx/VRMt0bdnITZl01u1JXpzGNKt9UVGidpsGTyt0AWeMUOnRhIrur8oIdHnEgCjI8yPwX+eaVO5TiZBUaQqOxLd0Csxs0jQLW35tT5wsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5UZ0QRi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87094C19423;
	Fri, 27 Mar 2026 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774607582;
	bh=y99k3AxszXoLLqKJdSH9zI8nDHzmGnx3kbvdsI8xFa0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5UZ0QRiWqj9+LAcud1/JPDq35sjinNBS2WT60ZvTmkiuuT/PxzWLstP/YQpNookv
	 NBuPYqUn6AjvdCFy71jPDt2hIfUznz1jfmHUydhqdDsEAjfbtQ3on/ZxY9pqqzSopX
	 G22nW4tkmrJRQYjnwr7W3GXgt/Z0Y722LCL5nyrkecJLlK4U0qqxk+qWzwpOmiLAgO
	 7f7Yep5vPaW4T7BEqg8FV/cMssxYty/IDdp4RMy+LwGwRQzpEbJdhWReeVkcm23LGW
	 1D/1yhfxcsQXDP/uAS6+tCWkJsLzWhjfGrlpPM6VFEe1a52VqXAW7Tfuog7kgtSkWU
	 kofiMZXNyqasw==
Message-ID: <9c7521fe-5008-4daa-945b-ce3f5c0f6dc0@kernel.org>
Date: Fri, 27 Mar 2026 11:32:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
 <20260323-b4-add_pwrkey_and_resin-v4-1-abef4e4dcc3d@oss.qualcomm.com>
 <20260323181820.GA888901-robh@kernel.org>
 <20260327095341.5radsv6dsbwptnfs@hu-kotarake-hyd.qualcomm.com>
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
In-Reply-To: <20260327095341.5radsv6dsbwptnfs@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100269-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBEAD34297F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 10:53, Rakesh Kota wrote:
> On Mon, Mar 23, 2026 at 01:18:20PM -0500, Rob Herring wrote:
>> On Mon, Mar 23, 2026 at 04:15:15PM +0530, Rakesh Kota wrote:
>>> PMM8654AU is a different PMIC from PMM8650AU, even though both share
>>> the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
>>> variant.
>>>
>>> The PMM8654AU PON block is compatible with the PMK8350 PON
>>> implementation, but PMM8654AU also implements additional PON registers
>>> beyond the baseline. Use the PMM8654AU naming to match the compatible
>>> string already present in the upstream pinctrl-spmi-gpio driver, keeping
>>> device tree and kernel driver naming consistent.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>> Changes in v4:
>>>  - Remove the contain for PMK8350 and new if:then for PMM8654AU as
>>>    suggested by Krzysztof Kozlowski
>>>
>>> Changes in v3:
>>>  - Update the commit message.
>>>
>>> Changes in v2:
>>>  - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
>>> ---
>>>  .../devicetree/bindings/power/reset/qcom,pon.yaml  | 32 +++++++++++++++++-----
>>>  1 file changed, 25 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>>> index 979a377cb4ffd577bfa51b9a3cd089acc202de0c..2a5d9182b8d5c1a286716ab175c7bb5e39b334e0 100644
>>> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>>> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>>> @@ -17,12 +17,16 @@ description: |
>>>  
>>>  properties:
>>>    compatible:
>>> -    enum:
>>> -      - qcom,pm8916-pon
>>> -      - qcom,pm8941-pon
>>> -      - qcom,pms405-pon
>>> -      - qcom,pm8998-pon
>>> -      - qcom,pmk8350-pon
>>> +    oneOf:
>>> +      - enum:
>>> +          - qcom,pm8916-pon
>>> +          - qcom,pm8941-pon
>>> +          - qcom,pms405-pon
>>> +          - qcom,pm8998-pon
>>> +          - qcom,pmk8350-pon
>>> +      - items:
>>> +          - const: qcom,pmm8654au-pon
>>> +          - const: qcom,pmk8350-pon
>>>  
>>>    reg:
>>>      description: |
>>> @@ -100,7 +104,6 @@ allOf:
>>>    - if:
>>>        properties:
>>>          compatible:
>>> -          contains:
>>>              const: qcom,pmk8350-pon
>>>      then:
>>>        properties:
>>> @@ -113,6 +116,21 @@ allOf:
>>>              - const: hlos
>>>              - const: pbs
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +            const: qcom,pmm8654au-pon
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 1
>>> +          maxItems: 2
>>> +        reg-names:
>>> +          minItems: 1
>>> +          items:
>>> +            - const: hlos
>>> +            - const: pbs
>>
>> I don't understand this. The existing if/then schema did the exact same 
>> thing until you removed 'contains'. Now we just have the same schema 
>> duplicated.
>>
>> What does need changing now that I've looked at it is dropping 'reg' 
>> in this schema as it just repeats what the top-level schema has.
>>
> 
> we have got suggestion to add a new if:then block for the new compatible from Krzysztof Kozlowski.
> 

But I did not suggest to add the contents in new if:then: block. I
certainly did not suggest to not check this patch before submitting, either.

We had long discussion where I asked you how many address spaces you
have there?

Answer above.

And then answer why the patch says the device has one address space or
two address spaces. You engaged me, Konrad and now Rob in reviewing this
triviality. This is on the verge of wasting of our time.

Best regards,
Krzysztof

