Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9D63D689D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 23:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhGZUqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 16:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhGZUqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 16:46:33 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21914C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:27:00 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v8-20020a0568301bc8b02904d5b4e5ca3aso10521654ota.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ll1nnihmkvO/gDgrcKX4fXvl2evxr2Vg6Gb68Gj0wG0=;
        b=ihMWf0papZJ3e5ptypD11uSums4DQvLI6Rd5Kcf2TmQGc6oi67UKouIgPfMRuPlGYu
         hnF3xY5Rs+YdaEeHPrOqHGrBGeBqL+Wpk+so4YJ89YyiYGPX47ekf/yaERpgoaEcNW5q
         0QltfkjiF3QMrtIEEZies9VeWYO9XosMMbt3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ll1nnihmkvO/gDgrcKX4fXvl2evxr2Vg6Gb68Gj0wG0=;
        b=mYQbJVRYpgkavXg9jALXC8huAHvngS1GWalE4R8N+xE/JBR4BBFLZM3JFmaT6O/N9o
         46aHizcKmdyzUKsHEKLCl7SIfVQ9Gr7KFezjj7006IM9LmMeEAA/JjX2kfFcvcWZ3yId
         qiTOPLEUjWsym0jfRlqpGf9YhuqBI1VBbW0k129hE0Reb0GvurWOpfoHHNRczES44VCW
         YijiRje3jyjurMMyOdEcfp080MG/m3QnqqE30sC9v/vk0Oqf3bqOtUAmjXiNWePglht0
         FzIS0iL5QJRFHibnX2H3+VrN38bE8jUxkHgQbOH7MKaUCC7nap3jSeZVlUhhZbpYdw8X
         POMQ==
X-Gm-Message-State: AOAM532+F7yOTXeHFbAPwBdDMlw5gbUNBVvYsSln7FWUOeX+2GkVWS7o
        Ev546ol5YklWJIUIUlEXhY36GNB1z2+XFUP1Y/4W+Q==
X-Google-Smtp-Source: ABdhPJyeVPc/zQaISTdfnsGJwNKl/FAcxTE6z02/xi9ZLUtj1ROscPre2KooDOK0yN0dsiG8qy8SZ8ZOkXzxCT1+1g8=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr13307303otl.233.1627334819551;
 Mon, 26 Jul 2021 14:26:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:26:59 -0400
MIME-Version: 1.0
In-Reply-To: <20210726120910.20335-3-srivasam@codeaurora.org>
References: <20210726120910.20335-1-srivasam@codeaurora.org> <20210726120910.20335-3-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 17:26:59 -0400
Message-ID: <CAE-0n52hziOfFo0JEoF8Xy1CvMChOqHxXmSw+c2=DahPRScR1w@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-07-26 05:09:10)
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>
> Add dai link in sc7180-trogdor.dtsi for supporting audio over DP
>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
