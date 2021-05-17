Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799AE386C67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 23:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245293AbhEQVmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 17:42:04 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:33699 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbhEQVmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 17:42:04 -0400
Received: by mail-oi1-f170.google.com with SMTP id b25so7896224oic.0;
        Mon, 17 May 2021 14:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yUN0fqrTxElDEO12Fng6p1MRYBZ1KCEP1NdaNKcV0iQ=;
        b=EsOjHPXXCaz2XjnzvOGA4GaL8YdjfeZzUbQvmtGxg6o3+SG9xsxM5wz+rxxUcLj3k1
         y1T44XHFBlwA4WjpBxHuOROvqxhFN86WHw0qO1Fb5x+sVwswMSvTV+l+8Li5UErZok6z
         YrmOyQb/r0EAU99/GWBQQDcxiL54qf32TVyeq4LrLdkMdjw5Oc931N/dachyFjeWSKna
         pxYmwMGchav3UcGJrsgTUXecoRhoCFyBwEgJeWU8xVq436d9EtEU7g/9dycErg8exW0e
         oJ9MinQoDSXLSpMIEEfKwhSj+S50kFcHSN2Y/oh5RS1SMVhgD9AcS2ryr/3svVxZ9Uxj
         G91A==
X-Gm-Message-State: AOAM533WiGBP8pWn5C3V1Bak9r5pyancBqFzfwh8L131nzjvhxWBIZCs
        Qjs96Wpi0L0AyblNtsiQyf8liMBiRw==
X-Google-Smtp-Source: ABdhPJx2H7OQ7/3ST3OABk4Iu6mFxGH3X6TdWosJdDKDx9qGf6vbKJGhFvsPapny4okRNFIXuw2Mow==
X-Received: by 2002:aca:5758:: with SMTP id l85mr916863oib.120.1621287646951;
        Mon, 17 May 2021 14:40:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c17sm3485875otn.45.2021.05.17.14.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:40:43 -0700 (PDT)
Received: (nullmailer pid 3249683 invoked by uid 1000);
        Mon, 17 May 2021 21:40:34 -0000
Date:   Mon, 17 May 2021 16:40:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-sm8250: Add sc8180x support
Message-ID: <20210517214034.GA3249633@robh.at.kernel.org>
References: <20210511041719.591969-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511041719.591969-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 May 2021 23:17:18 -0500, Bjorn Andersson wrote:
> The display clock controller in SC8180x is reused from SM8150, so add
> the necessary compatible and wire up the driver to enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml         | 1 +
>  drivers/clk/qcom/dispcc-sm8250.c                              | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
