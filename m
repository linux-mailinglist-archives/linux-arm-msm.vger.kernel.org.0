Return-Path: <linux-arm-msm+bounces-51633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F6A655F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 16:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979ED7A9715
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA4524A070;
	Mon, 17 Mar 2025 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="vIrmcCRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937C23FC48;
	Mon, 17 Mar 2025 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225962; cv=none; b=j6m6/2ECmpe9i/rbIWSBlf+l2HdOb9FDWlMNFR9IU94UYTLTG9pOVdGkURNGR3WrhvfKtsQaHqwT4dyC/pPonj7kCtEX5RJL0fys1qh8botrUNQkVcc4vNXLGj9Ol62dqcrB8ZiCz/39gzonqWrCjJHVczI+SH37ypW9DH938dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225962; c=relaxed/simple;
	bh=Sh975lz6XsISdagtutDAXsZPtuyfNLljOxdDiELNgRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8a0UGYvCLoDCo9qpmsCtBkIaWN4SvpPXSxg9kxKDHUgytYr0TLrTW/PDKmhVL9Ybnt1vkYkQpUVY4wG4VVRZQXymeKUm7sDJtZDGC0zIe7vMKdOs6HD+GnvBgHbOcESUgubSBF/j/YMyPUO7Z0PPeTJ4I7DOoxRLrbPq79ogkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=vIrmcCRI; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [192.168.2.71] (office.icewarp.com [82.113.48.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 1FD3B1603F9;
	Mon, 17 Mar 2025 16:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1742225950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HpMXPD7v2TVLhujP/CqwJ0vvCueRnUFka/y/qFcIY/w=;
	b=vIrmcCRI4IJBe6jTmcXuOmAMIo+iQ1iE+GS1hQhvtvyJ/lxv8z7KDl59AkRPhd5b2NfJRy
	jRLpVHjZw/RjFtAe7/ToGJRBlU4gLHOu/OqxzmxiO0MzllISd3U/6SJhEZkKo5jw0IExV+
	97IOuBuwXKzmSqUe7kq6lpLfryrZmzE=
Message-ID: <4cdb22a5-f21b-4240-afd7-822d4167e982@ixit.cz>
Date: Mon, 17 Mar 2025 16:39:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ARM: dts: nexus4: Initial dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ivan Belokobylskiy <belokobylskij@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Luck <tony.luck@intel.com>,
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
References: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
 <174221818190.3957236.3364090534153729086.robh@kernel.org>
 <7z2u2almxk7rnd6cx6nq3ypgbzvttkj3jqawv5jojayjz3foix@zprthr6awbcp>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <7z2u2almxk7rnd6cx6nq3ypgbzvttkj3jqawv5jojayjz3foix@zprthr6awbcp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> On Mon, Mar 17, 2025 at 09:18:33AM -0500, Rob Herring (Arm) wrote:
>>
>> On Sun, 16 Mar 2025 23:16:55 +0100, David Heidelberg wrote:
>>> From: Ivan Belokobylskiy <belokobylskij@gmail.com>
>>>
>>> Add initial support for LG Nexus 4 (mako).
>>>
>>> Features currently working: regulators, eMMC, and volume keys.
>>>
>>> Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
>>> Co-developed-by: David Heidelberg <david@ixit.cz>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> Changes in v5:
>>> - Sorted nodes alphabetically.
>>> - Link to v4: https://lore.kernel.org/r/20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz
>>>
>>> Changes in v4:
>>> - Sorted regulators and added regulators compatible.
>>> - Corrected pmic include and references.
>>> - Moved &rpm outside of / node.
>>> - Moved and simplify pm8921 keypad.
>>> - Added chasis-type.
>>> - Dropped incomplete WiFi node, will be provided in future
>>>    contributions.
>>> - Link to v3: https://lore.kernel.org/r/20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz
>>>
>>> Changes in v3:
>>> - rebased against next-20250307
>>> - dropped backlight until driver gets converted to DT
>>>
>>> Changes in v2:
>>> - lge vendor doesn't exist anymore, rename to lg
>>> - sdcc@ to mmc@ to comply with dt-schema
>>> ---
>>>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>>>   .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 341 +++++++++++++++++++++
>>>   2 files changed, 342 insertions(+)
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz:
>>
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'reg' is a required property
>> 	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: soc: replicator: 'ranges' is a required property
>> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@1200000: compatible: ['syscon'] is too short
>> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: timer@200a000: 'clocks' is a required property
>> 	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
>> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@5700000: compatible: ['syscon'] is too short
>> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
> 
> As far as I can see, all those are generic rather than being introduced
> by the new DT. I'll send a set of fixes soon.
> 
Yup, as I checked these are coming from apq8064.dtsi. I was thinking to 
look into them, but if you're going to go trough them, I'll just drop my 
R-b on your patchset :)

Thanks
David

-- 
David Heidelberg


