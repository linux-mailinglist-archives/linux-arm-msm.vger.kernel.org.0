Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7F54B7DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343662AbiBPCYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:24:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239898AbiBPCYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:24:24 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1D9D5DDC
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:24:13 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso936234ooi.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jfG2Bu8rOh2uqc/O2UGw/gH2EhdubksUqfjQyQ5UvPw=;
        b=dfs6y1eCCEopS42ue+mXzRktsoR6kFYC3xyIRj0wOxbUjltkW6LkuO4rIrlUlBMlS3
         0XgSZxJMNnsl6jwbuCO6W66heGxt1jwkG5MQSsYw5jpGBiLkuW0QY3TRchGICS2X6neh
         +xjRe4vpVwvzt0VeJXwLwOGDfW8mdNpyhT8qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jfG2Bu8rOh2uqc/O2UGw/gH2EhdubksUqfjQyQ5UvPw=;
        b=BIdO79go/1FWGAzEKwggxcvcl2cSkK4deaBJBCAokn+HnBPIMc5MITV/V4RtPKnZvu
         Na9w1a637IifoChgOeVV/S7g/KHsBi+pbPOjLRJpjBOIhqJWCPTYBGn6nIi5nblYYFKz
         DZQ0+qhGGALIn4myb7UbOn3XuEOtgA+RhglMPGlkvhR9CRIIAPmZ9x3xiJO5wl5cHqqa
         CkuoXtkq6aZprumdzfoX2Cg9QTMJPgADjnwuYNVGRAyhxHm+f8H4y6vqPZmiKNMF0QzT
         VlwpZG7d35kSfuk9qUqNsYAJLE32z7jOUDmDzESLrV4QKabJ49+U8PTU8IQ/nHGA+NLF
         EJZQ==
X-Gm-Message-State: AOAM533xcpEj67z0JQjOHlsvEm6EKGk++k+ZHT2vsewpbMbLL0UWob/C
        FjN2rWFcCaGvu6GENAjXau/sN3LLPu/u0L8dHYq3Kg==
X-Google-Smtp-Source: ABdhPJw/S7QW9ZSFsJb+EoQ7pPcn1JThwoSbzHfsJVcP/iSPgthUTHYweAWJg73YKGbDLvo+yewIr6atDg5ZmEoMZ7Y=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr230198oon.25.1644978252887; Tue, 15 Feb
 2022 18:24:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:24:12 -0800
MIME-Version: 1.0
In-Reply-To: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
References: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:24:12 -0800
Message-ID: <CAE-0n5320WA0ZdCdBOAmkjXv2E1u8f+RANcDhhvgpzrR+51Vdg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Only create debugfs for PRIMARY minor
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

Quoting Dmitry Baryshkov (2022-02-11 16:38:11)
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> of the files created are unrelated to the minor, so there's no reason to
> present them per minor.
> The exception to this is the DisplayPort code, which ends up invoking
> dp_debug_get() for each minor, each time associate the allocated object
> with dp->debug.
>
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
>
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create debugfs files for the PRIMARY
> minor.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [DB: slightly change description and in-patch comment]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
