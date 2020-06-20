Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BAF20232D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 12:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgFTK0q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 06:26:46 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:6296 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727861AbgFTK0o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 06:26:44 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9CEED5468307C131E412;
        Sat, 20 Jun 2020 18:26:41 +0800 (CST)
Received: from [10.173.222.27] (10.173.222.27) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Sat, 20 Jun 2020 18:26:31 +0800
Subject: Re: [PATCH] drm/msm/dpu: Fix usage of ERR_PTR()
To:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <jsanka@codeaurora.org>,
        <wanghaibin.wang@huawei.com>
References: <20200528130816.1670-1-yuzenghui@huawei.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <f1357380-9e98-4c1e-c1bf-a0a95bb5910d@huawei.com>
Date:   Sat, 20 Jun 2020 18:26:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200528130816.1670-1-yuzenghui@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ping for this obvious fix...

On 2020/5/28 21:08, Zenghui Yu wrote:
> ERR_PTR() is used in the kernel to encode an usual *negative* errno code
> into a pointer.  Passing a positive value (ENOMEM) to it will break the
> following IS_ERR() check.
> 
> Though memory allocation is unlikely to fail, it's still worth fixing.
> And grepping shows that this is the only misuse of ERR_PTR() in kernel.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a1b79ee2bd9d..a2f6b688a976 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2173,7 +2173,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   
>   	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
>   	if (!dpu_enc)
> -		return ERR_PTR(ENOMEM);
> +		return ERR_PTR(-ENOMEM);
>   
>   	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>   			drm_enc_mode, NULL);
> 
