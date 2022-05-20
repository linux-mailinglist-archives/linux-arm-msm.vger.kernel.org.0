Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9CC52F47E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353485AbiETUiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239375AbiETUiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:38:02 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC65D029C
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:38:01 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id t144so8007400oie.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=XdQ54rbpqYvGNbI94ee1Aky8XoFj7o6SUF46CZVfiN4=;
        b=hGVbRnhuCUsA7bBxm1jXglNj0M4A5uWOLbZL5AIXbyqoc+LL8xMyGTWkc0jBWM9G5I
         cb8IsWVIGCSkYX3UH6k43iEJWn3FK5SNewHW81MOG6KdqiinW8vnxXh3CWbOShRTsj/y
         qU20Tb2v5yBUH3Nnhnb4zmtAJ0C6mN+BTuMb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=XdQ54rbpqYvGNbI94ee1Aky8XoFj7o6SUF46CZVfiN4=;
        b=dwPGBmIP1UHTNSw0HVEQ+gdc33ThTO/yhfzX9bj0ZzkVBS/yodIqfn72qKTgV7zlNP
         xNsbT2PBpX4v3r0yGa5biVm+AI2BTAVSjQrFEsJ2pvX3cUsZoBxPy1WTN6ww8Bh7a2+P
         bRFjtSAE+YHqT/yyavEyb/cQky2k6KXxhHrvAwxbr9eOW5tOqt8MG6+JI2YO5zVsRl8b
         OmgmGlVmkdwew/EoWAc3TJOI/zbvLhPwdZ3ZEnBTYrlt2t7n9qU5wPsj98uOK266vIPt
         s0BTfcO3vZu22v48xr4sKitKr42kwgfOB6IghqH8wt26Tlt/o8Fo6dx094b/2lucdiOd
         jSQg==
X-Gm-Message-State: AOAM533eUa1+82CM+ui8cALDQ3w/whsTiC1iGe6rNmm5H1xgbV93cB4U
        lKQgY1fosAD8LevpYXHPepJbDk0aQH7RqqID38GY4g==
X-Google-Smtp-Source: ABdhPJx2ZXh9WbynSbhPjcPZhEQqIdnt2/D/vPTAW+3Hd/TEuhNZ0OKfdeoUPFA1x7Ghd1ESi9sF62pOTWaQMba6H08=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr6651718oib.63.1653079080739; Fri, 20
 May 2022 13:38:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 13:38:00 -0700
MIME-Version: 1.0
In-Reply-To: <20220520161004.1141554-2-judyhsiao@chromium.org>
References: <20220520161004.1141554-1-judyhsiao@chromium.org> <20220520161004.1141554-2-judyhsiao@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 13:38:00 -0700
Message-ID: <CAE-0n53e0bq_MbfgZYdxatP8CpGVMKkBKOnSDOV+MvbBFB6wOA@mail.gmail.com>
Subject: Re: [v2 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf
 settings for mi2s1
To:     Andy Gross <agross@kernel.org>, Judy Hsiao <judyhsiao@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Judy Hsiao (2022-05-20 09:10:02)
> 1. Add drive strength property for mi2s1 on sc7280 based platforms.
> 2. Disbale the pull-up mi2s1_data0, mi2s1_sclk.

s/Disbale/Disable/

The commit text is a list of things done but no reason why they're done.
I'd appreciate more freeform text with a blurb why a drive strength is
chosen and why pulls are disabled.

> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 9cb1bc8ed6b5..6d8744e130b0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -612,6 +612,20 @@ &dp_hot_plug_det {
>         bias-disable;
>  };
>
> +&mi2s1_data0 {
> +       drive-strength = <6>;
> +       bias-disable;

Is there an external pull on this line?

> +};
> +
> +&mi2s1_sclk {
> +       drive-strength = <6>;
> +       bias-disable;

Is there an external pull on this line? If so please add that details as
a comment like we do for other external pulls.

> +};
