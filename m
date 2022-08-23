Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21A559EE1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 23:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiHWVVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 17:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbiHWVVD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 17:21:03 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8116F260
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 14:20:59 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-11d08d7ece2so11651604fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=cE/HKSS1gcJ/bSLjCPtdvFIQrahyJdohXOdk9AJy+aE=;
        b=mdjPFrvRatkM6bSBrHyob39+vqOAM+OJ6yFbe7pKnEtneYvZ3AEyvA06mzPFI6C6xz
         b7wJf9XlaDnvGBReC4O4PjzPxfIqTp4enKLhhjyhON7LiW7T6rDerkr9nyN5k1uBDb7Y
         1V6kQ1zGUz+p+3DtkgHtsAB7vf+Cws/EsgFFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=cE/HKSS1gcJ/bSLjCPtdvFIQrahyJdohXOdk9AJy+aE=;
        b=Af3F57SiN1hO4ODzramAzfl3HSQnLWVMtGFcRJ9e6mZa5bxwbJluO4IaNQYnEmK6PH
         3FKOh9AF2+h0d/ABLmBgtrHGWHEuGvC8dnqveWYwnwhbcWQUaFG1rpUJdGpdpdAU8kwV
         VIKOnwVxF8GRb7z37xIr3eQAtPu4uy9mYUb9A4tNhsVav5zAZDJjALtOms2apHFEEOCf
         40vq3LOfvdnfIMVw6nkQV7CEaqfTvgVG1qjA3yYfbwPGf3YY9JcpNr6x964mZEQIBqaH
         9/gZk7bbLB/7jV4J9IVvfBVqV0DbpEQvH7uwUDmo8CQjy/Nh0/RudyCXE4o8CtOPKBun
         Nonw==
X-Gm-Message-State: ACgBeo2MJFvogVLiiuQrdZVz4Mm019ZPMgoZ1C7/WVelqGJMJ4YNlLWG
        l2lrJp9h6kqBYzZAtFMG+pybm7kkY1wfhj7YmpJ5Xg==
X-Google-Smtp-Source: AA6agR4QQoa2UfnPHO//dTdnEb86cOYZdqaGouJSF8NHaTF9PTibAwUV01BupM30k+6j+7cZ0tchO0CNdnY1ihMsSfc=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr2264277oab.0.1661289658829; Tue, 23
 Aug 2022 14:20:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 16:20:57 -0500
MIME-Version: 1.0
In-Reply-To: <c8a2f675-4d69-58f7-a603-5e810f0077fe@quicinc.com>
References: <20220823024356.783318-1-swboyd@chromium.org> <c8a2f675-4d69-58f7-a603-5e810f0077fe@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 23 Aug 2022 16:20:57 -0500
Message-ID: <CAE-0n50YsdeipC=shDnhyTbHaCctGEmZixLKzcb4DyOng5QhWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Silence inconsistent indent warning
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2022-08-23 10:47:02)
> link->request.test_lane_count;
> -       link->dp_link.link_params.rate = link->request.test_link_rate;
> +       link->dp_link.link_params.rate =
> +               drm_dp_bw_code_to_link_rate(link->request.test_link_rate);
>
>          return 0;
>
> Since we are fixing up this commit, can you please fix this too?
>

Sure.
