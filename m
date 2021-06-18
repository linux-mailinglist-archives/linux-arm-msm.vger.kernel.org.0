Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1663AD44B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 23:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhFRVTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 17:19:43 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:43828 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbhFRVTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 17:19:42 -0400
Received: by mail-ot1-f49.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso11030187otu.10;
        Fri, 18 Jun 2021 14:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UjUuhsmA5mgfVc/1Uy18d1ppznnOcj7kd0qIBjlj0Qg=;
        b=FZUN8LDzqpoQZIQJbyhl3o+1EBijVQtFR7J8PSYdvHrRreAM0K03L5NBuN4jqsvh46
         /1LwFUREyH85KnyHD9L5VHXHLmcfJuIHLQATedT8ynZpNlGv3bK96ZheDVtirMRhz1ra
         iyLjr6tFMFTICEJNJHwvtEVVOo/GjjFa7QrIBZ4txzw16/N+q+b1t7ug8FrAiOiDgGgi
         YlZTWyl2v0imnE5/c7uYTBlGIoVSvZfawAR3/x3k/p/MKlrhWsg9CpXOO7pQ6ZpScEsU
         ZXZOcZFEf1HApfg3iIbtPfwPSBEh8Toy3umeQD0pFaBxnNkydZlAt85AEyX8N8WEIoLB
         9dZA==
X-Gm-Message-State: AOAM531a9pcq9KnZ8aRMpDLRs2Phm7agl4WEhuhng3HxV86YysuXWzIM
        qBDcyk6D1ooRZQsVcuH/xlVntiG4Rw==
X-Google-Smtp-Source: ABdhPJxKqsxxAEVOEUJVHSPYIPZnK9BE8rbpPuJuwl1gbU8hpsT0qpmCkLgl3B9TrzZ8p0ww36AjQA==
X-Received: by 2002:a9d:5e8b:: with SMTP id f11mr11155641otl.274.1624051052049;
        Fri, 18 Jun 2021 14:17:32 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o20sm1142195ook.40.2021.06.18.14.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:17:31 -0700 (PDT)
Received: (nullmailer pid 2909228 invoked by uid 1000);
        Fri, 18 Jun 2021 21:17:29 -0000
Date:   Fri, 18 Jun 2021 15:17:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     martin.botka@somainline.org, jamipkettunen@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 9/9] clk: qcom: gcc-msm8994: Add a quirk for a
 different SDCC configuration
Message-ID: <20210618211729.GA2909138@robh.at.kernel.org>
References: <20210609145523.467090-1-konrad.dybcio@somainline.org>
 <20210609145523.467090-9-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609145523.467090-9-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 09 Jun 2021 16:55:21 +0200, Konrad Dybcio wrote:
> Some devices come with a different SDCC clock configuration,
> account for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8994.yaml         |  4 ++++
>  drivers/clk/qcom/gcc-msm8994.c                   | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
