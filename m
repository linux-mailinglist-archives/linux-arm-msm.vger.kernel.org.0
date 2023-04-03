Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87D26D4C70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 17:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjDCPtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 11:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbjDCPtS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 11:49:18 -0400
X-Greylist: delayed 268 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 03 Apr 2023 08:48:47 PDT
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 77DAD3AB5
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 08:48:47 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:58956.1433956841
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 4815D1002AD;
        Mon,  3 Apr 2023 23:44:14 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-tj646 with ESMTP id 0bd8b32bccb94efd9aa438a66f4d4aaf for tzimmermann@suse.de;
        Mon, 03 Apr 2023 23:44:16 CST
X-Transaction-ID: 0bd8b32bccb94efd9aa438a66f4d4aaf
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <27f4182c-753e-9980-5199-a769f69330ec@189.cn>
Date:   Mon, 3 Apr 2023 23:44:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,1/8] drm/msm: Include <linux/io.h>
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
References: <20230403124538.8497-2-tzimmermann@suse.de>
Content-Language: en-US
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230403124538.8497-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Reviewed-by:  Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/4/3 20:45, Thomas Zimmermann wrote:
> Include <linux/io.h> to get the declaration of devm_ioremap() on
> sparc64. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303301856.zSmpwZjj-lkp@intel.com/
> ---
>   drivers/gpu/drm/msm/msm_io_utils.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index d02cd29ce829..59d2788c4510 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/interconnect.h>
> +#include <linux/io.h>
>   
>   #include "msm_drv.h"
>   
