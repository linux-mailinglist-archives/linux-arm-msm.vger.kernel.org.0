Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15FAB4B7D60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245727AbiBPB7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 20:59:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiBPB7F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 20:59:05 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0E09A4F5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:58:55 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id e19-20020a4ab993000000b0031a98fe3a9dso251361oop.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 17:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=R+LYm6UbYwzklwgrWKfldyYMasmr0KjdKhTH+74gh5E=;
        b=V/q8gH1WZpL2h1HMbcPsyQhax1VJztQIe10OiGgLpp3mfnSElE8s1fmozTu0UZERff
         /P3g4fqN9FQkP6ymYgD59qg67zdRpuBv5i7cEmI7Vn11781ZjVZO8GYjwjRxMdiFsflx
         FyMySmz3/V8jYwp6c8ER0o3C+d0n4kbTrU5UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=R+LYm6UbYwzklwgrWKfldyYMasmr0KjdKhTH+74gh5E=;
        b=USUIRo8mrkvw0B9202FtFI79M+QP3ohvI0hKWRCzhWGEREOwl7z+BS7Rl9t5/7rlrs
         phsokjwaO0RfDnoxIGxzzQzkL2qNinREMPJFtuIRLylNNGEpQdibQBmYbbj8YRoW9QgP
         NYgMrTF6OG5ttxR5oc24kVMheFUUxx0G8+Rro6cMKhs1X6PNUZze0jvUmVGXZqH4tcjW
         XOf77E5AxE4L2N+8oBpNAn5Brp4LOIxk6BfHYI/XMCy36UflWmOCcP3qXt14tWr9Yq3D
         PxKNazf7jf91c2sqmpZSIdQbgKNcRxoV8qOfu79qUkDEx+4sjCeCL31LvtIor9FTO3oG
         9FGQ==
X-Gm-Message-State: AOAM530m51gcq8ZINdQpKaTD6ebTBb/vdA+qX3Gnzwh6j0p2uwrZbn9K
        7zp6asXpdb5oYf4acRxXClOdZTSXiL8wJSmWkLrR2g==
X-Google-Smtp-Source: ABdhPJze3x/RF7+2WkKFtz8cWerX43wYucnT4Wu3WZEPmq2xYoXVy1IiMR4/cE/ZbonvVhbSyVFTMQkLvkqYp6NwLWs=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr206733oon.25.1644976734433; Tue, 15 Feb
 2022 17:58:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:58:54 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-7-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org> <20220215141643.3444941-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 17:58:53 -0800
Message-ID: <CAE-0n500D92XLGPHwm-SHPZ1KwzQ+2rKaDOHU-G_2j6aFv7Ofw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
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

Quoting Dmitry Baryshkov (2022-02-15 06:16:41)
> Make dpu_encoder use atomic_mode_set to receive connector and CRTC
> states as arguments rather than finding connector and CRTC by manually
> looping through the respective lists.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
