Return-Path: <linux-arm-msm+bounces-94885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMZIOjZwpWmSBAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:10:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5B1D7401
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C97B3064D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF4135F61F;
	Mon,  2 Mar 2026 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbBfJQwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AC35F61A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449707; cv=none; b=Xy/Cd+C/IqS6ZW2R5m+7hiJxkbKpuykuptJrlK0b+dn/5FWf7AQAjtvoWANxSbCKqAeaDyNa92XH+7o1kHH1GX2/Lgr6G+XRlaQAwFe1vThuH2nyHJXuof1pcslbMGVB5BoMdEoM9MtmRb/r+A9tva3BhZvxhptoAoJTRC046Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449707; c=relaxed/simple;
	bh=8XEX/rnkazMSSq065H7yUtYreYrkU2RTr4vXU0hxBRY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHPIZwQCuwldx0z6+k2GJEAy7F5hrl4X6LkBkP84oYYN1sLQXAIdb2O3UkhTJLeDQOuvDDSfKS8dd35YD/ucKmut14sihGvnRQyikEoVrKQ/KvM01VlCCHceUe51rZ4Trqrdry5W1c337uRv+0P28YWaOS3vi4f/5vVSSlCEEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbBfJQwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFFBC2BCB4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772449707;
	bh=8XEX/rnkazMSSq065H7yUtYreYrkU2RTr4vXU0hxBRY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YbBfJQwvA8ZDkIbUHvzWd9bxFP286FyRi+6wLAQuE9q8TwWFcVlk9AQhC8fvsEHcS
	 yHatcnsbSspmtVtFlLwV8ZuOzJQTnegZmndCvXut4EfjMqaPL4fj3qz8c5eU7bkzIq
	 aL1hYJm3MSE2Sqahow2ntysCczX6gR+UuA0PZCR1B+bpZSYhPLWeOopNMlZaPIcUWb
	 ddwp8wxhX5dIZ7yAPFwPy3yEX0e20B7fJvLl9pCRMmzGAqvpVP3T9hxb9RyUXXa5vM
	 MVYoBQBbJZxn6wNsQRX52rnOZjDo6YpD/LwSyuvvP9Aqu1+Az9pysnm5MQk0BruDSF
	 uaXLV6f5/t7YA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389fa0d1040so57614811fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:08:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2Z9HD3dZ3Ixp1/fCKEfmVeRzJmUVWcMUh4ENSPncnxWBzP/cy9JaJcLKgNX4QjgRnCrahQGiDN4geKbM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx95dbHXG//BZ0PpMjKwRw7KblyB4oDPRG8ZnV/eVD/vofFewd0
	3n+2CjxF79cmgWJFzsDpJtw08Fgw8A/s+qcE+XP3df28T3ZWDBxg/evjGm2nOZjhJWgttx9wngh
	n6rdfIbYC/ubIttoYyC70EHH544EzvUOb22ALlvo5Cw==
X-Received: by 2002:a2e:a546:0:b0:389:f206:385e with SMTP id
 38308e7fff4ca-389ff105664mr79983601fa.2.1772449706034; Mon, 02 Mar 2026
 03:08:26 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 03:08:24 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 03:08:24 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
Date: Mon, 2 Mar 2026 03:08:24 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
X-Gm-Features: AaiRm52-e8hf8gRuhG83BjnYTwr36APGjOHw0TgBET88GWBunjS2IaxxLxeXJKQ
Message-ID: <CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Kalle Niemi <kaleposti@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Branden Scott <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59E5B1D7401
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 11:38:27 +0100, Kalle Niemi <kaleposti@gmail.com> said:
> On 3/2/26 10:55, Bartosz Golaszewski wrote:
>> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com>=
 wrote:
>>> On 2/23/26 11:05, Bartosz Golaszewski wrote:
>>>> In order to stop i2c bus drivers from dereferencing the struct device
>>>> embedded in struct i2c_adapter, let's allow configuring the parent
>>>> device and OF-node of the adapter directly through dedicated fields.
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>>> ---
>>> Hello,
>>> Automated driver test system bisected this commit to be the first bad
>>> commit, linux-next next-20260227 was tested. Failed tests include drive=
r
>>> tests for ROHM PMIC and accelerometers, which are connected to
>>> BeagleBone Black.
>>> The failed driver tests all fail to first i2cget and the tests stop
>>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file o=
r
>>> directory".
>> Wolfram: well, now it would actually be useful to know which commit
>> exactly is the culprit so maybe splitting the changes is not a bad
>> idea after all.
>> Kalle: which i2c bus driver fails here? Any errors in kernel log?
>> Bart
>
> Hello Bart,
>
> i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log=
. I got two failures without the dmesg available (this is bugged test seque=
nce, and not a kernel crash), but those got the same stdout message "Could =
not open file ...." as all others.
>
> -Kalle
>

I meant what driver are you using but I suppose it's i2c-omap.

Can you try the following change and let me know if it fixes the issue?

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index dd8cec9b04c6..01656f82d2c6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1548,6 +1548,11 @@ static int i2c_register_adapter(struct i2c_adapter *=
adap)
 	if (adap->timeout =3D=3D 0)
 		adap->timeout =3D HZ;

+	if (!adap->dev.parent)
+		adap->dev.parent =3D adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node =3D adap->of_node;
+
 	/* register soft irqs for Host Notify */
 	res =3D i2c_setup_host_notify_irq_domain(adap);
 	if (res) {
@@ -1561,11 +1566,6 @@ static int i2c_register_adapter(struct i2c_adapter *=
adap)
 	adap->dev.type =3D &i2c_adapter_type;
 	device_initialize(&adap->dev);

-	if (!adap->dev.parent)
-		adap->dev.parent =3D adap->parent;
-	if (!adap->dev.of_node)
-		adap->dev.of_node =3D adap->of_node;
-
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.

Bart

