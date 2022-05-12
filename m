Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63BA75241B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 02:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiELAwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 20:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiELAw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 20:52:29 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82A660ABC
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 17:52:28 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso4929358fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 17:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=SO048bkaqtJpnNOMEvZB35O9DTWVZ1Wg9kxc4ycyFjg=;
        b=cOc/ULhNS4VZgkhofRchN39m+cfbPtZsxhK2XKYkfT2dFHetpaa89L2NTSPaoYADiZ
         DPkgapU/gqwvkkJPzoL3lwgAIpTKGEqV+rQOpuUTp5THjNE1vXdLfxej+k05z8TDHrKI
         eoPWGslKfu1cmud7L+fcfMsfQuuk2c64zlCnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=SO048bkaqtJpnNOMEvZB35O9DTWVZ1Wg9kxc4ycyFjg=;
        b=lZMtuqcRug+d0NJpNR8/CH+R4qGIb+PaemAjApLSTlk3BrnOrVQ5ONOI4x3+gzjTss
         84EKYgH7wPoM3cFQrOEcCzIPuUvrKgvBxr6aYQHZdUVpWyjOkEmHr44kbKG1izEtAtHO
         PYHB5nO0D0yL06xFPKd2z1SifwmdbMFaRvuwGKa27a4XrcTSQFGKANsNUBu7v2pZ/hZg
         9hDYEZiv2V5N/42RftAmDXmvtNoVhD80UhAt0VkHDIbsutHqdtNqXwlIydms2b2m1cCJ
         La9PDg3CNVQKYQ51/HQ4OnSjrre08/QX67KN4N/jXEQtB9cZEJf4ytfrp+yyxZaGe2KW
         RB3g==
X-Gm-Message-State: AOAM530Hjjx7yB0U2SJRxN5sDXFKYcjeCogiTAxmGYW5VSJ8/sw/SQgK
        urQeswQ/ggZN0uXbrRPsxzISUZtCe6ldGDF6paPvjw==
X-Google-Smtp-Source: ABdhPJwX4oTvClZRn3k1F+TWgXVFBrjhZFK8ryObp71Dxi76wH3GSTdge9rwubpK0xGCkBygRmrlaUl0Lz8oFCYnoDg=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr4167327oal.193.1652316748287; Wed, 11
 May 2022 17:52:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 17:52:27 -0700
MIME-Version: 1.0
In-Reply-To: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
References: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 17:52:27 -0700
Message-ID: <CAE-0n51+94O20QW2rWqV2LBeb+5zoi4HNfRp=Sus-Z+tM5FRJA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove NULL-ness check in dpu_hw_intr_destroy
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-07 04:40:09)
> There is no need to check that kfree() argument is not NULL. Remove
> extra check and call kfree() unconditionally.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
