Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6316C27BA58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 03:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgI2BiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 21:38:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:45960 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727288AbgI2Bh7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 21:37:59 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 12EF7EE1E3DDF35918F3;
        Tue, 29 Sep 2020 09:37:58 +0800 (CST)
Received: from [10.174.179.62] (10.174.179.62) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 29 Sep 2020 09:37:48 +0800
Subject: Re: [PATCH] iommu/qcom: add missing put_device() call in
 qcom_iommu_of_xlate()
To:     Will Deacon <will@kernel.org>, kernel test robot <lkp@intel.com>
CC:     <robdclark@gmail.com>, <joro@8bytes.org>,
        <kbuild-all@lists.01.org>, <clang-built-linux@googlegroups.com>,
        <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20200918011357.909335-1-yukuai3@huawei.com>
 <202009220340.bJfsaeQn%lkp@intel.com>
 <20200921204556.GB3811@willie-the-truck>
 <20200928230835.GA12939@willie-the-truck>
From:   "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <3a2d2c51-dd4f-8384-805a-c91413ce4373@huawei.com>
Date:   Tue, 29 Sep 2020 09:37:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200928230835.GA12939@willie-the-truck>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2020/09/29 7:08, Will Deacon wrote:
> On Mon, Sep 21, 2020 at 09:45:57PM +0100, Will Deacon wrote:
>> On Tue, Sep 22, 2020 at 03:13:53AM +0800, kernel test robot wrote:
>>> Thank you for the patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on iommu/next]
>>> [also build test WARNING on linus/master v5.9-rc6 next-20200921]
>>> [cannot apply to robclark/msm-next]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Yu-Kuai/iommu-qcom-add-missing-put_device-call-in-qcom_iommu_of_xlate/20200918-091341
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
>>> config: arm64-randconfig-r023-20200920 (attached as .config)
>>> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 4e8c028158b56d9c2142a62464e8e0686bde3584)
>>> reproduce (this is a W=1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # install arm64 cross compiling tool for clang build
>>>          # apt-get install binutils-aarch64-linux-gnu
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/iommu/arm/arm-smmu/qcom_iommu.c:601:4: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
>>>                             return -EINVAL;
>>>                             ^
>>>     drivers/iommu/arm/arm-smmu/qcom_iommu.c:599:3: note: previous statement is here
>>>                     if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
>>
>> Oh, this looks like a nasty bug. Seems we're missing some braces.
> 
> Yu Kuai: please could you send a v2 of this?
> 

Hi, Will

Thanks for your notice, will send a V2 soon.

Yu Kuai
