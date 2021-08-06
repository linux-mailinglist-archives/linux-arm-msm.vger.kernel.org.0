Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B0E3E305C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 22:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhHFUeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 16:34:07 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:36549 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244936AbhHFUeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 16:34:01 -0400
Received: by mail-io1-f50.google.com with SMTP id f11so13778409ioj.3;
        Fri, 06 Aug 2021 13:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S7njTycsd1XL9PBVTCJA9Q/+rWiN/ju9cjzujGekEbU=;
        b=PqofKHP6j6id8LSJ8TGtJl42UZzMTLUPFg0PGf2+tFGUAWv8qQ2TwLkB5v3c14SZ6X
         fpVLIL3D8KuR5mZgo+GRzsqRDF6rIagjcWuofBqe5P6vgySme2f8LgHe1G1TrbMtiluT
         gwm6N3S7QSS1sseCBbFgEPG01lCT3gYJy2jyOan69s5k1KKHFgeLyfYDNG33QBmXTCpw
         ++PG/XqjGbTweN5euyRlHf30t191E5OWTvgUY4I6tavHMcolyN82CUSK5SA32CcAv8t+
         hRtz1SVBzeNt/IBM+jVh+tNBgCb/8J2oEw9eChkC9ef36EIQBiYxbgkQmz2yhvrvhuE9
         NrRA==
X-Gm-Message-State: AOAM533QxrJ6xtgDBxFv4YmD2MncxStgYU5L5xLK3EmfWAoLbHmETElb
        ytq2HK8VriPUXFYtroSYpQ==
X-Google-Smtp-Source: ABdhPJy+9mDnPUP/HP78FvogBEPKf3tNkk5YNN1moTUm9PWfvvig2Z+9QKjZqD+dQTYPGza1p+KBsA==
X-Received: by 2002:a6b:c906:: with SMTP id z6mr452309iof.7.1628282024853;
        Fri, 06 Aug 2021 13:33:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u12sm6294241iog.54.2021.08.06.13.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 13:33:44 -0700 (PDT)
Received: (nullmailer pid 1747070 invoked by uid 1000);
        Fri, 06 Aug 2021 20:33:43 -0000
Date:   Fri, 6 Aug 2021 14:33:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        phone-devel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: qcom: gcc-sm6115: Document
 SM6115 GCC
Message-ID: <YQ2cp7Ex0EQsmu5A@robh.at.kernel.org>
References: <20210805161107.1194521-1-iskren.chernev@gmail.com>
 <20210805161107.1194521-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805161107.1194521-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 Aug 2021 19:11:06 +0300, Iskren Chernev wrote:
> Add device tree bindings for global clock controller on SM6115 and
> SM4250 SoCs (pin and software compatible).
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/clock/qcom,gcc-sm6115.yaml       |  72 +++++++
>  include/dt-bindings/clock/qcom,gcc-sm6115.h   | 201 ++++++++++++++++++
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
