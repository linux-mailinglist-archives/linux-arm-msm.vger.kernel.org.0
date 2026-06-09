Return-Path: <linux-arm-msm+bounces-112091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aFFyLwPhJ2qA3wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:46:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3C65E7C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=TwGjK3VQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CD33091C6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9659039EF0B;
	Tue,  9 Jun 2026 09:31:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C9367B83
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:31:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997466; cv=none; b=LZte7UqZoJ4OLDPYTiRzA1e4N4lY82gJGS3jTphYMd0jKmjrTV3rjTgSC4nWiGgprcyalVGBkaFTLA+xrRFiYrbWnFaQos4Fs8Y2+qtF7rQZzAJD7Wz7qK5C8AsU6W2nRRhL2tqlAhXu7Kq76IVOenUxrRdK2+glIXq9fGqTzq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997466; c=relaxed/simple;
	bh=A43LRr2R11CwZdLErI94QN/M8VqgGQQ2IlVMHrVdW1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i3HQlsNXGfXtJT6VBB7b9j1NOykL1O/+bjJMz23+jX6yTqPNF7t3pYkGGVLmu85h6AYQhfzMz7RLQ5IhuMjcnukZDP5YCHSuzdjWpATqN2KDDgmUwb0ExA6r+HALyM3yZO8Pfd2mMo5hvoBQdacBNuUSfZgaO2XAs7Hiu57ElgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TwGjK3VQ; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DBFEC1A37EC;
	Tue,  9 Jun 2026 09:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B915FFC1;
	Tue,  9 Jun 2026 09:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18050106A2ADD;
	Tue,  9 Jun 2026 11:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A43LRr2R11CwZdLErI94QN/M8VqgGQQ2IlVMHrVdW1A=;
	b=TwGjK3VQXZ0F051JJq335p58AiVP0bVk7T/ENCeBJ3AwmFGNwLWolrA7je2kqWY8xHQifn
	uqTQOZQtu5skzrad7x9z6vVtpQoApFuPgth+vRHU1LBmFF2EMmo1V9EwKh1zW7Az9NvnHq
	qgFMh9kcQfU7T3jIQN03Xkvwrw5rY53SeH2aPHnkEsKgNp5MJJBMZjL2/uyqI/QAPdT3Eg
	81IBx3dbHZUXlmvUXQalzfYccNxytue4z0f8gfY5y2avAyPbts6Mv3wYIcWUJEX/wtwvqS
	av1oEHOBV41A1kYHKsCSzroRDiSMBzC5yKfd9VFJrh2a6zO1rN2hFyDoKC0/jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Manivannan Sadhasivam <mani@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <aifX80IHM8TLQiV7@linaro.org> (Stephan Gerhold's message of "Tue,
	9 Jun 2026 11:08:03 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
	<87mrx4b164.fsf@bootlin.com> <aifKejyF7n6QsI9h@linaro.org>
	<a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
	<35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
	<aifX80IHM8TLQiV7@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 11:30:54 +0200
Message-ID: <87o6hk9i29.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112091-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:mani@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55F3C65E7C5

On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org>=
 wrote:

> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
>> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>> >>>>> On MDM9607, there is only a single controllable clock for the NAND
>> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g=
. for
>> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dts=
i) works
>> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the se=
cond
>> >>>>> clock ("aon") that is required by the dt-bindings. This is not rea=
lly
>> >>>>> useful, so avoid doing that for new platforms by excluding the sec=
ond "aon"
>> >>>>> clock entry in the dt-bindings.
>> >>>>
>> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
>> >>>
>> >>> What is the problem in giving twice the same clock? If this is what =
is
>> >>> done in the hardware routing, I do not see the reason for more
>> >>> complexity in the binding?
>> >>>
>> >>
>> >> I had that in my first draft for this series, but this would be wrong
>> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock =
on
>> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
>> >> someone from Qualcomm can confirm), but a similar platform I was look=
ing
>> >> into at some point actually had *3* separate clocks for QPIC in the
>> >> hardware and none of them were called "aon" ...
>> >=20
>> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
>> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
>> > from GPLLs)
>> > gcc_qpic_system_clk (32 KHz)
>> >=20
>> > No clock containing the substring 'aon' in its name on this platform
>>=20
>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
>> The NAND documentation says
>>=20
>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
>>=20
>
> Thanks for looking this up.
>
> IMO, if we want to describe the actual hardware routing, we should
> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
> MDM9607).

Sounds more accurate to me.

> The resulting diff would be basically the same as this patch just
> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.

Diff would not be simpler but more accurate. So if we go for a
modification of the bindings, I would prefer that path.

> The complexity of the binding would be the same, so is it worth
> reworking this patch? At the end, there is just one clock we can toggle
> through the firmware here and I doubt anyone uses this SoC without the
> RPM firmware.

This is not really about how we use it, even though an integration
specific compatible is probably allowed to simplify the inputs. So now
that I raised that point, I'll let the final decision to Krzyztof who
knows better the Qcomm ecosystem than me.

Cheers,
Miqu=C3=A8l

