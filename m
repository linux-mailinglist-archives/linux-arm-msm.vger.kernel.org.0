Return-Path: <linux-arm-msm+bounces-95133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLKWDlDdpmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:08:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7E41EFE46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BDE8304A313
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2859642316F;
	Tue,  3 Mar 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDMK0bJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABF35B64D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543022; cv=pass; b=ZZMXN+XbEKi5SxWc5KjGM4kKkwIEN47C+KjpCdiStwpYi6NTjKCPSdyzJBujnxgghaxTTlAEcojSbwBUxQsHxss7oUA9MHJV4uwiqDl8/OoSAUcT6CVDhHryr0pwhhgebA6Bjq5hPQdhm1b8W0zqy6l0pJcRR97tT7tzvaCwAYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543022; c=relaxed/simple;
	bh=bdXuAHR+W7DcDsgTssbNNylZwjKna61a4d2JwD1CRZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FySihXVLRy7et5AV0+lHG6R1BRjzdfgfmW/hmsuv2aZ6CF8scGOjqVs3Py6cD3J0ZGPs7sPTVKUudrvfgOnClmj19s1lXG19hwpSqdH7oOP2R4o9iKgrJV8T+OaemogacYVsLZOgJSxbTnV6bq2f76Vh/PSzrDhuAkh503E7f0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDMK0bJ4; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40423dbe98bso471540fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772543020; cv=none;
        d=google.com; s=arc-20240605;
        b=OBisdyv07b+PromMJC3SUrMXwygBJxBGNvXdmWqMXxBr6bTj8DpUFtzcs3pw4XR/SR
         cLLBwEmtACfTPzNGAEyeEP5rZVAaMGI/5j7VLt73flFBkYptSURZB9uwGIhpTiwFrukT
         aUGaGedgGolAmsha/VMEOHy4MVomXDA012QZbf0K36oJr/0tdyO/CTXUBOZkHdVXbabb
         jp6+43Vw6/1kouKFjjguOh6wxZpgiQ1Bw51/Y7TpDfinz49gDhjbPnh5p6oXCZqgjucy
         HdjhmOJ4O//GtYsosp9GT1jkvsheaujZEXk8ubNINNHJxXEGexV3NpWImPC1GuAmmmSL
         5sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        fh=/QcrfAVAsJ5oEVkPoqs1Ye0gPPyTR19NaiZJ4zChUxo=;
        b=R7JepV7Az3pLsEHCL6EA1HzwOk7NVJvDFmig3OgK4vb2EqBksNNeLG96eC3iB2/E4+
         uXDxokcuM5y2QhO0SMW+m4N2SUbbdcW1dUQigwA3P+JCcV/P/kBjpHXLVz3e1m7Z0AhZ
         oGKRCwd9/VBSvHDGB12tST0FzR0mvnBlCe2AtjVQUA5whBQB4i7zq41zZTdhqWr7LFpq
         HKEoDEp7gzrFnem077rv5sK+/Az1Nsp+PjaRFN838a0nocrLKidnHgXh+IEoG5KDKqH+
         9EtuI7ZNVZl/CuU6R3cuNU7f9ed9xf2cWY4XNqQIkOnoFWjHX0Ui872GsNYePF7pmth/
         7Prw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772543020; x=1773147820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=DDMK0bJ4IhW4O3tUQ4nA/+xOWBNE1ioav5S5FzY/jWWS5ycjtIgAgkIi4kPzz11Ok+
         DtzkXfRNkhHvWk17RCat+vgv2bB5mJcYVCpFjRBI/PZ26+Tux4DDBil+6Zf5d3lpANFi
         imdIaCvG2cyPDsA66GhBqSFV2N7j1WUiofwtKgHRgQ0ixk4UNrXTXNKDHAVFzL69YXNF
         nVDDuukaz/P9yXu5fDmLv4WqpbwUIYuu372t+XDv/mLcNfXyDNeLOf+FhBSkZcNek7OM
         xptcjevbZjCZULwZoxhX6vVUgssJ66px6HcK6LgdBwiZfG8r8hzg00gwrvSJMGKgRzdb
         vKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543020; x=1773147820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=P8DKmcQchD9sWPxXs9E64gPLGUrjbjzLGLaYaHYimnz9IouQEBrd7SrKPwHDc7N6Q/
         LJDBTWzDnnPvlkKC8wKbibAhOLqPeSkXDZi+KwzsYnMawFr7wmBiUMfSYWi4tLAeiugS
         E1xf/ROkirgVnjaoazAVUnmWDqa5o45Iv+0jGIFvNNHKRQSO+RvedFNKJtIhmuG+k0ya
         p3e+4OmxdFmpWCu3ZencTulngcMGnjLURLUYtKAMEzfMJXk4ao84/zLx0cTUOlosIJb5
         gPG8D6zrlK/NKqgByTA5ABbmFKUw50wCtz44e0j6WdcoqbYZi3nr6Zp9Ju2F8Va1V6rT
         s9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWuO7+ldAlJqpvZrGzv45lhY/vfcG6+4Awfr9avgjusSjfIuFYvlEsCeOdmpDtFb7mloQV1pB+DzxtnMV04@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nBtASDj5hc0oZMW/3pOqAGLX8vhuNZbkRtNBi29CWw00373K
	ehYH1hg7nDZgxChADpQDaTOt1ifhT7JgL0KTybi358SZsMlUeY1zPfUnCwcBZUw686WIHgJ0gxs
	zFCEyWgQ3cstLktx9+Se9R0nUaz90hsX2xyy1
X-Gm-Gg: ATEYQzwiUnhNBBAkO65dG337oyJ4V+IlqyUilUW1PTb0n+FtJhDab/K1Cl81rq9tLQh
	4p7scdDQ5BruxlRFr0TMDO9GkVL6IsEmPkqXPRw2BR27aWbdJ5UR+Q6+m5j+/gKEv0DhRJgVwlV
	ZFkh0Iu4DEtYJ524jqRwshi92sf+XNCYl/4sgbhJvdaEnxGUPPP+baDuLjpV8SUapRWri33qBoV
	nI68V2VHSC+KY1RV2ZAbCs6TabyaLc/6r08Pj8ozjq+QTVEUyrOKi4pzjmV8lQ677BlGyGkQDov
	aMtekRaINQIfnlqUniTJ/Nw7m0idusNwlHGpi00z0hGoA5QRzl/Mwg+4I3hjd/racLJ/i512fQ=
	=
X-Received: by 2002:a05:6871:7383:b0:3e8:9e7b:4ea4 with SMTP id
 586e51a60fabf-41626e21440mr7566575fac.6.1772543019367; Tue, 03 Mar 2026
 05:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 3 Mar 2026 21:03:28 +0800
X-Gm-Features: AaiRm51hHETXLy5xgoyPjMD6CQcJQj3Ex8YjBm7PX7a5CmSkvNYD_5jZKUYKtjs
Message-ID: <CALbr=LaQoV0L2dxiHKvoP2weZNWEXXG434ir8k-Ej=ouBiEWHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CD7E41EFE46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95133-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 7:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.

Hi Danilo,

Thanks for the v2. The code looks good and the bus_type approach is
much cleaner.

Just a minor note on the commit messages for the cover letter and
patch 1: they still mention adding the DEVICE_ATTR_DRIVER_OVERRIDE()
helper, even though it was correctly dropped in this version.

Thanks.

>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Changes in v2:
>   - Drop DEVICE_ATTR_DRIVER_OVERRIDE() and make driver_override a
>     struct bus_type feature instead.
>   - Add driver_override documentation in .../driver-model/binding.rst.
>   - Move kfree(dev->driver_override.name) before release().
>   - hwmon: axi-fan: Use NULL instead of dev_name() in
>     devm_request_threaded_irq().
>
> Danilo Krummrich (4):
>   driver core: generalize driver_override in struct device
>   docs: driver-model: document driver_override
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure
>
>  .../driver-api/driver-model/binding.rst       | 48 +++++++++++++++
>  arch/sh/drivers/platform_early.c              |  6 +-
>  drivers/base/bus.c                            | 43 ++++++++++++-
>  drivers/base/core.c                           |  2 +
>  drivers/base/dd.c                             | 60 +++++++++++++++++++
>  drivers/base/platform.c                       | 37 ++----------
>  drivers/bus/simple-pm-bus.c                   |  4 +-
>  drivers/clk/imx/clk-scu.c                     |  3 +-
>  drivers/hwmon/axi-fan-control.c               |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c               |  6 +-
>  include/linux/device.h                        | 54 +++++++++++++++++
>  include/linux/device/bus.h                    |  4 ++
>  include/linux/platform_device.h               |  5 --
>  sound/soc/samsung/i2s.c                       |  6 +-
>  14 files changed, 228 insertions(+), 52 deletions(-)
>
>
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> --
> 2.53.0
>

