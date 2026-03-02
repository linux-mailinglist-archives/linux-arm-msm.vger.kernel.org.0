Return-Path: <linux-arm-msm+bounces-94882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGoENp9vpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:08:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 458371D7310
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2971B30804EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8B435FF5B;
	Mon,  2 Mar 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFI7GPod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411F0331A41
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449504; cv=pass; b=UTpYntoIxSp5FvLuNf4qgqfE6Hv2hCzs43mitNOYrVpsk/aghptSx8F/bxL7KCyHrJXzETS9+04Qj8e1hhUM7sNHHkbVjeEyuMHBdDfGhgBpmopYCc2N59iXCx0EFbFiWzUasOYQV+8LEUtg9aCyqS2mLxvZIzqV/Gi56h7Q+uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449504; c=relaxed/simple;
	bh=MNN0MxQutkVAICnu21/rtSu7MZP/rEU4Ta6qHPWAsoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhk3FrB2JSky8A6g/EW6gIe3X7WQOK+2zJLf0wFxCgZs8Z5ZTfUdiCKrRVoBUIQ8lEBiVnsB8p5fRwNXwHGEBEDo7OZfeDp2eAm9q5HvAMSBMl9VMN/OIh9FDP65M9NubaSkoVWMm4lFvzrVuIWQ6qLuNgcEb4JK32Um5AWA+gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFI7GPod; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d18d0e6d71so3533551a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449502; cv=none;
        d=google.com; s=arc-20240605;
        b=QJk0T33atB6F2RDE8uvPm9GD8B6Y2qhrQZZkZ9lr/EJbuXELYPOph9B6ChY3x6MAME
         QawU9CC4MDX+fwXRwTW2pIWfAMwBu9IgPs5rR3mb056epuAq8SYfpw6954OC0K9iKbi7
         0O9d7lfR1uCruT60pnfXBK7uzy/1Z3X5u6V3YatIEg0h9K39aSIifTuhi4WeCKtEVh1p
         pXpc0zm0AWMboSA+k743fbkEODPhnukcUQ6fAqmCScY12o0NTerqbkilkzNaW9LVLLpR
         fA9xpwn6nh0rBgz3kI8fHXvIr3tVijkanWMwpHCPO+ilXfOQ/R+zi3S9jVoD3RLqGjGf
         yv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        fh=5Jj9T34xjWZy11MPQWyuLF0y+kcB4nlpih3XrqqMr1w=;
        b=I7r5q2Q3o4v+etbiEu6MJOLPZbL/1wFEVsZAHTNdiGU3HEdt/9s9IlBXeSSOFDpWTq
         A55yOWK413b5qAKQxCukXYOjE0IOnbjoNydLpqwEzYYx7eXkHWPlef+11ZnZHt9NEJNr
         dysCvcTNEYO9I1+v/MdT+s4AIPcnQ7AyegYN+H6uctDnod9E1u/j5CSFEJN4CstOfY/I
         Tk9as+sjExLRW4uqURshbsx/NUOgXqa+n8SHuWTCt+wJv+L27kyC4Hqgmgl47bfCjOJK
         fuwGuLAkvKP6yLyg7NWez2glfkHMtUMeQnQnoa3pbxOCZkwcwM4U81vzi/iE0bw7WGIh
         XdBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449502; x=1773054302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=nFI7GPodwr4K7PC1HWfUVpPzdSjla2PQOIxDuEcBwSuSUvTWuwE5h20gW/c+gCy4t2
         u7QR/gPdyhMLyDTWmpznLdei1863tjE2BSGZTCnbBiufkUiS8X2sFkbHvf3zZU+SGT85
         Zdsw87IoZOF0vQlTKF+4+Nc/XEH5dCA0fEA1vh1IIJpbkto5aoGMyyrDS+SrhIZjaZVs
         vRYmlqAhwrxFdRyUdJ/JrIG2/Gpu+z6egxQjMYD3S0qZzGC7YK/grNnR5wEECaM1p0lb
         LeT+svI9a4QLe600affzmHLczk+PGzyC1rZ0JbA9hsMhED94j2TQnwiOMoUmvSFiGP08
         Ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449502; x=1773054302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=GkdVUDW8MPvcwMqmSJvgmWR3rFsUqdouw+py+3jojknDKMnz/2XIeRYn3g8BVkz6ZW
         ggVSZ1BXWcnauiyaYgUbphjgwd5hbMbKSSIEJbax52bMXg8G7h3jz4XdbXiud+DvHhqL
         UJm8uYgmDYDXU2ZTGNlCZX7S8bYy5l/0qmEesvtfxXOUYFIz2qZN44NJxDV6BWrPortZ
         5eM0PqL3TndxIbdBwUemm++GxZHAUNPslC8zF8G0/hZ6flcL2bPRMjrnkYZ75wz4QYqC
         0bhSqW6kTMeXcZL5g8BkaFFKg5FGXTppy33LjTnR8Qq7ph2wfnsRYmjFJcx7u9P/tOWi
         Vt8g==
X-Forwarded-Encrypted: i=1; AJvYcCWj35hRL3U4Dk4uOidBZTIQbN+GQDQTURp9dycvGKh5w/6i7lLVINB6idyiIyB8cwEM2R7e9UO7IumejZWj@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNZgqSXVsPzcbpyuYNV859g+0X+Vx9W1tkfhr8OozzECJPbDp
	J9Kj1CknaRFbtsPHTGeq0unc5TJMTTnyYl/k74vu8mcEtahBCbJ0nYPnLMjRbVaFNj/Yt0c9ZJB
	NQ7xqqrjZt5H4a1BHuyp5eVRwtUtpVJI=
X-Gm-Gg: ATEYQzw6cyeSVIfRoiCVXSHlNZsTVvYasy0GJwdLGSWuZAuEa+qzhsp+yDxtg4XyB/a
	C5FxNwgTqjiU54wunDgaJ8rqXU9XmWu9mx9C5rDt57L9IbCV9x6TRr759Dfi5htnuyPibg+DHK4
	cgXZMTAsIxyISL0Yo4f+VboUBzX++sst0cUHkPBa/JEpHCrn3mYZHN+pt1idsVAh60+tPBdFgl7
	ccqE5FyxTH9S3KPDhBDBCm6JI78VELLegiaL2QtmeV0uNY9dUJRDKgnJtsjKrGTYNNc1O8uQ2am
	FIbFXNNlK4NFRfboCpN0kYw9q9BW6FXUrmTpjTcd60bKeSZ67N23LBvqMDSVG3gjd28g4RjwgXc
	=
X-Received: by 2002:a05:6870:ad08:b0:3e9:1643:5977 with SMTP id
 586e51a60fabf-41626e0fc5fmr6099442fac.18.1772449502199; Mon, 02 Mar 2026
 03:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com> <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
In-Reply-To: <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 19:04:51 +0800
X-Gm-Features: AaiRm52arKfwi8YCxjpEdTXQmweggZZESyxe8RNIzUhwuktCE_TgfQAoQ172OQc
Message-ID: <CALbr=LZ6Qu+oi0XiTZO4u+H2Jsv51jWazmK7xPt5EgK9DOy-hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94882-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 458371D7310
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 6:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 9:36 AM CET, Gui-Dong Han wrote:
> > Applying the following diff fixes the KASAN issue. It was just a minor =
bug.
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index a8cb90577d10..09b98f02f559 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
> >         devres_release_all(dev);
> >
> >         kfree(dev->dma_range_map);
> > +       kfree(dev->driver_override.name);
> >
> >         if (dev->release)
> >                 dev->release(dev);
> > @@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
> >         else
> >                 WARN(1, KERN_ERR "Device '%s' does not have a
> > release() function, it is broken and must be fixed. See
> > Documentation/core-api/kobject.rst.\n",
> >                         dev_name(dev));
> > -       kfree(dev->driver_override.name);
> >         kfree(p);
> >  }
>
> Yes, we must not access dev after the release callbacks has been called; =
no idea
> how this kfree() ended up below. Thanks for catching!
>
> > With this applied, along with the PCI driver diff from the WIP patch,
> > the issue is resolved. I tested this on PCI and both PoCs no longer
> > trigger KASAN. I also ran with other debug options enabled (lockdep,
> > sleep inside atomic, etc.) and hit no warnings.
> >
> > I was working on a similar patch recently, but your version is better.
> > Not returning the string directly provides better encapsulation and
> > makes the API much harder to misuse.
>
> Ah, right, I remember you mentioned that! If you want I can add your
> Co-developed-by: to this patch to account for your work.

That would be great, yes please. Thank you!

And thanks for all your hard work on this patch series, it's a really
solid improvement.

