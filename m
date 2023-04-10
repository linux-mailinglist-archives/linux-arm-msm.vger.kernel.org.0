Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F606DCB7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 21:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjDJTZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 15:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDJTZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 15:25:23 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2690419B1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 12:25:22 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id n22so4473123ljq.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681154720;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMLZlLsk1ZmBuhpTjnkgtNlwoW9RY3W1zOG3l2TynA0=;
        b=NQsdCq7Vc3vBXOHSG2Gd4Ecu1AFWfemrladBsEVaJFxDiRyS3vD4YPE2ayQkKhGyVi
         4LytdPMMCdaA5hUJf1o+Axu0RaD1HLuWqSgIWCdAMMCGbSv8uLe2421ZjgDk+S58uBAH
         rwPGIdjovXJz0qjgfN0zr7Psrt5S8NwG+M6Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154720;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMLZlLsk1ZmBuhpTjnkgtNlwoW9RY3W1zOG3l2TynA0=;
        b=lZtu4WjLHFEi+X8THjBGtWonRHDdOdSckW0cQbTka7iyN5qFyhGORua8yoqPAlMRx7
         jiRmJ3D9ZvGa51IcSka5rhW7WNBN4cS1mYhKGqBH59naid0h64rhdS18Tvdhw6AAvqhj
         h7vsX4SW8zW55anty42rTWWBz4pn63JMXlg+KFegS9DtSth2KEBT1zjhPWwSVYL4hhaS
         9/D0N8OWhRQrboUOiSBh7VnojGKI04kn7ndDbaqHR7be/6fTru6kEG/qwCM1PyFvhbmR
         4aQmS5Q83DxIpcdIdJi6MZ9TFRYkJh1SfMsGz5Gb8Hwv7bL7I+HeNJT4rquiV1cSlUA4
         CBiQ==
X-Gm-Message-State: AAQBX9dDaBdQeokDd76Z3rsINGYEWrxXluURdFq2JIJXBRyQHHNLD1eo
        iHPs/jnOZJV6M4x8nlqF/vU1s77OQBChdtPa5XJCi5S/7kD+DDP2
X-Google-Smtp-Source: AKy350aM7EnTjHmbJKpnZSSwSWV8UNF3S78abKV89jAc10QXM95eqRFSxU6PMpjTGWeMKs4+jQ5mVRRL9wTvlBjw5Tg=
X-Received: by 2002:a2e:a9a6:0:b0:2a7:6f6a:baf with SMTP id
 x38-20020a2ea9a6000000b002a76f6a0bafmr2522173ljq.0.1681154720194; Mon, 10 Apr
 2023 12:25:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Apr 2023 12:25:19 -0700
MIME-Version: 1.0
In-Reply-To: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
References: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 10 Apr 2023 12:25:19 -0700
Message-ID: <CAE-0n52St9X1EA=PUKYFM22Er3+o_2aYC8eAskHr4KtMoQVQsA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix sparse warnings in a6xx code
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-04-06 18:07:41)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 0bc3eb443fec..84d345af126f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -51,8 +51,8 @@ struct a6xx_gmu {
>
>         struct msm_gem_address_space *aspace;
>
> -       void * __iomem mmio;
> -       void * __iomem rscc;
> +       void __iomem * mmio;
> +       void __iomem * rscc;

Should stick that * to the member name.

	void __iomem *rscc;

with that

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
