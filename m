Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF04FB07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 16:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfD3OGP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 10:06:15 -0400
Received: from foss.arm.com ([217.140.101.70]:48028 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbfD3OGP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 10:06:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D411280D;
        Tue, 30 Apr 2019 07:06:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F43F3F719;
        Tue, 30 Apr 2019 07:06:13 -0700 (PDT)
Subject: qcom_scm: Incompatible pointer type build failure
To:     Ian Jackson <ian.jackson@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc:     xen-devel@lists.xenproject.org, andy.gross@linaro.org,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <osstest-135420-mainreport@xen.org>
 <23752.17186.527512.614163@mariner.uk.xensource.com>
From:   Julien Grall <julien.grall@arm.com>
Message-ID: <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
Date:   Tue, 30 Apr 2019 15:06:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23752.17186.527512.614163@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ian,

Thank you for the report.

On 30/04/2019 13:44, Ian Jackson wrote:
> osstest service owner writes ("[linux-4.19 test] 135420: regressions - FAIL"):
>> flight 135420 linux-4.19 real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/135420/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   build-armhf-pvops             6 kernel-build             fail REGR. vs. 129313
> 
> http://logs.test-lab.xenproject.org/osstest/logs/135420/build-armhf-pvops/6.ts-kernel-build.log
> 
>    drivers/firmware/qcom_scm.c: In function â€˜qcom_scm_assign_memâ€™:
>    drivers/firmware/qcom_scm.c:469:47: error: passing argument 3 of â€˜dma_alloc_coherentâ€™ from incompatible pointer type [-Werror=incompatible-pointer-types]
>      ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
>                                                   ^
>    In file included from drivers/firmware/qcom_scm.c:21:0:
>    ./include/linux/dma-mapping.h:560:21: note: expected â€˜dma_addr_t * {aka long long unsigned int *}â€™ but argument is of type â€˜phys_addr_t * {aka unsigned int *}â€™
>     static inline void *dma_alloc_coherent(struct device *dev, size_t size,
>                         ^~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>    scripts/Makefile.build:303: recipe for target 'drivers/firmware/qcom_scm.o' failed
>    make[2]: *** [drivers/firmware/qcom_scm.o] Error 1
>    scripts/Makefile.build:544: recipe for target 'drivers/firmware' failed
>    make[1]: *** [drivers/firmware] Error 2
>    make[1]: *** Waiting for unfinished jobs....
> 
> I think this build failure is probably a regression; rather it is due
> to the stretch update which brings in a new compiler.

The bug has always been present (and still present in master), it is possible 
the compiler became smarter with the upgrade to stretch.

The problem is similar to [1] and happen when the size of phys_addr_t is 
different to dma_addr_t.

I have CCed the maintainers of this file.

Cheers,

[1] https://lists.xenproject.org/archives/html/xen-devel/2019-04/msg00940.html

-- 
Julien Grall
