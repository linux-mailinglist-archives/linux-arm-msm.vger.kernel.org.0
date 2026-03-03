Return-Path: <linux-arm-msm+bounces-95158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MZsJgD3pmmgawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 15:58:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CE91F1E3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 15:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DABBF30642D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 14:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3301D47DD61;
	Tue,  3 Mar 2026 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIeDQHi0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756347DD53
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549564; cv=none; b=Uaxsko4dbsHNqUIGJzdKzx3aukKZrG3rPcAFulVr7eJgqCjczI3n0byhI5LfpAzLpwKPySErBSp3XwDY3AR0XEOkQ6yXK74YU3CiEhNCKsr/2Q7Vy3cP3ZFmbrvo41qBkyBTnaKC8jkb8eI+UwgTxbSrwd08WyEUY0F/ztvcTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549564; c=relaxed/simple;
	bh=mSRQ1eMomHCwVtqBWfZCdjiyysv7g8iYFUzJOGWZess=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hyHa94eT6UYdDqqiy0cU7Z79S6kiklr/IXUyDbwwNufsV4X4AfQ0vC7CzEcQzlIeCyyE2Q0ADtM2HywSCVp+yfhg6JGX7VqsNVcMEBb43Yo2aQYeE/GRyo8NyRkyWDo6uxxn+BEeP+kpAejZYwhbR36PN8LvPVAdtv4ZJtxRPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIeDQHi0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1507529f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549561; x=1773154361; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=DIeDQHi0AAP91R6YbGWauz2eMg14tui6twbk5qs60s0DoQ+1m4sNZYPu4gM/D9DH1t
         hNmg2wPiCPvmc55Y13z7FQ6XbJB5Tou0H+GOL3lB5aw7HmnYKeMv0+mwUBic/58SF7oZ
         wihlcPIH4+FqRGqWqn04EyiWDXuZmM1k0zPviKdcBcgND8M5aRd1aWRm2fS16xL1pjoh
         boqcDFZv3MptHnPpOhCbOZnxFpV+yeIZ36XKxIy48p8jJ7CGYar4mNBW6FIPHgKRrOj7
         U+jozLWw9ItdmiDZTQQvdptl4UqQuTo626xTP3rk0nf+6jVzTUnnvm4a9kMDiVnUZHyJ
         yaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549561; x=1773154361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=nP7Egxl7/tbAx5BrY/0u650C5ewsFinwy0+sTL0SW41ahVzJ4WMTHRdPvWkFOp8vMd
         QC5hvJt76BEWD86Rux1zt0Vbj5P8U+Uedu3aEUHmKEjDHKWq072X9Tdw+QOIswci0DxO
         V7FhaTGmUqAO6AD1Qz1yUMjEdpIvGeeFatfWMIHc3Q+c9SofQKr+1jtcS0pMCYqM+Lis
         vD/m4ZgmUICclKfnpidI1ZFZ1fzSGC3QU7cshgyz7nThKXiUMTMUTdbCGGLfHdDuF/Rw
         xX8Z0MQNrQ+pYeqedIg24on+ux7cBViU2GsmL2Og0m1FE/QueoZQTysbk/Q4wrNawExo
         yAuw==
X-Forwarded-Encrypted: i=1; AJvYcCWECYDzP3Kf6iKzgPxYEygvqNbx+jO88Ym90txEwLxOkFZ1KKF030XJoxpTav5Hb2O0sqKNAEXQ4xOEODah@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBG6ePmfGFyn8kdnNDiCSXY0qprT5dzpfyAD5aAweCHyDu7Nf
	YrsT9V8ttRTzCgz6jcHpH0NFWWuyIZMeYRhs6i5qmDBeyFmx5G3HN1S0
X-Gm-Gg: ATEYQzyTp5Kf2ByiNMM1c3Zn7fPnS+UuufgBLprytSB7Jj76ZYLwp7KabMqoLCf8MJa
	VJTEHHcfopgjsXVYJdV0KG1GbP1qPpSYeOtJgAwdBLAtScg6DMg6roDjXckBoaj2ei3z+FFfdSR
	066o385w4Ft5HpunOB6TS9eyg4KS2fLn8vmKJYrA2X889162q2stU99S7gju0EGyVFzbuKsBQi4
	EEeQF8mfDOMwKc1pm/WV34NbKW/CfHvIwpf5le0A3X9MBbnV2uoSzt2ht+b3UNUHHJswgpKtrzl
	N4XJRB2Kt66fkWrh28LmxpU/6zuT1j128D7DNH0o4KmoWZDzfyHOFuJCeMEUzT3Lb20cjA7yS95
	VQcnhhw7TX+utY5NyxieU2c7ZW80fYQMf/zr+T1W+SBQ2A0jeMRhP7vIKIx0RQjwEzTx/lpgi+z
	VjIJyI5HrhKwv/qs/dcHyeGmhlzvmB73A=
X-Received: by 2002:a05:6000:4387:b0:439:c279:32ea with SMTP id ffacd0b85a97d-439c27935b1mr3280566f8f.39.1772549560930;
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm20531779f8f.18.2026.03.03.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Message-ID: <bddd7c86f5d9535ce5fe58e6271396da40750cb0.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Tue, 03 Mar 2026 14:53:24 +0000
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
	 <20260303115720.48783-4-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 15CE91F1E3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 2026-03-03 at 12:53 +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
>=20
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/axi-fan-control.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-cont=
rol.c
> index b7bb325c3ad9..01590dfa55e6 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_devi=
ce *pdev)
> =C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
> =C2=A0					axi_fan_control_irq_handler,
> =C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -					pdev->driver_override, ctl);
> +					NULL, ctl);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(&pdev->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to request an irq\n");

