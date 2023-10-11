Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4EDB7C5445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 14:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbjJKMqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 08:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbjJKMql (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 08:46:41 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5FBB7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 05:46:40 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d849df4f1ffso7150109276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697028399; x=1697633199; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dW3F0jw6hSYsieT6t+VsgmR8dZ8/32cVIfl7zOoZNLc=;
        b=qhi8mix547qoXELVrKlDLfC5LFVB9vxyFkquYgAQDuzaa+NxgpEn3fCnHb8Fx1JX8G
         hNin9MCfg4G0XzLkfkWsoJ8hUI0JoRuQMdIIg7WL1t1MDx9TAbFaKtUaT2yS779dQYRh
         gqGgRuBxSoCVtFJd+8e5zjtai1lUnB+HP0It46L1HbsK2jg4vTx0foU81rjpt+EdW52G
         4i3LODRmflXfAHnHYFii0iRLCG7Xbs1bqftil6ic5KhWj2qL44u/TAPZBUp2rAgPrPRm
         S0Nf51fmln64NcadRIQXXk4x4TRO86/eczOzOhy5pIBT9D0ZkdgTRFKRw6x8KOv2tH7p
         MH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697028399; x=1697633199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dW3F0jw6hSYsieT6t+VsgmR8dZ8/32cVIfl7zOoZNLc=;
        b=Hwjh4ot05UqUQb0dRg7hT8/fkPzqlNZZwy2Ig5dwxV29qzH5Q8fu4ZNqFX2QjfYT1l
         YdjBoC6LcE+GZKfdoOpuSHMrsGQfFCnDZ98ONYsRShA4y2+VUA0O87Dcqm405FjkxIKa
         S3HxZgPCMYmjY2j5CP01lfZF/ywpnhRX3X7Yk9g7+w1TrjTMtqDDymEf8qP3YmYI52J9
         r8z09AHRY6VsLrYwVOLivQ7qKtf1ZyFVl03zWBUzjZFhBvUcA02PhWZlwU09tjC/ibg6
         2NPieLvlVVxd5X2L6M5MtUByiaJHtovneNU2lE5OdGM0xf0+Rkpiief+NX/NDSRzm9wY
         uWtA==
X-Gm-Message-State: AOJu0Yyn4/Gb2NdtS9gGc+mFge/66C3ycszkqHnyhstwph70VKxZcvbT
        +pk6D3A4vBV7GLRAiBayMNuQ6kPeLuvD2xcWubnF3w==
X-Google-Smtp-Source: AGHT+IEXxUHgahb5Rv9YlVarko7XshACSDpKCpE2aXKyLar9E29Gzcw5Kx2vRU/DIhKX6Un2J5Ca5vqy10fCukWUVV4=
X-Received: by 2002:a25:3d81:0:b0:d9a:52ee:6080 with SMTP id
 k123-20020a253d81000000b00d9a52ee6080mr5293824yba.37.1697028399177; Wed, 11
 Oct 2023 05:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 Oct 2023 15:46:28 +0300
Message-ID: <CAA8EJpoGXEFisVAde3whLAC8Tt1EL1DqOsi-kfbzMU+MtbK4Vg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: enable writeback on SM8550
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Enable WB2 hardware block, enabling writeback support on this platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 4590a01c1252..d83a68a2cc0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -321,6 +321,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
>         },
>  };
>
> +static const struct dpu_wb_cfg sm8550_wb[] = {
> +       {
> +               .name = "wb_2", .id = WB_2,
> +               .base = 0x65000, .len = 0x2c8,
> +               .features = WB_SM8250_MASK,
> +               .format_list = wb2_formats,
> +               .num_formats = ARRAY_SIZE(wb2_formats),
> +               .xin_id = 6,
> +               .vbif_idx = VBIF_RT,
> +               .maxlinewidth = 4096,
> +               .intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +       },
> +};
> +
>  static const struct dpu_intf_cfg sm8550_intf[] = {
>         {
>                 .name = "intf_0", .id = INTF_0,
> @@ -418,6 +432,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>         .dsc = sm8550_dsc,
>         .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>         .merge_3d = sm8550_merge_3d,
> +       .wb_count = ARRAY_SIZE(sm8550_wb),
> +       .wb = sm8550_wb,
>         .intf_count = ARRAY_SIZE(sm8550_intf),
>         .intf = sm8550_intf,
>         .vbif_count = ARRAY_SIZE(sm8550_vbif),
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
