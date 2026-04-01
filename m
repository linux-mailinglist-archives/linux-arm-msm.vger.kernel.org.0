Return-Path: <linux-arm-msm+bounces-101367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0nrSJtQ4zWnfawYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:25:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 931B937D04B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 17:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 670AF3160497
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907583E6385;
	Wed,  1 Apr 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EBdBmhy8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NfWaPNdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BCC3E51EF;
	Wed,  1 Apr 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055436; cv=none; b=Y9Kto3UtjquX0HOZf87qbKcBAsWvIXxyd95YTwvsUNljjMEIfTLymr0Rm+SS5oLB0xu3h6AEFa2FMOmIy+/dAPM9p6CquWJpj+qfETxlP/jXcENAVscXDTDYJQj0yCNZk19UyGODaO4yIOTly+N31QiSW3vVYPTzk3apQRGRTWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055436; c=relaxed/simple;
	bh=goYJAE4V/aRa469NxUYIKQv+2HyvaoEYvg25hMztnW0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ggQesaUhmYvPn6DrKNfCJXb39kxHxj1Y/XysoDAFdMVduff8BV2Fmi4KLeqiifi/MLzIutUS5rsS/0d/Elb4kuf9bDbyCJWBMO6tDwULKnojMOTqlX+AImM3a4BzDQZqlXdsltZkS+SDo5QOpgMbSsCvj7qjBw8LgPBDbgDugdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EBdBmhy8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NfWaPNdV; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 881C3EC0268;
	Wed,  1 Apr 2026 10:57:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 10:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775055433;
	 x=1775141833; bh=wx9uFPxK7aoYVYlvEoqTCO23k72vx9XaFJAGMTz8G/k=; b=
	EBdBmhy8ush2I8l5uv7vjLGXV75AY92vQWxjmCPyEYY8SJ83SQnF3L14Vicw51NQ
	FF7gvwNjihLBoZoPAPfH5I3LfsQ0KNJogIRzsAbTWdU+XGuKF751BZaLASMT/tAj
	hR4TXU5NmhLWaOyIcbiSQ7m9J3rFx/MuuZoY5pTi2MM6a6SZT3kgblN+gL+k8sym
	j1nf9P/WSt2jGzIfYHTJL1ngpouJ0DKSSsYSBYAQvmV6uNruDtGa/LH+fs7jo8Cm
	+6tQJtuy0aGgC7A6EA6QHZcXqrgzaJUmJJBuxN+CXI/lO9b2jXbXvFnaymzD9UE4
	digK44vT3m53pAZJAr7ukw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775055433; x=
	1775141833; bh=wx9uFPxK7aoYVYlvEoqTCO23k72vx9XaFJAGMTz8G/k=; b=N
	fWaPNdVuR1mCv/d2Wu5O8fNJtzKsmx6tfjmxEShfy+qyzQ7kTBBXp2hg1yGjVQoL
	IRIxSfEux4jgrb9kGa3ix5DTfQnIuohbJN9tvl4c7B/4TH/CoAprnh7wkK5hvpXu
	NalbROKZrhJkP+TM0HMNh4jkY3n27VoYFZkg5HpLfBKLeOE2ndyutLKepeeo9qtz
	49h9PsCzlfz1mXQouLensFZ4a83AMHVLvh0lnDzK38p42B7Ka1K8n/pgTTCNPJhv
	1kD3AM2BuD6wKS7mc9tJGAAZopAOssvGg0Lo59k118uYXuBEr1a7swGiSKjGH1w+
	EDr3p8a4QXq0j1uWSaVLQ==
X-ME-Sender: <xms:SDLNafoWFO00-QQIK3gpd96_o3xq4ItpLl-cGJxwCcpDOyoK17MZLw>
    <xme:SDLNaUc4OdTKOi__4sC0iCw1NVGbCfWje7trf88s1EVGpoQmCDsWMJFLkI4_wk31L
    KxmDBnHR9wYHgqh5VxwEiBmuOsalQvbRcXgIFGCFMjrY8aFr1jTyNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefgedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehsohhuvhhikhdrtghhrghkrhgrvhgrrhhthiesrghrmhdrtghomhdprh
    gtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehf
    lhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoh
    epmhhorhhithiirdhfihhstghhvghrsegvthhtuhhsrdgtohhmpdhrtghpthhtohepmhgr
    thhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnuggvrhhssh
    honheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrghhlsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhhonhhrrgguhigstghioheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SDLNaRsQoJjEHEh6BjlT9J7fg0cDlw67Z6gzAFTSrS7tQgpPXwwm1w>
    <xmx:SDLNaSMRCb2AGtL3ZwYrT-br7Fx6lQyFnd7p-gywCyVnBCDgQ2cCUg>
    <xmx:SDLNaTXk96uxoMM2wYMUw7wCd0aeCKnui6e1E129kqAWwmSbEexovg>
    <xmx:SDLNaSjKAkD7DqhFGGw036g2Y6NYQaDPd7Qzm4IkKkNtZHXSx_q8Sw>
    <xmx:STLNacH8t54amPEHZvYFE30Eb81SbY22TSlc7KrXA6P9Jw3Oq9jPahOH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB713700065; Wed,  1 Apr 2026 10:57:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALgIkaxq5xRN
Date: Wed, 01 Apr 2026 16:56:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "John Stultz" <john.stultz@linaro.org>,
 "Moritz Fischer" <moritz.fischer@ettus.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, "Srinivas Kandagatla" <srini@kernel.org>
Message-Id: <f6ed07b1-8bfc-49ea-951e-b590bf8b299a@app.fastmail.com>
In-Reply-To: <ac0trUGsRBLPS+ux@lpieralisi>
References: 
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-101367-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.928];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: 931B937D04B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026, at 16:37, Lorenzo Pieralisi wrote:
> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>> 
>> > > +#include <linux/err.h>
>> > > +#include <linux/of.h>
>> > > +#include <linux/psci.h>
>> > > +#include <linux/reboot.h>
>> > > +#include <linux/reboot-mode.h>
>> > > +#include <linux/types.h>
>> > > +
>> > > +/*
>> > > + * Predefined reboot-modes are defined as per the values
>> > > + * of enum reboot_mode defined in the kernel: reboot.c.
>> > > + */
>> > > +static struct mode_info psci_resets[] = {
>> > > +	{ .mode = "warm", .magic = REBOOT_WARM},
>> > > +	{ .mode = "soft", .magic = REBOOT_SOFT},
>> > > +	{ .mode = "cold", .magic = REBOOT_COLD},
>
> These strings match the command userspace issue right ? I think that we
> should make them match the corresponding PSCI reset types, the list above
> maps command to reboot_mode values and those can belong to any reboot
> mode driver to be honest they don't make much sense in a PSCI reboot
> mode driver only.
>
> It is a question for everyone here: would it make sense to make these
> predefined resets a set of strings, eg:
>
> psci-system-reset
> psci-system-reset2-arch-warm-reset
>
> and then vendor resets:
>
> psci-system-reset2-vendor-reset
>
> at least we know what a string maps to ?
>
> We can export a function from the PSCI driver to detect whether PSCI
> SYSTEM_RESET2 is supported, an equivalent of psci_has_osi_support() for
> instance that we can call from this driver to detect its presence.

Sorry I've been out of the loop for this series for a while, but
can someone refresh me on why we got back to mixing in
the 'enum reboot_mode' from legacy i386 and arm32 into the new
interface?

I don't mind having whichever strings are defined for PSCI present
in the user interface, but this seems like a mistake to me.
If at all possible, lets define your own magic constants that
are not tied to "enum reboot_mode" or the legacy reboot= command
line argument.

       Arnd

