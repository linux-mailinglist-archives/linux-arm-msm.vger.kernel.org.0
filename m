Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73B5421B7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 03:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhJEBNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 21:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhJEBNi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 21:13:38 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96190C06174E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 18:11:48 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so23914152otj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 18:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JF6vyOXESxtfPHWab3e07TTjv7Vg3ZVZyUb4GlwIoFs=;
        b=cXaB7P7U3MKxhY/Xzb3aCV3IQ1p/c/QFk7Fteow2gs0Zy+03BHtIgOGazJV5pmbDuL
         lDxZg/K+5T/PAT50O1qBp4EC4R46wrcpzlhiX6dC4siXKprLmNfWLB0uPBQyFd7Xv5/W
         Q/dD20j+haqagqa05pclC8RFHt7CeFFwwf5Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JF6vyOXESxtfPHWab3e07TTjv7Vg3ZVZyUb4GlwIoFs=;
        b=M9rAuu/UjmtlJq0Cmp7T3icQ0FfuW+D9Vv6lAhsC5amdiXQV/UnxXQix0MVHQrb1JJ
         Lvs2tKHmAoEw1MllHtDnXrrLc87lehcsvOOqCBWcKMZP1VBNeNxxQ1zSCMgB2cXaSwZI
         2rN/6lm2N+Eu+lP8Re882JA+YR6HRUxmXMoSZcVZmEoDkx78lhPu0Vgna6Ab02WpMrpU
         IunMQWksMga3ZL8wta6BNhk2s7tN/f87kGLpvw95JJGvYvFlbIBLbqCg0d3hOItrzMMq
         6/xFm8E+4tnX3kWd2LAmZXe7H04RfRmOlJ07sD8PSggbjIRfPUJn6lTAzpARcPHUemmr
         xXVA==
X-Gm-Message-State: AOAM531BCWvWnUR8Ow3Oi4DdAdRIlObB8C2aUQnRj43dDKIQtRkiX3/j
        yxZBf6oK0+Jrz/f2BFIhnwaCdF6iNI484JmH05YoGw==
X-Google-Smtp-Source: ABdhPJy6i+fPzH6N8khmOKxP7d2oPe0DSUpWQzfCTqacbniPOVIFqVrcjgwadOtNRRoIUW5BOUwS3sA0fBv8QXKRtQs=
X-Received: by 2002:a05:6830:358:: with SMTP id h24mr11416616ote.159.1633396308016;
 Mon, 04 Oct 2021 18:11:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:11:47 -0400
MIME-Version: 1.0
In-Reply-To: <1633376488-545-3-git-send-email-pmaliset@codeaurora.org>
References: <1633376488-545-1-git-send-email-pmaliset@codeaurora.org> <1633376488-545-3-git-send-email-pmaliset@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 4 Oct 2021 21:11:47 -0400
Message-ID: <CAE-0n50CBhdq3fbtygfzb0m8+bz3244-mYwCtVPjs_CfNaK_NQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: sc7280: Add PCIe and PHY
 related nodes
To:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org, svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2021-10-04 12:41:25)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 39635da..e4bbf48 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2676,6 +2787,12 @@
>                         gpio-ranges = <&tlmm 0 0 175>;
>                         wakeup-parent = <&pdc>;
>
> +                       pcie1_default_state: pcie1-default-state {

Maybe call the node pcie1_clkreq_n: pcie1-clkreq-n as it's now only for
the clkreq function.

> +                               pins = "gpio79";
> +                               function = "pcie1_clkreqn";
> +                               bias-pull-up;
> +                       };
> +
