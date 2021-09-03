Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F140D40040C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 19:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349974AbhICRYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 13:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbhICRX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 13:23:59 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA8CC061760
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 10:22:59 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so61977pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 10:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V8XLfChI67FESwmGmsFsqJrUTudQEofQRGSRaywZdbM=;
        b=EsfJ77ID2EdkHcKDWm+iAi4npWxw2yXczIj1qxaX7ibyOCLM4TtuumhIgVtyTe8jak
         Sh9gAJ1LE1aP44u0ApdbeEAPjVxQzQggtGUGLm4dmVEp+ZlPAjrl0A5je+pOhsOTrMDZ
         UGJND80bLkGejzFm6EAeLKuj9EvPqoCTlc+DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V8XLfChI67FESwmGmsFsqJrUTudQEofQRGSRaywZdbM=;
        b=a1T1EtW4XYgIEXK6OYPPSHFe7gPKJBA16TNyDWjHwYhbj2joeCHtlrfaKxVXtbFj1E
         Q27TFaL1FAKRgVQ7fGQ46x+jW35x5TYCtZUz8ZDsK4TeKmW9xcPN/FYQ2x4f1UroIBhY
         9aNP+qW8knXwvNPvc4icXeTA3Z2//kXjkmjDpO8YadDbauztmW7aHGH7ed7sdEnjiEVB
         Xtn2PtGo3bUY7jlW5yZNP4SD1YTsw17BB7Pa5+8NvwDq2rMFYVvUUoZ05FWgPznJ0OFk
         AYIFpJnxTMrS/QsUJgw7UnsyzjeaIVcy0YBwAHVqz8ErX7xH25j5pD6a47h1SUyB8N60
         jPxw==
X-Gm-Message-State: AOAM532mUmNeWxIeaSbOWklk+GNuVrydMY9BPjpQSm8fWOXlj8TCax4g
        ShhnJYvs5YE0S/eDwnz2cirl2w==
X-Google-Smtp-Source: ABdhPJwo9KZ/kOYSg7o2f2x4DvFDJnbuPtPxnSCdGNNyKR4PBHqLBIFgvWnZ61uo9pdnINSWB9A+4g==
X-Received: by 2002:a17:90a:4481:: with SMTP id t1mr19889pjg.109.1630689779175;
        Fri, 03 Sep 2021 10:22:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:80b3:9f00:3170:fd8b])
        by smtp.gmail.com with UTF8SMTPSA id p11sm370053pjv.41.2021.09.03.10.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:22:58 -0700 (PDT)
Date:   Fri, 3 Sep 2021 10:22:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V7 6/7] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
Message-ID: <YTJZ8YkjrCmyzNjG@google.com>
References: <1630643340-10373-1-git-send-email-rajpat@codeaurora.org>
 <1630643340-10373-7-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630643340-10373-7-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 03, 2021 at 09:58:59AM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 709 +++++++++++++++++++++++++++++++++++
>  1 file changed, 709 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 32d1354..8fe54bf 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi

> +			qup_spi8_data_clk: qup-spi8-data-clk {
> +				pins = "gpio32", "gpio33", "gpio34";
> +				function = "qup10";
> +			};
> +
> +			qup_spi8_cs: qup-spi8-cs {
> +				pins = "gpio35";
> +				function = "qup10";
> +			};

As for wrapper_0, I think we still want the nodes to configure the CS as GPIO.

If there are no other reasons to re-spin these could be added with a follow-up
patch, so:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
