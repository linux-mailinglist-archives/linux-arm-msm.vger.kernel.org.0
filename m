Return-Path: <linux-arm-msm+bounces-89845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHH9NUm4cGmWZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:28:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97F55FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B47E745421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6576643DA47;
	Tue, 20 Jan 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGjvjIkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2E43CEEC
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917994; cv=pass; b=aNHZolAl0f/QyprNC4H3LVBup+Utbcvv8vyIU5EooKdlaodd+RuaCMTsv/iDn7mrhEU6UyzoPNaiWjHVGl1CLi6xbEHxxyTUgqJIz9z+6gTqDkBUKEt3ITtP1Ak0NKNMqwo6PrRJq6B7t5+Bn34lXPY+bdQ2GaAQGBvzwMT/98Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917994; c=relaxed/simple;
	bh=wpxEIKPcpfz5xqKXQMz+0Waal/J17WkYT/xpNLwvFpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIu+yt7S9T+92KXw0afADPOjJupzX4AC9Pgp8h5jahiUehrE3/m2n52HDVjyoV4suWFLMtiduCyKqvAD3vNiCsafxb0ttLxG1KwHu3ZXl4YHw/3edN+F72ZVgwTIsTahv2OzMwnd3C41Jx86nlYCweTMUUl0MUqlYufOf1ou/+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGjvjIkG; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1233b172f02so6615653c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768917992; cv=none;
        d=google.com; s=arc-20240605;
        b=GnbETIm39V/nkEeIFB49+maZ++UN/MmlygaIdpVdlRIqCwi1P87fDCfWweC//UkRvq
         y+pAdOUntRUJyQ/d6XhL+6Vg7Ckeh0HLHCe/RqgWtVk/0o6cdwKy4Et4yYSesQgCFev5
         rXTzBaaAVk0ZKCe/ATtseJyTvZuOUnMHQgy+eLXNKxXRDZhjXovac/g+Ua/bE7zY6dA1
         vbBUjHfRp8npRAbLQsr2uNNCzqWlUBz/ZPHRSd0U9L/ogrRnyCtzLaihTEEAEV+284l/
         K+IqNv+0cr9IL8hydmHySaBpLt3wHwaPrSrach7B8c0ZNlWA+w1LxnhWOGzU91iL4tzE
         xWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXFM7Jkpwqf/MKm70+eA7jdHdZGuqW/xQ6SJbuMNCrg=;
        fh=sUS+sQoeNTxrt6tGh0BJb3Ln+z7QzbxpA9x+YnEeOKc=;
        b=J1hT14ddloP50vEFBfccx+qgsntDCfAV85sECgqvowYh3S09U9rsIImeYGXTW4hcl2
         PiPFdq4DSqc7BjyV+0TFrSHGOiJFw/FInZYrYhQ8h8A6EIWwhgP7cjDQMRebIP7lJXSm
         Yj0we065KCJcDkxUCTL6cNrAAxoUq89RiF+rrQiKJOLQmLSdH9ifUSi+oS+VhpXgSOQD
         mp/8uVX2NBmgh6gGt2Oe0Oh4pQRY8OJryORTYQUFSyIvugFAMATdbXQItimzlzy836Mp
         +C1q5Hk2pS56nSlRHsZs7RTAimRap2I0Fc77PavAosneYSf4gbLJwCFf3l1ZY0IsiMDZ
         W3Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768917992; x=1769522792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXFM7Jkpwqf/MKm70+eA7jdHdZGuqW/xQ6SJbuMNCrg=;
        b=BGjvjIkG4uOb1dM73dWvbk4Hu8M58GHUOBVlOsB8DWVeY9zDC/HPtYlwHB+HJjAMrQ
         ntkNBRCVRbM6cf+NpMuQa2al3OqnbxiYUwgjJRTd5dNe0OXGMLKX9Z+IFHaH82TqS881
         c+y+3VYLH34zhmjCY6L6H/+Z6NH/AXjrs/MPXYA0rz3CCpWiMsrG+zq0Ct/giU1CxMhl
         xvRDdJV3Pog3EsjhkJir5yWiWHWFjlt5a6XGDS6XTS1zeBliuzea6ILRMlXvmNWcXSTS
         XEoJS+Es50o/314X8cJBIS+RiUKoNTE60veOxnVENWzEBx9HSzUl28TXedQXJT/Vsulx
         ZtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917992; x=1769522792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXFM7Jkpwqf/MKm70+eA7jdHdZGuqW/xQ6SJbuMNCrg=;
        b=Pvyu0Bfa2b6qkT+pXdntJfRAWk++uEJn+re4EV3NCJ5H2x7Ax4EPhvDRwTnVVp5puB
         pN1NYOgNaRf+qAJ/OvND65gXOF+DZbi9pYbr8rC6Zk8TzEU9XZXWpSpt5szapSsFSere
         xd5uFGo40ZMOCw92u6yRyyBPsGN7lFEdxp6DHwc9/gawc+t8S3szTMgEi4fqDFLrtI6u
         U15pTq4TecgbqrKhX0au1xcPiNbspwPVCgW5PU7Zclqjr9szTfkruvSsztlK0kL9cNRC
         3GwepP+/W90SHBXo23LyaEJMjL5eRbPkRXoa9GHBN6oW4Rc2wJ8M7Fw00CvdbcHxCAmZ
         OzQw==
X-Forwarded-Encrypted: i=1; AJvYcCXinaWN6gZG+zpVAF8x4z4agpjF28mQ7ByACJoQ1OMmfWNyXkVAk6g0D6pnj2J1u1bOOpLJB4iFNGOOkoN1@vger.kernel.org
X-Gm-Message-State: AOJu0YyPUHRojvvy60auCr77bn7EoF6oVAGCz0gQp7frhpz7SL6QLjEI
	77H1igRZNduqtYheN8EqBZ5rRg3+M79YFnKIgocxhLKgUBds1tsI8jdDuNj3xh4IhxdGsxI06ah
	86wYv6VSsKv8PLHaBlMUUl1T5BtIQpdE=
X-Gm-Gg: AY/fxX4Dn+UG2C+8xJKnyvNy9/80XJZC9Kz+DGfmU18RFD2oXM5Fxk7XACRg5Bp/gZ8
	qkTRJ6FT+d6zLLUoRsb76GcaHgcGOOLGShdAaj1Mizh0UNfHF4Pe1akxZH/FXYIeUCBC5ejc4Jz
	j1NVnCFWGAkLNP94c4FslR0c30R2MDH9X3WPF3mC77K+CoBQj+JltAAYNBO6Q6uzoxdMObvl7Fb
	CHoY72z/r+ttuLwRh1RpkHSLlY5QksX5PPDHrNMejSHI0zDajnWinEAlwRuk3e6jvuD3jfT7wHB
	jATUWrliF7bKJHDPmY5FNnwsFFwfeF+ttWn2V9amHp9JjQ07UF0/UhDONoeGy18CPaoOtCgrBUi
	lvSJUm9n+rA==
X-Received: by 2002:a05:7022:eacf:b0:11a:61df:252a with SMTP id
 a92af1059eb24-1246a95864dmr1539061c88.6.1768917991939; Tue, 20 Jan 2026
 06:06:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com> <20260119-tsc3400-v1-1-82a65c5417aa@protonmail.com>
In-Reply-To: <20260119-tsc3400-v1-1-82a65c5417aa@protonmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jan 2026 16:09:12 +0200
X-Gm-Features: AZwV_Qio-O-vTE5PHylE3IQy5B0233NJK43z8Dbc2ZFFAu4-CQCiqmv-S4Yu3Bk
Message-ID: <CAEnQRZAuSkDmJuMAaJwKXhZRZ868_hFbUAy+raeS-vuZPMnjxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] doc: add Device Tree binding for AMS TCS3400 light sensor
To: petr.hodina@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89845-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielbaluta@gmail.com,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid,protonmail.com:email]
X-Rspamd-Queue-Id: 9B97F55FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 7:19=E2=80=AFPM Petr Hodina via B4 Relay
<devnull+petr.hodina.protonmail.com@kernel.org> wrote:
>
> From: Petr Hodina <petr.hodina@protonmail.com>
>
> Adds a new YAML binding describing the AMS TCS3400 I2C light sensor,
> including compatible string, registers, interrupts, power supply, and an
> example node.
>
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
>  .../devicetree/bindings/iio/light/ams,tcs3400.yaml | 54 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 60 insertions(+)
>

Please use the correct subject prefix. E.g: dt-bindings: iio: light

If you are not sure what prefix to use just look around:

git log --oneline Documentation/devicetree/bindings/iio/light/

