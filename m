Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA6A400583
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 21:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350971AbhICTHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 15:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350972AbhICTHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 15:07:08 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B42C061757
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 12:06:08 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso226177oth.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 12:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ImrvsDaK3tlcktPfQxLSHY82KCie1ukA9uocnY0cHlc=;
        b=of0H4bbz0UPM+J7Yty2+Obx8cd87BiF6AWRa9A9BOCdq3nxLM1q1o53EDzbBiSQMeI
         /lUqqEwoif/lzNkxkwbwz29pjuUBhFUnQvx88lWSSsShyU2XZ0w9fvwW16AAfeghZr3I
         /uJOae0njheUZj6PwJTxOLDAE1okxvgK1ewh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ImrvsDaK3tlcktPfQxLSHY82KCie1ukA9uocnY0cHlc=;
        b=UA5Ylca+asAvLioQmGHHgk3WAEumjQsnGRq33aE8fm5n7WE2qmnY9I3gFFZFdmJW4F
         YCetGH9sgWMm002Iw00RBNSSINrpEavV2dSQjZFCQ/nLp+lmDRdMJbnx/Wz168MP8xew
         nFzH4ppBVTR/8QLpk1qiIjoOdidauvu6/eSuahBedPB+FKx6pOmQb+DyVtQ8juies5na
         ChuRDGfGMkMjTb8froZ0CHHzHQFkfpQn7eNpJTuG3f6cguOzvamtwuy9rJtMLLYbUGnr
         1ysso4Huv5DQjvQXiU+F3LyKdBZA0nIDJ56e7WmGsahP044DboifMIdAh3R269Pq6GU6
         ySNA==
X-Gm-Message-State: AOAM530X+uenTJ7SprPTk8AZ4l8QLwMlMrUXYg+8+y1kW2Mj38m5J8vb
        JJvYbrIFYa1G7dY4++lMqYVKw99WK/wF/srSyWmZwQ==
X-Google-Smtp-Source: ABdhPJxGGdckNSoDvsqvRS79uRgd5Xd5zQ9rKJI3ZEvRGCbaPI5zIQ62VVKexrWKxXQXCxEjUnmt/kvu99b/TTVVl4o=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr465943ots.77.1630695962836;
 Fri, 03 Sep 2021 12:06:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Sep 2021 15:06:02 -0400
MIME-Version: 1.0
In-Reply-To: <1629458622-4915-4-git-send-email-okukatla@codeaurora.org>
References: <1629458622-4915-1-git-send-email-okukatla@codeaurora.org> <1629458622-4915-4-git-send-email-okukatla@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 3 Sep 2021 15:06:02 -0400
Message-ID: <CAE-0n51WBdLoJRPs9tWZgdAukJMnkD3V00o7xNYVX77-eToKvw@mail.gmail.com>
Subject: Re: [v7 3/3] arm64: dts: qcom: sc7280: Add EPSS L3 interconnect provider
To:     Andy Gross <agross@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, evgreen@google.com,
        georgi.djakov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mdtipton@codeaurora.org, sibis@codeaurora.org,
        saravanak@google.com, seansw@qti.qualcomm.com, elder@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Odelu Kukatla (2021-08-20 04:23:41)
> Add Epoch Subsystem (EPSS) L3 interconnect provider node on SC7280
> SoCs.
>
> Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 53a21d0..cf59b47 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1848,6 +1848,17 @@
>                         };
>                 };
>
> +               epss_l3: interconnect@18590000 {
> +                       compatible = "qcom,sc7280-epss-l3";
> +                       reg = <0 0x18590000 0 1000>,

Is this supposed to be 0x1000?

> +                             <0 0x18591000 0 0x100>,
> +                             <0 0x18592000 0 0x100>,
> +                             <0 0x18593000 0 0x100>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +                       clock-names = "xo", "alternate";
> +                       #interconnect-cells = <1>;
> +               };
> +
>                 cpufreq_hw: cpufreq@18591000 {
>                         compatible = "qcom,cpufreq-epss";
>                         reg = <0 0x18591100 0 0x900>,
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
