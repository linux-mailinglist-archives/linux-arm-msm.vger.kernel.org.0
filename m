Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C923D7445AB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jul 2023 02:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjGAAo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 20:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjGAAoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 20:44:55 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09373C3F
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 17:44:53 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bff27026cb0so2421350276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 17:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688172293; x=1690764293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb4XLbAa6FHa6f/bZHMtFsSM9z+lq4odMd6vK4N6U0A=;
        b=HDDOAVVxZmS9WBogOomJ5KhF8WCVKZYzgS9XGBT2dQOaIuUgD99wuLx12AAMrGrtX5
         CidFk3nKSiYbOOsDoQx3IqW2Ozwk9XWwrjDieUdobowWMzeA7xNVlbvV9/OFVbKJgerR
         aBUAskHi397/8ji2BnJ2A6Og6EF7DNNA2Ci7HbDj/GAXC3GloWQC4XXzqqg+RCSR+QNj
         v2kqQJIkTbESJnODAF5p9AnbtStKLO2V22a/AYwl/RmPpBJ5zNrQpFu2A5h/ZXk3Gxdx
         PfMB/YRwJk6RK+CLb4CQ6Ne34XRqVMOUi/viER6K9lKi+xzvO25xdsbtkI5Ef4VsGBQN
         QnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688172293; x=1690764293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rb4XLbAa6FHa6f/bZHMtFsSM9z+lq4odMd6vK4N6U0A=;
        b=Iwe3WZhWJQJH/msc1cCVdPRPL6euAU6BKLCtYlq38R+4s8iJNO00dalkG3biW9rn35
         x4QJ20HXyigSC1nQgzSE/VsSPwE+sEd47+UtFU/NoAzrH0LOVZdgiKDwV/AKFPfiulZi
         LfywbcwHyMo+TNLnDSyvlq22oMv04Rv5qxWTuRmJufGsKVc6eo2SrLT2J2cvd6w3F4R6
         McbvDhDJwto2jaiNWgPoKV4EXrtsqs6sCIxlR9BHZ0r+l8Qr4MuH7KFhtWsFnEO9Z+Ws
         jwx1WmdzxiIvZ3tHjnUfI0UaYmy3L7XBeUB49aLOqjoQDZg2Tkg04irA7lmYDkPQ+UDf
         emOQ==
X-Gm-Message-State: ABy/qLaSR6lHnMMxDiEWfDy+nTJaSWoaTiwnE1WNwbaqCcoBaK5NlmO8
        +2W5OpikwXBQd0iB6ySlqu9l5xPwGK2ALm7DQBu0xA==
X-Google-Smtp-Source: APBJJlEL+WwVjxtvdk5GmlBVWtrIkQtRgNljiIk574SW1j79w6jqxyJYHfbUxzZsbWxrQV7bdXvEgAqaCpDsU8DP4VI=
X-Received: by 2002:a25:2449:0:b0:c28:bcc1:4834 with SMTP id
 k70-20020a252449000000b00c28bcc14834mr3301600ybk.30.1688172293164; Fri, 30
 Jun 2023 17:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
In-Reply-To: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 1 Jul 2023 03:44:41 +0300
Message-ID: <CAA8EJprYvLXaGmpYaSBt9eW5H1Ec_BKeCLW1qp1FvvR1LpDf6g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Assign revn to A635
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Jul 2023 at 02:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn is
> 0 by design (such as for A635). Fill it in as a stopgap solution for
> -fixes.
>
> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

As the v1:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Changes in v2:
> - add fixes
> - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e09c08fb@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index cb94cfd137a8..8ea7eae9fc52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
>                 .address_space_size = SZ_16G,
>         }, {
>                 .rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +               .revn = 635,
>                 .fw = {
>                         [ADRENO_FW_SQE] = "a660_sqe.fw",
>                         [ADRENO_FW_GMU] = "a660_gmu.bin",
>
> ---
> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> change-id: 20230628-topic-a635-1b3c2c987417
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>


-- 
With best wishes
Dmitry
