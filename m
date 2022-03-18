Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC4B4DD1D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbiCRAOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiCRAN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:13:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EFF19751F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g20so8481178edw.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Zw9lPFduJ2icojxhfJ3aRjvx7VBmO2urvyYDaLJ4d0=;
        b=QMhgbox8xCb6ZSHg6qb0nNgah3j0TTlKYxHwcoQrl/cBMnwf4ZupJHJTrgJFw1csLO
         g1QvwAy3Ivjs5kB+3lKnBlk25Xek9CCmKA1EGxMrbFc4YNYz+bwCOl0GB+vbKkHq5OuM
         64BLXfm8aEmJXYfZZ7n6OAY4gaM6+1LKmPmSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Zw9lPFduJ2icojxhfJ3aRjvx7VBmO2urvyYDaLJ4d0=;
        b=eqqTQrGjDLwLpiMHNDCppKS36BIZb+6Cx9sQD+62ZxSUnOrQrZL2bQAM8PDRxYqyNh
         xLcJ73kTYNWHZx4MjNmgY7/p4FtQX8f6rq8F7SiZKWSQTt2lv/gnKGmMoLLxuPR43AdY
         PejL43RNPpGC1lLCwILZjH+NkxGz0i1fl0HeWVAgyn4cyt/F6k+yVMmmB3kurmPiosrm
         jdtXmpQy+N9blN7q6xp/YVZCJ4CqvEi0X1opJGFi0BDrcVrqLroT87sJ1VoRtmp+Z2vO
         382CYB9il0NaB/8EpxsiDiCAiJoD5yW/cCSKSScNcUS9k+zQDeRXjdJc4l6BJ4gxxfs5
         LCWg==
X-Gm-Message-State: AOAM531PlSHpn+F03yalW670gQ6QFUNruNlQVpeoTdN44eaALJRb17vd
        tGxgo+5xvJFk7SrplvkHrZELOHujzRJXWg8exWI=
X-Google-Smtp-Source: ABdhPJzdiWI+NsdsWtV9x1nd7rs83H/BwMC6ireObpcp1t96Nu5Nr861o6XqQCa9jxOsasfCIxHQNw==
X-Received: by 2002:a05:6402:298c:b0:418:f55e:fdda with SMTP id eq12-20020a056402298c00b00418f55efddamr6704652edb.230.1647562360297;
        Thu, 17 Mar 2022 17:12:40 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id k19-20020a1709067ad300b006da92735c32sm3026404ejo.16.2022.03.17.17.12.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:12:39 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id a1so8264304wrh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:38 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:203:ed96:8212 with SMTP id
 ay4-20020a5d6f04000000b00203ed968212mr3631950wrb.679.1647562358403; Thu, 17
 Mar 2022 17:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com> <1647269217-14064-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-3-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:12:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5O8aZqQxtx2MGz791SiQtSwMBx2ww3J5qFaG=W9skjA@mail.gmail.com>
Message-ID: <CAD=FV=U5O8aZqQxtx2MGz791SiQtSwMBx2ww3J5qFaG=W9skjA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: sm7280: remove
 assigned-clock-rate property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_kalyant <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/

Some nits on how you're referring to the dependent patch:

1. In the commit message it's really nice to also include the subject
line of the patch so someone looking at the commit after it lands can
more easily identify the patch you depend on.

2. It's better to use links that have the message ID in them. In the
past patchwork's magic IDs have been list.

So I'd write:

This patch is dependent on the patch ("drm/msm/disp/dpu1: set mdp clk
to the maximum frequency in opp table during probe") [1].

[1] https://lore.kernel.org/r/1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com/


> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
