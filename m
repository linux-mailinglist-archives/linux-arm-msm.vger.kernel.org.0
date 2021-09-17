Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB25410029
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 22:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234785AbhIQUDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 16:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244011AbhIQUDx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 16:03:53 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C54C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 13:02:30 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id y18so13715757ioc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1UMbMc8OAj14RDhbE254NcvzwuTcA6/D0lnRvB23mQ=;
        b=evClt5J6dFFrQPKBBVCoFxqTJwegs8huDM9pX5uOxtetVMSX/DzJB6dQYczFDSMKuP
         0nvtA2qnccJQsgAPlE1IAc6DZuXXO6oOlYkaa3s9XTabjzfysVl8xz419KIb/N0AqdPz
         ZwbYoP4LB+0abJLIY3j56sLCv7LSkT4qNai7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1UMbMc8OAj14RDhbE254NcvzwuTcA6/D0lnRvB23mQ=;
        b=Ynk64YMDR4PYUa7+1np4nyLVUdXNlZ4u5f8D/UDXlyLess++t1/q0r+3rFZRXfl6dI
         hji7Nxz1hoPEanwtst+Prva7C7yfRdUCItLjX+5+25yh5RxivQW+J8WLckgu5z5ILgxI
         SKGr4hLMRzu9VfVz98lCSkqlu4wTzf+gpOt/z6GHVnHd6eR+KtwwL/XaTkRQJX5v3Csz
         iD7lpLGrhy/qwRMv+PLcEhoz7il+T1qAOVF0UfDwz/LuEE6TfIIdJMbHvPf/pa1JWFQ0
         f5tjeWlfqQQBZyx92/NNx8tFPIqvg1aJ01n1bPYB3HKKX3OdvYm9zX3qQctseuF0l+as
         yakw==
X-Gm-Message-State: AOAM532aPblD8QK7OH63QwOKXc/8xYYicMiwRDw/I5CdlDfIWdy1X/Fd
        Ptl6tIX5f5s0MLuvVN46Pii5+DdU83J5ig==
X-Google-Smtp-Source: ABdhPJyFRUUBD5y2sN31RrKEmx6XQDwueS4Qc3c+Bl/9Cj2UC7an6h6Z+Kb3Ojps9lzLLL50ocJwVw==
X-Received: by 2002:a05:6638:1e2:: with SMTP id t2mr1249088jaq.21.1631908948910;
        Fri, 17 Sep 2021 13:02:28 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id a11sm1872998ilk.18.2021.09.17.13.02.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 13:02:27 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id j18so13551115ioj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 13:02:27 -0700 (PDT)
X-Received: by 2002:a02:ac01:: with SMTP id a1mr1270459jao.93.1631908947377;
 Fri, 17 Sep 2021 13:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <1631872087-24416-1-git-send-email-rajpat@codeaurora.org> <1631872087-24416-2-git-send-email-rajpat@codeaurora.org>
In-Reply-To: <1631872087-24416-2-git-send-email-rajpat@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Sep 2021 13:02:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-7-OS0uDFDR+_AksgqLvTVCx0+Z5pbmNCCvqwBrvgBg@mail.gmail.com>
Message-ID: <CAD=FV=X-7-OS0uDFDR+_AksgqLvTVCx0+Z5pbmNCCvqwBrvgBg@mail.gmail.com>
Subject: Re: [PATCH V8 1/8] dt-bindings: spi: Add sc7280 support
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 17, 2021 at 2:49 AM Rajesh Patil <rajpat@codeaurora.org> wrote:
>
> Add compatible for sc7280 SoC.
>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
> Changes in V8:
>  - As per Doug's comments, added "qcom,sc7280-qspi" compatible
>
>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> index ef5698f..31711fe 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> @@ -21,7 +21,10 @@ allOf:
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sdm845-qspi
> +      - enum:
> +        - qcom,sdm845-qspi
> +        - qcom,sc7280-qspi

Other than the fact that the indentation is wrong (as Rob's bot
found), this looks good to me. Feel free to add my Reviewed-by when
you fix the indentation. In theory you could also be nice and add the
sc7180-qspi at the same time, I think.

-Doug
