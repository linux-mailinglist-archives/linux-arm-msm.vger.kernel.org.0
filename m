Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101703B5B83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 11:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbhF1Jov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 05:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhF1Jov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 05:44:51 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93465C061766
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 02:42:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 26EF63E883;
        Mon, 28 Jun 2021 11:42:20 +0200 (CEST)
Subject: Re: [PATCH v1] drm/msm/dpu: Fix sm8250_mdp register length
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jonathan@marek.ca, dmitry.baryshkov@linaro.org,
        lee.jones@linaro.org, kalyan_t@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210628085033.9905-1-robert.foss@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <2bfd62c3-b0fb-7c86-0e79-a2d87b7daa77@somainline.org>
Date:   Mon, 28 Jun 2021 11:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210628085033.9905-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 28/06/21 10:50, Robert Foss ha scritto:
> The downstream dts lists this value as 0x494, and not
> 0x45c.
> 
> Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 189f3533525c..5d30c7f33930 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -244,7 +244,7 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>   static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x45C,
> +	.base = 0x0, .len = 0x494,
>   	.features = 0,
>   	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> 


OK on Xperia 5 II (SM8250)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

