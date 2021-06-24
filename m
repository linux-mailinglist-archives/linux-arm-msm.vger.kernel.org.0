Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D7A3B371F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhFXTmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:42:19 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:35331 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbhFXTmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:42:19 -0400
Received: by mail-io1-f49.google.com with SMTP id d9so9719868ioo.2;
        Thu, 24 Jun 2021 12:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7k/6fGcD1pYsnikYJBx82GWh8GFdpDDIHWZK1LATGcg=;
        b=KZJT79ofgs6XxiOjuXA8zo7/a5z0CVrWowks8IrMMBTkqauhnXCxqWzv+r1JnyBWcF
         xO8kDvieC1lKaRat0xAmatCLYB8KwhXyvy86C/w9ANTXmHLCqDPQ0aVD4BZobBehUHuM
         0B1VUDczVwDA0cyJdS8bdaWwtNLPo89MKvomkY802yuD0C4Ol1abhAOwmZHB6b55SVTf
         w5Dsbp2rPeynlpnRprcPUvCtP/3KZ+kHfPpoqjRrseqFlg4skYlkfoT0Zr16b/rf/BIp
         e3rnAb+2xeGd5S3RExGmbpy5jKIIzRP/nEhvLVLG7LNHP0GO6GUw81c5yJl4DMgehglf
         1GtQ==
X-Gm-Message-State: AOAM5325caP3fP+cT1YvvQq7YY8hblcvewncvRFE6K1k+OnDES8uEx9y
        3AmtcL4oGX7HlYyRWIshtw==
X-Google-Smtp-Source: ABdhPJwPta/rVrlBdiXZV1erKAb8YG9ZEmulwZOe6xWKvFSZAbUcBPGnBU6xZfFY9JyU1BEbNB+5GQ==
X-Received: by 2002:a6b:cf15:: with SMTP id o21mr5565814ioa.9.1624563599723;
        Thu, 24 Jun 2021 12:39:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b6sm2290192ils.68.2021.06.24.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 12:39:58 -0700 (PDT)
Received: (nullmailer pid 1864678 invoked by uid 1000);
        Thu, 24 Jun 2021 19:39:54 -0000
Date:   Thu, 24 Jun 2021 13:39:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add MSM8976/56 Global Clock Controller
 (GCC) driver
Message-ID: <20210624193954.GA1862253@robh.at.kernel.org>
References: <20210612204317.11691-1-konrad.dybcio@somainline.org>
 <20210612204317.11691-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612204317.11691-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 12, 2021 at 10:43:16PM +0200, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Add support for the global clock controller found on MSM8956
> and MSM8976 SoCs.
> Since the multimedia clocks are actually in the GCC on these
> SoCs, this will allow drivers to probe and control basically
> all the required clocks.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Co-developed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v1:
> - Remove the bool in probe function
> - Clean up ".name =" clk lookup
> - Add a comment under gpll0_vote clarifying that it's crucial
> - Removed CLK_GET_RATE_NOCACHE from display clocks, it still works \o/
> 
>  drivers/clk/qcom/Kconfig                     |    8 +
>  drivers/clk/qcom/Makefile                    |    1 +
>  drivers/clk/qcom/gcc-msm8976.c               | 4173 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8976.h |  243 +

This belongs in the binding patch and dual license it please.

>  4 files changed, 4425 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-msm8976.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h
