Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3469BC6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2019 09:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfHXH5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Aug 2019 03:57:12 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36760 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfHXH5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Aug 2019 03:57:12 -0400
Received: by mail-io1-f67.google.com with SMTP id o9so25542642iom.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2019 00:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rt7wtYCc1s5tor1o81jIoZmh+z8hgaSPweyus4OLaDI=;
        b=K3z+flYVSNNSWoTBFmevj6fYPEM2G+divlFtL3oFGJ/e/x/iInhDr1dHK6vOFA/Sbp
         0UBZ0ILyiMLYwgPhEtNbPrCfbqGmZtE/iabl81cCpUXQwu/WVEpKa5tCim0w1eCIh71t
         eInx/aknxqQIs4gIxsdejGNRIx8xP+U2vTrq8ZHY1WRqCjxz80WNyH+rIwQ2mT6JfE1B
         QwqIwtiPieUU8kHxEfuWEcHR8GIRvzO2XbMzcLUUBoaBKhzkgm+6/ek9kkwQndKDRlwN
         Bo6V5oJZr/cP6fVAv0g7HenkS6s1hcn7PjRTIxgVGyzPH3mpyl52vEoa/RUroG5wsa33
         XzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rt7wtYCc1s5tor1o81jIoZmh+z8hgaSPweyus4OLaDI=;
        b=ednHRTgXWHAXC7kDjuxB1t5beaxJcgQom0lwWSSNzg+hEyyJg7xQJSo6TsL0Jcwv8z
         aPuF2OKyJXCP8AVIAFqxlWKd5gxttrYoCltQ8CG9STJj0g/N4uxhTfI8CqvURzBg2f2E
         30BtVN31cJnJ3jnp8cSi2bjOVnnBKH34fQVr88VDxPEFu/cwHeVrfAGaQBZF8V93S3lr
         2mjEtkYnalMUlNLJEAxKspLXsNwovnjpqEl6Fl69hFX/FfaoX0L6VEgdXZ/SzDP+b0a7
         NUQp1vKPDS9qOQYBFiXRe4JJH5DAcANtjyQR1Lot8+hGr/fG/jX7NGHAuHMd6gtMBarR
         irew==
X-Gm-Message-State: APjAAAU2RN0TzNlmK0vf0rvWJPkGjrvvoi2azAhCE60+EtQsjXpgun4l
        18uix/C/N8AO8JY+hWnWWYuKaZ2PwqvVtJkzreXrEw==
X-Google-Smtp-Source: APXvYqwxcXr8xhaFGFkwJobfl5gf6+4v9QSf+/e/XxuJihI8hsXlCsjVuqNrS0RHDZAcIleIWvUKgloQNh3YdFkKQX8=
X-Received: by 2002:a6b:b8c4:: with SMTP id i187mr12749931iof.102.1566633430565;
 Sat, 24 Aug 2019 00:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190815110944.3579-1-murphyt7@tcd.ie> <20190815110944.3579-2-murphyt7@tcd.ie>
 <20190820094143.GA24154@infradead.org>
In-Reply-To: <20190820094143.GA24154@infradead.org>
From:   Tom Murphy <murphyt7@tcd.ie>
Date:   Sat, 24 Aug 2019 08:56:59 +0100
Message-ID: <CALQxJussiGDzWFT1xhko6no5jZNOezWCFuJQUCr4XwH4NHri3Q@mail.gmail.com>
Subject: Re: [PATCH V5 1/5] iommu/amd: Remove unnecessary locking from AMD
 iommu driver
To:     Christoph Hellwig <hch@infradead.org>
Cc:     iommu@lists.linux-foundation.org, Heiko Stuebner <heiko@sntech.de>,
        virtualization@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>I have to admit I don't fully understand the concurrency issues here, but =
neither do I understand what the mutex you removed might have helped to sta=
rt with.

Each range in the page tables is protected by the IO virtual address
allocator. The iommu driver allocates an IOVA range using locks before
it writes to a page table range. The IOVA allocator acts like a lock
on a specific range of the page tables. So we can handle most of the
concurrency issues in the IOVA allocator and avoid locking while
writing to a range in the page tables.

However because we have multiple levels of pages we might have to
allocate a middle page (a PMD) which covers more than the IOVA range
we have allocated.
To solve this we could use locks:

//pseudo code
lock_page_table()
if (we need to allocate middle pages) {
 //allocate the page
 //set the PMD value
}
unlock_page_table()

but we can actually avoid having any locking by doing the following:

//pseudo code
if (we need to allocate middle pages) {
 //allocate the page
 //cmpxchg64 to set the PMD if it wasn't already set since we last checked
 if (the PMD was set while since we last checked)
   //free the page we just allocated
}

In this case we can end up doing a pointless page allocate and free
but it's worth it to avoid using locks

You can see this in the intel iommu code here:
https://github.com/torvalds/linux/blob/9140d8bdd4c5a04abe181bb300378355d569=
90a4/drivers/iommu/intel-iommu.c#L904

>what the mutex you removed might have helped to start with.
The mutex I removed is arguably completely useless.

In the dma ops path we handle the IOVA allocations in the driver so we
can be sure a certain range is protected by the IOVA allocator.

Because the iommu ops path doesn't handle the IOVA allocations it
seems reasonable to lock the page tables to avoid two writers writing
to the same range at the same time. Without the lock it's complete
chaos and all writers can be writing to the same range at the same
time resulting in complete garbage.
BUT the locking doesn't actually make any real difference. Even with
locking we still have a race condition if two writers want to write to
the same range at the same time, the race is just whoever gets the
lock first, we still can't be sure what the result will be. So the
result is still garbage, just slightly more usable garbage because at
least the range is correct for one writer.
It just makes no sense to ever have two writers writing to the same
range and adding a lock doesn't fix that.
Already the Intel iommu ops path doesn't use locks for it's page table
so this isn't a new idea I'm just doing the same for the AMD iommu
driver

Does all that make sense?

On Tue, 20 Aug 2019 at 10:41, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Aug 15, 2019 at 12:09:39PM +0100, Tom Murphy wrote:
> > We can remove the mutex lock from amd_iommu_map and amd_iommu_unmap.
> > iommu_map doesn=E2=80=99t lock while mapping and so no two calls should=
 touch
> > the same iova range. The AMD driver already handles the page table page
> > allocations without locks so we can safely remove the locks.
>
> I've been looking over the code and trying to understand how the
> synchronization works.  I gues we the cmpxchg64 in free_clear_pte
> is the important point here?  I have to admit I don't fully understand
> the concurrency issues here, but neither do I understand what the
> mutex you removed might have helped to start with.
