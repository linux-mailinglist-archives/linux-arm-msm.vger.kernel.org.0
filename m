Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74A622143B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 20:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgGOS0k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 14:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgGOS0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 14:26:39 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A99C061755;
        Wed, 15 Jul 2020 11:26:39 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a8so2357254edy.1;
        Wed, 15 Jul 2020 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oTQol0VmjKmBPC+M8imaYKdXV0XGdfLv0rh0VWky9EE=;
        b=uEvZT5ws7+T1jnEVo6h4JbcKv8hKOxVCiJq7OPNIAvwfhDPmyGLsLZHzlj3+UQdbDu
         AJKToPAaUqlIXFAC4vBVNmIbeFB8QSK3UYuQk68sX+Joam1O4wNo/I0UIbhcua/xk60a
         e1JadHF+95xJiCjkb4BPqj69zzhrMH3vOdDr9/57zwNbf1j0o51CmK+HkV8Fnv1oh3mq
         dsHG/eup+01xytoaipZGKywOhJg0gANnXIIwUNiURsyiVQoE6F3fjv5GsM9a4ECmV1Zu
         nsh/4VmIRcvcEWOFyXfYT657uKLnIh76SWifvHzJigNGdoc3EB2Y3w8AuF8RT8CkFJo2
         ey+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oTQol0VmjKmBPC+M8imaYKdXV0XGdfLv0rh0VWky9EE=;
        b=tTRIs+H4xo3e29xxKPEMMW/30g1+xlytsB1bpIn4Pw40HIgiz9yCAA46A95cFkLFAV
         o4Z4lvxZJriql+Qq84/YFzLo+YQa6dmf7Q7rZV+EubT0ijfmJPA8FiXyiw9t+2xsfM/O
         5nwbVGDGe30Fo4G3b0s9RnfkkYGTJ3QBh7g8wP1qt2WA8GjFpOw8XQjMTtFKgIcn/Mr3
         gL5/zCiAo1eVrMgThtbHzbRKl9zT8D0WLdRxXJ4gSeR9shktCFluqVDT1riQYCuDpVqO
         RFWYxWIDpPMEV73wd4gIIxFxJD10YLSdxGD9JJEUX6ox7Y4trQh1h9/bgw+kl59x/y1v
         4U1A==
X-Gm-Message-State: AOAM530t0giHHUudMUnNqqtVodt9utW25AwPXHG0KDPwOzqmDZQyQPSV
        WU+DKZtY2l8BUVDQM3iKD4WyW0j57F9L0l3H/zM=
X-Google-Smtp-Source: ABdhPJxLqEBMfJSdn3WSobb0Oqp5l9KTaKAbyXt1aXJeFG4g+SFo7Aq+S0ThjrslTJ53COSNmM0KR2c9PV+YQEl8Ctc=
X-Received: by 2002:a05:6402:304a:: with SMTP id bu10mr915071edb.70.1594837598280;
 Wed, 15 Jul 2020 11:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org> <1594644106-22449-6-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594644106-22449-6-git-send-email-akhilpo@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 15 Jul 2020 11:27:11 -0700
Message-ID: <CAF6AEGs9Ei=MAhC=OOfxHvw_AGeF25LTCrWLzxB_kGN7e2PgNA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: sc7180: Add interconnects
 property for GPU
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 5:42 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> From: Sharat Masetty <smasetty@codeaurora.org>
>
> This patch adds the interconnects property to the GPU node. This enables
> the GPU->DDR path bandwidth voting.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217..a567297 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1470,6 +1470,8 @@
>                         operating-points-v2 = <&gpu_opp_table>;
>                         qcom,gmu = <&gmu>;
>
> +                       interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;

I suppose this and the 845 dts patch should have:

   interconnect-names = "gfx-mem";

(OTOH not having it was a good way to notice a bug in the driver
handling the legacy case without having 'interconnect-names')

BR,
-R


> +
>                         gpu_opp_table: opp-table {
>                                 compatible = "operating-points-v2";
>
> --
> 2.7.4
>
