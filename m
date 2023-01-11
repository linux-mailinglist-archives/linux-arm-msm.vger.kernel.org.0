Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C62B665901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbjAKK1S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236508AbjAKK1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:27:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AB525D1;
        Wed, 11 Jan 2023 02:27:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0A3F61941;
        Wed, 11 Jan 2023 10:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501D1C43392;
        Wed, 11 Jan 2023 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673432825;
        bh=h8TxIxPqDFkhpYbcLfoV6BQoG0WhTrglcCMN9K0uJt8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N6AM/R958N4u18XHrq8UNFqyP70G0+gFwMjnQ7yqMsG47nguqfl6pW+209xvjJbjo
         rbyiV1w6ouyXKlZ7pR08EkBzODxgmNUTobWEUTrURUNmsiM/RuXCO9kxLqze0HyhcR
         S6C/niQFotI+kRCFg/uXnEq6zKAWOBRw0nS0DWmyZjAkNvygext7RU932qc4NbjrQS
         KV0HgZHWYoLzmXVOUeoidM1prvbzJLc7G6Y56qtqNpZx4XmtMUCyuFD3A2CAvUgequ
         zGm3mij0lsMIAscKAhWH2v20gJAspQzMm0kSukOEDurAvSSWc71hsGMCkJQLn4kfXu
         IsWN6cuZdIQww==
Received: by mail-lf1-f42.google.com with SMTP id bt23so22774660lfb.5;
        Wed, 11 Jan 2023 02:27:05 -0800 (PST)
X-Gm-Message-State: AFqh2krQ8TFnT+Z/YleYZcefXtraDE3YjVmnsLc3pWlSuq4zzep5cC78
        A1BxxR70hX9Bv4y1rCjJBVyBNhgrk+YYDgSS260=
X-Google-Smtp-Source: AMrXdXsLArq0Wo9nCQp1TG2fDBNEKyKeOcVuKtJtKzZgvOKKPRl44qz6sy8RasrBp5p6S+z6L6lslWMdW/csV0WAiDQ=
X-Received: by 2002:a05:6512:15a3:b0:4bc:bdf5:f163 with SMTP id
 bp35-20020a05651215a300b004bcbdf5f163mr3731265lfb.583.1673432823315; Wed, 11
 Jan 2023 02:27:03 -0800 (PST)
MIME-Version: 1.0
References: <63bc16ce.IBWX7dhtPEB7dLIq%lkp@intel.com> <CAMj1kXGAf7ikEU5jLoik0xrOde0xBg0yJkOo5=PtEtNXoUxMXA@mail.gmail.com>
In-Reply-To: <CAMj1kXGAf7ikEU5jLoik0xrOde0xBg0yJkOo5=PtEtNXoUxMXA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 11 Jan 2023 11:26:52 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH1GHmhc=SZDRFV2GOpncnn1rmbr8AZhiS8iDc6u+1ATQ@mail.gmail.com>
Message-ID: <CAMj1kXH1GHmhc=SZDRFV2GOpncnn1rmbr8AZhiS8iDc6u+1ATQ@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 543b9b2fe10b2e12b8d773af65314d322f91e479
To:     kernel test robot <lkp@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        speakup@linux-speakup.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 9 Jan 2023 at 15:38, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 9 Jan 2023 at 14:31, kernel test robot <lkp@intel.com> wrote:
> >
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > branch HEAD: 543b9b2fe10b2e12b8d773af65314d322f91e479  Add linux-next specific files for 20230109
> >
> > Error/Warning: (recently discovered and may have been fixed)
> >
> > aarch64-linux-ld: ID map text too big or misaligned
>
> This is caused by linker veneers ('stubs') that are emitted into the
> ID map text section:
>
>  *(.idmap.text)
>  .idmap.text    0xffffffc018c04000       0x38 arch/arm64/kernel/hyp-stub.o
>  .idmap.text    0xffffffc018c04038       0x28 arch/arm64/kernel/sleep.o
>                 0xffffffc018c04038                cpu_resume
>  .idmap.text    0xffffffc018c04060       0x38 arch/arm64/kernel/cpu-reset.o
>                 0xffffffc018c04060                cpu_soft_restart
>  .idmap.text    0xffffffc018c04098      0x468 arch/arm64/kernel/head.o
>                 0xffffffc018c04098                init_kernel_el
>                 0xffffffc018c04290                secondary_holding_pen
>                 0xffffffc018c042c8                secondary_entry
>                 0xffffffc018c043c4                __enable_mmu
>                 0xffffffc018c0440c                __cpu_secondary_check52bitva
>  .idmap.text    0xffffffc018c04500      0x3c4 arch/arm64/mm/proc.o
>                 0xffffffc018c04500                cpu_do_resume
>                 0xffffffc018c045a8                idmap_cpu_replace_ttbr1
>                 0xffffffc018c045d4                idmap_kpti_install_ng_mappings
>                 0xffffffc018c047bc                __cpu_setup
>  *fill*         0xffffffc018c048c4        0x4
>  .idmap.text.stub
>                 0xffffffc018c048c8     0xf7c8 linker stubs
>                 0xffffffc018c1c8c8                __idmap_text_end = .
>
> It seems unlikely that the entire .idmap.text.stub section is
> dedicated to veneers for code in .idmap.text, and the linker probably
> dumps them here because the next output section is non-executable.
>


I bisected this to

commit 5e5ff73c2e5863f93fc5fd78d178cd8f2af12464
Author: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Date:   Mon Oct 17 20:04:50 2022 +0530

    asm-generic/io: Add _RET_IP_ to MMIO trace for more accurate debug info

which seems entirely unrelated, but looks like it may be causing the
number of direct calls (and therefore the number of trampolines) to
increase, causing the ID map to blow up like it does.
