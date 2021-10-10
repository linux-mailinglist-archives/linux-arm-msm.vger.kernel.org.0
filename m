Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFE04282AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Oct 2021 19:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhJJRoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Oct 2021 13:44:18 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51211 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhJJRoS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Oct 2021 13:44:18 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0G9p-1mw7Oo2dkd-00xIKV; Sun, 10 Oct 2021 19:42:17 +0200
Received: by mail-wr1-f42.google.com with SMTP id y3so14981417wrl.1;
        Sun, 10 Oct 2021 10:42:17 -0700 (PDT)
X-Gm-Message-State: AOAM532svRuFPxZUNHvlD5UZfO4v7yFNlgwh5svx0fIeT/WBfrChfeE7
        O6ug4P9JxHxSVZjQGe7YXdfZWRM2vlVQhgngLBo=
X-Google-Smtp-Source: ABdhPJxAjKU8yfXgt2rjYVImjIKCImbIW4poCzzJGpBcz8kno/AlWQFANYktYRG2caQHUL2ye2HhyFkPp3obwvzre5s=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr6006483wma.98.1633887737269;
 Sun, 10 Oct 2021 10:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org> <YWJpJnaQ2Nr4PUwr@yoga>
In-Reply-To: <YWJpJnaQ2Nr4PUwr@yoga>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 10 Oct 2021 19:42:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
Message-ID: <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jVG6/l1Sg3kgqLyDpuWv74nnT8ektUJ4DDBI9ZLM/lPylGA3rr0
 HVQVjft4IguLUExdmpqPucvVzz7boSAVEkSJjguaSkLvdxS81umeCUEPrtaT9KlSvCt4DlM
 86jCwVVc0u8HR5WNQ66W+xSnatPhFyGz7Abpqjt97ugYX++FM5Wz+S1qzE2QyBH0DEvfMJo
 iR+T/2Jr0OMJJV4oZr89A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r4Iu1hR8NXU=:zjwDXYeJb7ylUVSVOiFk0B
 NFPr8MhoKc7A+8uXNcBwTD9tiFKs9uOeDL+bCLbaW3USNPBZS1uAJb34u65uVai+R3Yfswiaa
 pkzDrwe/XUMo5fnS3p/ev3V4MOLr+fzFwVh3HegQHuG9bwPjEPuCH2Wfl6Ahz7dVAfFnwUGW0
 /+GCZUq18vf+hmHzlldxAXrAz4w9kb8ZOe5SiRGWQ3Bhp5ROXfkE3P7SomytvlR82iaqJF8uG
 wcKKzBMhGK5Zdgcr2ETWy0QJtO8yMBZzkCiD3uZwjimB7pqAXMBcfmTGksa/fJBxCdqBzNHTz
 Daap7mWe4+TVsxdKDlSIpITh7xcshkEGbuUBJIhIlzvjSQIm2QVeKruwxnxJZvkrhh2jv4hrU
 jRghjo/X9/cteVWdjNx5nq5L721hKoFRVfoKJjo+mpaNUfYI2ZOD2QMQxf6Uvokt7eovtuGTA
 kt6PFwY/a+6ZWUIolVdEwh3LaQXRWyXRvstxVY0upa39TEtsfPSTgG8YwmdwjwdYzFZt8+AEf
 ELfvPptbWlIxwcTg3k1ETlnn0TiO9BeVq9PBjkZUqaAscTpYn/XzpntRZyJ37Gu7XG75c2OZo
 qLag3vtEGDuQvTcEEFaiSIPoWBD1c6hnda8MdVeC7adBzk7Pu2PfzOZYrpHk39b0MlzQNRSwn
 zgs+T8w1BYK5tD0jJ2GF9h4+6GKnSPwV3Qn14rcEoQbFCzYazumRrn1Fq+8MQcoHxqAkl67Hy
 srHyK889ZVKmwoqksp6bleCA60RY/4qArm2gdg==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 10, 2021 at 6:17 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 09 Oct 21:33 CDT 2021, Dmitry Baryshkov wrote:
>
> > After commit 424953cf3c66 ("qcom_scm: hide Kconfig symbol") arm-smmu got
> > qcom_smmu_impl_init() call guarded by IS_ENABLED(CONFIG_ARM_SMMU_QCOM).
> > However the CONFIG_ARM_SMMU_QCOM Kconfig entry does not exist, so the
> > qcom_smmu_impl_init() is never called.
> >
> > So, let's fix this by always calling qcom_smmu_impl_init(). It does not
> > touch the smmu passed unless the device is a non-Qualcomm one. Make
> > ARM_SMMU select QCOM_SCM for ARCH_QCOM.

Sorry about this bug. I was sure I had it working, but I lost part of the commit
during a rebase, and my randconfig builds still succeeded without it, so I
sent a wrong version.

> Arnd's intention was to not force QCOM_SCM to be built on non-Qualcomm
> devices. But as Daniel experienced, attempting to boot most Qualcomm
> boards without this results in a instant reboot.
>
> I think it's okay if we tinker with CONFIG_ARM_SMMU_QCOM for v5.16, but
> we're getting late in v5.15 so I would prefer if we make sure this works
> out of the box.

Yes, makes sense. For reference, see below for how I would fix this properly,
this is what I had intended to have in the patch. Feel free to pick
either version
as the immediate bugfix. I'll give the below a little more randconfig testing
overnight though. The pasted version of the patch is probably
whitespace-damaged,
let me know if you would like me to send it as a proper patch.

       Arnd

8<-----
Subject: iommu: fix ARM_SMMU_QCOM compilation

My previous bugfix ended up making things worse for the QCOM IOMMU
driver when it forgot to add the Kconfig symbol that is getting used to
control the compilation of the SMMU implementation specific code
for Qualcomm.

Fixes: 424953cf3c66 ("qcom_scm: hide Kconfig symbol")
Reported-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c5c71b7ab7e8..2dfe744ddd97 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -311,6 +311,7 @@ config ARM_SMMU
        select IOMMU_API
        select IOMMU_IO_PGTABLE_LPAE
        select ARM_DMA_USE_IOMMU if ARM
+       select QCOM_SCM if ARM_SMMU_QCOM
        help
          Support for implementations of the ARM System MMU architecture
          versions 1 and 2.
@@ -355,6 +356,13 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
          'arm-smmu.disable_bypass' will continue to override this
          config.

+config ARM_SMMU_QCOM
+       def_bool y
+       depends on ARM_SMMU && ARCH_QCOM
+       help
+         When running on a Qualcomm platform that has the custom variant
+         of the ARM SMMU, this needs to be built into the SMMU driver.
+
 config ARM_SMMU_V3
        tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
        depends on ARM64
