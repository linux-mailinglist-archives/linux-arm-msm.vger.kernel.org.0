Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350FF7945FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbjIFWLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244985AbjIFWLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:11:17 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A17B19BA
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:10:48 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-501eec0a373so412359e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694038247; x=1694643047; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2RJtIMUEMWFxmJWunhcUa/1GRq7hoPYxgh6yyU5r/o=;
        b=ISXM8GYx47z8115Y4iRPxhJ7nijiOcWVc0+XAPDdaskmXmMzsuuDc9DyD/rjMbp9Xt
         G737ln+u+VF64nDyaR4m7yfZ1uCUeM15rvqmj0ERobVmVbBCuEZ01/FXGJS/4KLNv2BH
         VclwTJhrG+IdPVsPyY3gLsZk/K/tjPUVytfwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694038247; x=1694643047;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2RJtIMUEMWFxmJWunhcUa/1GRq7hoPYxgh6yyU5r/o=;
        b=esw1LgJa7p9E8p502Wn8F6O3eD9Srgd4Ykx1Yvh33MSBdin9ufprWwqlYzp38elN2d
         La4JwcEb6s74vaW2auNAb8grJ8CiOywz+DDtfk3sU/ypvz3M6DZ8a86gaeZA4vKZPnTs
         uiYcQSJzjbFcQAgPCueAvZyExutEyuGaxFK58f0YQL6eBFlLvHR4T2zVzPv/XKxUEMAw
         cpQaD0rDMZn5nnrVuONzl0yoEIxXCVuSMSNrK1GeQVcyXglSDwimQFNwqPJ8F9IDHonz
         LYv0TN74nhZugwpxm585OQ4Dn8pvc+9+bWwtRIlx+4HEGhuR8+U/geG2swGWEyF8cv8w
         XXqw==
X-Gm-Message-State: AOJu0Yy1EyTDqr/OJAn9uWsB9JoSz6TwwSgKEyxJg8nSUHoe1cWbttqx
        fuupf1XL/buqySNrJrLrgVHpBNfxZQ/+pn8C7Itkzg==
X-Google-Smtp-Source: AGHT+IEhFPHoBJJvRYU2Otqkh3EePWdgpFD4jKmeCPPu49LQ4eq8HhL67nV/BdLtwHbKx5NhXUhBn1TL6mDEaMKupOY=
X-Received: by 2002:a05:6512:3c8c:b0:500:7e70:ddf7 with SMTP id
 h12-20020a0565123c8c00b005007e70ddf7mr4466753lfv.52.1694038246629; Wed, 06
 Sep 2023 15:10:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:10:46 -0500
MIME-Version: 1.0
In-Reply-To: <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org> <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:10:45 -0500
Message-ID: <CAE-0n51oha3TmMHRX7pedDzO1iOxXhbYS9nT8rdamki0LyAbqQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm/mdss: generate MDSS data for MDP5 platforms
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-05 10:43:49)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 348c66b14683..fb6ee93b5abc 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>         }
>  }
>
> +static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)

const mdss?

> +{
> +       struct msm_mdss_data *data;
> +       u32 hw_rev;
> +
> +       data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return NULL;
> +
> +       hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;

Or like this

	hw_rev = upper_16_bits(readl_relaxed(...))

> +
> +       if (hw_rev == 0x1007 || /* msm8996 */
> +           hw_rev == 0x100e || /* msm8937 */
> +           hw_rev == 0x1010 || /* msm8953 */
> +           hw_rev == 0x3000 || /* msm8998 */
> +           hw_rev == 0x3002 || /* sdm660 */
> +           hw_rev == 0x3003) { /* sdm630 */

Can we have #defines for hw_revs and drop the comments?

> +               data->ubwc_dec_version = UBWC_1_0;
> +               data->ubwc_enc_version = UBWC_1_0;
> +       }
> +
> +       if (hw_rev == 0x1007 || /* msm8996 */
> +           hw_rev == 0x3000) /* msm8998 */

Then we don't have to worry about these two having typos.

> +               data->highest_bank_bit = 2;
> +       else
> +               data->highest_bank_bit = 1;
>
