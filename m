Return-Path: <linux-arm-msm+bounces-95298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEbEFx8cqGm4oAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:48:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C944E1FF442
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0248030BF3FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5E438643B;
	Wed,  4 Mar 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Swfa7IBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65FA35AC28;
	Wed,  4 Mar 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624655; cv=none; b=I/shYuHN58QoMvP8MtJfO6K3roGvVYb360o0AB++la0PGdPwgELjom2LHN1dDbe7tKiLFExVcjQ1/tmPaZae1a9Gpvbmo7YgMmV2zMNQAgm+v6XXJVd9NJ5RkeuqyWbCX4swtV0SlovGF8Sopqtr8hPxKA77pE0XiAHnl1mdMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624655; c=relaxed/simple;
	bh=nKG3HmCguZ3+DYUUqi5mOFXboty3ir5xbAxeHT/p4RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sr5Yu/sZhDCiylNMe+jRxQvNCRAmblVvHi7NUk/KgEz+NSoEu9U/nh15/4rqglgF4Di7I85BB3TTjBDEFUVrHQ7O5ZC3GWtYQ5+OvVZdhFduseEEhIlWktVMVoACaws5pgXFmI3FgwZNNHnqWq2oWy1b1NEZskaiwQ1UMIZtM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Swfa7IBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA95C2BC87;
	Wed,  4 Mar 2026 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624655;
	bh=nKG3HmCguZ3+DYUUqi5mOFXboty3ir5xbAxeHT/p4RY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Swfa7IBegnctrRG1lZUN9DQofUbG8GP8hQbeZQP+OOlg2XeAn1ufLGzhA/ZdK3ZU1
	 4S+SdYdZcaeO4FmOtAyfMiZTdAzaLO5oZCIs3Dkcwies/UWd9b8yZzAPTfASaKKvc4
	 KnRGv9Xkhy89Ld/QvgeFIBNPRHuttZATY7C1L7gPTTRXXPYkCballOQlkHJxd8dIuW
	 bgzdq+kZ8FDLBp4YJ8M0JolRg+r/Z09Le1doXqxapXGT5pL/MdhdqBHvWwjukJIpqw
	 /9pMWPbdcPCkZdwHack/rmiA3D1U1TaxsJjJSE92ShNr7QzdweoChSvk1H/nL6d579
	 hmDVOK4WuvZOg==
Message-ID: <b7a1e40f-e8f7-4e14-927f-1f3000f10377@kernel.org>
Date: Wed, 4 Mar 2026 12:44:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
 <20260301-secret-exotic-nightingale-80f55c@quoll>
 <4cf9c98e-767c-44d3-9e71-bcc790e83997@oss.qualcomm.com>
 <edffecfc-ea3a-4c1e-9e72-58c7c134248e@kernel.org>
 <d3de0b25-861a-4261-8d9b-a3785187bfdb@oss.qualcomm.com>
 <6606bdbc-95b0-4adc-92e5-cad70d250cee@kernel.org>
 <33737c4f-b668-418c-ab03-f27ed3b6fcff@oss.qualcomm.com>
 <cc30861f-1e10-41d5-87a7-496e18bd358e@kernel.org>
 <78d08114-d573-42be-9cff-39c228c68848@oss.qualcomm.com>
 <0be1b15f-df0a-4ff0-ac97-8aaa46dd9b7c@oss.qualcomm.com>
 <7239b66d-be59-45f2-be8a-78d3803d345b@kernel.org>
 <af30d450-b55e-4ce2-ab38-e1706abf3155@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <af30d450-b55e-4ce2-ab38-e1706abf3155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C944E1FF442
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95298-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7b0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.131.57.192:email]
X-Rspamd-Action: no action

On 04/03/2026 12:38, Konrad Dybcio wrote:
> On 3/4/26 12:29 PM, Krzysztof Kozlowski wrote:
>> On 04/03/2026 12:16, Kathiravan Thirumoorthy wrote:
>>>
>>> On 3/3/2026 4:18 PM, Konrad Dybcio wrote:
>>>> On 3/2/26 5:33 PM, Krzysztof Kozlowski wrote:
>>>>> On 02/03/2026 15:56, Konrad Dybcio wrote:
>>>>>> On 3/2/26 3:54 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 02/03/2026 15:10, Konrad Dybcio wrote:
>>>>>>>>> Also not accurate - "sram" is not the reboot reason, which has node name
>>>>>>>>> called "reboot-mode".
>>>>>>>> What I was referring to is:
>>>>>>>>
>>>>>>>> patternProperties:
>>>>>>>>    "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
>>>>>>>>
>>>>>>>> where the 'sram' (not 'smem' as I typo'd above) is obligatory
>>>>>>> I know and sram is not part of "reboot-mode" name. It is "reboot-mode"
>>>>>>> in existing binding and DTS, not "reboot-mode-sram".
>>>>>> In any case, I believe it'd be good to drop that requirement
>>>>> Ah, and one more thing, the syscon-reboot-mode is Linux driver with its
>>>>> own Linux requirements - syscon - so probably not working with sram
>>>>> bindings. That's another reason full binding should be posted and tested
>>>>> - I speculate it simply does not work.
>>>> It won't even probe, we talked about that a long time ago on a similar
>>>> occasion
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/f6b16d1d-3730-46d1-81aa-bfaf09c20754@oss.qualcomm.com/
>>>
>>>
>>> Sorry, TBH, I'm confused here...
>>>
>>> I agree that, DT node should be as simple as below for now until the 
>>> child node is added.
>>>
>>> sram@8600000 {
>>>     compatible = "qcom,ipq5332-imem", "mmio-sram";
>>>     reg = <0x08600000 0x14000>;
>>>     no-memory-wc;
>>> };
>>>
>>> When I add the child node, it will eventually become like
>>>
>>> sram@8600000 {
>>>          compatible = "qcom,ipq5332-imem", "mmio-sram";
>>>          reg = <0 0x08600000 0 0x1c000>;
>>>          ranges = <0 0 0x08600000 0x1c000>;
>>>
>>>          no-memory-wc;
>>>
>>>          #address-cells = <1>;
>>>          #size-cells = <1>;
>>>
>>>          restart_reason: restartreason-sram@7b0 {
>>>                  reg = <0x7b0 0x4>;
>>>          };
>>> };
>>>
>>> which seems to be matching with the binding requirements.
>>>
>>> and the consumer can reference to this node like
>>>
>>> sram = <&restart_reason>;
>>>
>>> I'm not following what's being suggested here. Can you please help me to 
>>> understand further on this.
>>
>> I already asked you what to do.
>>
>> "Nope, sorry. Bindings must be posted complete, see writing-bindings."
>>
>> So post it after testing. We suggest that it simply does not work, but
>> you can always prove us wrong.
> 
> Are you by chance confusing 'syscon-reboot-mode' (write TO imem to set the
> restart reason) with this node (read FROM imem to present a restart reason
> via wdog)?

Previously IMEM was in with reboot-mode, so that is why I am asking.
Commit msg mentions only "restart reason" but also states it is not
adding complete picture, so I am done guessing here.


Best regards,
Krzysztof

