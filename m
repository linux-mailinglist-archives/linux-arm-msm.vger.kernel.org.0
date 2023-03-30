Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 330BB6D05CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 15:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjC3NDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbjC3NCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 09:02:50 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0672AA5FC
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:02:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h25so24401639lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680181366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RogR8ZtUdYcPzRFUIOedkEYrZnCY91rWR6PUijMp9w=;
        b=Wj5qVClm841JfzOvn+lHpe+yD29RVv/Bbo4uyLJMWDUvTgwYgKGeFAqhFGWs9LK/4/
         Yl3KmG1ywQbTxaWiOyWtQaGy6HoDTwGqJbGlWPGGy7DTDwHtCObA5W5TlmfVUY1wuzFH
         PImdar5kbb2hLkf7LlHrPSuwJ/wPlaJtsisQgrv4/ZrCLHz0Y4oHjHnSPKxHKE4QoNDs
         iUm9W0gSPJOzIQbdRPE4bpp1bXUCcS8JY67uNEYm+Je4dKMSkItyMUhgrVyQ0wEXZvQO
         qP7vF+s/mdZS4PLzwF4fxl3+B2j2OIIptwnhYKjsKVvsZyzC85R7RyzphPtK9orp2JjD
         vujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680181366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RogR8ZtUdYcPzRFUIOedkEYrZnCY91rWR6PUijMp9w=;
        b=LumYbZRk+sN7EAtGszCoHh2GVXaZTysaV0d6eWG2TNCCpVj6YsciR/xDSltozCrRlA
         9/EOzOBaWgM4tvXirB0d6BJZEsY/KYhs64H2Qqrl/R8qJFMqdgzn26Y9rHSUqxctORrC
         OxVwvI1hvLC1gubK2M+K0PWHkLxW7aqwvurZF5OGOuYMmkGd86qBm831BPtL5/04bz5+
         SsK99pNCqP/t9/IAQQVzWHWcwctrOwcDeAWLd14CdlICoqLagrh6ploC1AYUNl3uY+HX
         NusJiOhbNsHbXm+TfQItsaWwbYZjSpWfaFfY19ZFT07JvHIsE6ta39rbTAaaiPQIm/Dt
         dBzQ==
X-Gm-Message-State: AAQBX9eO8+PShyk6sUJKUC+9Z2Wg5St5wy51SyTw7SuBmIrysC2dN5du
        sMY3Lf0ja4PoL9Nhe6mXWlSGDg==
X-Google-Smtp-Source: AKy350ZE66LJBidcIElElvytvyzs2f2PP7ea9oW2Wa2PSznpmDFh+tOxxGD3LeOAnHozCixEeTt3ag==
X-Received: by 2002:ac2:5288:0:b0:4eb:2d47:602 with SMTP id q8-20020ac25288000000b004eb2d470602mr269159lfm.59.1680181366173;
        Thu, 30 Mar 2023 06:02:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id d20-20020ac244d4000000b004e9aabe94a3sm5063026lfm.151.2023.03.30.06.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:02:45 -0700 (PDT)
Message-ID: <ca0ccc96-09e8-9d6a-0317-df8c192f6fab@linaro.org>
Date:   Thu, 30 Mar 2023 15:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,44/50] drm/msm/dpu: drop unused macros from hw catalog
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-45-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-45-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Drop the version comparison macros from dpu_hw_catalog.h, they are
> unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 5355a6c5aaac..8490e5e58469 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -23,14 +23,6 @@
>  		((MINOR & 0xFFF) << 16)  |\
>  		(STEP & 0xFFFF))
>  
> -#define DPU_HW_MAJOR(rev)		((rev) >> 28)
> -#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
> -#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
> -#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
> -
> -#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
> -	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
> -
>  #define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
>  #define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
>  #define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
> @@ -52,14 +44,6 @@
>  #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
>  #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
>  
> -#define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
> -#define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
> -#define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
> -#define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
> -#define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
> -#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
> -#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
> -
>  #define DPU_HW_BLK_NAME_LEN	16
>  
>  #define MAX_IMG_WIDTH 0x3fff
