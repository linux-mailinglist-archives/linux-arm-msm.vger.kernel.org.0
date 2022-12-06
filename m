Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18E364482D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 16:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbiLFPkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 10:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233317AbiLFPku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 10:40:50 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B22639F
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 07:40:49 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id n21so7116262ejb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VQDzBqsBTE8WLwYAzMMGHQmUn+CuZZVkF9Y36XFfYec=;
        b=kLrPEpykbsLXwkED/QlJ1FLFFvX9oUCpMJKPH4x0GiU8byIpo6HmWG9Xl4xlk8maqA
         aKCRmP7kd8Dz9IRbEOKS5YbYuuxkhhJl9Q5sjHr0iuB9l2Et/XZi1FDpz4I54nt6Dtg4
         Xp+7QF9vE9mokQorQF9Rn7+Mt/gaqnt96+GEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQDzBqsBTE8WLwYAzMMGHQmUn+CuZZVkF9Y36XFfYec=;
        b=pkj3z+QGsoaFB48/42xhcBmGHcuP3VyBG1YnXJyrQWDtEjVtQUq/fbb6rAr6Pnc+oW
         zQa9rWUjWzPNz7y9P1oIQNO7EF9sWVamoAgVjdq4EpQKcSYKImAPkwn3DgqQKOf+KJQS
         qHBzrkLA4zGaj2JF8Q4t1OC/ww3xKBt1tjlUDkex4biQSycqPWClElBe2iMfbdK/vfaC
         Cus4EyMuK7QS09mX98EIUo+qj4MSS/txvPBlDjaly7UvNvV2NIJvwBtaw3qdU5t1dsYA
         6GMdQN0eqeoZSltdeawXEqEdgA8ASYreMbyNB+VqmQejV27s5Kq31gNpJmZ5popHHMJ0
         W3Ig==
X-Gm-Message-State: ANoB5pljl5LN4f3n+iQdoEvtbZUsdLnhX0Fp/EzCtBsJmhm+he+IT6dD
        vJE3PcGNaTIYS5v02TWAEjEgFs3FwV7K7uJuJ74=
X-Google-Smtp-Source: AA0mqf4p2aJHwC1sEdRTFF2PBhMtQ63V/o8w/I+8GekYsFMAD6EgG5B6+LdLv+nn1Rg7r2iekOWs3A==
X-Received: by 2002:a17:907:6a98:b0:7ae:39b4:7202 with SMTP id ri24-20020a1709076a9800b007ae39b47202mr225613ejc.6.1670341248078;
        Tue, 06 Dec 2022 07:40:48 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id gg19-20020a170906e29300b007c0f5d6f754sm2480791ejb.79.2022.12.06.07.40.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 07:40:46 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so1093624wmh.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 07:40:45 -0800 (PST)
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
 bg14-20020a05600c3c8e00b003d069f4d3d0mr23096034wmb.93.1670341245678; Tue, 06
 Dec 2022 07:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20221206075512.812389-1-linmq006@gmail.com>
In-Reply-To: <20221206075512.812389-1-linmq006@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Dec 2022 07:40:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XXoue_vkuM7TmxnECfT3-p9d-OH=H_dyeoOk_Kp4kK2w@mail.gmail.com>
Message-ID: <CAD=FV=XXoue_vkuM7TmxnECfT3-p9d-OH=H_dyeoOk_Kp4kK2w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix memory leak in msm_mdss_parse_data_bus_icc_path
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 5, 2022 at 11:55 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_icc_get() alloc resources for path1, we should release it when not
> need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
> Add icc_put(path1) in the error path to fix this.
>
> Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index e13c5c12b775..a38fa9a9a3d6 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -49,8 +49,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>         struct icc_path *path0 = of_icc_get(dev, "mdp0-mem");
>         struct icc_path *path1 = of_icc_get(dev, "mdp1-mem");
>
> -       if (IS_ERR_OR_NULL(path0))
> +       if (IS_ERR_OR_NULL(path0)) {
> +               icc_put(path1);
>                 return PTR_ERR_OR_ZERO(path0);
> +       }
>
>         msm_mdss->path[0] = path0;
>         msm_mdss->num_paths = 1;

Hmmm. I guess the original author of the code (which wasn't me--I just
restored the code that was deleted by a previous change) was assuming
that if mdp0-mem had a problem that mdp1-mem would also have a
problem. That would mean that you wouldn't need to call icc_put() on
it.

...and, in fact, your patch doesn't handle that case, does it? If
_both_ of the two are error or NULL then you'll be calling icc_put()
on something invalid. I guess icc_put() handles those cases without
crashing but it will give a WARN_ON() splat if it happens to be an
error...

Really, there's a better solution anyway. Instead, you should do:

path0 = of_icc_get(dev, "mdp0-mem");
if (IS_ERR_OR_NULL(path0))
  return PTR_ERR_OR_ZERO(path0);

msm_mdss->path[0] = path0;
msm_mdss->num_paths = 1;

path1 = of_icc_get(dev, "mdp1-mem");
if (!IS_ERR_OR_NULL(path1)) {
 ...
}

In other words just defer getting path1 until after you've checked
path0 for an error.

-Doug
