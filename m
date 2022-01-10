Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A530E489C07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jan 2022 16:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbiAJPUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jan 2022 10:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236022AbiAJPUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jan 2022 10:20:01 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A159C06173F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jan 2022 07:20:01 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id z3so12294527plg.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jan 2022 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fAjF3vLZ7mfBQ3SdQhH11iQQkyBtd3g1WKHRB67w9Ag=;
        b=x5k8qvvwOHKm9jQ3J2orM920vpHpXpan61Fa9wXJa31YFURL4OMoBzEp0r1MAf5d30
         mIpnWvZDiZEMqpqsnRnGQmCN109X7MWHSj2eN5Rw59hzXBdsUs/mvhiYLsvtF+Gbf4op
         GB21wMvcUX/Q7zyE7IRRrnwGafuE8qW4+pdXAChIV0Mz6qeeDNM3tLtmWfeaye1MXQ6L
         3JfQ2TMtLskHpGt2TSjtWSkcoGcL/jgPS8zqmoTkWZd0e5mFIsxuq7Ugo7h7nn7iKxhm
         Axv3JjvYEfLSkFRRR4Ax5XecSh+E09vnB1vedQJTJ+3z60OrqNjKpoq15rF0oh9zOK1J
         0Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fAjF3vLZ7mfBQ3SdQhH11iQQkyBtd3g1WKHRB67w9Ag=;
        b=3Ib9tNAYatuKbcKws8da2uFabnKMw8nDorEsYR89EOIqrUJgJtNhvl2RF0G0v5AIhz
         7Ep2ysHpIgxOgTF26+uBKPO6ZEom1JF2uruXC9O9NeuQFClTnGuKeM6FJLTGXukuRd0A
         cILz1von5kK27fOSkNIro/i7jBB8OIVXq/CZpvommwO6/dOU/jCdyFYqiUhbJEbCso2E
         UXxUbLWAfZ0hwxKT9eNNmeCVJV76thLxiNt0xSeKhw+dSbE5xNITzVHqIcwkZyH7h9n2
         UnDU25i6xlXvoKnYsG6ObsXrQJVECyeCOYGJq8pqk5kNtimt7LNtReCPaTN3qMZyYEHJ
         nIag==
X-Gm-Message-State: AOAM5326o9CMzkgZINKvUhJqYpO56TdsJSax969EGXkJ5krngYO5q6/w
        dS3x1LjR9eoRuoTeG2dey8dXYG5rkHCvCya5Hq2ztQ==
X-Google-Smtp-Source: ABdhPJybNE82ps6aSyetuV9YokNXz4hLcdbt1lDM2XO7LOBQhj6z6pAAFWgXlBKPlXR/yt+foULOOZkRruB7pBU16yc=
X-Received: by 2002:a63:7c51:: with SMTP id l17mr218009pgn.178.1641828000557;
 Mon, 10 Jan 2022 07:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org> <20220109024910.2041763-8-bryan.odonoghue@linaro.org>
In-Reply-To: <20220109024910.2041763-8-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 10 Jan 2022 16:19:49 +0100
Message-ID: <CAG3jFyv-R0jik2D0-VOz5e93tMMngJ8bPdCxoZHu2QRjiwvw_w@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] media: camss: Point sdm845 at the correct vdda regulators
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for catching this Bryan!

On Sun, 9 Jan 2022 at 03:47, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Reviewing the RB3 schematic its clear that we have missed out on defining
> one of the power-rails associated with the CSI PHY.
>
> Other PHYs such as the UFS, PCIe and USB connect to these rails and define
> each regulator individually.
>
> This means if we were to switch off the other various PHYs which enable
> these rails, the CAMSS would not appropriately power-on the CSI PHY.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index dcb37a739c95b..859b397912cc8 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -543,7 +543,7 @@ static const struct resources csiphy_res_845[] = {
>  static const struct resources csid_res_845[] = {
>         /* CSID0 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>                                 "soc_ahb", "vfe0", "vfe0_src",
>                                 "vfe0_cphy_rx", "csi0",
> @@ -563,7 +563,7 @@ static const struct resources csid_res_845[] = {
>
>         /* CSID1 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>                                 "soc_ahb", "vfe1", "vfe1_src",
>                                 "vfe1_cphy_rx", "csi1",
> @@ -583,7 +583,7 @@ static const struct resources csid_res_845[] = {
>
>         /* CSID2 */
>         {
> -               .regulators = { NULL },
> +               .regulators = { "vdda-phy", "vdda-pll" },
>                 .clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>                                 "soc_ahb", "vfe_lite", "vfe_lite_src",
>                                 "vfe_lite_cphy_rx", "csi2",
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
