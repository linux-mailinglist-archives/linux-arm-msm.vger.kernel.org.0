Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BC842D23D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 08:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhJNGYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 02:24:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26740 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhJNGYO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 02:24:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634192530; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=lTLIJG2i4OAIzGVAjEZbpCIr/J4WAHviqABtv7QEgV8=; b=TTRWrFqcnrKM+DFnrQvw4ATRbZR4FPyaN2gd0gGy/5E1lTbVJhMw8NolN4JXrB0Lr2xHw1vB
 ZpUDDaeMOIhlTS7KIhYJTnU4uLoK6r4ynzYNd1Ea6E/nyB5u4VqcMo/QsgoD4q6wpxdpguSe
 57fk2890hdtHV9KgSul/3I3g/IM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6167cc8903355859c890c693 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Oct 2021 06:22:01
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F626C43616; Thu, 14 Oct 2021 06:22:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (unknown [117.217.235.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 51059C4338F;
        Thu, 14 Oct 2021 06:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 51059C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <b69f0e6c-3121-1b88-938b-34556a5013e6@codeaurora.org>
Date:   Thu, 14 Oct 2021 11:51:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [bug report] drm/msm/a6xx: Fix llcc configuration for a660 gpu
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20211012100029.GA3379@kili>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211012100029.GA3379@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/12/2021 3:30 PM, Dan Carpenter wrote:
> Hello Akhil P Oommen,
> 
> The patch a6f24383f6c0: "drm/msm/a6xx: Fix llcc configuration for
> a660 gpu" from Jul 30, 2021, leads to the following Smatch static
> checker warning:
> 
> 	drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1480 a6xx_llc_activate()
> 	error: uninitialized symbol 'gpu_scid'.
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>      1423 static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>      1424 {
>      1425         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>      1426         struct msm_gpu *gpu = &adreno_gpu->base;
>      1427         u32 gpu_scid, cntl1_regval = 0;
>      1428
>      1429         if (IS_ERR(a6xx_gpu->llc_mmio))
>      1430                 return;
>      1431
>      1432         if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
>      1433                 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
>      1434
>      1435                 gpu_scid &= 0x1f;
>      1436                 cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
>      1437                                (gpu_scid << 15) | (gpu_scid << 20);
>      1438         }
> 
> gpu_scid not initialized on the else path.
> 
>      1439
>      1440         /*
>      1441          * For targets with a MMU500, activate the slice but don't program the
>      1442          * register.  The XBL will take care of that.
>      1443          */
>      1444         if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
>      1445                 if (!a6xx_gpu->have_mmu500) {
>      1446                         u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
>      1447
>      1448                         gpuhtw_scid &= 0x1f;
>      1449                         cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
>      1450                 }
>      1451         }
>      1452
>      1453         if (!cntl1_regval)
>      1454                 return;
>      1455
>      1456         /*
>      1457          * Program the slice IDs for the various GPU blocks and GPU MMU
>      1458          * pagetables
>      1459          */
>      1460         if (!a6xx_gpu->have_mmu500) {
>      1461                 a6xx_llc_write(a6xx_gpu,
>      1462                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
>      1463
>      1464                 /*
>      1465                  * Program cacheability overrides to not allocate cache
>      1466                  * lines on a write miss
>      1467                  */
>      1468                 a6xx_llc_rmw(a6xx_gpu,
>      1469                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
>      1470                 return;
>      1471         }
>      1472
>      1473         gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
>      1474
>      1475         /* On A660, the SCID programming for UCHE traffic is done in
>      1476          * A6XX_GBIF_SCACHE_CNTL0[14:10]
>      1477          */
>      1478         if (adreno_is_a660_family(adreno_gpu))
>      1479                 gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
> --> 1480                         (1 << 8), (gpu_scid << 10) | (1 << 8));
>                                              ^^^^^^^^^^^^^^
> Used here.
> 
>      1481 }
> 
> regards,
> dan carpenter
> 

Thanks, Dan. I will fix this in the stack I share.

-Akhil.
