Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8AD4B7DC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343658AbiBPCXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:23:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239898AbiBPCXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:23:52 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D06DD2051
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:23:41 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id r19so1038556oic.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=do3u6/z7zCvazn6dB/lB4uze72AW50adozCDD+3nWC0=;
        b=dep0T2pIMIu4ZF68LVowfSkCS8ZxQieF9CH5b7wOgc6Hbtao27n1EOb5gWMqPlEMfa
         JiEQvMfO6kYPEG7VAJpoKpE9tDR/A51kcdFDr1K9rHtgnUghJNtKQ8Yq9eBG76imN3Cb
         3/j8kY2ujmHBAmJxqCl+dko0CccdxK4Ygv8rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=do3u6/z7zCvazn6dB/lB4uze72AW50adozCDD+3nWC0=;
        b=jN5Y/yVXNrbZmjDShQlKqAY7rKtyXdpYXIlpnMkaOowfTRXEQ1IRRyQmQjBI0L+zHb
         saPEWgeqS3Be48unbTLKLRAq8jKRRXTxTN9lrKNtsWDVv5W6BucMilKhUqJWvtRxXBvq
         rrlIC6vug/aIlisI827bsT08tbm0dfOi3Qw5sPjwXyUZ/1QuwW6vfAOtGdu1xpo3ivWU
         7szohE+OT5nlfSpcwK4iIiJXX9pOnhqIQi8Bp93QJMgoFSAWFGuo9fJJKzMoi47t8bkh
         gkceWYNegLxD9Kwdlqdb71wObKJIFlJvvsUv/CEvUE9EUQu+gAgARmq3WMrLNmvQF9wr
         BbYA==
X-Gm-Message-State: AOAM533ISBXKfNQM9G2f9lFf39CQKf4UR9HJI8VLoNWY7BQlvYVB4fAb
        MamF3BLeDoTzwFYga5apa8DDRlDyVyqb3GxBeV5+Fg==
X-Google-Smtp-Source: ABdhPJxTadsQFl0F265Dj7oAXJyj6RI9yKfL/VD6n7bVCUqdLXYuh0mXfZ6jUdzpa9lfmUtffEGDanBYPorC556NV2I=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2980915oig.40.1644978219565; Tue, 15
 Feb 2022 18:23:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:23:39 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-7-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org> <20220201151056.2480055-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:23:39 -0800
Message-ID: <CAE-0n53sC=vfEtV=h9bDJgHoTi7z4fSLvqNmUDkBfWsXk1u_pA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:56)
> Pass IRQ number directly rather than passing an index in the dpu_encoder's irq table.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
