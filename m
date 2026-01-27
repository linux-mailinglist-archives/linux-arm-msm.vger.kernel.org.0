Return-Path: <linux-arm-msm+bounces-90836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMMbOt/meGmHtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:25:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F097B74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69843303AF38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE4F35F8B2;
	Tue, 27 Jan 2026 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFblznla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B173563D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530841; cv=pass; b=InriDY7sZ8jZSONz3bZUYyphzpMzPzJk0zEQ+chuzFnxPMHnGtvfCTk4hIKYu0lVuY/JHNqkI429S+0anTihkIBDIlpbBvUTpN9hj6cirqrMEisCpxnW+s1fgLVAkwjNWlAwnpaexNNnf2FYsOrjMU54ie5KCeAtW4pEcuZP75Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530841; c=relaxed/simple;
	bh=p/BPlz45ZsnUOOv45A1fjPgdnS9vrperPPIkgwQyvPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3gwxXwkuUCCqdjEZBHlcyhhTe4bvT3Lh0M4ybqIBReiM5bW89Vu4jBSkXVCt/J5IL/J/WK5t3MYaK6KMfYOX9dtXIMc8VTU8AbMHiR0zcblT4XsB6dtsevOvmXasxUvCe73/oagJaHoT6/x23KS8HkX+GsWB5wnDX2X65yGHlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFblznla; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c363eb612so3235809a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530840; cv=none;
        d=google.com; s=arc-20240605;
        b=lH+EpHeAx3pCwZJiO/aql9gJ54EpXs4SauB2idbOLgrGDwmbEo37w/XpZjCYm16A/j
         Bq8BI4o7sAEcZr8aQT6Z25+7i/dzxm9I2ERYDy6aJgU1sIy66jCCb3sLyRtmndg1szir
         nfO6BQDiTMeGfo+hLqELS6HgRVgO1u0HkAU80x2TVsgQg9CBM4d3KGbjD+G7j9BNjJlj
         wghkilDzDnH1OVUf3Yyt7TJdQ/s7rF4ydzD7nydwbzBZs+sBZ3Z3hLr0ZztsU7+V5rmA
         lcEd2E0ozbaPWp+q/E3fQ8w+gkAfwQtE9Z/x60MeiIJBrbe+vypUhzuxqbw27QbFZnC9
         E25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d65yytJ1MW2JgMvRS0O1lQIMly3lo2OKXfhreY51uFQ=;
        fh=K4Y4vk9Gh/X+MDZRYDN+dRN1qJgBVt063PlZ/SxHml4=;
        b=LMD3o4tEYi4gWkGzDNKjy1bZwKkRJQpKQKanjGl8ktCqeyt9rnGgW8w2I3ej0psTac
         S5GKUtkmbT9/NsWVYy9TuFbYEoUnp/lWw6O9BdSKR00SBhZrFhidpZKES1Kz5CmO2VrX
         FqUkv29mfWMc3wMPwlfuONZnSGWv7M5UCVYM5slqTOk23UwavZ0lLw9iw+4r+1jSibf7
         i3y5sQyU/uDZ+4J+nfcCwxGN4cdZs/2y5t8nic8mDhZO5UVNLNKI62QgaTw7y+5WChVK
         uScNto0V4LIhdkM64YFRy60pb/ELe2SFKbZBTW3qzeXMGgyXp20u4Nx/OtsGxzIx9kES
         PYkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769530840; x=1770135640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d65yytJ1MW2JgMvRS0O1lQIMly3lo2OKXfhreY51uFQ=;
        b=eFblznlaAM8ejSVhSXhmavjFxMQf00lhD/5n/xkQ4GZm9pQ9y1SYBtDMtnud7+Dbkv
         u1QkDeZDOczq1g5INH2DQXrf7lQJU3S7i0RLju03z9IWWbocTHFTO19bvby53/FexhXb
         s5NsuQaQyfCfc1Rzi2zaPsDXBQceAk/dqcbeQW0bwQIZTS8g30i8LjwYM0Q8M+XzlDdb
         ZnkkjChz9+kUrs984zjVkddMi9x9xacicZ/YYuaPGxwZkFHoJPhV6aTSkl+vSPqXKbq4
         r8D6g5iKPLjRDkw7EXlPCfzdUyUE89pgk5kxigqOzn/6P4e5FegThzzkVvA7X+8SCbHq
         sc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530840; x=1770135640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d65yytJ1MW2JgMvRS0O1lQIMly3lo2OKXfhreY51uFQ=;
        b=ntscHQ72AAeayqY1XJ66A+vvIFx/oRm6rRsPYExszBc8dt/57nSfi6QnkmkCFVglcP
         UGDgEd76o1GhYsLFu9psblnEkEoQniVNNaUo/6LfDBT1w/8YcTVeVR9/J8ohpy7DyOBW
         JQYoajMR16dpz4V0IxmHay+GUnFVpDufcVcnZME3goF1w845+z96WlxgW5qv5xiiE0tY
         1O03dYomlRZEBVEdZ5WnPr0J4lWMilJ8k/rlR31/GR0Y43Bl5QQaJj1Utyyz3i9CX/9Q
         heT3VVHXfwAMB/KwhGFCiSM2de6i16NenM+RQLP3klJ0x6wSoCw4FMhVwKJbIYeTDQ5w
         JY1g==
X-Forwarded-Encrypted: i=1; AJvYcCXgxuwTbdRqiM0Q867kBYPd30Sv8VwU1f8KKYi8tfq1RIgJHcLUKZJB14/j8WTzXh5W4qkYjLwMt6PLQUj1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HT+eebmzgHr0grTOqR+9pyQNxdyVh4sLnVrKghMjKjF8VbKn
	dKO92F5ZNI5skIvpjrNM6xcppxr/Nb3AL6oiSKwyYOxYpQXNjoX6In2zg4CAoy4/zNlEqp/5cDd
	gokBOknFiI9npy8B212Hlo82ZFPnoKb8=
X-Gm-Gg: AZuq6aKZx5pSnmlPxsgjYFPgbhQdsBsInugssUJi+RFSuGTVEw5SX9jSN9u01cY9G6e
	LzKevQSrqGeBZW/E7RD9PGFdjn4i1BMjLTU5JVnD8sWl8fXukvvnYzVE9ry3TjTokj0uqtm2vyE
	hPHPzQ03y7nZLfZHi5OtrqXbBIBThkBkVdbkhD9eAf5rZKGM26DKXe+zwYytYK3CHU7C+AzcCPj
	zc7RtulY3ZFxc4e/9aWuF5T8/RILsV1Oz0xmCXled9MvjctDMr2tQSrPNQS+B067gQ0Q/MGs7Z+
	E7hgX3KuJ24NFeEnDzNTH4sJjG0=
X-Received: by 2002:a17:90b:3b85:b0:340:2a3a:71b7 with SMTP id
 98e67ed59e1d1-353fecd6236mr2343805a91.12.1769530839689; Tue, 27 Jan 2026
 08:20:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126173444.10228-1-bjsaikiran@gmail.com> <20260126173444.10228-4-bjsaikiran@gmail.com>
 <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org> <CAAFDt1tsyvtAa84bFK2Hq5yG_F15SUUseBd5Xi-DB8GnUj7+7A@mail.gmail.com>
 <aaab1d32-9375-47d2-8524-e80e076b864e@linaro.org> <CAAFDt1vKn5ssoTQZduGKb5eOeN74P=FVk9f01go1d-JS71Zt0A@mail.gmail.com>
 <clmeor0Z59Dd_ymBj-m2zE0orMOFgVsPFXUBpBx39ZehM4t_GrlZV8y8f-lZbH6p9N-W7FLs7PqYhfG6VzwmBw==@protonmail.internalid>
 <571cd869-847f-4697-ace3-503f123e8486@linaro.org> <cb902c4e-f7b9-4d70-a997-1e84c90ea18b@kernel.org>
In-Reply-To: <cb902c4e-f7b9-4d70-a997-1e84c90ea18b@kernel.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Tue, 27 Jan 2026 21:50:28 +0530
X-Gm-Features: AZwV_Qj_vb1x1lu6XXMunkVpxeZcvcZBHMOYFjYNAf2rHeYoii8GYdmNqCxCgXM
Message-ID: <CAAFDt1s+RUpUEUEERCuXqDHijxHXW=PemVaWk=to7WtQ9cYKEg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to
 avoid brownouts
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com, 
	vladimir.zapolskiy@linaro.org, Hans de Goede <hansg@kernel.org>, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90836-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,kernel.org,gmail.com,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 646F097B74
X-Rspamd-Action: no action

Hi Bryan and Hans,

I implemented your suggested debug probe in qcom-rpmh-regulator.c to inspec=
t
the registers directly. Unfortunately, on this platform (X1E80100), it retu=
rns:

  rpmh_regulator_probe: --- OV02C10 PMIC DUMP: Failed to get parent regmap =
---

This confirms that the AP does not have direct access to the PMIC configura=
tion
registers (likely blocked by the RPMh firewall/access control).

However, I have confirmed definitively that the root cause is the 2.3s pass=
ive
discharge requiring a mandatory off-time.

When I apply the `regulator-off-on-delay-us =3D <2300000>;` property to the
camera regulators in the device tree (and patch the regulator driver to sup=
port
it), the camera operates flawlessly without needing any workarounds (like
autosuspend / Software reset / additional delays) in the sensor driver.
The regulator core correctly blocks the
re-enable until the discharge constraint is met.

The regulator delay and figuring the 2.3s out is another issue which I
will keep digging at from now.

Plan for v4:

1. For this ov02c10 series (v4), I will drop the "Autosuspend" patch as it =
is
   no longer needed with the correct platform fix.

3. I will keep the "Race Fix" (Patch 1) and a cleaned-up "Power Sequence"
   (Patch 2) which addresses Hans's feedback (5ms reset assertion, no
software reset) to ensure
   the driver is compliant with the datasheet.

Please let me know if you have any questions.

Regards,
Saikiran

On Tue, Jan 27, 2026 at 4:41=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 27/01/2026 11:06, Bryan O'Donoghue wrote:
> > So, SPMI is not exported in /sys/kernel/debug/regmap - however
> >
> > drivers/regulator/qcom-rpmh-regulator.c
> >
> > Lets add this to probe
> >
> > unsigned int val, i;
> >       u16 bases[] =3D {0x4000, 0x4300, 0x4600}; // LDO1, LDO4, LDO7
> >       const char *names[] =3D {"LDO1(1.2V)", "LDO4(1.8V)", "LDO7(2.8V)"=
};
> >       struct regmap *p_regmap =3D dev_get_regmap(dev->parent, NULL);
> >
> >       if (p_regmap) {
> >           pr_info("--- OV02C10 PMIC RAIL DUMP START ---\n");
> >           for (i =3D 0; i < 3; i++) {
> >               // Check Config (Active Discharge)
> >               regmap_read(p_regmap, bases[i] + 0x41, &val);
> >               pr_info("!!! %s SEC_CTRL (0x%04x) =3D 0x%02x (Bit7: Activ=
e
> > Discharge)\n",
> >                       names[i], bases[i] + 0x41, val);
> >
> >               // Check Status (Is it actually on?)
> >               regmap_read(p_regmap, bases[i] + 0x08, &val);
> >               pr_info("!!! %s STATUS   (0x%04x) =3D 0x%02x (Bit7: VREG_=
OK,
> > Bit0: VREG_ON)\n",
> >                       names[i], bases[i] + 0x08, val);
> >
> >               // Check Pull-down config (Secondary check)
> >               regmap_read(p_regmap, bases[i] + 0x42, &val);
> >               pr_info("!!! %s PD_CTRL   (0x%04x) =3D 0x%02x\n",
> >                       names[i], bases[i] + 0x42, val);
> >           }
> >           pr_info("--- OV02C10 PMIC RAIL DUMP END ---\n");
> >       }
>
> Obviously only do this for PM8010 for the other RPMh which may not have
> this offset.
>
> ---
> bod

