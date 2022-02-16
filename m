Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA034B7D5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343584AbiBPCNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:13:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343577AbiBPCNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:13:32 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5335D27FEB
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:13:21 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id o25so550031qkj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=633/kcGFp+Bu8soejxxfIa5w0BAskL4NcDa75DnlBvg=;
        b=BEvAvpEadNVOU5zOf00p/LinV3MSMuiM6l0UehZ9p+CNJL8x7K6yQqJ/31uRU1Cdmq
         17WNOMoRi+hfJxPakD9yzDPTugdFwTe1V1LOyDgdzLMse+0kDW029LqlSscEmx+64zVo
         B9kakBW/1KCZjyrmSR1opd3USKqpyHCiwbFFqtyq4YZJF8WIGqsXWjr7P+OoFd/Uq/o1
         fbP/lLuPSDxsOybncInpkMIq5KGdIPRV9sxACT2IC9/8Mz1Dy7xQMlTGNVzuov+uQfC3
         CcHGD25AiunUjezvz19Wzv6RbF9pW9s2+PyCIe9GUuXYgPJ1hHx6qV4rkGo/HwZV9rTs
         lTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=633/kcGFp+Bu8soejxxfIa5w0BAskL4NcDa75DnlBvg=;
        b=td58F0HgXArwPu22vrRbJcLicNwmRHDDV+b3dtae3xa5pcTtGdgjROCOL9uZiOFo8g
         Rb/nP/E29/MA4/3MQzwYVqanM4k3n3OA9yk6gPOMlmpfyY8V7oC7e2zO9lYTys830700
         3gEThOeMwHsDWGzuql4v+mdL6u0+pu6+hU13lFn3/SwXqR35woOdpONAQDdsJ+wzKD50
         dHQDgyUe2yykN2qPY0S1by2ohqtf6ttmNN+9DqA+SW79GFtr+W48fntBPV9gZa9uQonV
         z45QvvNQiiWYvMG+0XOHMOCKRB0jka0CuJKLfBGM6GEDxewP4wLD//Tn0MFxF20Y+lg5
         4Gmg==
X-Gm-Message-State: AOAM5313QrPLmf1q2GPF0KwtyhJIq4pUBXPLk8DoY0gNV7DJku+7XiZP
        8eyXOhVFETESsAOGkeMiv//3e3xGHr8Omw9hxyVZ5Q==
X-Google-Smtp-Source: ABdhPJyqPMY2nDAAkDpO1ed3x3bQ7KaH2mUKTwigY6Tx+GyBLn0C1HYHEfNIVOQinK3Hzemaf3EI3DW3XKw4M4VSrow=
X-Received: by 2002:ae9:c10e:0:b0:474:c146:32a7 with SMTP id
 z14-20020ae9c10e000000b00474c14632a7mr353330qki.203.1644977600496; Tue, 15
 Feb 2022 18:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org> <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
In-Reply-To: <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 16 Feb 2022 05:13:09 +0300
Message-ID: <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: pull connector from dpu_encoder_phys
 to dpu_encoder_virt
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Feb 2022 at 05:00, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> > All physical encoders used by virtual encoder share the same connector,
> > so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> > structure.
>
> What is the benefit? Less code? Clearer association?

Clearer association. Otherwise code suggests that different phys_encs
can have different connectors.

-- 
With best wishes
Dmitry
