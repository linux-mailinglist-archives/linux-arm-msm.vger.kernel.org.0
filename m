Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F6C1D40C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 00:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgENWVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 18:21:15 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:59861 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbgENWVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 18:21:14 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3bfB-1j949L2GJP-010dRa; Fri, 15 May 2020 00:21:12 +0200
Received: by mail-qt1-f174.google.com with SMTP id l1so299005qtp.6;
        Thu, 14 May 2020 15:21:12 -0700 (PDT)
X-Gm-Message-State: AOAM531BIsBiBaz8ZUJNJbrOhMd6y1xbmLXI+BI3KySEYddF7Z1yM6cL
        23vymXJfpWSJKIVdreNwwraMQng7rrcHNTx9xhU=
X-Google-Smtp-Source: ABdhPJz3z8Uc5VTtjgLSDkoyOHauhvKBcZ35PPNjjTDk8atS2l/AZsbKhLvHSdGFjVjGju2HcTzkigXlye6L10IJ6Ck=
X-Received: by 2002:ac8:6914:: with SMTP id e20mr439652qtr.7.1589494871298;
 Thu, 14 May 2020 15:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-6-git-send-email-jhugo@codeaurora.org> <CAK8P3a34ks226S9UJMfCNdY3KWiBS+vscYdKwLW7wkLj0H_4Cw@mail.gmail.com>
 <a22412f9-4717-7097-3011-5be96f59e3c9@codeaurora.org>
In-Reply-To: <a22412f9-4717-7097-3011-5be96f59e3c9@codeaurora.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 May 2020 00:20:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EgMnPGnYgFqUuRBEcaDJHuAaBUXYWsdRYCuR4ZnbhRg@mail.gmail.com>
Message-ID: <CAK8P3a2EgMnPGnYgFqUuRBEcaDJHuAaBUXYWsdRYCuR4ZnbhRg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] qaic: Implement data path
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     gregkh <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:T8hMKti8wveVg2CIcH8fDurzlkCWkCPWYP/4qRVYC8sbuA3vm5F
 jYXgeYNWOM9MzKi0UvWTUgLEurDFPdow0DvVfluiW6JRr66v3TsjMSAW/5kfY/TuLgUlnGw
 jVk6dtf9xRnsjGL1MHVXOnLCFtw29gOlJjms4wGFFVbaXnLGo6Rg2Vxl67v2ohwUvie46fp
 Ck/yGQdE/bU0Sr3wPgHXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NB7j5rnVavY=:0kkwDsSPm1yfhhQWbySiCW
 RYdGDNDEqal6tP+cdB3sU2oBI3a+QfZXT6Xvbn6N4reK9t4xA85MqKSAle9fHefIjnPLvmfEy
 it4S6LhgHQnEhbTSVEo9kwj3f1ayPIStcJAwONBv55DLQeuRc/TZ/45FZPdvmIN+XzGq8OEBV
 dpnYij8tlPqIdBzT7v4JQPVaA/EZQhNAfdmEZQ6ms1kCmmtTPnz3T8AZ5/NdaOFQ6IPTpVwSu
 tMwt3ly+OYMN4cKUUpNu6JjbYaS7533EAt5ftbovOYPKjYZzFIZM2jW/6OI/daiNl3gXE4m/T
 yJM+bnxtMfMSTmchnB/5qZTX5t/IMKQxHfsBbLmkoi/D9pAlyl8Xxi4FNirbeTIPD5i2Daswc
 RqEsvY97JTnefSxn1qj0bySkk4233qP56D/oVuwbF58ySreq0vAWzgQMOLzd8SQMy0Wij8wGE
 oXMzEIeApA9VUbjOcMS1BvBP9xS62o1KTs2uRfr8JPxJZL3zPBjJe2pAnT5BixaeAy0G00tga
 DDABt76KdSynJ+kuvJ/GG0aAVpiaKps8a2IjwJGM6Pij07LLggJNWUYctge1bKkoVoCuyfgtb
 HjJjtAckKMgxzryIH3kxmEVmHFX8ctkiDq0AudUCnD3Hw+e///iitQ9PSc2t1z/CQUPzW7PRV
 0F5nYMQXcxWOacJdbBQWoAYMHKkvaxqAjzYvZrCAZZSgxlZyE9ohszko+aYqmOhrBtYD/zYCK
 0k3txFvFt6fP09/cMgp2q0D9mk84iCAbSHm2OJQnZQOCOTaK6MlOYMCtA8II/uWJzak067RXu
 YA/+s0x0EFofgE//Sc1y71B04obJbdwhjVp30zKKQh3yug0bO4=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 15, 2020 at 12:06 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:

> >> +       u16     req_id;
> >> +       u8      seq_id;
> >> +       u8      cmd;
> >> +       u32     resv;
> >> +       u64     src_addr;
> >> +       u64     dest_addr;
> >> +       u32     len;
> >> +       u32     resv2;
> >> +       u64     db_addr; /* doorbell address */
> >> +       u8      db_len; /* not a raw value, special encoding */
> >> +       u8      resv3;
> >> +       u16     resv4;
> >> +       u32     db_data;
> >> +       u32     sem_cmd0;
> >> +       u32     sem_cmd1;
> >> +       u32     sem_cmd2;
> >> +       u32     sem_cmd3;
> >> +} __packed;
> >
> > All members are naturally aligned, so better drop the __packed
> > annotation get better code, unless the structure itself is
> > at an unaligned offset in memory.
>
> I'm going to have to disagree.  While most "sane" compilers would not
> add extra padding, I've debugged enough issues in the past when
> sending/receiving data with foreign environments to never trust anything
> that isn't "packed".
>
> Unless I missed something in the C spec that requires naturally aligned
> structures to have an identical layout in memory, I'll take safety and
> functional correctness over performance.

The C standard does not mandate the layout and individual ABIs can
be different, but Linux does only runs on ABIs that have the correct
layout for the structure above

The problem is that the compiler will split up word accesses into bytes
on some architectures such as older ARM, to avoid unaligned
loads and stores. It should be fine if you add both __packed and
__aligned(8) to make the structure aligned again.

> >> +       init_completion(&mem->xfer_done);
> >> +       list_add_tail(&mem->list, &dbc->xfer_list);
> >> +       tail = (tail + mem->nents) % dbc->nelem;
> >> +       __raw_writel(cpu_to_le32(tail), dbc->dbc_base + REQTP_OFF);
> >
> > What is this __raw accessor for? This generally results in non-portable
> > code that should be replaced with writel() or something specific to
> > the bus on the architecture you deal with.
>
> The barrier(s) that comes with writel are unnecessary in this case.
> Since this is part of our critical path, we are sensitive to its
> performance.
>
> What are the portability issues around the __raw variant?

The access may not be atomic on all architectures but get either
split up or combined with adjacent accesses.

There is no guarantee about endianess: while most architectures
treat __raw access as a simple load/store, some might have an
implied byteswap.

__raw accesses might be completely reordered around other
mmio accesses or spinlocks.

If you want to avoid the barrier, there is the
writel_relaxed()/readl_relaxed() that skips most barriers,
so they can be reordered against MSI interrupts and
DMA accesses on architectures that allow (e.g. ARM
or PowerPC) but not against each other.

If you do use them, I'd still expect a comment that explains
why this instance is performance critical and how it is
synchronized against DMA or MSI if necessary.

    Arnd
