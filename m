Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70765515D82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 15:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241955AbiD3N3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 09:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345995AbiD3N3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 09:29:19 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B5836169
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 06:25:56 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2ebf4b91212so110395247b3.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=64feOhocvLGn2fJsVd3fjrvb0tRje9mApVjwOF26BKs=;
        b=azUNnWcXCkr97DjIquiDIVbjSMXybkEmBz92ZEbhQT7Qicj/5fgDg4zJHbM2MoRkEk
         EinO0l6MFR1UyE2W8rteWaAsShr/qYH0PeEnHTPhR5GJ3gLF8/AYyPtaPlPyl5O/8pa/
         ClRNPRLvdQUVQ612nCoTt8v0EnY5c+8kYc/3X15ClSfxF9RMjhQlnervWD+Ne20R+5Ft
         XHNI4SJCW34yasJkOfLrCYRdPEpupz0QRTBp4SugOonFsT2SLhwlysc9VE9P5wi+g3xZ
         gmmq/YxQeblZwcLayc9HmNM3JEj/e8h6PcJoNRizeU8m1lu9QBAqGWEFwV+DMioCkmA+
         3D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=64feOhocvLGn2fJsVd3fjrvb0tRje9mApVjwOF26BKs=;
        b=I26WapNJWT52KdQx0FP/GsP92I7Vr9O4vwWFfDjQ9Tgrf/msEleNnGTbzoPsQr1Kj8
         z9qZXISgWfIaiHlfWU1BlBH24zT7+I4Cl98x1hTCbOs2orFpyG4Nnpa0GKODEJtLR9LZ
         FrPp5KjBlQDWFbsq+fMDTewcnDjGcimIvOu/ihxGhZtfNp1R3BnmOS3UUjnswIfgW179
         pKliA8oWvqo5/ZiX2ql0ZtSIY1SpqfgSG2HyBuMWDkNITCSQSCvxyHg3smIH/yEEO9bm
         gsgfjJEZuAiH4BW+ZIjz8dFiE6Ad4l8C6NFGQSZd6glaahjFrgFix1S15JHFkT1hY05W
         wt+A==
X-Gm-Message-State: AOAM531G18EzGtMUvhpucg6qxHaPs7zivOLpNwWXMKfVRr8uQBiyGfxF
        37Jf0T52Y+hGoZpcdRtwrW3ImyiGua6+sLco45HIa9R7VCBU2A==
X-Google-Smtp-Source: ABdhPJxoi3jJZl7joWc/2nnCDUb8N5KSDQA9caiC10LPVX4ArV5FkST7tiOSOjorT56fLrnw7cJe/TJuYyR9luW9+0Y=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr3781507ywa.101.1651325155685; Sat, 30
 Apr 2022 06:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220430055118.1947-1-ansuelsmth@gmail.com> <20220430055118.1947-2-ansuelsmth@gmail.com>
In-Reply-To: <20220430055118.1947-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 30 Apr 2022 16:25:45 +0300
Message-ID: <CAA8EJpoxddxoWnX+aQbzeAQH_g04WsDqtQcY9vyu-XGJLfibkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: qcom: replace gcc PXO with pxo_board
 fixed clock
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 30 Apr 2022 at 15:59, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Replace gcc PXO phandle to pxo_board fixed clock declared in the dts.
> gcc driver doesn't provide PXO_SRC as it's a fixed-clock. This cause a
> kernel panic if any driver actually try to use it.
>
> Fixes: 40cf5c884a96 ("ARM: dts: qcom: add L2CC and RPM for IPQ8064")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 996f4458d9fc..e6ca8d1d1c5f 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -304,7 +304,7 @@ cxo_board {
>                         clock-frequency = <25000000>;
>                 };
>
> -               pxo_board {
> +               pxo_board: pxo_board {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
>                         clock-frequency = <25000000>;
> @@ -782,7 +782,7 @@ tcsr: syscon@1a400000 {
>                 l2cc: clock-controller@2011000 {
>                         compatible = "qcom,kpss-gcc", "syscon";
>                         reg = <0x2011000 0x1000>;
> -                       clocks = <&gcc PLL8_VOTE>, <&gcc PXO_SRC>;
> +                       clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
>                         clock-names = "pll8_vote", "pxo";
>                         clock-output-names = "acpu_l2_aux";
>                 };
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
