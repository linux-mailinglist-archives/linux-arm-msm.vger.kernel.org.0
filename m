Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C28821156DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 18:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfLFR6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 12:58:07 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37614 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfLFR6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 12:58:07 -0500
Received: by mail-qt1-f195.google.com with SMTP id w47so7945192qtk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kv7PKT3RJppr5jJNmsz7aLEf+1pNL9YBv/3STz+QhV0=;
        b=zGiLMcGVYQvuNbzXUV7DuknNoSLECg/tSjWJt6M6qJaZkyGrxA3No6AlfCfcJfm3X+
         uYQfiUYU6mD9O8Xf770AsGu0vDgmZLyYBXlOHNF/0tmIBEcuU+75ubwYZaBZMR9yPCeI
         h1Pp8FsGZ+N5M1gSMZ8pzvz357KLWac1ztjsgaNUl1RFijT/KqrT501VzonzCS+Zheab
         LsF3fpUBlMV/ynC4USwOheFDtVXRRjYczwj20aVQxeO9AKlYPExscUTbsQiQYTBoWizr
         QjNJ1HoSzxLyjneN4dw2+7praGMYtjFmvrWdJHnZhVrwDVvXCXG3xZjVt4/xhqRY6gTd
         ZixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kv7PKT3RJppr5jJNmsz7aLEf+1pNL9YBv/3STz+QhV0=;
        b=cDioKkPoXClnQKa+SyGSzHI4FnZc3z4UEOQlsWotqHuIjXD8GjaHwJq1l62DQfGDus
         FbOuAwFjNUymw/WyoTw1lhZjcuQ2GUokO6X+ImqioqEtEanXXV1EbCnLfCY+sNncpNmS
         ClT6A2c8a9wCEbjxx2Mnog0TkPaHLF1qXJmR6rVgQyHmxkXLyTHCOSbqvVLjL72Fzr7h
         Yh51jNGulMNXGoBoO3Xnxq+5xcD+XEI4AJ8stJgbqdHoXzioa0UaVlAyAtVM7vj8///a
         6Tkz2Gl4Zr91kHAkNJ76mPrYg/69ltQP3lHTTAU22GbS5Zq9KBFDIACfiBMU/crVQwH0
         M0eg==
X-Gm-Message-State: APjAAAU+OppyeyyO6Z1D7Rsnnrsjfdagv87wq467iTKpzzWJsCsYTRyc
        SlgpIFGfzJME3I+sHTG91zPDfBe1GLrRtriUTwtNYQ==
X-Google-Smtp-Source: APXvYqxoKRU9YX/OzOYBOke7neojht5Ijup8DLVEc2JCgKKHSgPyzJk1Z0/HluGJuqxcu9fTQbZ4dEqsuCuSfYyIfKo=
X-Received: by 2002:ac8:5346:: with SMTP id d6mr14187281qto.49.1575655086001;
 Fri, 06 Dec 2019 09:58:06 -0800 (PST)
MIME-Version: 1.0
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <20191106220406.4aoq5suvwww6c3ov@localhost> <20191206050222.GC289401@yoga>
 <20191206163237.t4ohf7fviz4ywkck@localhost> <20191206172841.GA10830@tuxbook-pro>
In-Reply-To: <20191206172841.GA10830@tuxbook-pro>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 6 Dec 2019 23:27:55 +0530
Message-ID: <CAP245DVPFkGhgexzQYqAunROyMarVN+zoyQ1Ma9aWeJz_7uaBg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Olof Johansson <olof@lixom.net>, Andy Gross <agross@kernel.org>,
        arm-soc <arm@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lists LAKML <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 6, 2019 at 10:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 06 Dec 08:32 PST 2019, Olof Johansson wrote:
>
> > On Thu, Dec 05, 2019 at 09:02:22PM -0800, Bjorn Andersson wrote:
> > > On Wed 06 Nov 14:04 PST 2019, Olof Johansson wrote:
> > >
> > > > On Wed, Nov 06, 2019 at 01:33:56PM -0600, Andy Gross wrote:
> > > > > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> > > > >
> > > > >   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> > > > >
> > > > > are available in the git repository at:
> > > > >
> > > > >   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.5
> > > > >
> > > > > for you to fetch changes up to a36612b7469cf76953cf237a2b9a62f6c97730bb:
> > > > >
> > > > >   arm64: defconfig: Enable Qualcomm watchdog driver (2019-10-20 23:04:59 -0700)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > Qualcomm ARM64 Based defconfig Updates for v5.5
> > > > >
> > > > > * Enable Qualcomm cpufreq, watchdog, prng, socinfo, SPI, and QSPI controllers
> > > > > * Enable SN65DSI86 display bridge
> > > > > * Enable QCA Bluetooth over Uart
> > > > > * Enable various Qualcomm remoteproc dependencies
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > Bjorn Andersson (6):
> > > > >       arm64: defconfig: Enable Qualcomm remoteproc dependencies
> > > > >       arm64: defconfig: Enable Qualcomm SPI and QSPI controller
> > > > >       arm64: defconfig: Enable Qualcomm socinfo driver
> > > > >       arm64: defconfig: Enable Qualcomm CPUfreq HW driver
> > > >
> > > >
> > > > Hi, this turns on the driver as =y, when the option is tristate. Other
> > > > cpufreq drivers are also modules. Is this driver truly needed to be
> > > > a built-in for a generic defconfig?
> > > >
> > >
> > > I see Linus merged the arm defconfig PR today, but afaict the patches
> > > from this branch is missing. Please advice on how you would like us to
> > > proceed.
> >
> > I think I was waiting on the promised validation of using =m for the cpufreq
> > drivers and an updated pull request.
> >
>
> Sounds reasonable, I would however like the CPUfreq driver to be =y;
> there are several other drivers doing this and lately work has gone into
> ensuring that this driver probes as early as possible.
>
> In either case, I presume we would change the =y to a =m in an
> incremental patch, in order to not have to rewrite the branch?
>
>
> @Amit, have we done any validation with the SDM845 CPUfreq driver built
> as a module?

Yes, the driver works as a module.
