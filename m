Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B724286A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 08:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbhJKGLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 02:11:03 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54963 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbhJKGLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 02:11:02 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MJVY8-1mKM0T3AHQ-00Jt7C; Mon, 11 Oct 2021 08:09:01 +0200
Received: by mail-wr1-f50.google.com with SMTP id r10so52365117wra.12;
        Sun, 10 Oct 2021 23:09:01 -0700 (PDT)
X-Gm-Message-State: AOAM532lz6m3N6wq5WHFxRi0kS3Pf8DZqAzJ+NMmuNsycz5kBkXRMSJP
        sZyxKZO7Fr+Xw/hm8fe/yrQUrsZfw9WLgyr3Bjg=
X-Google-Smtp-Source: ABdhPJzokqOl1FjpKWa7hPmI46vA3MbqNwtIHx5QkXa4cBkJuMWag11qBpJwNxvearH05lPT0JSjYqMCvI8xjMjduAg=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr6604283wmg.35.1633932541412;
 Sun, 10 Oct 2021 23:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
 <YWJpJnaQ2Nr4PUwr@yoga> <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
 <CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Oct 2021 08:08:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3JwQP1b0KeLRN0UCMmzFn3+gY2oexYUwGyt2bOqC0P4A@mail.gmail.com>
Message-ID: <CAK8P3a3JwQP1b0KeLRN0UCMmzFn3+gY2oexYUwGyt2bOqC0P4A@mail.gmail.com>
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:k+HcbtuOTQpaVMTxJPM3+h+Of3AscCILByFUfjZe8V5Ish9HFzm
 zAHAi1G5NcqyLCyWORR4QmMEgvgvxk43ANxwFHVBjsmFWIbVrcC5g8H7k/3d0U75sf9NRX8
 Pu4u7C55QYC3a8MYqQ3lKnR2RDuYIR7Hs/Z8q8zwY6I8fOEUBYBqUXHvOat//U7csEQC3/9
 IV88+vmsKVPYYZ8GSipCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RznMQPZqWBg=:mbLYd1e0vkH/3H6mM6vpcR
 wXTo5qdMg3zcExQ2H0RC226AW62psyQW/R6kvDFmBiecSRGHHe/23ImFQOgXA/hDJpklAbbpy
 MiaPHKrtgBT0FqWc6xgXYGI47zURXKrM3lfxWJml/hJpF/IDC3hcbypzrJhAeaWTryYQI1Q7F
 AMPxil4CqTGqLkLz1/zC2szPo1qmFACY+glJzOW2jLlCl+t6ESaJtf2SpCTqa3tOWeWKsE7eT
 RvMzZ9/SjJSrupp8BYAncBuM67ceAFXjrs/qBLxWSu39z4Gfnis7hdH5O5ILrazqszNTRmKYt
 JLZHNMpsNITzdbyuHBVixsnb2ZK0/58BH8jFxwRZ3vJZOgPmyAzjlBmrgloHOEkG8FXY9fs+N
 ItKQ6k3ZxFwZHMqv/UNUhQf4PDXvMJUys7TPofMZWsJHLfZ8wQDlNWxbZ50ETa/a1rR9A64FD
 ovhDpea4Zg/zHK7lfs7tmZq5N08w09GzX3hTdwzVzJRpR6cLKfg0TC0qjvHmJmBVJUNbUyBDw
 tf9w9X238WTIRFiPw7bEvW+NrX/0mq5q3ibSxell4r2eaWqZhpo30TiYj5Ku77yAwVQQEyA1V
 cvllKK+lLzDqRp8ljRj39Pr394e1TiPwz8IAxs7uDcFNWFtcU/wjs67CfrNkAzYC5Qpm5QtVP
 lt1O5/t/gG3N9znj+79ec1VaQV79DIzRYbRDPEC87CvymomGruAij71reLYqbCXpWClJuqn4Z
 iTm2p0fLcGIA5GB5X96mszwqUuU46I/jrzqkBg==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 11, 2021 at 6:11 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Sun, 10 Oct 2021 at 20:42, Arnd Bergmann <arnd@arndb.de> wrote:
>
> The patch seems correct, but it becomes overcomplicated. What about:
> - restoring QCOM_SCM stubs

The stubs are what has led to the previous bugs in this area to often
go unnoticed for too long, as illustrated by your suggestion

> - making ARM_SMMU select QCOM_SCM if ARM_SMMU_QCOM

I assume you meant "select QCOM_SCM if ARCH_QCOM",
after we stop using ARM_SMMU_QCOM?

> This would have almost the same result as with your patch, but without
> extra ARM_SMMU_QCOM Kconfig symbol.

The "almost" is the problem: consider the case of

CONFIG_ARM=y
CONFIG_COMPILE_TEST=y
CONFIG_ARCH_QCOM=n
CONFIG_ARM_SMMU=y
CONFIG_DRM_MSM=m
CONFIG_QCOM_SCM=m (selected by DRM_MSM)

The stubs here lead to ARM_SMMU linking against the QCOM_SCM
driver from built-in code, which fails because QCOM_SCM itself
is a loadable module.

We can move the "select QCOM_SCM" in the ARM_SMMU_QCOM
symbol if we make that a tristate though, if you want to separate it
a little more.

        Arnd
