Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A30CAEA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 20:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbfJCS4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 14:56:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34074 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbfJCS4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 14:56:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so2353547pfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=m3hPkICQE69+a0xauYT0Amw2XtL4GDAq+zoSEfirsuU=;
        b=RTH7eMPNg4REcj7uJxBnWgOGXzLh25RAdH0XvU6vUYGvMXEuc4SQe9Mopl1HUy9qTV
         NwlkefUwbR5ZusY6euOhVnCNMd9HBRlowLYcDJ+/tismHYMOUtJdHE3jmXC+xB5H1rFG
         MUmS1wlEq19k/B0rutrOSHgMx0/zeNEFj52Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=m3hPkICQE69+a0xauYT0Amw2XtL4GDAq+zoSEfirsuU=;
        b=FcLfwIMmEs4Mebsm8sOoP4bO4wuuerr2uU3KAmWNrwKUQR2vTSpFLFT6+qd98gXRLH
         ONEqdXMjKqYF7j73FxU3b5DbplEnMNBwwVtbvHaOjXvUY7GIb9owr7ZPj5gRnd/6y7AF
         LEq0vjs8380zkg3IpV+zRifJ+KBpnOxOrp5xY15Q/f7IEC0MUEN2D8E8dS38iIhl7irX
         cf6KbScUiLK2IN/ud4OribDt2jxKIQfT8ckY2YkWefziSO7dQMBhW4qBX5kMVtH4hG8e
         NdLQrLkgOWCIuEXpAgsHhBOhTsmFeGGJiR0S/rGWO7js5xj2gYIYUrClKgdJKZo3sIju
         1Low==
X-Gm-Message-State: APjAAAWG3/KAXmYqVqQ5uREEMa3kM93eYDg5Om9EUPJ1+4Af6v5KsMIo
        DgBpybfJrKiBK7Bfw5q+RKM78A==
X-Google-Smtp-Source: APXvYqwDCBHsPX8dh6oRQ9FHBVLRypmHbpAWhqLjb3zrDPeKQKRHPbU3F7fMBBGRfrbzqBb/RLO09A==
X-Received: by 2002:a17:90a:fa3:: with SMTP id 32mr12426687pjz.35.1570128965072;
        Thu, 03 Oct 2019 11:56:05 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v68sm4379189pfv.47.2019.10.03.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 11:56:04 -0700 (PDT)
Message-ID: <5d964444.1c69fb81.121ce.d43b@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAE=gft6YdNszcJV67CwcY2gOgPHrJ1+SnKMLr63f2bix2aZXXA@mail.gmail.com>
References: <20190910160903.65694-1-swboyd@chromium.org> <20190910160903.65694-4-swboyd@chromium.org> <CAE=gft6YdNszcJV67CwcY2gOgPHrJ1+SnKMLr63f2bix2aZXXA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 3/5] memremap: Add support for read-only memory mappings
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 11:56:03 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Evan Green (2019-09-18 12:37:34)
> On Tue, Sep 10, 2019 at 9:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > @@ -53,6 +60,9 @@ static void *try_ram_remap(resource_size_t offset, si=
ze_t size,
> >   * mapping types will be attempted in the order listed below until one=
 of
> >   * them succeeds.
> >   *
> > + * MEMREMAP_RO - establish a mapping whereby writes are ignored/reject=
ed.
> > + * Attempts to map System RAM with this mapping type will fail.
>=20
> Why should attempts to map RAM with this flag fail? MEMREMAP_WB will
> allow RAM and quietly give you back the direct mapping, so it seems
> like at least some values in this function allow RAM.
>=20
> Oh, I see a comment below about "Enforce that this mapping is not
> aliasing System RAM". I guess this is worried about cache coloring?
> But is that a problem with RO mappings? I guess the RO mappings could
> get partially stale, so if the memory were being updated out from
> under you, you might see some updates but not others. Was that the
> rationale?

Will Deacon, Dan Williams, and I talked about this RO flag at LPC and I
believe we decided to mostly get rid of the flags argument to this
function. The vast majority of callers pass MEMREMAP_WB, so I'll just
make that be the implementation default and support the flags for
encrpytion (MEMREMAP_ENC and MEMREMAP_DEC). There are a few callers that
pass MEMREMAP_WC or MEMREMAP_WT (and one that passes all of them), but I
believe those can be changed to MEMREMAP_WB and not care. There's also
the efi framebuffer code that matches the memory attributes in the EFI
memory map. I'm not sure what to do with that one to be quite honest.
Maybe EFI shouldn't care and just use whatever is already there in the
mapping?

Either way, I'll introduce a memremap_ro() API that maps memory as read
only if possible and return a const void pointer as well. I'm debating
making that API fallback to memremap() if RO isn't supported for some
reason or can't work because we're remapping system memory but that
seems a little too nice when the caller could just as well decide to
fail if memory can't be mapped as read only.

