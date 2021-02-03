Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592F630DC77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 15:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhBCORm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 09:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbhBCORi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 09:17:38 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09903C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 06:16:58 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id j4so11683585qvk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKx3uJPZmePnlL93mK/U5koaWC3gTC8OGj972WJi/uk=;
        b=u4z21jPbV4qoGn8f7xGMTWbQYMk2F4eU4WQja9xLGyq/qDnEAUdbSOModaoVZlwSu5
         ZvNutHhs0g4YI5Br4K3Na4SuDWxIXAtU0UlPYDg4yAsd3Z6B7uyHcKjbM/NlMXyAcORY
         gk7kKI5RPXYWDxNJp1vLhRxvXBnrATJAokc84xRfkuvdQU1MJnlc+mHrI4LGdDQdwcMa
         ks48k0VHXnqbw3P2JMN4wgUrdSbr4CDqkLygxLToWpGSuAiaIKAsBi8Dr1G/tMU+csXa
         pzybaf6OMGoVaUfXzIsIeJYqjtsVmLB/jR1kstTYT4oatFf8NMnt6Bs0rXHhBgR1AF8Q
         zr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKx3uJPZmePnlL93mK/U5koaWC3gTC8OGj972WJi/uk=;
        b=HuW/RJrxJFlkS27V1fEMccpUKG/2RoMKONx+jbFMW0hFFBxfmMKTXIG4hqo07Dic/X
         I+BF3OvOBz9DpVlHIbsT59GYxuNBneideK3n3X/RmMGLalaPu0f7CWkVkxlfC+wtAqmG
         mf1bC64+jvHw7pZIWXMnBknah9jT5SoKPt6XJLXMdrcvxKzpxh3JT03dEB1xyAX+O+kT
         1TixShgb5shjJc4W+bs7dDM+EMfKHEyu0InMqVpzqApOkIHQEPPmQJdy7bH29K4KT6si
         Bzyz1gp00X7BP+A6h9EswJ98ZWUv1/TY9SesaykqSSBbimXRfzVxHuRu/mTHpW+/O5ZW
         VLXw==
X-Gm-Message-State: AOAM531QVIv1LFVOgUNWlLRe8St0YjpiVeVNZDW8ewqDTbEte8cs8AZW
        +LnewwRdvxuTwEH5C2bvzyhAJRt+2I1JCw1dsWLVhA==
X-Google-Smtp-Source: ABdhPJz3pfdeXW8rEpq6+RJaBTEnbpC6wBz3cIDKfG6hqkQVujxl43VS7Prq3JKhJ5fuLPTnRc+cPNCxxahRPxI5qgA=
X-Received: by 2002:a05:6214:18cb:: with SMTP id cy11mr2645941qvb.61.1612361817238;
 Wed, 03 Feb 2021 06:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 Feb 2021 17:16:33 +0300
Message-ID: <CAA8EJpppSpzknWnnL1MiZbmTUhu8_K9cD4Vqv-wA+QdRiWnpfA@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patch 3 should reference 'video_cc_mvs0_clk' rather than
'video_cc_mvs0_div_clk'  in the commit message.

With that fixed all patches are:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On Wed, 3 Feb 2021 at 14:53, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> - Adds some missing indices to the videocc index
> - Adds videocc clock tree hirearchy for msv0
> - Adds a regulator to power the videocc consistent with downstream
>
> Once done we can move on to enabling these clocks in the DTS and switch on
> the venus.
>
> Bryan O'Donoghue (4):
>   dt-bindings: clock: Add missing SM8250 videoc clock indices
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
>   clk: qcom: videocc: Add gdsc mmcx-reg supply hook
>
>  drivers/clk/qcom/videocc-sm8250.c             | 39 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,videocc-sm8250.h   |  2 +
>  2 files changed, 41 insertions(+)
>
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
