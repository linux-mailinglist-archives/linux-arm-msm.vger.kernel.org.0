Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFAF3B8FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 11:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbhGAJ3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 05:29:20 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62431 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235168AbhGAJ3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 05:29:19 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210701092647euoutp024d5f0bc5065c5ed35f7370853d9a47f5~NoJYyvlOX2122021220euoutp02A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jul 2021 09:26:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210701092647euoutp024d5f0bc5065c5ed35f7370853d9a47f5~NoJYyvlOX2122021220euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1625131607;
        bh=pFxbu6W1zqy25WaKD6FvSezlWD7U/LTkGDdeKblBEzM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=j0VBFNKSgsa55lg4n2Kgb3dgvZwoYE9AeGO0+GS4oC3OJxT5tdQrmibx6g8BcCn4o
         6rGqBuTFhYdYS7THR9Ldxar6VPrLJOft907pin0UrpYKiGRp2YNedjH8uj5wqdPocU
         gZhXTZVZbuBnHoVH+J/H/4kUCioiOws7m01xghlQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210701092647eucas1p1c583e6368c559eb0c0b1f7911efeca8b~NoJYbRUnK1162711627eucas1p1w;
        Thu,  1 Jul 2021 09:26:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id D8.AF.45756.75A8DD06; Thu,  1
        Jul 2021 10:26:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210701092646eucas1p21e2b799d2c67f07dec29e696fbefaff9~NoJX6Q14c2716127161eucas1p2N;
        Thu,  1 Jul 2021 09:26:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210701092646eusmtrp1eb8c20bca6ac839a6b225805ec458284~NoJX5WhG00277002770eusmtrp1k;
        Thu,  1 Jul 2021 09:26:46 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-72-60dd8a571f33
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.C2.20981.65A8DD06; Thu,  1
        Jul 2021 10:26:46 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210701092645eusmtip1f1d8d6caf01d05f2fb6ffe278c38f9d2~NoJXPGwS51915719157eusmtip1Z;
        Thu,  1 Jul 2021 09:26:45 +0000 (GMT)
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
Message-ID: <a72b0a47-9de9-ebb9-e0eb-70e3bb20942a@samsung.com>
Date:   Thu, 1 Jul 2021 11:26:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bf8d3101-1db7-ee5a-377c-2196e3ce84e3@arm.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87rhXXcTDL58Z7a4tH0Zq8WC/dYW
        DasvsFq0zFrEYrHp8TVWi4n7z7JbXN41h83i4IcnQIk7pg6cHmvmrWH02DnrLrvHplWdbB53
        ru1h89i8pN5j8o3ljB69ze/YPD5vkgvgiOKySUnNySxLLdK3S+DK+HvjGUtBi3bF3uMrmBsY
        G1W6GDk5JARMJLa++8nYxcjFISSwglHi9JRN7BDOF0aJGy/mMEE4nxklXnfMYodpabh9ixUi
        sZxR4tqCD8wQzkdGiZ4Lf5hAqoQF/CU6v/1mBLFFBNwkzh+czAJSxCzQwyTxrOkYC0iCTcBQ
        outtFxuIzStgJ/H40UKwZhYBFYnXr6+DNYsKJEu8nzeDFaJGUOLkzCdAvRwcnALWEm/X+YKE
        mQXkJZq3zmaGsMUlbj2ZD3a2hEAzp8SaDTOYIM52kej+towZwhaWeHV8C9Q7MhKnJ/ewQDUw
        Sjw8t5YdwulhlLjcNIMRospa4s65X2wgm5kFNCXW79KHCDtKLOmfywwSlhDgk7jxVhDiCD6J
        SdumQ4V5JTrahCCq1SRmHV8Ht/bghUvMExiVZiH5bBaSd2YheWcWwt4FjCyrGMVTS4tz01OL
        DfNSy/WKE3OLS/PS9ZLzczcxAlPW6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8UTtvJwjxpiRW
        VqUW5ccXleakFh9ilOZgURLnXTV7TbyQQHpiSWp2ampBahFMlomDU6qBybmC4aCw/PTCEmWh
        6vCbLtE/1+/VWiDPy+72XCB35oQloYGye47YNm+r77oV4d8vOuuNtXNh9LTwrIO/vtjauUbs
        Zbr1Q7FZZnX/Zp9ug0nHNznJpX22fuQkHhY/u1/cu9Mv9x6j2ydVPi/ev0J+dm/npGnJvMh7
        t28LZ+767u1fFlZtfHfLfRfHhUlHnj5R2bDuTrn/GyW3/1yh71W1UoKyDI3OzUlYvG39BumH
        weofpN5NOGeznXFNzGIJ88e+U9RdDSJ+zprq7bigsuCxX3e5pPsy/tj41c++6HNxGHzWv33q
        mcHOtJNry++1n1ha7bB+pZzhdgH1tOXMbwzYAj7fOljyTezY1NgbQWW2SizFGYmGWsxFxYkA
        /gFBQMgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7phXXcTDCYfE7O4tH0Zq8WC/dYW
        DasvsFq0zFrEYrHp8TVWi4n7z7JbXN41h83i4IcnQIk7pg6cHmvmrWH02DnrLrvHplWdbB53
        ru1h89i8pN5j8o3ljB69ze/YPD5vkgvgiNKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0
        No+1MjJV0rezSUnNySxLLdK3S9DL+HvjGUtBi3bF3uMrmBsYG1W6GDk5JARMJBpu32LtYuTi
        EBJYyijxZP1cdoiEjMTJaQ2sELawxJ9rXWwQRe8ZJRb2nmUGSQgL+EosPLKPEcQWEXCTOH9w
        MgtIEbNAD5PE2Vl/wYqEBF4ySyx5ZA5iswkYSnS9BZnEycErYCfx+NFCJhCbRUBF4vXr62CD
        RAWSJX6ub4eqEZQ4OfMJ0FAODk4Ba4m363xBwswCZhLzNj9khrDlJZq3zoayxSVuPZnPNIFR
        aBaS7llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwAjdduznlh2MK199
        1DvEyMTBeIhRgoNZSYQ3auftBCHelMTKqtSi/Pii0pzU4kOMpkDvTGSWEk3OB6aIvJJ4QzMD
        U0MTM0sDU0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUamHi0xPXCnT9rfT9ese1OQGmV
        mO3Vxcv/85XkvNnsz7Q9vrP25a1V6SEspT97+vonOnGxH58poOEmuyvzNMu2+z/7f9yMeHzq
        6el6L/nqq9YGhueezM85NfuNtGlPXt30FYcM/mwpXNt6KUNfPcmeyeLTof+yCTt+WYmp3+NM
        +3ot8+fj+TrJfPt1Nf12by1iZMzQamvJT2R59NQteL7Toi/zlz/X1Su46H93yslFLK/Edwln
        6LYqBgeZHH/E4BS9ZfLJg1mO878e/cZaf3L6Mt2HK1Tezb4YEejVtmvTiyPTJPf4OEwPjTfX
        +H5Vs27zi6RCwQuPD/xY49owV2Ln7tl7ElTLKtJnnk1NLvxcLa7EUpyRaKjFXFScCADsGacR
        WQMAAA==
X-CMS-MailID: 20210701092646eucas1p21e2b799d2c67f07dec29e696fbefaff9
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
        <d3fee5f3-a435-7aa8-62ae-060e9b2aa532@samsung.com>
        <20210701090112.GA9489@willie-the-truck>
        <bf8d3101-1db7-ee5a-377c-2196e3ce84e3@arm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01.07.2021 11:11, Robin Murphy wrote:
> On 2021-07-01 10:01, Will Deacon wrote:
>> On Thu, Jul 01, 2021 at 10:29:29AM +0200, Marek Szyprowski wrote:
>>> Hi Robin,
>>>
>>> On 30.06.2021 16:01, Robin Murphy wrote:
>>>> On 2021-06-30 14:48, Marek Szyprowski wrote:
>>>>> On 30.06.2021 14:59, Will Deacon wrote:
>>>>>> On Wed, Jun 30, 2021 at 02:48:15PM +0200, Marek Szyprowski wrote:
>>>>>>> On 08.06.2021 18:45, Amey Narkhede wrote:
>>>>>>>> If device registration fails, remove sysfs attribute
>>>>>>>> and if setting bus callbacks fails, unregister the device
>>>>>>>> and cleanup the sysfs attribute.
>>>>>>>>
>>>>>>>> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
>>>>>>> This patch landed in linux-next some time ago as commit 
>>>>>>> 249c9dc6aa0d
>>>>>>> ("iommu/arm: Cleanup resources in case of probe error path"). After
>>>>>>> bisecting and some manual searching I finally found that it is
>>>>>>> responsible for breaking s2idle on DragonBoard 410c. Here is the 
>>>>>>> log
>>>>>>> (captured with no_console_suspend):
>>>>>>>
>>>>>>> # time rtcwake -s10 -mmem
>>>>>>> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Janï¿½ 1 
>>>>>>> 00:02:13 1970
>>>>>>> PM: suspend entry (s2idle)
>>>>>>> Filesystems sync: 0.002 seconds
>>>>>>> Freezing user space processes ... (elapsed 0.006 seconds) done.
>>>>>>> OOM killer disabled.
>>>>>>> Freezing remaining freezable tasks ... (elapsed 0.004 seconds) 
>>>>>>> done.
>>>>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>>>>> 0000000000000070
>>>>>>> Mem abort info:
>>>>>>> ï¿½ï¿½ ï¿½ ESR = 0x96000006
>>>>>>> ï¿½ï¿½ ï¿½ EC = 0x25: DABT (current EL), IL = 32 bits
>>>>>>> ï¿½ï¿½ ï¿½ SET = 0, FnV = 0
>>>>>>> ï¿½ï¿½ ï¿½ EA = 0, S1PTW = 0
>>>>>>> ï¿½ï¿½ ï¿½ FSC = 0x06: level 2 translation fault
>>>>>>> Data abort info:
>>>>>>> ï¿½ï¿½ ï¿½ ISV = 0, ISS = 0x00000006
>>>>>>> ï¿½ï¿½ ï¿½ CM = 0, WnR = 0
>>>>>>> user pgtable: 4k pages, 48-bit VAs, pgdp=000000008ad08000
>>>>>>> [0000000000000070] pgd=0800000085c3c003, p4d=0800000085c3c003,
>>>>>>> pud=0800000088dcf003, pmd=0000000000000000
>>>>>>> Internal error: Oops: 96000006 [#1] PREEMPT SMP
>>>>>>> Modules linked in: bluetooth ecdh_generic ecc rfkill ipv6 ax88796b
>>>>>>> venus_enc venus_dec videobuf2_dma_contig asix crct10dif_ce adv7511
>>>>>>> snd_soc_msm8916_analog qcom_spmi_temp_alarm rtc_pm8xxx qcom_pon
>>>>>>> qcom_camss qcom_spmi_vadc videobuf2_dma_sg qcom_vadc_common msm
>>>>>>> venus_core v4l2_fwnode v4l2_async snd_soc_msm8916_digital
>>>>>>> videobuf2_memops snd_soc_lpass_apq8016 snd_soc_lpass_cpu 
>>>>>>> v4l2_mem2mem
>>>>>>> snd_soc_lpass_platform snd_soc_apq8016_sbc videobuf2_v4l2
>>>>>>> snd_soc_qcom_common qcom_rng videobuf2_common i2c_qcom_cci
>>>>>>> qnoc_msm8916
>>>>>>> videodev mc icc_smd_rpm mdt_loader socinfo display_connector 
>>>>>>> rmtfs_mem
>>>>>>> CPU: 1 PID: 1522 Comm: rtcwake Not tainted 5.13.0-next-20210629 
>>>>>>> #3592
>>>>>>> Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>>>>>>> pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
>>>>>>> pc : msm_runtime_suspend+0x1c/0x60 [msm]
>>>>>>> lr : msm_pm_suspend+0x18/0x38 [msm]
>>>>>>> ...
>>>>>>> Call trace:
>>>>>>> ï¿½ï¿½ ï¿½msm_runtime_suspend+0x1c/0x60 [msm]
>>>>>>> ï¿½ï¿½ ï¿½msm_pm_suspend+0x18/0x38 [msm]
>>>>>>> ï¿½ï¿½ ï¿½dpm_run_callback+0x84/0x378
>>>>>> I wonder if we're missing a pm_runtime_disable() call on the failure
>>>>>> path?
>>>>>> i.e. something like the diff below...
>>>>>
>>>>> I've checked and it doesn't fix anything.
>>>>
>>>> What's happened previously? Has an IOMMU actually failed to probe, or
>>>> is this a fiddly "code movement unveils latent bug elsewhere" kind of
>>>> thing? There doesn't look to be much capable of going wrong in
>>>> msm_runtime_suspend() itself, so is the DRM driver also in a broken
>>>> half-probed state where it's left its pm_runtime_ops behind without
>>>> its drvdata being valid?
>>>>
>>> I finally had some time to analyze this issue. It turned out that with
>>> this patch, iommu fails to probe for soc:iommu@1f08000 device, while it
>>> worked fine before. This happens because this patch adds a check for 
>>> the
>>> return value of the bus_set_iommu() in
>>> drivers/iommu/arm/arm-smmu/qcom_iommu.c. When I removed that check, it
>>> probes successfully again. It looks that there are already iommu ops
>>> registered for platform bus, before qcom_iommu probes. On the other
>>> hand, if I remember correctly they are not used during the device
>>> registration, but they are needed for some legacy stuff. I can send a
>>> patch restoring old code flow if you think that this is a right 
>>> solution.
>>
>> Yes, let's just revert the qcom_iommu.c changes from that patch for now.
>> The pm runtime stuff looks dodgy anyway so I think this needs more 
>> thought.
>
> Oh, right, blindly returning the -EBUSY from bus_set_iommu() because 
> we're not the first instance to probe is definitely the wrong thing to 
> do as well. It's still not clear why failing makes the DRM driver fall 
> over, but +1 to qcom-iommu needing some deeper consideration.

I've just checked and bus_set_iommu() is called for every 
'qcom,msm-iommu-v1' device in the system, thus it fails for the second 
and next devices.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

