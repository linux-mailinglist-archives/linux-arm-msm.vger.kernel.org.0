Return-Path: <linux-arm-msm+bounces-94834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDI2BTtgpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:02:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 817FE1D5F52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 431AD3035A74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5940D37C0F8;
	Mon,  2 Mar 2026 10:00:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D5E327BEC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445636; cv=none; b=nn7C1d8abNXV6b8AbNic8YL/RVrim1/14Q6ZTDZ0jBoVSNnBNx7jH7AM588Lk6QG0UaqidlVvov9rOUkzVMuMnXb+ST8RPhCzcoOZSyyf99DM+KrYrazadZotnJDpA4bi3lDNEqZWUheYHq0FAYd/9F4YanzdJWH5v/m/yJTKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445636; c=relaxed/simple;
	bh=4y2TOHi9TFOVkbjGDV689T/Smv9dTsRouELeh2CzMQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plmYReshc10POc5SPr0ET6AXfQJXf79HSezOHD3qahR5IICid/rwV6SuAYI7KppsJVJoXbuwc7/Gir4Aj4FrpBjSb3bkshxC75vw/xnmZBi9ZvC+xZiQw4LVnK5UxhvHT4bs1ObzxWzOC9ZpQAJfTNTK+wyOAkkfuAJuxM5ReJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3597917e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445634; x=1773050434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8HkRe6vR1zoQp8bGRDh2bo/ApHTR7KmRx9+/JW4v6E=;
        b=C1QYysZsikiOP/NAWnnaw+bsLBQxCsCtOZCeVrYCq7QaVWulj16uBjCrAS3BtwvSkj
         0IRuIA5he/gh1JyAVTvMXwF+JUZzgrmcpJFhaAff+6gRiJzRJKLk1NEh6iy2pkl+ez2n
         Co+iq3h6aPLaezbhraE7E3NqM6VjJZR8gOJTYjAZh4hVOokeC0YtrjQBWh3L/3PDGIMO
         ZjTeq2PTwp9k/hG+M6FPbqw/2PtbpYBmgTyTSFnwxED8o0XI7ElWBkJdXhtr4tMFwME5
         bRE5HMEDxqznyLhZTVcuPhs08OvHQYQpSLGk0VqZqmPY9B3ud8/3nfWMvM8nJ+8ZRgHr
         QB7w==
X-Forwarded-Encrypted: i=1; AJvYcCW2UbyzXw17wg/KPsmvp9IfXxdF2d+Y8gia3XO8/YSJxPaHDiG0kgXNFZ9KJjpIPHu60NHxUooKTagpUAi0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi3SIw1egEFvOij/04SyLJ4SrDBuxWf6N0qvw42ZS6Avuau+Ao
	9tJJ9H308ZYAqAxHUUfSkcodxt9t4NCmjNAiuYnnc7oDlZYje+3JzhVovo0lyfds
X-Gm-Gg: ATEYQzzUkoLHVXcRp60y/RMFqz/QYLHoqFoe/04QZuQPTm5MSHR+hg5Y4mmYHlazSaE
	0sE/trtqQ9IWyPABqBECz95ydT0Td9CxreNyLKwHDP+chPGR99vpZZq8Mp2t9Yd5+HM+ON9bS+U
	jaa61Jb8c6//wWeql55xnwLvQYTP3UxU4vNZuLzDRfb39iK32KnwpZ+0mQ3J4iGHql+KT3uWPdJ
	wawtX5Vj54hnouxvJnXNLljQm9fcQv+2W4PH6B3SVarJtoopmVDi6GxkQAwQJjZpWnCP7SI7WRY
	5z+OFh+F/faaFQNcWW2hansgpD45FuFOGdH8I0TtVCHAX2MCPuXJMMFMDTboZBztlmzbRlWYZ5j
	vSyXrPVsdgf0+3PVwvHZGBSvLthTXBsB0itXCQ6WzL2M1xqI24cCsTkhnpYOQ7RfSc++0UW76rX
	njiIZH2nFCojn0lWUuNpv4m3Qm8iQfdkodnytc3yN3J8cozrD7nwhsAYXcxHQEYhYV
X-Received: by 2002:a05:6122:2a01:b0:559:6960:be0d with SMTP id 71dfb90a1353d-56aa0a8ddefmr5946629e0c.13.1772445634013;
        Mon, 02 Mar 2026 02:00:34 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7a8sm15604951e0c.4.2026.03.02.02.00.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:00:33 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a87d7c5d7so3473629e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:00:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJs0CjvaNZVCK7yKuonrKoJgr5E1V2uaGq95qUlBtTiCqOOnFqVGxYO9vXiWlJJ7yiyFbYUWoarWVvA1ZG@vger.kernel.org
X-Received: by 2002:a05:6122:1c0f:b0:566:22e6:35df with SMTP id
 71dfb90a1353d-56aa09f82acmr5754346e0c.5.1772445631307; Mon, 02 Mar 2026
 02:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
X-Gm-Features: AaiRm52H_j84TKaKZyu39pwrVpDQPCGWPfmBnPTyHzO3FAF2JqSLhA9oDdBhutg
Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-94834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.093];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 817FE1D5F52
X-Rspamd-Action: no action

Hi Danilo,

On Mon, 2 Mar 2026 at 01:28, Danilo Krummrich <dakr@kernel.org> wrote:
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for your patch!

> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len = strlen(s);
> +

The newline case below is is basically the same case as the empty
string.  Hence if you would move the newline check here:

    if (len) {
            cp = strnchr(s, len, '\n');
            if (cp)
                    len = cp - s;
    }

then the "cp != s" check below is no longer needed.

> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old = dev->driver_override.name;
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }

Also, this block can be eliminated completely...

> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;

... by pre-initializing new to NULL, and making the allocation of new
conditional on len being non-zero.

> +
> +       spin_lock(&dev->driver_override.lock);
> +       old = dev->driver_override.name;
> +       if (cp != s) {
> +               dev->driver_override.name = new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

