Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A736E972E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 16:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjDTOdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 10:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbjDTOdV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 10:33:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740934EC8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 07:33:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4ec94eb6dcaso603275e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682001180; x=1684593180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxUBEBnff0FS5uWK1Xy6+WkZa1SWO0jyLNTiw6td0Tg=;
        b=c0fBL6gljKJg2U5xC8i5InaVYMXL+9/qFKvMeTL5sEdZlJ+5MsUMgQorTocD+ZZr7R
         nXPuc3kzONj+oEoOIARLORifiuZQIHlfg+jm+egwcilfOZAZDkVrRwOcEHSh9dpiTLYa
         hA+d9ho40Od86hBr23gyMCf++z/uwKSJM+2B2x061aV0DXHaTMsjSgmtf6lwNNwDlFDF
         OYpgiw+zoO8G3qVyXWHPzuC8b8mJgyiJade0OMfH2o9pc6A9CZ0RYPW6inK8vxZHMPBb
         BZxBhQsrIZt/1gCAGHYoYTiFXmrhwxhRGB3uJ7HWCHoBjOvh6WLTFOk8ZtSL3fYtkQGi
         pZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682001180; x=1684593180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxUBEBnff0FS5uWK1Xy6+WkZa1SWO0jyLNTiw6td0Tg=;
        b=jFi/ekJBGYEXR45pnv9fmI+h6NjdQAb0mz0pjMQ02EPb6wohBsCqXDiEqXwJyULZh6
         akp39uCluUqWPVAzpJJZrQGZV3A+Wn7+axQ2MCT8sAzaEed8Evayi6cVFLHgxK31azkj
         Ojwyw5NQSBayVR6XZEt1yXNos04J9dnF3kv/Bm3vZvc3qVdgaWhVdUi5Oi4hHmernXB1
         8h/JQ2HgjJ00InjXet7e8UWG8mNw41ZKmevl1ghN8vmioFfbGS5lHyq+aRlWzgaDMa8t
         coAjrYiN6CW+RJCI8ciD3exC08NVC2r8IiQ89iHbeAtzcGK6VVNj9WLRlYCpmgpOJbGE
         o/Dw==
X-Gm-Message-State: AAQBX9dzmAH0lMsL6831CuZ1tUov43EyQ2l1sAZ2pvmdAgnLoB0FvjPZ
        5NYWyuzbZPP+9qM1gCFZfsSSYw==
X-Google-Smtp-Source: AKy350bT9WLnfTYOgyXhMG2gNFX0pcaVYe702TIX25PW1dp9FSB/gs13aejCsz1XO5Ug3vfDx6VnwA==
X-Received: by 2002:ac2:4a8d:0:b0:4ee:d562:5752 with SMTP id l13-20020ac24a8d000000b004eed5625752mr521375lfp.27.1682001180631;
        Thu, 20 Apr 2023 07:33:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h12-20020ac25d6c000000b004db3900da02sm234026lft.73.2023.04.20.07.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 07:33:00 -0700 (PDT)
Message-ID: <2aad9be0-bda3-7992-de1c-69d90dc1ecc6@linaro.org>
Date:   Thu, 20 Apr 2023 17:32:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Assign missing writeback log_mask
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-2-b9897ceb6f3e@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v1-2-b9897ceb6f3e@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 02:14, Marijn Suijten wrote:
> The WB debug log mask ended up never being assigned, leading to writes
> to this block to never be logged even if the mask is enabled in
> dpu_hw_util_log_mask via sysfs.
> 
> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 1 +
>   1 file changed, 1 insertion(+)

With the mentioned commit message changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

