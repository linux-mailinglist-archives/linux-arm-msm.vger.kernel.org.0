Return-Path: <linux-arm-msm+bounces-117060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gn77KMIqTGrBhAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:22:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38738715EE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:22:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117060-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117060-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43E8C30234FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 22:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899D442A157;
	Mon,  6 Jul 2026 22:22:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4A423791;
	Mon,  6 Jul 2026 22:22:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376576; cv=none; b=hdcmllzCArcQESNiikTKoW2H/gT+Aw6IbCr0Y+ClBrzmEEKQchWsoco+ctm9yHoivQyS48ff+GeWW9gIaE6/Ou4dO6xEufW8tIrrz3oafSPuy01PEVPZ7hrmjejNWvf2Pvm1vf7HIiOfkNemINh7PKPoW9cnEIFksJ2cAmcxlg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376576; c=relaxed/simple;
	bh=UqZMSELsHwKu0xlfbRA60WE6Zr5hbjpWnBeS5arSfJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8svYmq5nMX1HLNNqW6QgCzsd3K35d+XCUiqujxR5gw1nOcmnJr99rQkg+yiq5+2UGOVGIC87RkysYUQPsTvDrIYUID9T7k90DrSxqJfqX/fc6aKGYXOL/oCHPiEke41fdyBw7HiFySTOeUPr/57w/T2rcLErDTrS/vKXu9iFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.147
Received: from mail.privateemail.com (K8S-PROD-WORKER-10 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4gvJkz0bgQz3hhTF;
	Mon,  6 Jul 2026 18:22:33 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
Date: Tue,  7 Jul 2026 00:22:09 +0200
Message-ID: <20260706222209.180391-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ac214cce-ccb2-4b21-a02e-2fc7816766bb@kernel.org>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net> <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net> <ac214cce-ccb2-4b21-a02e-2fc7816766bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117060-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:ravi.hothi@oss.qualcomm.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[catcrafts.net,kernel.org,oss.qualcomm.com,gmail.com,fairphone.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[catcrafts.net:from_mime,catcrafts.net:email,catcrafts.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38738715EE6

On Mon, 6 Jul 2026 22:41:48 +0100, Srinivas Kandagatla wrote:
> Thanks Jorijn for sending these patches over.
>
> Was there a reason why RX not added?

Only that the Fairphone 6 gives me no way to test it: the phone has
no headset jack (hence MBHC being left out too), and its earpiece is
one of the two Awinic speaker amps in receiver mode rather than the
codec's EAR output - so none of the codec's analog outputs appears
to drive anything on this board. TX/capture was the feature the
phone was missing, and I did not want to send RX code I cannot
exercise on hardware.

> I have been working on adding an SDCA compliant driver for this codec
> for Glymur compute laptops just few weeks back, not fully ready yet.
>
> @Ravi has been working on the same codec for a non compute device
> (Eliza) and has made some good progress.
>
> As this is an SDCA compliant codec, there might be way to get both modes
> working with single driver (either with or without generic drivers),
> which is something that I will be exploring in parallel.

That is very good news. Two findings from the FP6 bring-up that will
matter for the SDCA-mode work as well:

 - The SDCA function engine does not survive bus clock-stop (details
   in the commit message): registers keep their values, but the
   sequencers ignore every subsequent power request and only a codec
   reset revives them. The downstream stack works around it with
   "qcom,is-always-on" on the TX master. Whatever driver shape this
   ends up with will need a story for that.

 - Register accesses above the 15-bit direct space need SCP address
   paging in the qcom controller, which mainline does not implement;
   I posted "soundwire: qcom: add SCP address paging support"
   (20260706192150.143921-1-jorijnvdgraaf@catcrafts.net) alongside
   this series. The Glymur and Eliza drivers will need that too:
   all of the chip's codec control registers - SDCA functions and
   analog core alike - sit above the 15-bit direct space.

> Overall Looks like we could bring everything together to add better
> support for this codec.
>
> In the meantime Myself and Ravi will continue to test this codec along
> with other changes and get back

Sounds like a plan. I'll hold v2 for now so it can take a shape
that fits the single-driver direction; if the testing takes a while
I'll respin with the review fixes collected so far and we can
converge from there. The Fairphone 6 is a readily available retail
device, so consider it a standing test vehicle for the mobile
split-slave mode - happy to test patches on it.

Thanks,
Jorijn

