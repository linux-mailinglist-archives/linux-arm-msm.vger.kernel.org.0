Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E06B31466ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbgAWLj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:39:26 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33255 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWLjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:39:25 -0500
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MqJuP-1jPa3j0wz5-00nTYa; Thu, 23 Jan 2020 12:39:24 +0100
Received: by mail-qt1-f180.google.com with SMTP id h12so2197192qtu.1;
        Thu, 23 Jan 2020 03:39:23 -0800 (PST)
X-Gm-Message-State: APjAAAU5DRNmRvP/YQPxKZCB/+NXbf6iuaIG9QHUkHhb3UphS2I1oxBo
        q0aWeUw0/hJW0w1LR6uwncRZ/ui2RVBdRy1BBvE=
X-Google-Smtp-Source: APXvYqwl5OWM4a/1rCO8squxRomDrH9Sttl8L71MEQHGCRT0NS52GLYNPbwvgsMB5wUaCGgV9NXsq1uBH3hdgjylhWY=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr15472564qto.304.1579779562982;
 Thu, 23 Jan 2020 03:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org> <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jan 2020 12:39:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2pZEdsAi6YQ5z3YD=zD1iZLu+WPirhwmxeZ33k7sjkeg@mail.gmail.com>
Message-ID: <CAK8P3a2pZEdsAi6YQ5z3YD=zD1iZLu+WPirhwmxeZ33k7sjkeg@mail.gmail.com>
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:62/enJC96IEUk7ZONzFwU2xeZN5I7NYxjeTLe541vlWo9LBXs2j
 n0asGyBaPW2M06tyyDofmUSkoZmNxHJN+cbvOA8A3OJ860n5bnte60fw9XAvtRCLoBc/Q3J
 iG/mQaaJis/nTue7gvVDBr+QyMBTrznrwFLCuiWoEDocL2g+3zJuBxGN3xuPr7WU8puIJ4Y
 FBdvYsm8QUUgwp2HUe11Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3rKgSTS5XWE=:Odw7OjvEf1uEOGayHy2YR2
 uKk5zW2G6XkXijrs7tdyWCNpOatfVSmVP5FOpeQ8Sk8Vn7jpYe6o8BZ3qg8q97YKYIAE9CJC2
 TTmS38U9bbJ7aqf2/9t05jboVOh2/NvYvLlAfj6JCIyMisdlPe4Amu5E+OOsVJccBi3PrG+be
 usJxxX96Aw8ws/vCOrNCnjigCCm3HPQgfcS52TS7lbtxPCC4scTHp5Ryoy9ciZ4LYvsf56Ohx
 O2T1b+gxsV2Wi814FGqgY6AWsQUzBYF6C6mntoMSVHEzVvC+dLlCHuwqg9Mp3wE8oD8ud7oo+
 F6hK0gnoQpFKGnUb6hUNRpkaVo3KJ57AvNztJx60TW6dnKl5I0OjauHWhQTl2R6mWqaGEzwYB
 ITAa4+m4eSnO6m4D7d+iuI5kwpnIhsv8iyaa+t+Kuej0xX7+WGV7j02ULgF4levKGij5fjnCj
 k59cPHnUaCq03Nht77I1f0MAX1n8/wLDJwTUzxGrswRQ2KYaiDDmBW7k3ljwkFILhfZEK2f9H
 tqY4ntTw4LeI96hj0YOcyv71Sin+aaX1Ic86GbcSAY9ECpLq4ZllGrRSMW/tYzGXGp5FpcG1/
 hgwRtw/i+1wsYENzDbwSNayJJ/JjKn8Iu323te49ykrLYuwYqZ0bRc5N/IQsjXm45JsDScPmR
 FuxG7T5TAJqTP6/dKOgGt3rapRVWfTDVfqHw71f7RgTM4FoLQ0vYgtGf3jo5lIQ8hYU9ySvHp
 7+7Y0VyaAs+P3fmtHDd0UH4dEjpI9cde7CH6teLBI3jox45g5rO/N9R1jPjJwA2VhNCwM5b4d
 oIKz2DD8RJD1SVu/KrmvCyzHmvjHdS6ytJa9wG3qMZN2/ypvuI=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 12:19 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> +int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
> +                             void __iomem *base, u32 offset, u32 *out)
> +{
> +       u32 tmp = readl_relaxed(base + offset);
....
> +void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
> +                  u32 offset, u32 val)
> +{
> +       writel_relaxed(val, base + offset);

Please avoid using _relaxed accessors by default, and use the regular
ones instead. There are a number of things that can go wrong with
the relaxed version, so ideally each caller should have a comment
explaining why this instance is safe without the barriers and why it
matters to not have it.

If there are performance critical callers of mhi_read_reg/mhi_write_reg,
you could add mhi_read_reg_relaxed/mhi_write_reg_relaxed for those
and apply the same rules there.

Usually most mmio accesses are only needed for reconfiguration or
other slow paths.

      Arnd
