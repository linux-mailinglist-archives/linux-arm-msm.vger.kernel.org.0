Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D89343409B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 23:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhJSV3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 17:29:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhJSV3k (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 17:29:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D639611C7;
        Tue, 19 Oct 2021 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634678847;
        bh=n5oKhj49goNe7lHOmGWW8DH88TSwDNvemsZekDVUD+g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hA8jLmLCMkT0f8JITb9xNQlvJW/fBCTKXqZqkYvpXpW9mIuTSpdqXIQJYXFgGnyqb
         XAU6fUA6S4YpfO7TT9OTDvEJklw/Sxr4JV2Gy8XsUhJCYCAiR+tVsAhE9AO7tsWfRG
         7KM3wKkpTlyultA7pI12K4mjHuLzfBrOeIXS+1X6/G9nlmO9KMZ158dGkcrBtsuoSz
         Y21Z0w0DxNlxhb0UrG1ccW4ehLnJMBGfAZzh9DCsxQyt3VXuxM/+kGNgBXrJhJ1fFI
         PgSl0UsxBrkNcJGWUQBqkaso6+9h7eXXUmIFEGEfM0iZFuyV1QCOGRJYsrs/1Ln6nX
         A7pyLacvyHGZg==
Received: by mail-wm1-f50.google.com with SMTP id v127so14540204wme.5;
        Tue, 19 Oct 2021 14:27:27 -0700 (PDT)
X-Gm-Message-State: AOAM532/i/abnc/NQwMetnRfgvhYWR9014cAOHspg2rCUx47sB9g+MIn
        G1fuwotp/+P+GnEmK9AAHz1amxnTwElIhjFPwBI=
X-Google-Smtp-Source: ABdhPJyhBvMAj7E4hwSuCHCizWK1p4jiSiUNfn+Rg4ldLs8/ysSNQSLbiYhlq6WQaCwWkA1g6gF7Za9VyAjZbwku+l8=
X-Received: by 2002:adf:e292:: with SMTP id v18mr45066638wri.369.1634678845729;
 Tue, 19 Oct 2021 14:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
 <1632399378-12229-9-git-send-email-rajpat@codeaurora.org> <CAK8P3a3KuTEAXbSTU+n3D_fryquo8B-eXSF2+HrikiNVn6kSSg@mail.gmail.com>
 <YW8xl0fLnQE5o3AQ@ripper> <CAD=FV=XsiMp5jSpX5ong27KYW=G-XYhCfjo48E5cC6Cm+oU-mA@mail.gmail.com>
In-Reply-To: <CAD=FV=XsiMp5jSpX5ong27KYW=G-XYhCfjo48E5cC6Cm+oU-mA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 19 Oct 2021 23:27:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2FroDEppfEkPge7Mm4gGF8ZNHvCwL3r-8Cg7f575YhPw@mail.gmail.com>
Message-ID: <CAK8P3a2FroDEppfEkPge7Mm4gGF8ZNHvCwL3r-8Cg7f575YhPw@mail.gmail.com>
Subject: Re: [PATCH V10 8/8] arm64: dts: sc7280: Add aliases for I2C and SPI
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 19, 2021 at 11:11 PM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, Oct 19, 2021 at 1:57 PM Bjorn Andersson
>
> Hrm. I know this gets into slightly controversial topics, but I'm a
> little curious what the downside of having these in the dtsi is. In
> the case where these i2c/spi/mmc devices _don't_ have "well defined"
> numbers in the hardware manual of the SoC then I can agree that it
> doesn't make sense to list these in the dtsi file. However, in the
> case of sc7280 these numbers are well defined at the SoC level for i2c
> and SPI.
>
> Said another way: if you have a board that's got peripherals connected
> on the pins labelled "i2c2" and "i2c6" on the SoC then it's a really
> nice thing if these show up on /dev/i2c-2 and /dev/i2c-6.
>
> ...so I'm not sure what board exactly would be overriding and
> re-numbering? Unless a board really has a strong use case where they
> need the device connected to the pins for "i2c2" to show up on
> "/dev/i2c-0"?

There are multiple things going on here:

- The aliases are traditionally managed by the bootloader, same way
   as the /chosen nodes including the kernel command line, so the
   numbers are local policy, and the per-board defaults are just
   for convenience.

- IMHO there should not be any aliases for status="disabled"
  nodes, and the status is usually set in the board files.

- The labels on the board don't always match what the SoC calls
  them, or there might not be any labels at all. This is more
  important for things like serial ports that are often bare
  connectors rather than already wired up. The aliases should
  normally match how the board numbers the connectors, not
  how they are attached internally.

- For i2c, it's not uncommon to have i2c devices attached behind
  expanders on i2c/spi/gpio/usb/pci devices

       Arnd
