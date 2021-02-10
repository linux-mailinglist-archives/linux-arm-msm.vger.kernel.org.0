Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2C0316952
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 15:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhBJOmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 09:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbhBJOmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 09:42:40 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F870C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 06:41:58 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id t18so902104qvn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+O5sJf0GQNw99asEPwHvnMpnrIoSGqJzUV39jsbMtE=;
        b=L/5VOG9C3vJHZYjVRUWRXcMXxsARSTCaRWq8plo6cuUBt/o/yiMxD2yvjFpuGHj5iF
         l8hdrKliZyWM0onXf+cYZnHnHIiV2ONT2iK0//zAtUL9fNEybcHTjbkZU04CDdU63oOm
         gU1nT9pxzWGfGz9a1d28lMXbp/ziCcjdv4AEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+O5sJf0GQNw99asEPwHvnMpnrIoSGqJzUV39jsbMtE=;
        b=asZNlbATFuMMTODV1FSHflOCnqsUjw2/URprq3e5JeCJjgcVuAMcB28QK/UQ0dYsFl
         2+mtnwO8aHr+lwkUyW0pbBQdUJOU84hWrodA0JU/m2ecDJTlSuabK7FPO5CKJq3RnLXv
         ZpOIqeyNjXWajt9NP2WKgh6pJsEDR1yc92qe2hMTTm+sY7Uxpud1cysOVU1KRnoAkfGN
         54ENspN1n2oVFGz4CuMxfAhjK1+XHdOKqoMEWIqW7hLCbXdf3A24u3zruUqg8cLmXYKh
         Iy7XJsAjrVC+vMpqTieS++4O77DqpAZslwNTGSj9QTXFiHbVMAoPf1KaFmqLyL/x3pp5
         Vy6g==
X-Gm-Message-State: AOAM5300avkvZA4y3UEyRox5X+96krgLmJz0M3zkeO3bY6p90mhn2wYd
        CPItNmSVj2gMdYMDHGKaM2L0nl5NbFqWQQ==
X-Google-Smtp-Source: ABdhPJw/WWJfWS68Jk7/FX+M1/eYRzlJlqvsJ2Q3gjx/VkFGgTW6fqvtlVc9aIKWmd6S1qxH/CWmng==
X-Received: by 2002:ad4:55aa:: with SMTP id f10mr3298233qvx.46.1612968117336;
        Wed, 10 Feb 2021 06:41:57 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id o12sm1548970qkm.81.2021.02.10.06.41.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 06:41:56 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id v5so2229246ybi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 06:41:56 -0800 (PST)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr4455012ybg.476.1612968116499;
 Wed, 10 Feb 2021 06:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org> <20210210133458.1201066-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210210133458.1201066-2-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Feb 2021 06:41:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W5FM5ngNicD=HA8pZ-HkzCeLpF3bpYquJDf7hosL4e5g@mail.gmail.com>
Message-ID: <CAD=FV=W5FM5ngNicD=HA8pZ-HkzCeLpF3bpYquJDf7hosL4e5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 10, 2021 at 5:36 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> As discussed on linux-arm-msm list, start splitting sm8250 pinctrl
> settings into generic and board-specific parts. The first part to
> receive such treatment is the spi, so split spi pinconf to the board
> device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   6 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 300 +++++------------------
>  2 files changed, 66 insertions(+), 240 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
