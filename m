Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5FE05942F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 08:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfF1G3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 02:29:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36722 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfF1G3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 02:29:05 -0400
Received: by mail-io1-f67.google.com with SMTP id h6so10246352ioh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2019 23:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=saTGILFM6srmwaj5/tNn2pJ+i33z1aHVJBPvZqZ/BAQ=;
        b=D0mMAxAkyRFOSeWJJs8lfk5+0GEaORmZ8+PuHou6ahBwjFSXkKZu/YUjPwnOlrnGSn
         /ZMaoM+bsUqfcSKl3JuySQsMv7/z9C4LVUivLTai5w7Eh63PwbrS5LBV7hgeLF/7fZW/
         7gnmj837H7fBE+tgJyfBtjNJ9paoXMvqFQZfemXCW6OflwfLhYof+jarlgyA5g2qNRKp
         GPo6HwCBT2+23G0VYYByJu14Ul8JtxQFjdDopcPCYWN+GwSWuy/Hnebh/yaIxv/w23uZ
         eH1dU9WPiK6rETD/XYVO2zoEu0nqXGv3kvSX16LSxRsrrek2YLgq0w0Nzo4p1VZNHTMV
         detg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=saTGILFM6srmwaj5/tNn2pJ+i33z1aHVJBPvZqZ/BAQ=;
        b=ky8Nvd5wx210WSlPN3P9wsmzE66pDzS2ISpD17y0hCNzxpN+b/Bqf1cAFK52LKs9m6
         ilT8UXy83mg0foW8U4qPh30vXN4Z0j5R2G6JNXHCCB7GC4WLnEzaENv9MPcu7VnMXDr3
         lRlroBoYs48hpg06DBtd8LJB6CzeC8uVqNTIV9lVx0VX2sql1MvrkfdmqZv7zSvJ4haE
         ngrgeFB7XXXube9KsVY6E5n3o+5LhbyMnc4Z3/C0lZrzalyAyvfZzMCCrzbs4n9/qem9
         f718BTm1vKiTHjl+a94SpxmKu3lscsgaKGRDc2UwUyrB338kes74qYuo0/FqU1f35Iw3
         IzBA==
X-Gm-Message-State: APjAAAWL7PBYXfz+yKJW0drLEOZwbU0Dtb1azK03i/8YmhadHh29vQJa
        ict1geeg4/zKaeopDuckxGQPEXZy4vtGXkbDvDxKGw==
X-Google-Smtp-Source: APXvYqx3P+LmmIyDtQh34wT0i4pWVu04xgifzi8AuxYP1ModA6Zlva0Pj6Fel0+bK1DzBPsPdaJY+uky6uQUE++iGPA=
X-Received: by 2002:a5d:94d0:: with SMTP id y16mr5555373ior.123.1561703344930;
 Thu, 27 Jun 2019 23:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <1561700182-18108-1-git-send-email-agross@kernel.org>
In-Reply-To: <1561700182-18108-1-git-send-email-agross@kernel.org>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 28 Jun 2019 14:28:53 +0800
Message-ID: <CAOesGMhQKastVvjUdmH=-zTzejHZ-QOXr6=qJDD2XqoHQJPrJg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.3 Part 2
To:     Andy Gross <agross@kernel.org>
Cc:     ARM-SoC Maintainers <arm@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 28, 2019 at 1:36 PM Andy Gross <agross@kernel.org> wrote:
>
> The following changes since commit 2410fd450c09a126aefefc9106b4652285b5d60f:
>
>   arm64: dts: qcom: qcs404-evb: fix vdd_apc supply (2019-06-19 23:50:52 -0500)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.3-2
>
> for you to fetch changes up to 8291e15108cde33c3e086a34af5381c95cc7aa87:
>
>   arm64: dts: qcom: qcs404: Add missing space for cooling-cells property (2019-06-28 00:20:37 -0500)

Merged, thanks!


-Olof
