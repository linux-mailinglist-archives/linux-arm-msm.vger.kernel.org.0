Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AB617A5E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 13:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgCEM7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 07:59:41 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:37030 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgCEM7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 07:59:39 -0500
Received: by mail-vk1-f195.google.com with SMTP id t192so1569352vkb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ENi9YssFnNrxIavWdof089xJmIH8gmeds5g//LfUp44=;
        b=fUVsBbEloBN3ui7o2WuEDc4txVUIiaEuZ54fCn8hUe2OgxGlrRouGF/0tM/JRlLskK
         wc9gnLtfk5lcXDMK+ZM6gwalTXjVvfCGOHi3NntxWHBmcaUh/2yC3bTb6gd96gJyHE+8
         hxFDdihTUi47ba5vmrhc/kHp2sD3mXR0zIoNmvw7o4aGi90mb8IuwHXLcHmyFauAKT9E
         fkEYEA7XzgoqpB31snLHS8ZZ1FN2ecKdQAWeBbpxBvbucg/7iOMPuYugJ5rNui8C6Xx+
         XmJI/oVR9yH6EUO0VDVTvQEjXjLkW2N2uv4wVJpWVWYtGrJ+XOL39wYB+NNSSXptkB12
         +Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ENi9YssFnNrxIavWdof089xJmIH8gmeds5g//LfUp44=;
        b=Hf8yuxGEPTmWJw32IzDb8w7ZJEU+oxW+6nyWRM/DXYfc2l+A/9TE4Fd3v55ckIszBF
         F4t3kuELsKllVYyEVQJmTyCq4OBpn/hT8OmZWcwcZivTNPZmCo5iuaAumHvwpp1W9CbC
         dlJgEKHs3govodjMJH84/wyNBQHmfhoz2whOsDzQtIgVprKr0pSVszo/ClKuOPdDGS1g
         TAuDTlNLk/E4gto5xtaj4OmUUu+etkmTC9Ty0wgm6UtwEw2J2NenfcR1QsYkCYYRg5gA
         pi2vCuMuZA5igXeucOvVDes2196WbnJUGJBpQOAM4z+G8BoPDhtGd4UwqsWNpjmrRusa
         jHJA==
X-Gm-Message-State: ANhLgQ3dji1u1k7Rym8zDM3C8deXYCR7t20KIVztHucoTbXArkHLMzXe
        +1ZmPzXYiDiPvqeLECdabnhGawu+FCTJn/4bM22dJQ==
X-Google-Smtp-Source: ADFU+vthOpcSnEMfoc58TZoJB2q1XsBRBO/ycdfjLggnL0JssdRwpzmWuaPKw+kP/3woe4bR5m8vDpKaITSqlpVksuk=
X-Received: by 2002:a1f:2882:: with SMTP id o124mr4678329vko.86.1583413176966;
 Thu, 05 Mar 2020 04:59:36 -0800 (PST)
MIME-Version: 1.0
References: <1583394547-12779-1-git-send-email-rkambl@codeaurora.org> <1583394547-12779-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1583394547-12779-2-git-send-email-rkambl@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 5 Mar 2020 18:29:26 +0530
Message-ID: <CAHLCerM-qkkJWqdGWk62XzHmw2AiVBFgKNBYnkvPtwq7+VGKqQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180: Added critical trip point
 Thermal-zones node
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sanm@codeaurora.org, sivaa@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajeshwari,

Please cc reviewers of the previous version of the patches in the future.

On Thu, Mar 5, 2020 at 1:19 PM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> To enable kernel critical shutdown feature added critical trip point to
> all non CPU sensors to perform shutdown in orderly manner.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 253274d..ca876ed 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2366,6 +2366,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               aoss0_crit: aoss0_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2421,6 +2427,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               gpuss0_crit: gpuss0_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2436,6 +2448,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               gpuss1_crit: gpuss1_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2451,6 +2469,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               aoss1_crit: aoss1_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2466,6 +2490,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               cwlan_crit: cwlan_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2481,6 +2511,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               audio_crit: audio_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2496,6 +2532,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               ddr_crit: ddr_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2511,6 +2553,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               q6_hvx_crit: q6_hvx_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2526,6 +2574,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               camera_crit: camera_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2541,6 +2595,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               mdm_crit: mdm_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2556,6 +2616,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               mdm_dsp_crit: mdm_dsp_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2571,6 +2637,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               npu_crit: npu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>
> @@ -2586,6 +2658,12 @@
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> +
> +                               video_crit: video_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
>                         };
>                 };
>         };
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
