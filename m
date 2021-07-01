Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10AF33B8ED5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 10:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbhGAIcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 04:32:03 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20111 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbhGAIcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 04:32:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210701082931euoutp021c0bc4e4a022d30b0e0a204716f66ca1~NnXYjqEPn2538125381euoutp02o
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jul 2021 08:29:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210701082931euoutp021c0bc4e4a022d30b0e0a204716f66ca1~NnXYjqEPn2538125381euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1625128171;
        bh=Ot0MIWXbZbOHC3NOB3xttOMBVPOErGYNsWoNItxp+i4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=DWaa94YP+lSTTgP8gzr8QPGCSpd6tTfjDKvE2mBuNaosQMI6L2RaqKqF4+79esJPc
         NCkwHlDusx06FNUqY5Y+N8R7M0Q9uKLbYfHiMMDdJQV4LGO7qLPd43UuHKq1tyIWnR
         gN+hfJ30OGCe7jc7w1aWTUqHFeZRRTtiDx14A8Wc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210701082930eucas1p2d9fe0e671a2c8dc1a503a5ce7d4fd168~NnXYNItde1092810928eucas1p2m;
        Thu,  1 Jul 2021 08:29:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.35.45756.AEC7DD06; Thu,  1
        Jul 2021 09:29:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210701082930eucas1p10f9a8f82118f7ffc382f64ef2ad24992~NnXXugvq70677006770eucas1p1Q;
        Thu,  1 Jul 2021 08:29:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210701082930eusmtrp2de8c4edb9226c8039efadebb91a37f4f~NnXXtuvKe2939929399eusmtrp2r;
        Thu,  1 Jul 2021 08:29:30 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-70-60dd7cea291f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 99.98.20981.AEC7DD06; Thu,  1
        Jul 2021 09:29:30 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210701082929eusmtip1d7d9093bd66728eb0e71d576c4827499~NnXXIngwW2436324363eusmtip1Y;
        Thu,  1 Jul 2021 08:29:29 +0000 (GMT)
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error
 path
To:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d3fee5f3-a435-7aa8-62ae-060e9b2aa532@samsung.com>
Date:   Thu, 1 Jul 2021 10:29:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bc07bd52-ed2e-0a44-80a7-36b581018b40@arm.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87qvau4mGEy6YGxxafsyVosF+60t
        GlZfYLVombWIxWLT42usFhP3n2W3uLxrDpvFwQ9PgBJ3TB04PdbMW8PosXPWXXaPTas62Tzu
        XNvD5rF5Sb3H5BvLGT16m9+xeXzeJBfAEcVlk5Kak1mWWqRvl8CV0fbpGFvBYcWKr/eusjQw
        vpPuYuTkkBAwkTjx5hdzFyMXh5DACkaJmY9WsEA4Xxglzk3Yww7hfGaUmPr2G2sXIwdYy8rF
        hhDx5YwS0+9dYYVwPjJKrHl2lBFkrrCAv0Tnt99gtoiAm8T5g5PBxjIL9DBJPGs6xgKSYBMw
        lOh628UGYvMK2El82f6ZHcRmEVCReLHrNCuILSqQLPF+3gxWiBpBiZMzn4D1cgpYS2xbOw/M
        ZhaQl2jeOpsZwhaXuPVkPhPIMgmBZk6J5ecOsEF86iKxeMIJJghbWOLV8S3sELaMxP+dcA2M
        Eg/PrWWHcHoYJS43zWCEqLKWuHPuFxsoAJgFNCXW79KHCDtKLOmfywwJFz6JG28FIY7gk5i0
        bTpUmFeio00IolpNYtbxdXBrD164xDyBUWkWktdmIXlnFpJ3ZiHsXcDIsopRPLW0ODc9tdgw
        L7Vcrzgxt7g0L10vOT93EyMwZZ3+d/zTDsa5rz7qHWJk4mA8xCjBwawkwhu183aCEG9KYmVV
        alF+fFFpTmrxIUZpDhYlcd5Vs9fECwmkJ5akZqemFqQWwWSZODilGpiqwrcwVBvv/S/cdcdc
        K4DjxQZH4Z7HgfPeZuz56WerHnb9fMafPYmsVWu6yqLNIrRO/WPg8vjD0bHQekL8NfmQ//KP
        91TInvpmp89c/ezGypfNVxw+HX3X4XXTYJqNbWA341rn17LMq76/1wq4eV+0ymCK1f0lxey+
        iyw/HOiukttr80TKaMaiFa0N8ia9N7P0bVI5j3jncwepTL7UlBzBmFllEXzji0b6m8mx4b+Z
        e24u9ep5u8Pm3421VxdEcK7dK2Qle6r4acnpyWkbHIV8jzQcmXtH88ezI1IpId+lDd7vOHdd
        72RxzZNEVc/FsRM1+k22f0o2CmacOn3yEr2sz2uav3KJ3etXsv34aKkSS3FGoqEWc1FxIgAF
        ZkiqyAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7qvau4mGNxsFLS4tH0Zq8WC/dYW
        DasvsFq0zFrEYrHp8TVWi4n7z7JbXN41h83i4IcnQIk7pg6cHmvmrWH02DnrLrvHplWdbB53
        ru1h89i8pN5j8o3ljB69ze/YPD5vkgvgiNKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0
        No+1MjJV0rezSUnNySxLLdK3S9DLaPt0jK3gsGLF13tXWRoY30l3MXJwSAiYSKxcbNjFyMUh
        JLCUUWLbsZ2MXYycQHEZiZPTGlghbGGJP9e62CCK3jNK3J80kxkkISzgK7HwyD6wBhEBN4nz
        ByezgBQxC/QwSZyd9ZcZouMGk8SVKX3sIFVsAoYSXW9BRnFy8ArYSXzZ/hksziKgIvFi12mw
        daICyRI/17dD1QhKnJz5hAXE5hSwlti2dh6YzSxgJjFv80NmCFteonnrbChbXOLWk/lMExiF
        ZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjNFtx35u2cG48tVH
        vUOMTByMhxglOJiVRHijdt5OEOJNSaysSi3Kjy8qzUktPsRoCvTPRGYp0eR8YJLIK4k3NDMw
        NTQxszQwtTQzVhLnNTmyJl5IID2xJDU7NbUgtQimj4mDU6qBqdN35fUJPMafWQLnJIfF1cqd
        31X2I+rw5FO/nsRF5K8782Vrr/O3O1G5i24fclW+qC8XtuVuw4tLD3ctl+lLkZfIms2jnn7m
        87qD6z+8uPNNbrJaoo9JyO57iicu6SjlePm4rlHkzF+ppBVe13FJfqcEv/kXhRu/tv/dY33+
        yryO7GWt/6QM7j8pWn7n+NoHx1X3aIsd3fLdwE+uf1L+brMQhsL9SfP28S5+FdMjnlK+lWtq
        VHWAQ7RS7ye57okKAjrFl74+nP6uY0Lwr1ClJqW1Ue/2tiznUlsRcI/XynmXZNPWLQG7io7a
        3ZohKe36tmTi02UWkc+YCzYsLy6u0M3yOnIi9sYGn1ezy5iPLlRiKc5INNRiLipOBADoZ6Hf
        WgMAAA==
X-CMS-MailID: 20210701082930eucas1p10f9a8f82118f7ffc382f64ef2ad24992
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
        <CGME20210630124816eucas1p27563f0a456c0196e20937619aa2f8d26@eucas1p2.samsung.com>
        <26f6a765-37c8-d63a-a779-384f095d5770@samsung.com>
        <20210630125940.GA8515@willie-the-truck>
        <4e3b1685-323e-2a7e-3aae-7c21b28fc65f@samsung.com>
        <bc07bd52-ed2e-0a44-80a7-36b581018b40@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 30.06.2021 16:01, Robin Murphy wrote:
> On 2021-06-30 14:48, Marek Szyprowski wrote:
>> On 30.06.2021 14:59, Will Deacon wrote:
>>> On Wed, Jun 30, 2021 at 02:48:15PM +0200, Marek Szyprowski wrote:
>>>> On 08.06.2021 18:45, Amey Narkhede wrote:
>>>>> If device registration fails, remove sysfs attribute
>>>>> and if setting bus callbacks fails, unregister the device
>>>>> and cleanup the sysfs attribute.
>>>>>
>>>>> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
>>>> This patch landed in linux-next some time ago as commit 249c9dc6aa0d
>>>> ("iommu/arm: Cleanup resources in case of probe error path"). After
>>>> bisecting and some manual searching I finally found that it is
>>>> responsible for breaking s2idle on DragonBoard 410c. Here is the log
>>>> (captured with no_console_suspend):
>>>>
>>>> # time rtcwake -s10 -mmem
>>>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:02:13 1970
>>>> PM: suspend entry (s2idle)
>>>> Filesystems sync: 0.002 seconds
>>>> Freezing user space processes ... (elapsed 0.006 seconds) done.
>>>> OOM killer disabled.
>>>> Freezing remaining freezable tasks ... (elapsed 0.004 seconds) done.
>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>> 0000000000000070
>>>> Mem abort info:
>>>>      ESR = 0x96000006
>>>>      EC = 0x25: DABT (current EL), IL = 32 bits
>>>>      SET = 0, FnV = 0
>>>>      EA = 0, S1PTW = 0
>>>>      FSC = 0x06: level 2 translation fault
>>>> Data abort info:
>>>>      ISV = 0, ISS = 0x00000006
>>>>      CM = 0, WnR = 0
>>>> user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
>>>> [0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003,
>>>> pud=0800000088dcf003, pmd=0000000000000000
>>>> Internal error: Oops: 96000006 [#1] PREEMPT SMP
>>>> Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b
>>>> venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511
>>>> snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon
>>>> qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm
>>>> venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital
>>>> videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu v4l2_mem2mem
>>>> snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2
>>>> snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci 
>>>> qnoc_msm8916
>>>> videodev mc icc_smd_rpm mdt_loader socinfo display_connector rmtfs_mem
>>>> CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 #3592
>>>> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>>>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
>>>> pc : msm_runtime_suspend+0x1c/0x60 [msm]
>>>> lr : msm_pm_suspend+0x18/0x38 [msm]
>>>> ...
>>>> Call trace:
>>>>     msm_runtime_suspend+0x1c/0x60 [msm]
>>>>     msm_pm_suspend+0x18/0x38 [msm]
>>>>     dpm_run_callback+0x84/0x378
>>> I wonder if we're missing a pm_runtime_disable() call on the failure 
>>> path?
>>> i.e. something like the diff below...
>>
>> I've checked and it doesn't fix anything.
>
> What's happened previously? Has an IOMMU actually failed to probe, or 
> is this a fiddly "code movement unveils latent bug elsewhere" kind of 
> thing? There doesn't look to be much capable of going wrong in 
> msm_runtime_suspend() itself, so is the DRM driver also in a broken 
> half-probed state where it's left its pm_runtime_ops behind without 
> its drvdata being valid?
>
I finally had some time to analyze this issue. It turned out that with 
this patch, iommu fails to probe for soc:iommu@1f08000 device, while it 
worked fine before. This happens because this patch adds a check for the 
return value of the bus_set_iommu() in 
drivers/iommu/arm/arm-smmu/qcom_iommu.c. When I removed that check, it 
probes successfully again. It looks that there are already iommu ops 
registered for platform bus, before qcom_iommu probes. On the other 
hand, if I remember correctly they are not used during the device 
registration, but they are needed for some legacy stuff. I can send a 
patch restoring old code flow if you think that this is a right solution.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

