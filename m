Return-Path: <linux-arm-msm+bounces-71548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E06B3FC63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EDA160AD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4B328135B;
	Tue,  2 Sep 2025 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZueIHmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1E2280309;
	Tue,  2 Sep 2025 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808852; cv=none; b=Gj2jYV5pTKAnAse7xu6x8CPDwvmCi1Jg0zRYOG6P/TFpCzyd/bIUL/1bZ5dQdUIIkOq6sXiERmlR95JLvO6rLnarl4slKeLI2MiofkyvWIhhprpA3tHYQFCGPbZohUY+lPI+5CGQYjq+W87DUEcbXTlN2ZMQ6D+nYDR+iTFuWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808852; c=relaxed/simple;
	bh=9vY2iPUojXBGZ3yZLfzoQea5xlgAlLhFfTMphrasNFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ime6xR87acm1F63bl5WgaDwIeJ6NQr+nWHziPHoHX1ctQ+jpSIOjM0UfKHg+kZrDejSbIBNthcXQvY/IRs7AjUKy94EIwFefNF/zs98G4+c2ZxNFE79zDW/HU1krC80z082eUCZiwTM6/wKX//jPgJwRJTdUCIjjuMMfgMq7FtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZueIHmC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED27C4CEED;
	Tue,  2 Sep 2025 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756808852;
	bh=9vY2iPUojXBGZ3yZLfzoQea5xlgAlLhFfTMphrasNFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tZueIHmCfFvlETbVgfvgVVDCvWiCpO+6mviNIrMtE8a4njLtAkQrXUVBb42sDXXG/
	 n9Tlt3oFrvb49i2vS8i+2LO+qvN+pX3016ic3+IoXt8UDH5ZuiMwwzFi+vuZ4oH2wV
	 Ui7725GUuUjB+BLir2miG0mjz9fE20KQDmVWwcD1OyPWrSS0Sjnr8qqQClilH+YUN2
	 bQk6l1vAi1ZSWz7Q9BNsxdIS3A8WU/bLI6UGygQdrpbdp8DVAPzF1RlQ7EGsB/SSjl
	 3Fp3rqj/zs/ye6sBFYQV20SV7O5ZPclb/Z4Y+/840688ztXokhAMb8xBoonfeWEXyx
	 X5u17DKhHRKVA==
Message-ID: <c0ca6ca1-ffee-4b12-bf96-ee9efb93c4d2@kernel.org>
Date: Tue, 2 Sep 2025 12:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
To: Sebastian Reichel <sre@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
 <ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com>
 <pslvca6j5fpr5dgvciwlaz3fubnkjq5olfontaaytt56xs4bvk@5typdoosbreo>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <pslvca6j5fpr5dgvciwlaz3fubnkjq5olfontaaytt56xs4bvk@5typdoosbreo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/25 6:10 PM, Sebastian Reichel wrote:
> Hello Mark,
> 
> On Mon, Sep 01, 2025 at 09:48:39AM -0400, Mark Pearson wrote:
>> On Sun, Aug 31, 2025, at 5:28 PM, Sebastian Reichel wrote:
>>> Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which
>>> is in theory compatible with ThinkPad ACPI. On Linux the system
>>> is booted with device tree, which is not supported by the ThinkPad
>>> ACPI driver. Also most of the hardware compatibility is handled
>>> via ACPI tables, which are obviously not used when booting via
>>> device tree. Thus adding DT compatibility to the existing driver
>>> is not worth it (almost no code sharing).
>>>
>>> The driver currently exposes features, which are not available
>>> via other means:
>>>
>>>  * Extra Keys
>>>  * System LEDs
>>>  * Keyboard Backlight Control
>>>
>>> The driver has been developed by reading the ACPI DSDT. There
>>> are some more features around thermal control, which are not
>>> yet supported by the driver.
>>>
>>
>> Thanks for working on this - it's great.
> 
> It's a personal scratch your own itch project, as I daily drive the
> machine.
> 
>> I'll see if I can get the EC spec so I can do some checking on the
>> values (I thought I had it already, but I can't find it). If this
>> file can be used for other platforms then it might be good to
>> rename the file to not be specific to the t14s? I'm curious if it
>> can be used on the X13s or the Yoga platform.
> 
> Maybe. I only have the T14s (apart of my older Intel/AMD ThinkPads,
> which use the ACPI driver). The ACPI DSDT functions completley
> abstract the lowlevel I2C interface, so in theory every ThinkPad
> could have a completley different EC and still use the same ACPI
> driver. So this needs to be checked per-device. Hopefully the low
> level interface is similar in those, so that we don't need to spam
> the kernel tree with multiple different EC drivers :)
> 
>> Couple of notes
>>  - I do agree it doesn't make sense to add this to thinkpad_acpi.
>>    That file is too big anyway.
>>  - If there are other pieces like this where some detail of the
>>    platform is needed, please do let me know. I never got enough
>>    time to work on this platform directly, and it wasn't in our
>>    Linux program, but I do have access and support from the
>>    platform team for getting details on it. If I can help, so not
>>    too much reverse engineering is needed, I'm happy to.
> 
> Thanks for the offer.
> 
> I would be interested in bits around system suspend. Right now
> support on X1E is limited to sending the CPU into suspend. Much of
> the machine seems to be still powered. Right now the keyboard
> backlight and all the status LEDs stay on and the LID + power led
> does not go into the typical breathing pattern. Additionally I had
> to disable wakeup capabilities for the EC interrupt, as closing the
> LID generates an event and thus an interrupt, which wakes the
> system. Obviousy that is undesired from user's perspective. My guess
> is, that there might be some register to mask events, but I haven't
> found it so far. Alternatively the EC might mask them automatically
> when the system is send into suspend, which I also have not yet
> figured out :) The only bit I know is, that EC register 0xE0 is
> involved in modern standby.
> 
> Apart from that and (probably) unrelated to the EC: I noticed that
> accessing the built-in webcam (with the X1E camera patches from
> Bryan O'Donoghue) does not enable the status LED. It would be
> nice if you can check how that is wired, so that it can be enabled
> when a camera stream is started.

FWIW a couple years ago I tried to do something similar for the X13s
EC, and the software interface looks somewhat familiar..

This never ended up becoming anything big, but just in case this is
useful for anyone:

https://github.com/SoMainline/linux/commit/c0cc2c60177a33597c33586bfe27b5f440e36745

Konrad

