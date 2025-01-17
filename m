Return-Path: <linux-arm-msm+bounces-45415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D962DA15331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 318C61887FC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF45199FB2;
	Fri, 17 Jan 2025 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5gVwnca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA2B17FAC2;
	Fri, 17 Jan 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129108; cv=none; b=BY7weL1i8UU6S0kOH0oRZp3PjiwtJnqA1hlOZoik8xj9CqJ3I1MHqNCetRKN7zc4xNtevXIkGzqrJ8/7z3hLj9dt9lR68XAZOPtbCUR0oANgNf5gJekwNIlMrNlb14C2tNuz/XDEYvsfeanMSoTuHPvemTaQJhvwTR212NJZIAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129108; c=relaxed/simple;
	bh=B5V+XPr0ozMHNvK105RmAHyS+dhJuEy/yONGrS4GIdQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JLNCZeZMkDs/cJVHedGbURjYuxy6JApweuyDkCb4mFN8GQISBRPgG87j700jML5tSAFTi+9/DHps4ZqM4UTVa9f6rr9veaMxiqywyb6GGB2XFI3R6TiDFvTn1OXaZizSqnpBJRnkC+eqoGgWK8t3fKlsOH5/YPM5+g67dJw72Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5gVwnca; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737129107; x=1768665107;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B5V+XPr0ozMHNvK105RmAHyS+dhJuEy/yONGrS4GIdQ=;
  b=E5gVwnca6t2UL8z51HKIcTWPo7w3MaDepLXetk1Q97uhXG/a7VoP/hO2
   gHAfXoE8CT+wCDWAbaWdpdl0AuyQyllgGg7/i986LGbALiHfzZeucbs9z
   GWvRW9yRbOShSZsZhqHBi3dSSVBG+X+LXZ8+TYEg0Tu1HYHYSirTOY5/O
   xiTh105C816EYCiuKxgC75iZX3KAYgpFNAJ2YRH1xZ6wgDqsksJEdoTU3
   s95RpuNytZUtxtcoytRoF0yWTgIH9b2VWUFOHXZR9GOFLm02PlBuTajwr
   NhmkekdfUsYo6wKOka/iM1nw0mr3DZHScRn/FiXCnrFom2TwsYMYLqgj1
   A==;
X-CSE-ConnectionGUID: pLxt4DKdTGWvIfmZPWyLgQ==
X-CSE-MsgGUID: OGy+NBzBQReUayHDPfEBxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48055375"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48055375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:51:46 -0800
X-CSE-ConnectionGUID: 29fSSbRRR7KHEGUAnmdTzw==
X-CSE-MsgGUID: Gh8SpIDbSHud8VA2VAKDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106389439"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:51:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Jan 2025 17:51:36 +0200 (EET)
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
cc: Pengyu Luo <mitltlatltl@gmail.com>, andersson@kernel.org, 
    conor+dt@kernel.org, devicetree@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com, 
    konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, platform-driver-x86@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC
 driver
In-Reply-To: <0a6c6586-3dd9-4af9-85f3-376f2788b21a@linaro.org>
Message-ID: <3a88c45a-5f26-3a14-3ae8-aa09c00b1431@linux.intel.com>
References: <65dc7d7f-cee5-4eff-9ab7-153b12be4f26@linaro.org> <20250116181532.134250-1-mitltlatltl@gmail.com> <0a6c6586-3dd9-4af9-85f3-376f2788b21a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-478076918-1737129096=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-478076918-1737129096=:932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Jan 2025, Bryan O'Donoghue wrote:

> On 16/01/2025 18:15, Pengyu Luo wrote:
> > On Fri, Jan 17, 2025 at 1:31=E2=80=AFAM Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> > > On 16/01/2025 11:15, Pengyu Luo wrote:
> > > > +
> > > > +     guard(mutex)(&ec->lock);
> > > > +     i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > >=20
> > > You should trap the result code of i2c_transfer() and push it up the
> > > call stack.
> > >=20
> >=20
> > This EC uses SMBus Protocol, I guess. Qualcomm I2C driver doesn't suppo=
rt
> > this though. The response structure define by SMBus I mentioned them ab=
ove
> > (Please also check ACPI specification 13.2.5)
>=20
> What difference does that make ? The i2c controller itself can return err=
or
> codes via i2c_transfer().
>=20
> You should trap those error codes and take action if they happen.
>=20
> >=20
> > +/*
> > + * For rx, data sequences are arranged as
> > + * {status, data_len(unreliable), data_seq}
> > + */
> >=20
> > So the first byte is status code.
> >=20
> > > > +     usleep_range(2000, 2500); /* have a break, ACPI did this */
> > > > +
> > > > +     return *resp ? -EIO : 0;
> > >=20
> > > If the value @ *resp is non-zero return -EIO ?
> > >=20
> > > Why ?
> > >=20
> >=20
> > Mentioned above.
>=20
> Right, please try to take the result code of i2c_transfer() and if it
> indicates error, transmit that error up the call stack.
>=20
>=20
> >=20
> > > > +}
> > > > +
> > > > +/*
> > > > -------------------------------------------------------------------=
-------
> > > > */
> > > > +/* Common API */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_read - Read from EC
> > > > + * @ec: The gaokun_ec structure
> > > > + * @req: The sequence to request
> > > > + * @resp_len: The size to read
> > > > + * @resp: The buffer to store response sequence
> > > > + *
> > > > + * This function is used to read data after writing a magic sequen=
ce to
> > > > EC.
> > > > + * All EC operations depend on this function.
> > > > + *
> > > > + * Huawei uses magic sequences everywhere to complete various
> > > > functions, all
> > > > + * these sequences are passed to ECCD(a ACPI method which is quiet
> > > > similar
> > > > + * to gaokun_ec_request), there is no good abstraction to generali=
ze
> > > > these
> > > > + * sequences, so just wrap it for now. Almost all magic sequences =
are
> > > > kept
> > > > + * in this file.
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
> > > > +                size_t resp_len, u8 *resp)
> > > > +{
> > > > +     return gaokun_ec_request(ec, req, resp_len, resp);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_read);
> > > > +
> > > > +/**
> > > > + * gaokun_ec_write - Write to EC
> > > > + * @ec: The gaokun_ec structure
> > > > + * @req: The sequence to request
> > > > + *
> > > > + * This function has no big difference from gaokun_ec_read. When c=
aller
> > > > care
> > > > + * only write status and no actual data are returned, then use it.
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req)
> > > > +{
> > > > +     u8 ec_resp[] =3D MKRESP(0);
> > > > +
> > > > +     return gaokun_ec_request(ec, req, sizeof(ec_resp), ec_resp);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_write);
> > > > +
> > > > +int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *b=
yte)
> > > > +{
> > > > +     int ret;
> > > > +     u8 ec_resp[] =3D MKRESP(sizeof(*byte));
> > > > +
> > > > +     ret =3D gaokun_ec_read(ec, req, sizeof(ec_resp), ec_resp);
> > > > +     extr_resp_byte(byte, ec_resp);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
> > > > +
> > > > +/**
> > > > + * gaokun_ec_register_notify - Register a notifier callback for EC
> > > > events.
> > > > + * @ec: The gaokun_ec structure
> > > > + * @nb: Notifier block pointer to register
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_register_notify(struct gaokun_ec *ec, struct
> > > > notifier_block *nb)
> > > > +{
> > > > +     return blocking_notifier_chain_register(&ec->notifier_list, n=
b);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
> > > > +
> > > > +/**
> > > > + * gaokun_ec_unregister_notify - Unregister notifier callback for =
EC
> > > > events.
> > > > + * @ec: The gaokun_ec structure
> > > > + * @nb: Notifier block pointer to unregister
> > > > + *
> > > > + * Unregister a notifier callback that was previously registered w=
ith
> > > > + * gaokun_ec_register_notify().
> > > > + */
> > > > +void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct
> > > > notifier_block *nb)
> > > > +{
> > > > +     blocking_notifier_chain_unregister(&ec->notifier_list, nb);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
> > > > +
> > > > +/*
> > > > -------------------------------------------------------------------=
-------
> > > > */
> > > > +/* API for PSY */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_psy_multi_read - Read contiguous registers
> > > > + * @ec: The gaokun_ec structure
> > > > + * @reg: The start register
> > > > + * @resp_len: The number of registers to be read
> > > > + * @resp: The buffer to store response sequence
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
> > > > +                          size_t resp_len, u8 *resp)
> > > > +{
> > > > +     u8 ec_req[] =3D MKREQ(0x02, EC_READ, 1, 0);
> > > > +     u8 ec_resp[] =3D MKRESP(1);
> > > > +     int i, ret;
> > > > +
> > > > +     for (i =3D 0; i < resp_len; ++i, reg++) {
> > > > +             refill_req_byte(ec_req, &reg);
> > > > +             ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp),
> > > > ec_resp);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +             extr_resp_byte(&resp[i], ec_resp);
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
> > > > +
> > > > +/* Smart charge */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_psy_get_smart_charge - Get smart charge data from EC
> > > > + * @ec: The gaokun_ec structure
> > > > + * @resp: The buffer to store response sequence (mode, delay, star=
t,
> > > > end)
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
> > > > +                                u8 resp[GAOKUN_SMART_CHARGE_DATA_S=
IZE])
> > > > +{
> > > > +     /* GBCM */
> > > > +     u8 ec_req[] =3D MKREQ(0x02, 0xE4, 0);
> > > > +     u8 ec_resp[] =3D MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > > +     int ret;
> > > > +
> > > > +     ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     extr_resp(resp, ec_resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
> > > > +
> > > > +static inline bool are_thresholds_valid(u8 start, u8 end)
> > > > +{
> > > > +     return end !=3D 0 && start <=3D end && end <=3D 100;
> > >=20
> > > Why 100 ? Still feels like an arbitrary number.
> > >=20
> > > Could you add a comment to explain where 100 comes from ?
> > >=20
> >=20
> > You may don't get it. It is just a battery percentage, greater than 100=
 is
> > invalid.
>=20
> 100 meaning maximum capacity, good stuff.
>=20
> Please use a define with a descriptive name. That way the meaning is obvi=
ous.
>=20
> In fact if the name of the function related to battery capacity then the
> meaning of the numbers would be more obvious.
>=20
> static inline bool validate_battery_threshold_range(u8 start, u8 end) {
> =09return end !=3D 0 && start <=3D end && end <=3D 100;
> }

I suggest going with this latter option. 100% tends to be in its literal=20
form elsewhere too. I suppose we don't even have a generic define for=20
"100%", at least I don't recall coming across one nor found any with a=20
quick git grep underneath include/.

But I agree the naming of this function could be improved like you=20
suggest.

--=20
 i.

> >=20
> > start: The battery percentage at which charging starts (0-100).
> > stop: The battery percentage at which charging stops (1-100).
>=20
> Or just add this comment directly above the function.
>=20
> ---
> bod
>=20
--8323328-478076918-1737129096=:932--

