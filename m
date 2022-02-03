Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5C04A8FC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354766AbiBCVYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348022AbiBCVYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:24:02 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F19C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:24:02 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id x193so6266292oix.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mFCoCNzXJqQmBPGmpGLMQ/uDTw/arZ60RPDkmkAmvcM=;
        b=X9B+VWIM+Ueb2wMTtVcqXGBXMsJvg92EaCbJS5Lrb8sY0n7o30x+gUx+Q6cvRrxjfh
         4RFW7XwAz8boyhMLjyTEYSZWuEQDta0bt/3Cvl4Cck1g8VEKzwJq1CISOmCeTuFYHIyb
         EkOB1WN1V7lWrYfL5CP9zFHTMbOq8icSYgmUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mFCoCNzXJqQmBPGmpGLMQ/uDTw/arZ60RPDkmkAmvcM=;
        b=dkWXwqbYflKVdytJpeGQqaQDhhgFUMzk5KgZxAqBMX6jGtubhGKNhd9xnT9TmPOMd9
         Hwzl2k75KvRw60f3PResUyPYoDTnnRxew1XFF0ZezURk6Wg1UQnLN3c7C9O0kVzKlvqb
         n6B8qs5NnPJq/HzOfSYAAXuwUeOzHpx1XEqNsbEXNKmU4wJMHaaIUSFwwjHUS2Jzm6ib
         vWh1yVM4i3q2Bv85zvGerSZBcfY2l/WKmimwv2rEG1s5sBF0rfSXnAZJV3e0pwZQHTP+
         6d/yErXjybaAKP2xj7TGiIYgxYulVercMEjhC+zV0n6TTt9YtOZ/AnVOprZqGw+SnBkK
         TMCw==
X-Gm-Message-State: AOAM530f6OO0HCsXrfUxskwbh4qmzdyegEgoHZ+Wm+w6uqy6nUBvoXzK
        mdjKRFxFKUhF1bYG98yMP7ZAmts1Ti76kWHhuHGT/A==
X-Google-Smtp-Source: ABdhPJxOyWKbVr8mR+7m+pTrPwUwsXvdE1QAEYRkR9DKBNuxJ6lIKEDLx782mJcqVTw8QOn4+56Rzvr1UzlZz8BO8Z8=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr8697745oib.40.1643923441665;
 Thu, 03 Feb 2022 13:24:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:24:01 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.1.I7b284531f1c992932f7eef8abaf7cc5548064f33@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.1.I7b284531f1c992932f7eef8abaf7cc5548064f33@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:24:01 +0000
Message-ID: <CAE-0n52tvHrr-Mj+RssP_OpxZv9m3puUcwhtQxd9PjTsZ==K6w@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] arm64: dts: qcom: sc7180-trogdor: Add
 "-regulator" suffix to pp3300_hub
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-02-02 13:23:35)
> All of the other fixed regulators have the "-regulator" suffix. Add it
> to pp3300_hub to match.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
