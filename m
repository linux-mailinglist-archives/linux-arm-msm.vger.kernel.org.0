Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B5A7C8B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 18:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbjJMQbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 12:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjJMQbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 12:31:35 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9461EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 09:30:18 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso2458921276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697214618; x=1697819418; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=veDHOSSglRPxO++sDqxd9T/imdhN2ow5EstVAAB24X4=;
        b=QEGmFTRzZ3laIo1+ekyJhzvzx0d86X4xE5SuRtC3/1v7k7azCPYMceImseS30h8Cch
         HoB8/3P+9dRSQMs39GYRIvEf9X3K0hYtw+F9fKWuR1tP1wRfNHAhdwua9YY7f70Q2pfA
         L9+r2J4zIRm4RLfseV8jeSfTqfM2ggOeTaNgVBOLTdXjTYkCO+jpmrPjPZUblYduzRKs
         HeRiuSKU6u2He0U7Y/XiHzKYBfmYCxaikzZCwdVsUEnJFs3BIWxD24iYrvNoQS+XCHrX
         dxxeSdDT4jtdJzSz4cVw4nx/yREUvfTaWa8oLlygDryRllzZaPliitHxkR3gyX8Q5PuM
         jK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214618; x=1697819418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veDHOSSglRPxO++sDqxd9T/imdhN2ow5EstVAAB24X4=;
        b=LwtrI/EMsDUcVMaZct+ZmyZV9SDv9ev3OiDcZJWkQhFlVaUc6yKuhOfcQJRP6hEFNH
         1Di/BwQ+zHuard3Yi2lsPPuMP/NnxHziVz2KQDvuKo5G0JCvOLi2ZEo6KT7pwOg/5BsB
         I6BtKCjx/hy37GJJFt5uRWjQBmWU5sNCn/JOodG9wbES8x8IYvEaiOkAv6niAF6gJMdi
         Gqv4i4xN6kT0e97o/CK4a8f8gedgVV3kRTU9JxIDdcnwiIkgZojycHJOAcKohnPgFU88
         m7YTBnibUWcSH0UWzV08XjFG/AzDk0LMFoVXM5uHXEA4fb2oI2TeaxhYeFikCWkiiMhu
         m1xg==
X-Gm-Message-State: AOJu0YyNN5Kt+zVqro/GtbDFZNVuSpUA7s33WjnNPyvrqVdv4gNhPjRC
        Xjm5++LG+g6ksAQ4emDu3lJMNmgovZ6f/rSD2BVm9g==
X-Google-Smtp-Source: AGHT+IGmGROLxFTg/QvBurrmJrb0DRXEr3xD4vja5abWktrT0Y4AE2J8f1r0WagBilg8IjNVZtcXk8Ii3xs4Np+B6ec=
X-Received: by 2002:a5b:f86:0:b0:d7a:d716:233c with SMTP id
 q6-20020a5b0f86000000b00d7ad716233cmr23602244ybh.41.1697214617968; Fri, 13
 Oct 2023 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-5-dmitry.baryshkov@linaro.org> <dff4bd1d-e32a-9541-94d2-c354adf3d23b@arm.com>
In-Reply-To: <dff4bd1d-e32a-9541-94d2-c354adf3d23b@arm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Oct 2023 19:30:06 +0300
Message-ID: <CAA8EJpod3X_HJEUK4i=uO0KmBLUCE0D3pH1xGhezxF0U+cDucQ@mail.gmail.com>
Subject: Re: Warning notice "Memory manager not clean during takedown" on RB5 runs
To:     Aishwarya TCV <aishwarya.tcv@arm.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Aishwarya,

On Fri, 13 Oct 2023 at 19:05, Aishwarya TCV <aishwarya.tcv@arm.com> wrote:
>
> Hi Dmitry
>
>
> On 17/08/2023 15:59, Dmitry Baryshkov wrote:
> > Add displayport altmode declaration to the Type-C controller node to
> > enable DP altmode negotiation.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
> At present RB5 runs against next-master are consistently throwing
> warning messages (attached below with call trace) on "Memory manager not
> clean during takedown". I can send full logs if required. However, the
> runs are booting successfully so the logs are quite big. Tried running
> with older dtb built, where these
> warnings was not observed.

Thank you for the report. These patches should be fixed by the
patchset at https://patchwork.freedesktop.org/series/125010/

-- 
With best wishes
Dmitry
