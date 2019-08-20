Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9357495665
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 07:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbfHTFEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 01:04:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44051 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbfHTFEr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 01:04:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id c81so2604451pfc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 22:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J5jmxPECEtlkSClh6kdjYePWOqswhvSklEpB5MKVT2Y=;
        b=pGeoQ2K6G50W9ZHfxskCOsB70zYcEDk3+0sg6mf3aj26fQVNcSwz9vG3Q5kcD9V2vB
         wgSYF8Gcnkl8SXlHpT3XNfFsXNdVR9l6mSAlxf8qIfFIEm+tOQaClKUBMtSrrvb6EBGc
         nWJu4SumKg0eSOtk0EORJuaZNYK9lPNs9gZ8j1MRxgSXKMSCy9tuSaaFSg49zFAWkuKX
         9NG7xsanhuzJInrKpC7u4ZFiQWfpXEir+zG31vlNKQ4go6IoFVHP6Vnv86fpe5dduqQ8
         DBYPhiISQXQUW2EwZ8hoZBAQNfZ8Da84tL+2zOm7Mo0+34Iu6JU+Dc00NPrI2GfUjHw1
         rhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J5jmxPECEtlkSClh6kdjYePWOqswhvSklEpB5MKVT2Y=;
        b=AlUo7gjblxkvwSgGTrVo9ECQ05/ip0OPeK0RZPcOxfbRoU1c5XvsB3nxoMCOUb7L9o
         4gELkKpSjQ1Pm/teiv+g9rxl2JRYuzbgtookZWaE8tuiNw+QrzJKs2g8MsWYaSpxzFDQ
         hhwlzWB+0TatnIbyIt+5ZFZGaEsUMSEzxO7VuffgPD1d3dBszCeCmvW1hvkl/JHPP2Gq
         J7J64rBcO6WS69q08GVvw4g1ThI/t7m/TiqwD9U0s35wVcMyVO05Te56VqxciNV+yWU0
         SYZkS24E52H93ZOCl7yEgoOFMrE9OuRzLHGBvKZ4FHklDeDUQmWZJj0n1TBVlHlf5+cI
         15FQ==
X-Gm-Message-State: APjAAAVkb7NP/Fz53LjJ5ZpLPCNZWU38CRAEkXtJvJqCkakXayPppRsF
        5ktWTSgKr95hUhdM2w4gvYgx7A==
X-Google-Smtp-Source: APXvYqz1mx/jDQWX30lQ9e88jbA/Mq4fclvAAYQEup4fkkADK+YsB/Y8B+YuEW8GnHCulPOX3NsCug==
X-Received: by 2002:aa7:8611:: with SMTP id p17mr28252702pfn.41.1566277486139;
        Mon, 19 Aug 2019 22:04:46 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t6sm16419128pgu.23.2019.08.19.22.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 22:04:45 -0700 (PDT)
Date:   Mon, 19 Aug 2019 22:06:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Document the parent clocks
Message-ID: <20190820050623.GI26807@tuxbook-pro>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819073947.17258-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:

> With clock parent data scheme we must specify the parent clocks for the
> rpmhcc nodes. So describe the parent clock for rpmhcc in the bindings.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> index 3c007653da31..8b97968f9c88 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -9,6 +9,9 @@ Required properties :
>  - compatible : shall contain "qcom,sdm845-rpmh-clk"
>  
>  - #clock-cells : must contain 1
> +- clocks: a list of phandles and clock-specifier pairs,
> +	  one for each entry in clock-names.
> +- clock-names: Parent board clock: "xo".
>  
>  Example :
>  
> -- 
> 2.20.1
> 
