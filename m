Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32531F70B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 01:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgFKXFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 19:05:33 -0400
Received: from sonic315-55.consmr.mail.gq1.yahoo.com ([98.137.65.31]:35280
        "EHLO sonic315-55.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726306AbgFKXFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 19:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1591916728; bh=4YUy2dnKX+aLfXhIKF01g98COCeJaRGO0uIb0VS79Kk=; h=Date:From:Subject:To:Cc:References:From:Subject; b=ksY/536Vx4+k7UgUuK7sU+hVBThfiszI09Iuz1pRDsEDzIekIw49uYjp7ORgIcNYz0f6DNDzfy6/4yfZrOHqInTp/7Z/HcyjmMMLgeZWuD8TRAwOaMMkENqEBRHmRUuLAghQQjihayEfj8L20m6zZMfg23tNVn0w4aye3VB6XxwcQwPiMIHahzYpkJItzHEI+CmtRNoS45OeF8pkyYlQXTj5rda13IOwNMLzMGJ8ZXmNJM+2AQJKKYg2covwyMtdvSqzYCtGIcWITwCXA8hKPZtr12KvBVm1CK0E2O6h8qR/7PTGpw4okY+ctPIvnNIDw3ffcEEgwvbMVoGH5mEvNw==
X-YMail-OSG: VeI5KAIVM1l8FZBKKOcgI77XPMQpX1yRxgEuJkG2HwGiwftSWlMzUhg.wI9RpCO
 0m9mb_xDfGj9T2zqhX.uH.ouvYYHvpDFZhv1pWFL5y1aS4v9hb1LGwKsLcCxtdjVmrndIAxlrgTz
 8LO3W4t7Y60g_t0QstSujZEh68oL_wRlHCSB5Td_M.HVxGsUQjqWM2qr_3.AkhSA0yutg5qcke8K
 Tv4I9pYJd9awi6FeCBU8.AW0hdjLa6mwHM8hm8SCtmWxN5P9kgX8HCxAaSA2wWYE5BgfOiUDY0eN
 8SdF4xfPgafkYHgez7VCD9nxGHLJtR8PsxeXciMIqqC1F9E63fd4UIcXYfSp5mCCnXf1pW2oA0VZ
 eHnF2Lf5MUvy0KsxA7VkbSJfJnhx72DN4PMW15_Pqypq2CTc5FOh7t_XE2x5gmqPfv8aAgem9Z6S
 G754j7JvVIvxR16NyP1NJHKbTMsWHNX0qPQnbyQSB5vpRmVwkBOq_AHkSPmPavoJRKp4qbzy6bBO
 Bgl5ef0LdH1w0IGoNwlRH.UR8MrIAnwak32wCqG5lf.SwS9m.j1yNpS4_5D0o_3_e09XXbmbVT87
 JydTvntH.WypWlGKDwbEeflUZOlJnJ07XyPmONgYYP36533AICJBEt96Va3.mhtjhlFw3.29ZciX
 DUnx7ZrUMS58v2ROWoMShz.kIsuifGl.62rbZy_X8r4vO.Uxo5XJwzW4msMSwsvTqaOqT_X2DSbr
 LLj_UnAnYi2D4y9bOLYthO6rgknJsjH5NNK_yfRdTmQy.0mTEM7K9s8uzcE9CTS8fKfsDaVPyVxh
 xVmmJFX.A8jqmra2IrNsfF8nyaPIwxTRtGkfxuk34ZNH.5c0amNlvLcBd8.CT2wpn_WASLVEIrIT
 lDlihOCfti987bgw5CyoUnMPwNm0_HyhWtZkakVcpPqyn4HsvO_sGZRdcb0.0tEu_C025pvdxswN
 rmgxGP8nc8FxFl_ewO1mGzIfh.LwtPgP6qxJHGwfAB.8sgV6oyaOcpklbPCK0mtb2TNuawY.gM1Y
 4EIewDISpLaEHGybdY02ejlYI9grt4UFGP66cBLM98U9eaSs476RtjcbgJDnZF0_b5o12Ivh3yDE
 .RRrOjKXttZUE3n3qAJp9VaVUkrJ1tU13bF05OPpKcgEydjxVzV7vX1CE71IihUl_3XGlg_spYT1
 ddNGRuEIqFA0z2RSjAXwv25g7eOX4gy.2PVQRZ6tqkn.PDou7IfhlVk8_1frFp5r3OUVYDW2Om7X
 b38HOjsBTSMFQLSdrTiz56K7c1Ygr8lUnUMCqgmgaJUxAZUUchMUduSb9Ii8mcXGP569B9NwAMAc
 y3hNB5BRs5SQzb2xm6fsFam.vFlKXVBiNz6MHR.jitsw1wi_Lt0BaPaD8ibirje_yAw4-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.gq1.yahoo.com with HTTP; Thu, 11 Jun 2020 23:05:28 +0000
Received: by smtp422.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 385a77de6a3948fc2d5a9f83b3566fac;
          Thu, 11 Jun 2020 23:05:25 +0000 (UTC)
Date:   Thu, 11 Jun 2020 19:05:21 -0400
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: AMD IOMMU + SME + amdgpu regression
To:     Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
        David Rientjes <rientjes@google.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Daniel Drake <drake@endlessm.com>, jonathan.derrick@intel.com,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
MIME-Version: 1.0
Message-Id: <1591915710.rakbpzst8h.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
References: <1591915710.rakbpzst8h.none.ref@localhost>
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

amdgpu + IOMMU + SME is now working for me on 5.7, yay! But, it is=20
broken on torvalds master, boo. On boot, depending on which exact commit=20
I test, it either hangs immediately (with built-in driver, before=20
starting initramfs), displays some errors then hangs, or spams the=20
screen with many amdgpu errors.

I bisected the black screen hang to:

commit dce8d6964ebdb333383bacf5e7ab8c27df151218
Author: Joerg Roedel <jroedel@suse.de>
Date:   Wed Apr 29 15:36:53 2020 +0200

    iommu/amd: Convert to probe/release_device() call-backs

    Convert the AMD IOMMU Driver to use the probe_device() and
    release_device() call-backs of iommu_ops, so that the iommu core code
    does the group and sysfs setup.

    Signed-off-by: Joerg Roedel <jroedel@suse.de>
    Link: https://lore.kernel.org/r/20200429133712.31431-16-joro@8bytes.org
    Signed-off-by: Joerg Roedel <jroedel@suse.de>

Testing torvalds master (623f6dc593) with the containing merge=20
(98bdc74b36) plus the DMA mapping merge (4e94d08734) reverted allows=20
amdgpu + IOMMU + SME to once again work.

I think that nobody is really working on amdgpu + SME, but it would be a=20
shame if it was supported and then incidentally broken by a small=20
change.

I am using an ASRock B450 Pro4 with Ryzen 1600 and ASUS RX 480. I don't=20
understand this code at all, but let me know what I can do to=20
troubleshoot.

Thanks,
Alex.
