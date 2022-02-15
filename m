Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9412F4B77E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiBOQqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 11:46:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiBOQq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 11:46:29 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0F61019EA
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644943579; x=1676479579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YMyJIc2B7Ri2sZ8bucdp08+gCVrS5NBg0UZ2pv7ST9k=;
  b=aieIi8F75JnVnFlp75q3dmZODx0ncA3l5oZoK5nfbNi/mn6EkOkKQTn6
   ebAxBCoZgtPshqZlxX6M3gyKy6RopGOj1pR2T0ZnURRuLfxmHhLGXFU7p
   L7I8OQGeHmBOlSjAFJ3NVVQGga2hBt1SjwdMfOdeCbFD31kxamOwXfAE2
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Feb 2022 08:46:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 08:46:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 08:46:18 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 08:46:16 -0800
Message-ID: <8997c7e3-90b2-4ab7-7a69-782175f1eb3c@quicinc.com>
Date:   Tue, 15 Feb 2022 08:46:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3] drm/msm/dpu: Only create debugfs for PRIMARY minor
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SCC_BODY_URI_ONLY,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2022 4:38 PM, Dmitry Baryshkov wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> of the files created are unrelated to the minor, so there's no reason to
> present them per minor.
> The exception to this is the DisplayPort code, which ends up invoking
> dp_debug_get() for each minor, each time associate the allocated object
> with dp->debug.
> 
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
> 
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create debugfs files for the PRIMARY
> minor.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [DB: slightly change description and in-patch comment]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> This is a replacement for
> https://patchwork.freedesktop.org/patch/467273/ with the patch
> subject and comment being fixed.
> ---
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5f0dc44119c9..c394bd6b2e5d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -271,6 +271,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>   	if (!p)
>   		return -EINVAL;
>   
> +	/* Only create a set of debugfs for the primary node, ignore render nodes */
> +	if (minor->type != DRM_MINOR_PRIMARY)
> +		return 0;
> +
>   	dev = dpu_kms->dev;
>   	priv = dev->dev_private;
>   
