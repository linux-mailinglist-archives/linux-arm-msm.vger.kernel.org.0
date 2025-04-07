Return-Path: <linux-arm-msm+bounces-53433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BDA7E643
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FE619017E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 16:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3C420ADC0;
	Mon,  7 Apr 2025 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="endZq3d6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B420A5D3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042448; cv=none; b=Op/FgaVMnhjvl39dOfxNJHKeOy/JKidnPVmLZw0if7jnb8YX/cqc+jI7miCYuViE6Cepze9wtZ5LnZ9mg8221m/BKV6FSvTGiPA8SpTEKNSNEDtbcD0jPumadBBF0LAPqhVrmYi+9MXmKasIkNapOChVOzHLBjzOC/UM1WGhStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042448; c=relaxed/simple;
	bh=MZ1+v4Yr8SrxsYFLNiPWcJ3X3rXXmM+Atb5i9VRwigw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvYtOFV4KU8xqFtH0hMasbvqw1Y5tr9B1gP+dpiLacadygqr4k1vToJ72VOviFiZyt1ZCPe8tAtlpgZgU7u6WMJXOLjiyHj3UjsjmZ35K3BNRi2uaiHlNVEB6MxjgqzeMSSgUmPIyXk4LXDXp6ObYt5UoL8Ml5kJ1tzKAsoKKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=endZq3d6; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7023843e467so42690227b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744042445; x=1744647245; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bod33nGx35GYDGeyLDpG4qYPRiHJzUFJHwZD8P4WupU=;
        b=endZq3d6f2rGBycLrcxNGnEUlxVaR8NwpKrT1XudIkVdUOkbzPggfFGfOlzpYKnUOF
         D1Lga+Nwnt+zVDusaHfz9jmONa54DD7079bRQQA1oafjVIxsPCdLrQQ5bwpsowclji+d
         YSImJOejdLXF6oGTGmuGaj3qaMGVPpXI8ptu/890dc5FwuPqR7xZG4rOJM9hcfKOAi5o
         Jtm1E6S1BsPzc56+0MZh1izD70z/ge+ViuYlo2CQIfmR/2iSioQkql9KHoIiw7zk2enj
         z7RPhShjiortuBqkwrbW8HGxxENiigwiS9dsDhANO0Lz+VKOR6nozIaM55La461Tfn9W
         0QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042445; x=1744647245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bod33nGx35GYDGeyLDpG4qYPRiHJzUFJHwZD8P4WupU=;
        b=emR4ri18xpBluzpDEZmGZEHigJXhCmjwCxAOk/CAcM65Ea9gcnJ3pRzEx+AYQqfokM
         G/3I4yoAo/bHbruqttBAmVeHZl4IOCDMWknFNIzFeSXxF4lUlAKiRy9mPo+9uonQ+3ub
         tSD83OuCHz++nLNp6lW3no718uwHe5LfErYArvASqbGTeZO8/0eLhq7oeHOq5miXKdnJ
         e/Eu+I4/pWvQW3J+spufbdR6g+JXMpGWbTdZAc+zr411l8WWnf7eYbIy1aJIpDKcoqgR
         ZTriMK5K+KA1owpULuTBZ8pQUPsxomvo6fKJv1XB8zgiFT90w0/M9RA5tVsSwZOKJbhA
         zQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCVs0UxMCpNVkR9nWL6lgEypw3lrxMIMK1eXVUZlSDGBn6k+o+1QP9So3vc5iT2jpTowkAU2HgV/fuv6v6pM@vger.kernel.org
X-Gm-Message-State: AOJu0YzmInoGrIPQiDlWmNcl4G4Oa4/CwL52Q4yJunyuAifUml4Du7C0
	ffDl8XQoagkIAeNwU/P8q9suPj63jxFG5aEx7i31zDPTWoH0EBVkxKIsZ9ZsWaqQqJMJvU1Cboo
	ffx3FiQggx4nSDmIWNsD8mFf17JWaT56S+mC7SQ==
X-Gm-Gg: ASbGncssVLt92F3EFUzlSKbpM6hdGHmC4O39GR/ZovIDmr1Fkzz8P9QfTVMFt6Mq4gy
	o6fgLq+p7bSni5aW5kBq07fBKHb0KLqimOxNZl5xwBkoBU3RN9uuPQPv5ECOHlmmHBnsRB0B0/1
	V8mbXD4ZEamJHUoxwyn7jAlhozSXE=
X-Google-Smtp-Source: AGHT+IFoDbEoYCGI/fKsfvc1W3WRJ48PIrl3shNMLSyLyHUCZEKjVWa8xv5qbOXVgK1f6QWGAMLLH1qGHEVK9aquLzg=
X-Received: by 2002:a05:690c:4c11:b0:702:5689:356e with SMTP id
 00721157ae682-703e1546003mr227916307b3.12.1744042445057; Mon, 07 Apr 2025
 09:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230621144019.3219858-1-abel.vesa@linaro.org> <2786d9ff-0579-429b-b431-a8547cbf6fb6@ti>
In-Reply-To: <2786d9ff-0579-429b-b431-a8547cbf6fb6@ti>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:13:28 +0200
X-Gm-Features: ATxdqUG2bTsfDvA_PWKUIhjRNtwJmFpgrRLM7JC797JM0tWqTf0FSYOqcVvkHm8
Message-ID: <CAPDyKFodE6KokC9uwZZgF+VGCc5JCA5YjB7okUkELAn16V=nvA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/4] PM: domain: Support skiping disabling unused
 domains until sync state
To: Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-pm@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 16:13, Devarsh Thakkar
<devarsht@lewv0571a.ent.ti.com> wrote:
>
> Hi Abel,
>
> On 21/06/23 20:10, Abel Vesa wrote:
>
> Thanks a lot for working on this.
>
> > This new approach drops the is_off change that was part of v4. That was
> > kind of beyond the scope of this patchset. This new approach changes the
> > boot_keep_on in such a way that we won't need any kind of new locking
> > for a PD. This involves using the patch [1] for adding dev_set_drv_sync_state
> > from Saravana for allowing the genpd core to set a default sync state
> > callback for a provider that doesn't register one by itself. While at it,
> > we can add another such API but this time to query a device's sync state.
> > Then, we filter out each power off request in such a way that if a boot
> > powered on power domain is not attached to its consumer device and
> > the provider has not state synced yet, the power off request is skipped.
> >
> > [1] https://lore.kernel.org/all/20210407034456.516204-2-saravanak@google.com/
> >
> > No worth mentioning what changed since v4 as this version is almost
> > entirely reworked.
> >
> > Abel Vesa (3):
> >    driver core: Add dev_is_drv_state_synced()
> >    PM: domains: Ignore power off request for enabled unused domains
> >    PM: domains: Add and set generic sync state callback
> >
> > Saravana Kannan (1):
> >    driver core: Add dev_set_drv_sync_state()
> >
>
> Could you please share if you are planning to re-spin this series as
> non-RFC in near future ?
>
> We think that these patches would be useful to enable smooth display
> transition from boot-loader to kernel space, something which our team is
> working on, so just wanted to know your plans for this series.

I am working on it as we speak, but I need a few more days for
testing. You should expect something to hit LKML later this week or at
least early next week.

I will keep you posted!

Kind regards
Uffe

>
>
> Regards
> Devarsh
>
> >   drivers/base/power/domain.c | 72 +++++++++++++++++++++++++++++++++++++
> >   include/linux/device.h      | 26 ++++++++++++++
> >   include/linux/pm_domain.h   |  4 +++
> >   3 files changed, 102 insertions(+)
> >
>

