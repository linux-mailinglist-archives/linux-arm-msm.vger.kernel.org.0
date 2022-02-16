Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CC44B7D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbiBPCUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:20:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236507AbiBPCUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:20:22 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1432BF97D
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:20:10 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id z24so999333oib.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XAfwp7j7WHoPgTggKUVHhjFZruqxqm2zyO1xWp3l9wk=;
        b=a/efTqnqJvKpAM+8MzMGUZIgMNN3UU2Xkp6YQHELWkg3ORnsO/0ZSYogApRAXnopbX
         iS7HSbQLbddTq9dUa6yHmNSWHpTSRX3fxTM9FXrGo339L8URZstD06L2Q3OwV7zctTgf
         28B56I0HpqR4HR4lc8WThUn/1obYmxpncCJ3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XAfwp7j7WHoPgTggKUVHhjFZruqxqm2zyO1xWp3l9wk=;
        b=ZDe7RrwCLyqNq++8EdRH9jf4F1lvXSJj8meQTxstVEuSf4nTO3bI+wY12Uya2PjR5j
         hkQAd4nmIlqSbFwgSo0SX824CV9Jp5iXShtXS17AchVtevJIKsH8dXIGWpk/F33rWOE7
         CT/KnWUlRY1F7gt5rBEHW+MwJVF1xQiodAddDuKd9GFO/cT41gePerhrhJEqp+2rJ1bK
         0heEMoXXvk82CGhq8nrgrMxDMRk8nX8D69W1ZB50ifgsqF+XuzBaFdna1kmkFUmeH+l5
         F/9rphCOLl/P2uYVnAG3m1Dz2f7nntajgjS/TqTzJn5w1rHdnTOLieD64tbfb7m4gcKO
         xGfQ==
X-Gm-Message-State: AOAM533jkeh62D80rAAkudtqL7doNQ2SCvgoxBm7qOqE3Yhse8NQ8fpN
        Py5ubDEJBPNEa/mFxmWNRXtdeD0l4sPZ8s84LE/6VY4oGcg=
X-Google-Smtp-Source: ABdhPJyxPyJO6OqJE+BDPaGZkFjijQe/mgb97dL7c6jiU3sz1MQvlSq/GF3c8TGS3LIMqD2nycVdiz9/0kfTz/Jv2ik=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2976794oig.40.1644978009506; Tue, 15
 Feb 2022 18:20:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:20:09 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-5-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org> <20220201151056.2480055-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:20:09 -0800
Message-ID: <CAE-0n51xcCdHjjq_S4h_4HhF88czSDDqi4qk=3LrLxchC0MY5A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-01 07:10:54)
> Get rid of dpu_encoder_helper_register_irq/unregister_irq helpers, call
> dpu_core_register/unregister_callback directly, without surrounding them
> with helpers.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
