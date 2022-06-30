Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECA1561EB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 17:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbiF3PEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 11:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbiF3PEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 11:04:48 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DAD26AD3;
        Thu, 30 Jun 2022 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656601487; x=1688137487;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3MzqRyg09BTwl/Y0H0sDfUbDlK1r0bSm44NNmhCEeZ4=;
  b=LMbPC7Yk/5mcZnYndRF2RBXhwpfBvt5Rj2GraX86tMzY8WrH9e8DeNfz
   14FZL3oLt7ZTMoBBplTJ4J6CdXIXDMcM6LNiAsuQvTiTv2Gg7iV2vYdDr
   rznnCSCWiB/v0gbOo4GrC6fIFFOvDvUDOCrPJlfLnCcwnf3nX01T7aD+3
   E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Jun 2022 08:04:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 08:04:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 08:04:46 -0700
Received: from [10.216.41.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 08:04:40 -0700
Message-ID: <5dbedabf-2232-f84f-0622-833c9793fee3@quicinc.com>
Date:   Thu, 30 Jun 2022 20:34:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v3 3/4] drm/msm/a6xx: Add speedbin support for
 A619 GPU
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
CC:     <freedreno@lists.freedesktop.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        <linux-arm-msm@vger.kernel.org>,
        "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
        <jamipkettunen@somainline.org>,
        "Jordan Crouse" <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@gmail.com>, <martin.botka@somainline.org>,
        <dri-devel@lists.freedesktop.org>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        <angelogioacchino.delregno@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
        <linux-kernel@vger.kernel.org>
References: <20220528160353.157870-1-konrad.dybcio@somainline.org>
 <20220528160353.157870-3-konrad.dybcio@somainline.org>
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220528160353.157870-3-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/28/2022 9:33 PM, Konrad Dybcio wrote:
> There are various SKUs of A619, ranging from 565 MHz to 850 MHz, depending
> on the bin. Add support for distinguishing them, so that proper frequency
> ranges can be applied, depending on the HW.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 331cd2f6b9e3..a2a30a9ab677 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1836,6 +1836,22 @@ static u32 a618_get_speed_bin(u32 fuse)
>   	return UINT_MAX;
>   }
>   
> +static u32 a619_get_speed_bin(u32 fuse)
> +{
> +	if (fuse == 0)
> +		return 0;
> +	else if (fuse == 120)
> +		return 4;
> +	else if (fuse == 138)
> +		return 3;
> +	else if (fuse == 169)
> +		return 2;
> +	else if (fuse == 180)
> +		return 1;
> +
> +	return UINT_MAX;
> +}
> +
>   static u32 adreno_7c3_get_speed_bin(u32 fuse)
>   {
>   	if (fuse == 0)
> @@ -1855,6 +1871,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>   	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
>   		val = a618_get_speed_bin(fuse);
>   
> +	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
> +		val = a619_get_speed_bin(fuse);
> +
>   	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
>   		val = adreno_7c3_get_speed_bin(fuse);
>   

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil

