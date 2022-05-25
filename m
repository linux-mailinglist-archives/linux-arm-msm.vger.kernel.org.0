Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5103053343D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 02:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241644AbiEYAU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 20:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241276AbiEYAUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 20:20:53 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684F17221E
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:20:51 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id rs12so26776514ejb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFNyhH2PA3ljDR5ctK4z4sd4lSPZnlCyP4REV9FrmG0=;
        b=atWef+0vCmx2JhZX3or/VLDUlzqQvaVadsgA7a2K6VVGhaF69s+puWkmzOaeg0+asP
         O1vbjspHUOIG2pAXNJuiSX+WrGw+bHTpwC9A+ov/SfFm1yYp1mh4oO5HU/qudPE+DYxp
         3+5zkA3cv6irqzWRwOaCYJJqZGcBnVKB4JMCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFNyhH2PA3ljDR5ctK4z4sd4lSPZnlCyP4REV9FrmG0=;
        b=6OCw6uRjmDKXH5GbQ2qSBX2n7P+9uOEmY8U0nSngsyp8C7NdrRkPOUyYuvjWd6o3Rs
         1gpFlcS3eRKEhlLlRk7pHVmPQ0zP5nI5W+ikZb+BeTE//J5rTlBw3gq0ztxI8W8mSQzB
         6BDq7y+q2v3qEITqBCOATXaNeD6uycvLUEPbC/FmJ12G9DADESsWnx+hOaAJ5NccDJea
         5jf7mH+lE066NdPbybMrA0NK8NkY2/vyAhKZuP93hWurThIG5r8XwyKx+SKO7iQC4mYO
         VYobcpSZmanx88aJ1Trwt7VPFBJSkpBkUXoZ/u6z3K1xQ5q9G/EUvaf2CgHsDKcf1qZF
         mIOg==
X-Gm-Message-State: AOAM532cGDwBGCNZuhQuVHifQYXvJskbBx2PYKYrsj8v0+IHFzK2/M6d
        yhUoiU1fAGFZs6D/aG+l9P23jlrzyw0nBmc8ReQ=
X-Google-Smtp-Source: ABdhPJwrRIIvQ+mb9YrtNCx5elUQJ4ysWvVumgNfalm/FpYOIzpousC05h+AUPxAACV8MmybKHUMOg==
X-Received: by 2002:a17:907:7205:b0:6ff:830:fb0c with SMTP id dr5-20020a170907720500b006ff0830fb0cmr4110249ejc.681.1653438049663;
        Tue, 24 May 2022 17:20:49 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 28-20020a170906015c00b006f3ef214da8sm7722842ejh.14.2022.05.24.17.20.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 17:20:48 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id e28so27286740wra.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:20:47 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr15834745wry.513.1653438047238; Tue, 24
 May 2022 17:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com> <1653082028-10211-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-4-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 May 2022 17:20:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vc2zSTHTdneE4yCypg2SO_0xVsEx69BuArDAF3nzSfWA@mail.gmail.com>
Message-ID: <CAD=FV=Vc2zSTHTdneE4yCypg2SO_0xVsEx69BuArDAF3nzSfWA@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] drm/msm/dp: delete vdda regulator related
 functions from eDP/DP controller
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 2:27 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> @@ -101,11 +101,6 @@ struct dp_reg_entry {
>         int disable_load;
>  };
>
> -struct dp_regulator_cfg {
> -       int num;
> -       struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];

You forgot to delete the #define of DP_DEV_REGULATOR_MAX earlier in this file.

Other than that, this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
