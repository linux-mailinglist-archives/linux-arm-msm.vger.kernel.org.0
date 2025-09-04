Return-Path: <linux-arm-msm+bounces-72128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0BDB445E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD63E1CC376D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2562C267AF2;
	Thu,  4 Sep 2025 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="lzrKdoY4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MOlxFmiI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5F267AF6;
	Thu,  4 Sep 2025 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012201; cv=none; b=V6ydmWuLNGbB//0xksOCqA0eISi1SUbIkF1wmktAha9x74sgwrnYS1pEiLWU+5yyWeR9Z3pID4CkRLHIIMa/aXcRrOTMdjvWs5wfl0fnfOfhmaOHSCahy4F1NdfgPniWkm4gb6Dw5rJAejxNGLGy9sEC0dUL2eFW3cglkClpXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012201; c=relaxed/simple;
	bh=+8yYrN9eZg46gNH7uB5YrYrugTVxjxh4HzNwHnrPdkc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fzA4ENSD1G1iVqb2W52mLWFZpv9XRbPEPpy1KsQnmDkSGas9x05kfDQ/FUB5bFY3DQt9WkxSgzwpksDDUp8YU1BnMsM6gSF5h0aTRYiZWXjREuCnBOnwSaSPMrFWqChDJ2nbGsV1VFvtrApZILlVWD+/Xwd3ysN9S8YLSPHTeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=lzrKdoY4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MOlxFmiI; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 9AF82EC0266;
	Thu,  4 Sep 2025 14:56:37 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Thu, 04 Sep 2025 14:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1757012197;
	 x=1757098597; bh=7rzgU6/+xZPjOX1WExw5X2Safwl0wrZ8s4OUB4n+T4s=; b=
	lzrKdoY4RXoZYIOSzL1zRt3ov+2mI3ng8ht5UikURkuG5rmJSkPUCOTs8JXXgY67
	xjcunljgJgVL218DysfG1jTi14D0aUTMPSK4s910KentdF1oiwtSXcpHLPqJZHSu
	9S1QKEQUpzPQnpAU73oKMHp2bpvwcEh4LrtZiFCJd8l4H9ltfI0ySmeBNy3qYzc7
	9bOQI+I7fmzoQoxpXXIwQolLEtvQSkMsIg0/4J2fq5YFarS/sKeg+bGJaabR6kxg
	mVJ86GjJXCvRiZjpRJcdY5SNtDExfLvfPL+pX3Lu09Coyyj+3ASRDaS+eyX2zB+u
	a/pcscmh7H62zzUnI9WJ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757012197; x=
	1757098597; bh=7rzgU6/+xZPjOX1WExw5X2Safwl0wrZ8s4OUB4n+T4s=; b=M
	OlxFmiIPvxSU/oDSlanMmImcNr8eWRk64kQpqv+12v9zTpU5rkxIX5pB2gOHJzp8
	RrXYw4X1ON+WvMS9X0cVHBap/JOpHeLDR27SjxoQgXjPumcvKkOfClsJ+2O2/bgB
	GUF70alkrnM5B6HV5JMt4xVWGpsxsNsR8bOhoZ732BVQAITF7+UQ8Potk5547myk
	PlFI0nuWeBUWu6/ZUxa2zBWbaRbnRwFxeGJ6qiJYQ7vI9kNf4F9vAk2KWc0n9Xon
	h+hGwmDIE8sf1UH0TJlXCeoLdOVBHj9mXRkwiYf9XDgVMqNOTwidN+2SaKg2zh3A
	+nMFjq9eUwT/OxVPHqTwg==
X-ME-Sender: <xms:5OC5aGBFmhwp6koGHj6-xjfzuh-IqcLf_VBw6XpZYC0JCVvbpR7Mzg>
    <xme:5OC5aAjmeUScbnss4AsYArx60cG8mw_oC81XoI6kKuDI6zuF2zncLXHbAyLzclRe7
    KJyucYcUWocOVdUZK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedvgeek
    hfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkh
    hjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhh
    rdgvnhhgrdgsrhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    hhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghioh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrh
    gvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5OC5aLpUcBHmQYc76N1Gwun1b6jafEN_ctWEu4v5VzaDwlDLm77u_Q>
    <xmx:5OC5aAhLZzYRa7zeWbx33A82psAapANHW27wH0KqhR8odPU_tYXRWw>
    <xmx:5OC5aCZuKuQZKyoIZsaZaCeT1bRVrilZbqXn52TosN3HlEe2resgDw>
    <xmx:5OC5aAlIDpQXPeOtxvnwK2F_grRXDOFA0PAGBf8tnu8xzp8PnsUjEQ>
    <xmx:5eC5aNvYwlgegQRoz1S-cXSuW8HAXhDkcLPsSMAdBGtu14F7zyvNmDeF>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2CC642CE0072; Thu,  4 Sep 2025 14:56:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0cV_uEw7IB3
Date: Thu, 04 Sep 2025 14:56:07 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Sebastian Reichel" <sre@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org
Message-Id: <ec295b0c-4a65-4cfe-8d38-99c5c4db9099@app.fastmail.com>
In-Reply-To: 
 <pslvca6j5fpr5dgvciwlaz3fubnkjq5olfontaaytt56xs4bvk@5typdoosbreo>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
 <ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com>
 <pslvca6j5fpr5dgvciwlaz3fubnkjq5olfontaaytt56xs4bvk@5typdoosbreo>
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On Mon, Sep 1, 2025, at 12:10 PM, Sebastian Reichel wrote:
> Hello Mark,
>
> On Mon, Sep 01, 2025 at 09:48:39AM -0400, Mark Pearson wrote:
>> On Sun, Aug 31, 2025, at 5:28 PM, Sebastian Reichel wrote:
>> > Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which
>> > is in theory compatible with ThinkPad ACPI. On Linux the system
>> > is booted with device tree, which is not supported by the ThinkPad
>> > ACPI driver. Also most of the hardware compatibility is handled
>> > via ACPI tables, which are obviously not used when booting via
>> > device tree. Thus adding DT compatibility to the existing driver
>> > is not worth it (almost no code sharing).
>> >
>> > The driver currently exposes features, which are not available
>> > via other means:
>> >
>> >  * Extra Keys
>> >  * System LEDs
>> >  * Keyboard Backlight Control
>> >
>> > The driver has been developed by reading the ACPI DSDT. There
>> > are some more features around thermal control, which are not
>> > yet supported by the driver.
>> >
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
Looks like you're right to make this platform specific. At least for now it looks like the definitions are tied to the platform.
Strange as we have a common spec on the x86 Thinkpads, but at least for now this is t14s Qualcomm specific.

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
I did get back some details - not quite as much as I wanted, but enough to confirm that all your definitions look correct.
Main point of interest is they didn't send me the BL2 details - so not sure if that is needed?

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
I still have some more digging to do here I'm afraid.

> Apart from that and (probably) unrelated to the EC: I noticed that
> accessing the built-in webcam (with the X1E camera patches from
> Bryan O'Donoghue) does not enable the status LED. It would be
> nice if you can check how that is wired, so that it can be enabled
> when a camera stream is started.
>
Ack. Don't know the details on that yet.

Mark

