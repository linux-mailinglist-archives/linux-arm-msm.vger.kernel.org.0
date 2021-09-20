Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB96412A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 03:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhIUBlH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 21:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbhIUBjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:39:20 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC1FC01AE78
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:43:47 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id y47-20020a4a9832000000b00290fb9f6d3fso6276296ooi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jZilAWTtlxib5UiTFHrd1oo5lANOqZ4zGoC3s+xI1Z0=;
        b=c8K6bBkASy9LhBdg5fqDar23fZZpMZq79/5LTgHDq0MLd2uRbU0gbK7LGcsxQnXsKs
         DHHQxTM+/VXWQmDr7vewoXfZj97vgARrJ9JYUl3Kjzn7wuTRkl+ivmsKoYbFZPmVMdI1
         hNM/YX3sLKFUaqWXfXhprJgjEHUAVuGR7J2/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jZilAWTtlxib5UiTFHrd1oo5lANOqZ4zGoC3s+xI1Z0=;
        b=263m7EMUd3pGi1021tgRipjZjEEeEfJmvzJtXeAsyR0MOgVBeXUXLEU+Lu3+ojQC4F
         y5jRf2zaYPdPOGCUBIUugvm7vaC9t56bN2C4Up6U2C2HOP6PZYtQ0dvDHRtsHEoPCd/9
         /qIJRTRjoG2SOj1VNDwtkZ8ut4gOnIHj22aX+rCVWxFuAXeEr7nCWCY2yn2KeYa1Aqi/
         CS+/a3px76dzuVPBh1Wp1pc5/4qnNEx94+cXXXDPsnWJz8DWqSzCyVzAFw8UjQkbjFMM
         tK4+Rrdw3GYjkNVvtyRXOUBGs+OvCRBw5O0dr/xNXGA6vp1arIfvuwmf0KG8bhLh+dBe
         gt4A==
X-Gm-Message-State: AOAM531YJdl1ipLkntyHG9Bw5AWgxIEIOUkbKgpQtcCHHTHywIrRiCZx
        PIPh5J5mdZq2CQwKT0FX7MtAY8CULP9Ap22zg2/uzp+fGxw=
X-Google-Smtp-Source: ABdhPJzJzusg5DvAffEXijW//YgVgAEw7k66hAc3zmtsDWl6cUtcCwqNtXZvRricLpDqAodbFZtg27A4gNFf88jXZM0=
X-Received: by 2002:a4a:c3c2:: with SMTP id e2mr8183815ooq.8.1632167026504;
 Mon, 20 Sep 2021 12:43:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 12:43:45 -0700
MIME-Version: 1.0
In-Reply-To: <1631872087-24416-6-git-send-email-rajpat@codeaurora.org>
References: <1631872087-24416-1-git-send-email-rajpat@codeaurora.org> <1631872087-24416-6-git-send-email-rajpat@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 12:43:45 -0700
Message-ID: <CAE-0n53fVzeAo9ch60_BcfHUvqSRA2SEE-2c8zQhPJwcY7or6g@mail.gmail.com>
Subject: Re: [PATCH V8 5/8] arm64: dts: sc7280: Update QUPv3 UART5 DT node
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajesh Patil (2021-09-17 02:48:04)
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>
> Uart5 is treated as dedicated debug uart.Change the
> compatible as "qcom,geni-uart" in SoC DT to make it generic
> and later update it as "qcom,geni-debug-uart" in sc7280-idp
> Add interconnects and power-domains. Split the pinctrl
> functions and correct the gpio pins.
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
