Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CA12E90EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 08:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbhADHYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 02:24:46 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:54701 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbhADHYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 02:24:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609745065; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ePSJTS8aNTEGt/dVLDXZqrMUMJo9tCN/G2RVV6iVggs=;
 b=dUyPaNBGjvRGfGwPtaAB3kOKdjIhb8dRjC6JjYqjqZyCy1jN757uFfX+d2jyGZis2ZT1Bnpm
 UlygydIs0CdDx0FPTLhiEB+cZm123Atn7mcaSXFr8lGfKp1oUies6dy7pEeOYIduQQQq2Bvb
 L2L01T7Kgg8RBVlwOeCc+O5ZV7c=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ff2c28f3d8496911481beef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Jan 2021 07:23:59
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 41779C4346D; Mon,  4 Jan 2021 07:23:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F808C43464;
        Mon,  4 Jan 2021 07:23:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Jan 2021 12:53:57 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     kernel test robot <lkp@intel.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        kbuild-all@lists.01.org, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>
Subject: Re: [PATCH] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
In-Reply-To: <CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com>
References: <20210103140407.3917405-1-arnd@kernel.org>
 <202101032327.9BXJpAn8-lkp@intel.com>
 <CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com>
Message-ID: <c6964a2e396f2c5376870ab57ec4744d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnd,

On 2021-01-03 20:54, Arnd Bergmann wrote:
> On Sun, Jan 3, 2021 at 4:09 PM kernel test robot <lkp@intel.com> wrote:
>> 
>> Hi Arnd,
>> 
>> I love your patch! Yet something to improve:
>> 
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v5.11-rc1 next-20201223]
>> [If your patch is applied to the wrong git tree, kindly drop us a 
>> note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>> 
>> url:    
>> https://github.com/0day-ci/linux/commits/Arnd-Bergmann/drm-msm-a6xx-add-CONFIG_QCOM_LLCC-dependency/20210103-220704
>> base:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>> 3516bd729358a2a9b090c1905bd2a3fa926e24c6
>> config: i386-randconfig-m021-20210103 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce (this is a W=1 build):
>>         # 
>> https://github.com/0day-ci/linux/commit/7d8b8d7954012e210a5e6c77103e52382c6b5503
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review 
>> Arnd-Bergmann/drm-msm-a6xx-add-CONFIG_QCOM_LLCC-dependency/20210103-220704
>>         git checkout 7d8b8d7954012e210a5e6c77103e52382c6b5503
>>         # save the attached .config to linux build tree
>>         make W=1 ARCH=i386
>> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> 
>> All errors (new ones prefixed by >>):
>> 
>> >> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>>    drivers/gpu/drm/Kconfig:74: symbol DRM_KMS_HELPER is selected by 
>> DRM_MSM
>>    drivers/gpu/drm/msm/Kconfig:3: symbol DRM_MSM depends on 
>> QCOM_COMMAND_DB
>>    drivers/soc/qcom/Kconfig:19: symbol QCOM_COMMAND_DB depends on 
>> OF_RESERVED_MEM
>>    drivers/of/Kconfig:80: symbol OF_RESERVED_MEM default is visible 
>> depending on DMA_CMA
>>    kernel/dma/Kconfig:109: symbol DMA_CMA is selected by FB_HYPERV
>>    drivers/video/fbdev/Kconfig:2182: symbol FB_HYPERV depends on FB
>>    drivers/video/fbdev/Kconfig:12: symbol FB is selected by 
>> DRM_KMS_FB_HELPER
>>    drivers/gpu/drm/Kconfig:80: symbol DRM_KMS_FB_HELPER depends on 
>> DRM_KMS_HELPER
>>    For a resolution refer to Documentation/kbuild/kconfig-language.rst
>>    subsection "Kconfig recursive dependency limitations"
> 
> Ah, this depends on another patch of mine that I have in my randconfig 
> tree, to
> replace the 'select FB' in DRM_KMS_FB_HELPER with 'depends on FB'.
> 
> Should I resend that patch, or would someone suggest a different fix 
> for
> the CONFIG_QCOM_LLCC dependency issue?
> 

Thanks, your patch looks good to me unless Rob has some other idea. Once 
the recursive
dependency thing is sorted,

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
