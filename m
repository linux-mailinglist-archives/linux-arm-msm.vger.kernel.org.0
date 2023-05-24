Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFAA70F6AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 14:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbjEXMkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 08:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbjEXMkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 08:40:13 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFB0135
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 05:40:12 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d3fbb8c1cso883884b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684932012; x=1687524012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pAICOAZEYoF1OGimsbond0ssy6jgdLXoNKu17c1NoEc=;
        b=lTxyiuW0gLBBlcU4qmcwsM+I+d/g8+KFnHiX/wCsZWTANny8fP8yMnSsJCMNIv12GF
         cRiezTtq5AHJLbGpoo2aQWwNFGsqXI4s79dcCb1mI1ORJjz1XjHVBCEeS8LzYCrXOe++
         dKdg4f+JoPvCsylxkcE54uDuwgqJMv1zpY/HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684932012; x=1687524012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAICOAZEYoF1OGimsbond0ssy6jgdLXoNKu17c1NoEc=;
        b=VDpZuazLqDfSM53qgZTdpxwU8pPeqOwKOyruNAWm2Vc+jrZoCMyH82xOwXjHvBQ4Jx
         PpwW5dJuurhraWuLyZjxpOnWpa762wbDxco801KI4XQFts6dpCbIfq3n7vQ9SiIgZBr6
         mWOGR+a4p7L69Pv2oTUiZRXhyiY99Senh4ojYOqnTN+rIKO15oIe+SQaofdCr7QU8TtA
         y862K92maoQvzVBMUg9k+hKVlh6xU9pQ0U26I0hhnT8ynloiNm//gkCGqgFyKUs3ihBa
         VneyJMUTJkfXPsIOTR6wJeRMwzsa+ZeEneG3v/w9Yaa5f4YEIExTxxccMMh5jbtu6zOR
         oH3A==
X-Gm-Message-State: AC+VfDwIoQuZ+0NHXaSaOGoalagUmMGlR7n7ZwfIBAmPX4zKa/MU2NjY
        i38Jf6GTvKovyawB8k/N1lBoEg==
X-Google-Smtp-Source: ACHHUZ6uv1bkmZJ8LT4YhMG1Xk4RvMoWtOrdpYDPKJVhU3Sqbvnsu/TpuVYGjHEtn1sWPlXdePesbQ==
X-Received: by 2002:a05:6a00:1a15:b0:64d:f5a:3fd2 with SMTP id g21-20020a056a001a1500b0064d0f5a3fd2mr2716289pfv.28.1684932012198;
        Wed, 24 May 2023 05:40:12 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id c15-20020a62e80f000000b0063b8ddf77f7sm7295020pfi.211.2023.05.24.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 05:40:11 -0700 (PDT)
Date:   Wed, 24 May 2023 21:40:07 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: venus: provide video device lock
Message-ID: <20230524124007.GA30543@google.com>
References: <20230524013732.2503561-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524013732.2503561-1-senozhatsky@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On (23/05/24 10:36), Sergey Senozhatsky wrote:
> Video device has to provide ->lock so that __video_do_ioctl()
> can serialize IOCTL calls.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 1 +
>  drivers/media/platform/qcom/venus/venc.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 51a53bf82bd3..90b359074c35 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1767,6 +1767,7 @@ static int vdec_probe(struct platform_device *pdev)
>  	vdev->vfl_dir = VFL_DIR_M2M;
>  	vdev->v4l2_dev = &core->v4l2_dev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->lock = &core->lock;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4666f42feea3..e6b63ff5bc0e 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1565,6 +1565,7 @@ static int venc_probe(struct platform_device *pdev)
>  	vdev->vfl_dir = VFL_DIR_M2M;
>  	vdev->v4l2_dev = &core->v4l2_dev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	vdev->lock = &core->lock;

Or should it use a dedicated mutex to serialize video_do_ioctl()?
