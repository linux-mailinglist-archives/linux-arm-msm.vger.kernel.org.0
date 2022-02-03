Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780534A8FEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355114AbiBCVaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244523AbiBCVaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:30:05 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3FEC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:30:05 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q8so6158367oiw.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rkTzeavTVwFkxzAS4iEW6aIk8hmO+bZZIXQ3Z1hc49o=;
        b=aosHpZuq8uiinuv5XH+lUVb1LGaBayOF8tU7fh9FmPgsKZi5XRDan352WhIptDRocn
         sXinzmGW5mtd+mkDCJDQ8l5PU+P9VR7RHE4VaaF+PryB+vMkjSkf0vSB6YNnVv6Cjeo/
         LylUwwNfj+kyop4E8j/uiVNNFsGaEIDmJuXf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rkTzeavTVwFkxzAS4iEW6aIk8hmO+bZZIXQ3Z1hc49o=;
        b=WpUpzsRFhviobp7ciTNB+gl//cWgOj0Xf2yfZK9R/dBH/5Z0BtCRBIfccEgY8A3LeK
         qnMRR4BA/kck8SeipLWjzTk1jUKN0/LTjvJL7K2CuV1E83vPFDitPz5Q2tEc9xkTWa0l
         jrNWrttzor1ywZFnQdGsE1xWFTcoUtglOoR3NxcP4+to/P0CKrYHhxA/ZZN9xRl9sZ0U
         gHxnXcqxZ7ZnAP6ug7PpWtVu6VX8jgq9HWmXHVlzsn+YplY9ANJ0BJMYabTISjZwh2sV
         IBQ2L3JPAbbcDtYOh1QrSz4/pKbB+JOQbYrDjzlm5yhkkGIr1MNE/+P0Ju30wRRhuHBX
         YR2A==
X-Gm-Message-State: AOAM532U/3Z5Ik9/pF67eD6wH6bfijqHwFPzsNXLp5kkiU8QKEHOp9Iw
        09LlGznRRXlnyyJf0WF4sESEhbFV3Al1gFejJzzLtQ==
X-Google-Smtp-Source: ABdhPJwrU6oEtqZrhwLNPFXnJxYbf/FCpwiKJ1jVB9W6oPnpSgtkV35IBS7X/R4Rc8PXhe742p8eefh1QgM6qFcmFo0=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr8710371oib.40.1643923804731;
 Thu, 03 Feb 2022 13:30:04 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:30:04 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.7.Ic84bb69c45be2fccf50e3bd17b845fe20eec624c@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.7.Ic84bb69c45be2fccf50e3bd17b845fe20eec624c@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:30:04 +0000
Message-ID: <CAE-0n507mWRJTNu2zG=nwXFfaPX3KBm6DKDQPD8HBsHGd1HhYA@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] arm64: dts: qcom: sc7280: Add edp_out port and
 HPD lines
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

Quoting Douglas Anderson (2022-02-02 13:23:41)
> Like dp_out, we should have defined edp_out in sc7280.dtsi so we don't
> need to do this in the board files.
>
> Like dp_hot_plug_det, we should define edp_hot_plug_det in
> sc7280.dtsi.
>
> We should set the default pinctrl for edp_hot_plug_det in
> sc7280.dtsi. NOTE: this is _unlike_ the dp_hot_plug_det. It is
> reasonable that in some boards the dedicated DP Hot Plug Detect will
> not be hooked up in favor of Type C mechanisms. This is unlike eDP
> where the Hot Plug Detect line (which functions as "panel ready" in
> eDP) is highly likely to be used by boards.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
