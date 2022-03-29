Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9744EB67F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 01:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239474AbiC2XLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 19:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239476AbiC2XLj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 19:11:39 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0B1EA767
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 16:09:55 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id h196so15366124qke.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aEhUDD4h6uAblZYdEqK3WfYH78cRJFucwHHJvJpj9po=;
        b=w8xu9XnmFHc5caQlAGfwzcIkBfTpogJyC/Z8FpIG+9cIP3gR2zRYtoUaWiHzPZuBsG
         HQneZzTbvoXPu2yMmtyeQNis5QeWwbocvt4HHrIwN1RV7UyzTATwZqwmcVPtC3dwZslc
         9PIYisICUth6zmHVftQ0am2evsMdXpXbWvEdj0OMz2hq3Z69aKjuLLiB6H1NHl8H61pt
         DxIR5dTh4zN8XlngUUjGIa8DNvHTNSNAmPEAIF/kooUnJlwwjGwjm5vQgiu93BCwCMln
         DoFcFIGw+hHrOX0v52ma/X2KnyWqF/28Q3ofS1EWuLHZpJ6K3IsfC17RX2fsgBu/RWf8
         uOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEhUDD4h6uAblZYdEqK3WfYH78cRJFucwHHJvJpj9po=;
        b=uHsi/pOL6MplSbHqNymfKtuTa3yh9wDwRkFieduIP31X/mBaKjBr6jdQwA487511IY
         Md30SM1IHXDvH9ES5hj3KQLlV6EHURz39TnWpfjZLELavIIIxpaD/fP7GqL97X/N5lPF
         1rckK26wWpC8DoGSG3fwgDUpL2xsu9oUVc1OVd7cy18fpgoOcDLBVhapQKhakdyDZDB6
         isJMrdO9uahJrWpWUou9hc5NKmGCvU7VEMqcysErcBOie3sSeSSvLSis+J2+n4GwPA2q
         9pgMAqxGc6MMol4/DRSP7Q1Ux//JC/dK5vE4G921g3aZnp0jihnlN2bDPR6jKb5rPPXr
         cWCw==
X-Gm-Message-State: AOAM533kDPkjxU9p3lSP/XH3qbpwnjybuTf8oMnxnRlkYJZmlzFiz8Ir
        L6c5pJYSNCQHUmk66rRNsWC66bOpVPg00EQ7lph0Mw==
X-Google-Smtp-Source: ABdhPJyLdObA37xboAWKWrjWol8cD8HdyMOGLCYHULnJO8ksydrxdWJIytU1sr7bpMvVWokokD9NAS8l5HilJGmwql4=
X-Received: by 2002:a05:620a:2442:b0:67f:65f6:bad2 with SMTP id
 h2-20020a05620a244200b0067f65f6bad2mr22390896qkn.203.1648595394698; Tue, 29
 Mar 2022 16:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com> <20220329230105.601666-2-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Mar 2022 02:09:43 +0300
Message-ID: <CAA8EJpqnS1qJS9CkR6s7nBSJcfL=i-gvX+PSpajoQOK6FmuWjg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/msm/gem: Move prototypes
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
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

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> These belong more cleanly in the gem header.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
