Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D682760B7D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 20:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfGESjF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 14:39:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43558 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGESjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 14:39:05 -0400
Received: by mail-io1-f67.google.com with SMTP id k20so20978335ios.10;
        Fri, 05 Jul 2019 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1s/k43Uef/oTZ066ashsVWzI7Tt+ue2hhBa4/5vSY8=;
        b=HHAshVYuxSLMcBpfsVyE710re2bMPnXjz2lor83rqUHC7wpBI9j0Umy9JS8PGUz1me
         8bg7v5s3JYFtsPMXh47sH2xaxAkW9mvENDvNv9xQBVr+C0ZMksvV/mGRD5S6C9uEabIE
         +iC9o+j2DqDoMgcUwu7y4xDDVWui30NxDWrxsgZ1uAFymPyeOeNWZtWXTeug/+Lzz9xR
         MYpiM1BKSM9WNckqLDqIgdHZg5dOa38Ijwea7yN8Q4UdfuBAq64mj1AGIdETJuOXFCnr
         s/10ufHZIWrSd9Hpq7qJQTan33d1nUwTL3l7SzJZeA73XocbIY4KW9K6pa3rL+yR6w5h
         CbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1s/k43Uef/oTZ066ashsVWzI7Tt+ue2hhBa4/5vSY8=;
        b=qpkJO/1RUg+WlZaVW/jzKKVK2mJVaiBBE4wOx+W6du4gfNhPlqy02lSEmnNuY/wOQI
         5oMQmzm3/oD7WCrPKKT3pQbwx2ffFsTdoOOhwPgNjnCAq9dWknRpgaj6ZshPfBrdQfnq
         EPLVB1Ta2GJObpz+ZvRY4Hr0xsAgNS5FHSruCRTB3av1lWJVocRVBydXV2YZ5tbOPxAU
         pPIgyOeiUnFaDIi8nzBoqX7bbcCboAQ5idQSva8D0nwincNgUAFmOGeqmUJ5RLzMS90V
         v6V4c471Aobtp5z26ijCGyv7OodZUfb7tVl7VhgLMpvln53klkflS5O4jWuo6KYu+8Id
         cGZg==
X-Gm-Message-State: APjAAAVGb8ehiNwrH+Sxe1C6uuThLB7Ja1pIGXcpftsTwvh2FOeJtkvN
        Shgas0BIwziG28uor85KiJh72DX2iNXSM1IGI5o=
X-Google-Smtp-Source: APXvYqwe/lOZqTMnRDY7Swtv9Fp4sctE1ATThpdg1r/J8kj+FhdaVVgjYdjeXRQ1YQvjfA/lu8RkKXTGyy+WWuejpmQ=
X-Received: by 2002:a02:c50a:: with SMTP id s10mr6427939jam.106.1562351944338;
 Fri, 05 Jul 2019 11:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165655.456-1-jeffrey.l.hugo@gmail.com> <20190705172338.GB2788@ravnborg.org>
In-Reply-To: <20190705172338.GB2788@ravnborg.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 5 Jul 2019 12:38:54 -0600
Message-ID: <CAOCk7NoCq0k2rCC4XQm_yLxgQir1bqLwJMGwD1qDCHQJRUEC8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, thierry.reding@gmail.com,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 5, 2019 at 11:23 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> On Fri, Jul 05, 2019 at 09:56:55AM -0700, Jeffrey Hugo wrote:
> > +     panel: panel {
> > +             compatible = "sharp,ld-d5116z01b";
> > +             power-supply = <&vlcd_3v3>;
> > +             no-hpd
> The binding do not mention no-hpd - but it is part of panel-simple
> binding. Is it included in the example for any special reason?

I just copied (poorly apparently since a ";" is missing) from my
platform's dt.  There is no particular reason the example lists
no-hpd.  I'll drop it in the next rev.
