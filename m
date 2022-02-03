Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839434A8FE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355048AbiBCV2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349013AbiBCV2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:28:37 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCA4C06173D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:28:37 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r27so6178158oiw.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+RbntWRN79q5RPV05clq8Fh+vWUqIzQLRg1FUcIv2nc=;
        b=DzOvqLUzvBFFhrrYuZbSi6LCdUBB0DYrzD1jLOr4gecpNX9IP5gcYmuc8XADmjhLJt
         P9H7A8pub1rIYhb551hGne2YtZ4nXoGVw+xbM1C5URsCB6E5x5Y/63dvD+vwlDqtl0bk
         oBz1zdJPIhZ4mrMkzkTHWc9qNhkzuQLnnkbJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+RbntWRN79q5RPV05clq8Fh+vWUqIzQLRg1FUcIv2nc=;
        b=VExQcVkjQxXm61s6tVMYvIZ8fIItO/VaYWWeio9YZPT+pJ+V0ODb6mlaUlqNabuTeY
         NHe1h6wlXansIsL0gqJEdPZgckyvkry2CIj2Jq1/Y8qRxhn+JaEIZ02UfkZ1cmUslBef
         pCjTx1fDpIepi+rbRYFGR1T6l4BtboCcjQBxseF/Vv37kXBhRgANri3CPgg6KZa/VWyY
         oWDiFFtMxy9aEL7PKf+gDaLwS5UombVMFUrK7fA2VIHD+bE8KHnGjYgqxIvUsYE10DeJ
         H4tDMQa6EeUgj8O2JsFk8j7pewcEDV/N8MrQK4lNDa4iG1QbCqLTKlMb8R+536N5Z7+l
         qw4g==
X-Gm-Message-State: AOAM533Ohd0xS58c4DrecYB685foSNeLBhtqZ7dSZ1PtmzpYLJUuJdEi
        fWa7QKIz1FDtF6fCdW0CQoAF/nJxwUpnjWAMm2BYTw==
X-Google-Smtp-Source: ABdhPJyoycbirgh261+2gDWFrRkCeDwAOW8Ic+JLG1xma2uKUHeC233b0BA34TjioVfbIXlqPohxc9p71R9X26sA5MY=
X-Received: by 2002:aca:df82:: with SMTP id w124mr8789833oig.112.1643923716194;
 Thu, 03 Feb 2022 13:28:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:28:35 +0000
MIME-Version: 1.0
In-Reply-To: <20220202132301.v3.5.Ibaf8a803802beb089cc6266b37e6156cff3ddaec@changeid>
References: <20220202212348.1391534-1-dianders@chromium.org> <20220202132301.v3.5.Ibaf8a803802beb089cc6266b37e6156cff3ddaec@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:28:35 +0000
Message-ID: <CAE-0n50CvqhJ5e4zXGhvABg2_CJc9QDHTU2ZiJUrwahyBLROaA@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] arm64: dts: qcom: sc7280-idp: No need for
 "input-enable" on sw_ctrl
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

Quoting Douglas Anderson (2022-02-02 13:23:39)
> Specifying "input-enable" on a MSM GPIO is a no-op for the most
> part. The only thing it really does is to explicitly force the output
> of a GPIO to be disabled right at the point of a pinctrl
> transition. We don't need to do this and we don't typically specify
> "input-enable" unless there's a good reason to. Remove it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
