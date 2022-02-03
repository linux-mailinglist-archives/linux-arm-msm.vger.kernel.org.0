Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B57644A901D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355452AbiBCVm7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355438AbiBCVm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:42:59 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CBFC06173D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:42:59 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso3704485ott.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rZKb/URIRb4e+1bq8WG2naPTAIt04R1V4A+/AOQJl5M=;
        b=Zf6GC6P6k4E2dueABypEgo62Lv+i3l2RFwhGUQSmjg+1kA2upWJPfHzShEgEzgvVDl
         Ua1Yv3V6RcxXR83e8HKwdEzppPas66GaBIFyXygHC7Lmka9iDN47zmY3oiW3dD/xYq06
         ql137IYDI4LAC4RnEaU4i7kaE9g22NV9vutrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rZKb/URIRb4e+1bq8WG2naPTAIt04R1V4A+/AOQJl5M=;
        b=BMLb72QIwu4XholmxTzz6QKsUw0FJp26y1CQvyW7aqNy7AJtbnFYzafm8XvXkrrOQx
         rEsI945uSfeesaCI8UaLCbEzu5IEZ8+K3E5yM5JBjoqGIwREEl4HJ+kTME96d+oKGIpS
         8wmTDaRVr6ZLsvLY+xUvS34XyK3BiegaAb5cZ8CCfNWHGu+UNP32fZtkPov/JQwOFRvJ
         pg+u8HHrN0voM1uIFC5kQ59M2YuNBQDVaOVq+XzAmO6RqBh/Hn1plaaHehzkK+V/Bn5u
         NjAZEA/GIzRPdtfbUxJMmb470jB6Mfi7tHkia+qzC3CgCkdpW1sRFvqO/zxlo1YkkNQM
         WkwQ==
X-Gm-Message-State: AOAM532Rgdh2h/3o7jXA359ZxuUc/gAVEwAdIRrIu/Qs1bWH9QMK9NCv
        O9gUBpZO0HmdO/Pq84wv5+cVShDXTFa9QocTTOMZlQ==
X-Google-Smtp-Source: ABdhPJwOrdMT6DEZpuC4Xl8C+ncm9GmabxBxkq3j/gPjgxLIYcBg0xtPPRBeD0/wfYLGAK9zt/aT/y71aEC8gWzGQ54=
X-Received: by 2002:a9d:6f06:: with SMTP id n6mr40779otq.159.1643924578513;
 Thu, 03 Feb 2022 13:42:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:42:58 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.11.Iecb7267402e697a5cfef4cd517116ea5b308ac9e@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.11.Iecb7267402e697a5cfef4cd517116ea5b308ac9e@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:42:58 +0000
Message-ID: <CAE-0n51aXPJRBHsmjEs0t4--bfobz6xhTCFjKNN77O1adtq--w@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] arm64: dts: qcom: sc7280: Add a blank line in
 the dp node
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

Quoting Douglas Anderson (2022-02-02 13:23:45)
> It's weird that there's a blank line between the two port nodes but
> not between the attributes and the first port node. Add an extra blank
> line to make it look right.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
