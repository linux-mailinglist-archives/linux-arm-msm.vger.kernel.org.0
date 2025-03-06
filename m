Return-Path: <linux-arm-msm+bounces-50571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA2A556CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 20:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5BC71890DD8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C4F26B08E;
	Thu,  6 Mar 2025 19:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="MdWFZ1Dw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9A25CC6D;
	Thu,  6 Mar 2025 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741289656; cv=none; b=bT6oknnD7UFXc6377pxj9sjBkhcvDYOu02cVfSOzfA9tdnBdBenfMFquCwbyNKhhLxBysNkEEaEktxjjwwZ1kCiyOU4qEZ2eGpFbPxvGks+3rXOrtMJOhhqZELrOVEH+rFUefMuSUPeJsFQGHeIUf/mzapkA9Jz9SDDwIMNDUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741289656; c=relaxed/simple;
	bh=Md9W1nZ8uox4KDKTV5T60vg3lFfOHXf/ttYEIwyJmTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldtk5XXt+Sl2TKgeqrVnYdHwENaSKHwTBddQ0wc2ybhSMWJdhyG9+c6fqhwh1RkeqKtSXYzFU0c07/E6/XKKk3rAw0FXPSManP0/lwHRO9vvgCg94f6SxoKD+ZFKmeYmC009h5TpZlEcNSgL5L8Owp5XW6kRL1xjnoJsIwBkdYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=MdWFZ1Dw; arc=none smtp.client-ip=77.75.78.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Received: from email.seznam.cz
	by smtpc-mxd-85df84df95-zvkwb
	(smtpc-mxd-85df84df95-zvkwb [2a02:598:64:8a00::1000:a0e])
	id 05ca8f605ec4db090463433e;
	Thu, 06 Mar 2025 20:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
	s=szn20221014; t=1741289650;
	bh=bxJZp9qPOV1Kif4TBfq5HSYGLQ4VDImZDFEN9weBs5o=;
	h=Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:Content-Type:Content-Transfer-Encoding;
	b=MdWFZ1Dw4DDcMmLd2/t2Bi4Dnlm+UUgcACKGbanmy24EZHKgolPg5Drrni6RVQq6H
	 dgDIX7eVl57J2/A984D7nX4JMIZ1jQYZU7LD1T3Br13YT+VSX4/QHG0aS7O7tEAbFZ
	 308reImcLWOtPmvx1isW128JiBXGluDr9qdlxNxFGU/WMznH0MIrc49wSvBrhc/YFu
	 xrSwtNY05KWeqi49q2uUkfcq7UBMLJTYMM/A75uudPl3xGmWUNWpC4oENUzXx3rjYl
	 FR91gur/J/DkHzQDBuW9g0iJQLTAW5b3ovawUCmhCO90shgeOJjLKmLzqCaLGgGZfM
	 VKrbsmj7MYVeQ==
Received: from [192.168.0.240] (ip-111-27.static.ccinternet.cz
	[147.161.27.111])
	by smtpd-relay-6bc9f4444d-zcqjp (szn-email-smtpd/2.0.34) with ESMTPA
	id f1197a66-db6d-465f-9dc4-2735ed061162;
	Thu, 06 Mar 2025 20:33:13 +0100
Message-ID: <13043fe9-4669-4f72-baf2-ef86e4b3546b@seznam.cz>
Date: Thu, 6 Mar 2025 20:30:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Georg Gottleuber <g.gottleuber@tuxedocomputers.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wse@tuxedocomputers.com, cs@tuxedocomputers.com
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
 <58d6c774-2976-43ef-aa04-b339df4b6ff1@tuxedocomputers.com>
 <bb7a05ec-ee68-4f2f-a58a-b57d12317e18@oss.qualcomm.com>
Content-Language: en-US
From: Michael Srba <Michael.Srba@seznam.cz>
In-Reply-To: <bb7a05ec-ee68-4f2f-a58a-b57d12317e18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06. 03. 25 19:15, Konrad Dybcio wrote:
> On 6.03.2025 4:22 PM, Georg Gottleuber wrote:
>>
>> Am 06.03.25 um 13:50 schrieb Konrad Dybcio:
>>> On 6.03.2025 1:25 PM, Georg Gottleuber wrote:
>>>> Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
>>>> Elite SoC (X1E78100).
>>>>
>>>> Working:
>>>> * Touchpad
>>>> * Keyboard
>>>> * eDP (no brightness control yet)
>>> in case your panel as a PWM backlight, you will need to set the PWM
>>> output pin function explicitly, see x1e80100-microsoft-romulus.dtsi
>> Thank you, will check this.
>>
>>>> * NVMe
>>>> * USB Type-C port
>>>> * WiFi (WiFi 7 untested)
>>>> * GPU (software rendering)
>>>>
>>>> Not working:
>>>> * GPU (WIP: firmware loading but output is jerky)
>>> Please tell us more
>> Oh, this is already an older thing: with kernel 6.10 loading
>> gen70500_gmu.bin and gen70500_sqe.fw leading to partly slow and
>> stuttering video output. Sometimes it rendered black edges / borders to
>> KDE menus. Surely I did something wrong.
>>
>> I have just tried to reproduce the same setup, but I couldn't get it to
>> work just now. If you are interested, I can try it again with a
>> new/current kernel. (which is preferred? linux? linux-next?)
> linux-next/master is good
>
> [...]
>
>>>> +&gpu {
>>>> +       status = "okay";
>>>> +
>>>> +       zap-shader {
>>>> +               firmware-name = "qcom/a740_zap.mbn";
>>> Are the laptop's OEM key/security fuses not blown?
>> I'm not sure. How can I verify this?
> If you took the ZAP file from linux-firmware and it loaded, they are
> not blown.. meaning secure boot (not to be confused with UEFI secure
> boot) is not there and anyone can replace the entire secure firmware
> stack with what they please
>
> Konrad
>
Which to be clear is probably something Tuxedo would want, because it's by far the simplest way to ensure that the person who buys the device can do that. Even without the SPI flash being write protected and requiring physical access to unprotect (which I believe is what google went with for chromebooks), afaik Linux can't access the spi flash in the default configuration so it would still not be particularly feasible for someone without physical access to abuse this.

Although I'm a bit confused here, because to my knowledge being able to replace the "entire secure firmware stack" before it even has a chance to run (which is what anyone wanting to replace it would presumably intend to do) is considered a privilege escalation CVE by qualcomm and is not something you are supposed to be able to do without their blessing. I suppose they may be a bit more lax about allowing the OEM (and therefore the user if the OEM graciously doesn't lock the device down) to skip XBL_SEC (or whatever it's called now) with TME now being the first core to boot, which would certainly be nice even if it's literally "you can have it as long as it is no longer equivalent to full control over your hw, which is what you wanted in the first place"

