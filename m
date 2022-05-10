Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 271B652231E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 19:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345871AbiEJRxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 13:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343652AbiEJRxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 13:53:14 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A852C5C679
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:49:13 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso19196181fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=gShKOlubHINbHrOYmWIYwvsPJWlFhoQwvEzs2MtNzRg=;
        b=T5cs+amiki7PVXGowH5NWaY6htj9jBPAfR5Ql4Gbvfa/gT2wjf7YYfXcKilCrDpUvH
         oFVlQQCrZIDrE1Rt19Bd6/mVis5oYTO4QpY3HnMWwuHYFQjbFTyNquuI8A4LFUJe9qg4
         q0zt9D4azDhEnwgIrQocAgIJXEJEibsgPdUBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=gShKOlubHINbHrOYmWIYwvsPJWlFhoQwvEzs2MtNzRg=;
        b=sbQrpInOwHPJXRW1iyJYSsG/iPiueMTGmiu7l6X2Ug92LApmIoPY6s4bNEx9tk0ZeU
         jarK5ru1kfneO+3JlgBIblJ1ZbYHYOhNSy+5zzL2hddxtSwXV684Yy0utW+0SAZvWr8+
         BmZ1pOEvs2fmIvBm0ilj6WPPX6bjSKvDpmwtM/VtXkvZBT/ibTV6B8UYn34iXps1/SK9
         /9GSpGTOrJITxKHqZOtIwjYz9OtYR28j+5q9/hcZKjzaKZKd+i0mmc3CSCU+mlDr8qGW
         uvG/JYDUlJNrpue2pIjAO5Rdu+ZwMjspPW5SzRLGn4llqL4nByKIOx4DsOMa2qvnMlYe
         i8tg==
X-Gm-Message-State: AOAM532WN5WAmjHbTuPm/qjRMFs5v9tfHMaOOGXjuii0FXCrxkW55bw2
        vzmD7uaZbj7z/17fs1r07JCvZkXo0+h3oypbmzgRLg==
X-Google-Smtp-Source: ABdhPJx+X9wiv0k0bhwUJ1wj5I72zRTSe1VIdfpE5kV9YTXYRxqPOTSQ0ocQrq3IFa4KzxVLEepf2VQxRWhddTx57zQ=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr691361oal.193.1652204951523; Tue, 10 May
 2022 10:49:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 10:49:11 -0700
MIME-Version: 1.0
In-Reply-To: <20220505104024.v4.3.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
References: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
 <20220505104024.v4.3.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 10 May 2022 10:49:11 -0700
Message-ID: <CAE-0n533+C2npNy2-GtoP=TSg6_pGjxhFSK9HBn_ByoEe3D_hw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Joseph S. Barrera III (2022-05-05 10:41:14)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> new file mode 100644
> index 000000000000..e0c0ab748ca7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
> @@ -0,0 +1,324 @@
[...]
> +
> +&camcc {
> +       status = "okay";
> +};
> +
> +&dsi0 {
> +

Nitpick: Drop newline here

> +       panel: panel@0 {

Please add the same comment here.

> +               reg = <0>;
> +               enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&lcd_rst>;
> +               avdd-supply = <&ppvar_lcd>;
> +               pp1800-supply = <&v1p8_disp>;
> +               pp3300-supply = <&pp3300_dx_edp>;
> +               backlight = <&backlight>;
> +               rotation = <270>;
> +
