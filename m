Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61E43C636A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 21:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236267AbhGLTQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 15:16:39 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:43607 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbhGLTQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 15:16:39 -0400
Received: by mail-il1-f178.google.com with SMTP id w1so18679898ilg.10;
        Mon, 12 Jul 2021 12:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A/ti7YMTwDsmvSfnd0XpCHfTDnupbMR/HAk/uSkogbI=;
        b=AmrzGhsTp+DI5lDXpP0oPoYixutADzTpaVe60uCkO97n90kImY21DWo/jkF/klycDb
         wG7MQ5Jq6DbJMMYqYBkG2RRV8hjcVhq/Dvo6qTqkulIVR4Qsg0hfyy+Zlf8HYoedfUBC
         DN/nNZt8lNEh6dPbYVhiEcayRrUoh4tKQki8zBmo3OiWnCX/U0EwSJfdNTETOElY8i3a
         BrbuI7R118cw64AWkvvrFP3mZlgYzxF65WN8bPXp/IiRCQUGADXDTRxBPxCOwnmrbYOp
         LMDiLAxoOtq6ARQMagRVjPXey8OjdQYmqzefo0EueU/whCM5n1ebjh+/Mbkc9hnehF3G
         2QMg==
X-Gm-Message-State: AOAM531OaDKuhF5QmnDXTyVW10n1GZZ8iBOyfJxjoVQfrSTZCUQXyqOc
        UbCg7QI5O+Wfk2JBXLhwzQ==
X-Google-Smtp-Source: ABdhPJygV4RswIzgdTiCxC5pzTkty3UXCrrwiSu8z/zCEsTkxaIzKR8ZRgypCiMuyA2sepUa31hZ1Q==
X-Received: by 2002:a92:1e08:: with SMTP id e8mr303229ile.10.1626117230440;
        Mon, 12 Jul 2021 12:13:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d205sm8076550iof.31.2021.07.12.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 12:13:49 -0700 (PDT)
Received: (nullmailer pid 2320952 invoked by uid 1000);
        Mon, 12 Jul 2021 19:13:46 -0000
Date:   Mon, 12 Jul 2021 13:13:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, jamipkettunen@somainline.org,
        martin.botka@somainline.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Taniya Das <tdas@codeaurora.org>,
        marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v3 2/3] clk: qcom: Add msm8994 MMCC driver
Message-ID: <20210712191346.GA2320915@robh.at.kernel.org>
References: <20210618111435.595689-1-konrad.dybcio@somainline.org>
 <20210618111435.595689-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618111435.595689-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 18 Jun 2021 13:14:33 +0200, Konrad Dybcio wrote:
> Add a driver for managing MultiMedia SubSystem clocks on msm8994
> and its derivatives.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/clk/qcom/Kconfig                      |    9 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/mmcc-msm8994.c               | 2494 +++++++++++++++++
>  include/dt-bindings/clock/qcom,mmcc-msm8994.h |  155 +
>  4 files changed, 2659 insertions(+)
>  create mode 100644 drivers/clk/qcom/mmcc-msm8994.c
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8994.h
> 

Acked-by: Rob Herring <robh@kernel.org>
