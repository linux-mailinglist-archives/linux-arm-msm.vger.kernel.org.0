Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C5C33C089
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 16:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhCOPwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 11:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhCOPwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 11:52:11 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF7CC061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 08:52:11 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id gb6so9025558pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l5O8s/wBRTzluF+EQ18kfEQD+z0CSNx9wGIEFGPEHmg=;
        b=N5lNJUt9jcIm74NZds5a8UYlvcZmXQT5aEGfcXpTlAbso+wSTn6RBT2JsVv39b9dWd
         Nq2mMSljLvcDWTMvAurfqgJ1ymfMGAfOLSAlCgqhNHYzXiTLFhSpn68SZd822/6+KRAG
         o46GZb3mIdRmLizFod8sjKveuavDko4jp6ek7knHQn0vBb20rtBJGH+iH07rpJO2soiO
         IHtqDZwsu+jqi4QgUBOR35FSH7QPBoH1s4vlF45Y9BXiK0xnHbmU4uOipchP6AbzQwO6
         hp0vdH8tXxR6My8yc1ujWWpvUFSVJ0q/Bzhw+My8VV/8BWT8UmblB4Cch7239voBznNS
         EFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5O8s/wBRTzluF+EQ18kfEQD+z0CSNx9wGIEFGPEHmg=;
        b=f82cb9nMk4P5mpK26sQ2puoYus+drLSqfbTvS6nFJAdeWhe+QifEwlLx6MGdS5FrCQ
         bZl7d2RvSqWU8Csn0vlRw8tAgJW+O/Ql2sQWFj2cbublW7NO9UPJqLAXJ0tacRlUJu/o
         EwrdlD0ISn6cJPefGeI37z4rDKWiB7YfBIpj3nH/0SLtmD1IS26yJPXjJPNgGIQ9QWqI
         bq2OJIgag4GD3SsAnP3CRVXvLXWM6K3IvogZ41jTobLjF+qNLtRJc6YnryQlXMpOyha0
         Rh15oFOS82uyYXhSXhVdYfA7X4kAr5J3pTBhJaCT+wYPl9MqqM9xq+9Lt0O7QEHL6oo8
         bBMQ==
X-Gm-Message-State: AOAM533fJtq2B8G379grMWCw+Mu5zGydXuOZA0Bbwn7YqOezXgBqOguC
        6yx1p+Xwo9+f52c0M1/35WMlJACblrF4jVMO09MU0A==
X-Google-Smtp-Source: ABdhPJwLtHPMWbEgOuq8RvEEYc2YsUKVLt+jWBUG2xRdYfgi2jcTTjBDvqIjtTGn6oOLMuDW4RlfTcorUlFYFD3/+zc=
X-Received: by 2002:a17:902:e752:b029:e6:822c:355c with SMTP id
 p18-20020a170902e752b02900e6822c355cmr12425529plf.69.1615823531085; Mon, 15
 Mar 2021 08:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180948.268343-1-robert.foss@linaro.org> <9e914313-d849-5a0b-32d5-40e033893f9d@xs4all.nl>
In-Reply-To: <9e914313-d849-5a0b-32d5-40e033893f9d@xs4all.nl>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 15 Mar 2021 16:51:59 +0100
Message-ID: <CAG3jFyuu7MUny3n2MrYPa=vy8pmz0HBGYz=1WEWvHNzJvjsRWg@mail.gmail.com>
Subject: Re: [PATCH v7 00/22] Add support for the SDM845 Camera Subsystem
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Hans,


> >
>
> Please check the patches in this series with 'scripts/checkpatch.pl --strict'.
> I got a bunch of warnings, most seemed trivial to fix.

Ack, sending out v8 in a bit.

>
> When I compiled this series I also got these sparse warnings:
>
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-4-1.c:959:30: warning: symbol
> 'vfe_ops_gen1_4_1' was not declared. Should it be static?
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-4-1.c:959:30: warning: symbol
> 'vfe_ops_gen1_4_1' was not declared. Should it be static?
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-1.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-4-7.c:1151:30: warning: symbol
> 'vfe_ops_gen1_4_7' was not declared. Should it be static?
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-7.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-170.c drivers/media/platform/qcom/camss/camss-vfe-170.c:770:26: warning: symbol
> 'vfe_isr_ops_170' was not declared. Should it be static?
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-4-8.c:1140:30: warning: symbol
> 'vfe_ops_gen1_4_8' was not declared. Should it be static?
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> SPARSE:drivers/media/platform/qcom/camss/camss-vfe-4-8.c drivers/media/platform/qcom/camss/camss-vfe-gen1.h:69:31: error: marked inline, but
> without a definition
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
>

Ack, wasn't aware of sparse or smatch, I'm adding them to my workflow now.

> And these smatch warnings (a lot of overlap with sparse):
>
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-csid.h:66:27: warning: 'csid_testgen_modes' defined but not used [-Wunused-const-variable=]
> drivers/media/platform/qcom/camss/camss-vfe-170.c:422 vfe_halt() warn: ignoring unreachable code.
> drivers/media/platform/qcom/camss/camss-vfe-gen1.c:26 vfe_gen1_halt() warn: ignoring unreachable code.


Ack, thanks for the testing!
